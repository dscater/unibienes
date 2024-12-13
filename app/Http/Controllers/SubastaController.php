<?php

namespace App\Http\Controllers;

use App\Models\HistorialOferta;
use App\Models\Notificacion;
use App\Models\NotificacionUser;
use App\Models\Publicacion;
use App\Models\Subasta;
use App\Models\SubastaCliente;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class SubastaController extends Controller
{
    public function clientes(Subasta $subasta)
    {
        $publicacion = Publicacion::with(["publicacion_detalles", "publicacion_imagens"])->where("id", $subasta->publicacion_id)->get()->first();
        return Inertia::render("Admin/Publicacions/SubastaClientes", compact("subasta", "publicacion"));
    }

    public function getClientesApi(Request $request, Subasta $subasta)
    {
        // $length = $request->input('length', 10); // Valor de `length` enviado por DataTable
        // $start = $request->input('start', 0); // Índice de inicio enviado por DataTable
        // $page = ($start / $length) + 1; // Cálculo de la página actual
        $search = $request->input('search');
        $lastId = $request->input('lastId');
        $maxima_puja = $request->input("maxima_puja");
        $consulta_publicacions = SubastaCliente::with(["cliente", "subasta"])->select("subasta_clientes.*");
        // if ($search && trim($search) != '') {
        //     $consulta_publicacions->where("nombre", "LIKE", "%$search%");
        // }

        $consulta_publicacions->where("subasta_id", $subasta->id);


        // datos para validar si se obtendra los registros
        $publicacions_id  = $consulta_publicacions->orderBy("subasta_clientes.id", "desc")
            ->get();
        $publicacions_puja  = $consulta_publicacions->max("puja");
        $total = count($publicacions_id);
        $maxima_puja = $total > 0 ? (float)$publicacions_puja : $maxima_puja;
        $lastId = $total > 0 ? $publicacions_id[0]->id : $lastId;

        // obtener los registros a mostrar
        if ($lastId != 0 && $maxima_puja == 0) {
            $consulta_publicacions->where("id", ">", $lastId);
        }

        $publicacions = $consulta_publicacions->orderBy("subasta_clientes.estado_puja", "desc")
            ->orderBy("subasta_clientes.puja", "desc")
            ->get();


        return response()->JSON(
            [
                "lastId" => $lastId,
                "maxima_puja" => $maxima_puja,
                "publicacions" => $publicacions
            ]
        );

        // return response()->JSON([
        //     'data' => $publicacions->items(),
        //     'recordsTotal' => $publicacions->total(),
        //     'recordsFiltered' => $publicacions->total(),
        //     'draw' => intval($request->input('draw')),
        // ]);
    }

    public function registrarPuja(Request $request)
    {
        $request->validate([
            "monto_puja" => "required|int"
        ], [
            "monto_puja.required" => "Debes ingresar un monto de puja",
            "monto_puja.int" => "Debes ingresar un valor entero",
        ]);

        $subasta_cliente_id = $request->subasta_cliente_id;
        $monto_puja = $request->monto_puja;
        $subasta_cliente = SubastaCliente::find($subasta_cliente_id);
        $subasta = $subasta_cliente->subasta;
        $publicacion = $subasta->publicacion;

        // validar limite fecha subasta
        $fecha_hora_limite = date("Y-m-d H:i", strtotime($publicacion->fecha_limite . ' ' . $publicacion->hora_limite));
        $fecha_hora_actual = date("Y-m-d H:i");

        DB::beginTransaction();
        try {
            if (Publicacion::verificaFechaLimitePublicacion($publicacion)) {
                // actualizar ganador
                DB::update("UPDATE subasta_clientes SET estado_puja = 0 WHERE subasta_id = $subasta->id");
                // $subasta->subasta_clientes()->update(["estado_puja" => 0]);

                // verificar monto
                $monto_puja_actual = SubastaController::getMontoPujaActual($publicacion);
                $monto_validacion = $monto_puja_actual;
                if ($monto_puja_actual > -1) {
                    if (count($subasta->subasta_clientes_puja) > 0) {
                        $monto_validacion++;
                    }
                    $mensaje = "El monto debe ser mayor o igual a " . number_format($monto_validacion, 2, ".", ",") . " " . $publicacion->moneda;
                    if (!$monto_puja || $monto_puja < $monto_validacion) {
                        return response()->JSON([
                            "message" => "Debes ingresar un monto valido. " . $mensaje
                        ], 422);
                    }
                } else {
                    return response()->JSON([
                        "message" => "Ocurrió un error al registrar la puja, intente de nuevo por favor"
                    ], 422);
                }

                $subasta_cliente->update([
                    "puja" => $monto_puja,
                    "fecha_oferta" => date("Y-m-d"),
                    "hora_oferta" => date("H:i"),
                ]);

                $maxima_puja = SubastaCliente::where("subasta_id", $subasta->id)->orderBy("puja", "desc")->get()->first();
                $maxima_puja->estado_puja = 1;
                $maxima_puja->save();

                // AGREAR AL HISTORIAL
                $subasta_cliente->historial_ofertas()->create([
                    "subasta_id" => $subasta_cliente->subasta_id,
                    "cliente_id" => $subasta_cliente->cliente_id,
                    "puja" => $subasta_cliente->puja,
                    "fecha_oferta" => $subasta_cliente->fecha_oferta,
                    "hora_oferta" => $subasta_cliente->hora_oferta,
                ]);
                DB::commit();
                return response()->JSON([
                    "publicacion" => $publicacion->load(["subasta.subasta_clientes_puja"]),
                    "subasta_cliente" => $subasta_cliente->load("historial_ofertas")
                ]);
            }
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                "message" => $e->getMessage()
            ], $e->getCode());
        }
    }

    public function registrarComprobante(Request $request)
    {
        $request->validate([
            "comprobante" => "required|file|mimes:pdf,jpg,jpeg,webp,png|max:5120"
        ], [
            "comprobante.required" => "Debes cargar tú comprobante de pago",
            "comprobante.file" => "Debes cargar un archivo",
            "comprobante.mimes" => "Archivos soportados: pdf, jpg, jpeg, webp, png",
            "comprobante.max" => "El archivo no puede pesar mas de 5MB",
        ]);

        DB::beginTransaction();
        try {
            $publicacion_id = $request->publicacion_id;
            $publicacion = Publicacion::find($publicacion_id);
            $user = Auth::user();
            if ($user->role_id == 2 && Publicacion::verificaFechaLimitePublicacion($publicacion)) {
                $comprobante = $request->comprobante;
                $subasta_cliente_id = null;
                $subasta_cliente = null;
                $eliminar_archivo = null;
                if (isset($request->subasta_cliente_id)) {
                    $subasta_cliente_id = $request->subasta_cliente_id;
                    $subasta_cliente = SubastaCliente::findOrFail($subasta_cliente_id);
                    $eliminar_archivo = $subasta_cliente->comprobante;
                }

                $cliente = $user->cliente;

                $extension = "." . $comprobante->getClientOriginalExtension();
                $nom_file = $cliente->id . time() . $extension;

                $subasta = $publicacion->subasta;
                if (!$subasta_cliente) {
                    $subasta_cliente = $subasta->subasta_clientes()->create([
                        "cliente_id" => $cliente->id,
                        "garantia" => 1,
                        "puja" => 0,
                        "comprobante" => $nom_file,
                        "estado_comprobante" => 0,
                        "estado_puja" => 0,
                    ]);
                } else {
                    $subasta_cliente->update([
                        "garantia" => 1,
                        "comprobante" => $nom_file,
                        "estado_comprobante" => 0,
                        "estado_puja" => 0,
                    ]);
                }

                $comprobante->move(public_path("files/comprobantes"), $nom_file);

                if ($eliminar_archivo) {
                    \File::delete(public_path("imgs/publicacions/" . $eliminar_archivo));
                }

                // REGISTRAR NOTIFICACION
                $notificacion = Notificacion::create([
                    "descripcion" => $cliente->full_name . " REGISTRO SU COMPROBANTE",
                    "fecha" => date("Y-m-d"),
                    "hora" => date("H:i"),
                    "modulo" => "SUBASTA CLIENTE",
                    "registro_id" => $subasta_cliente->id,
                ]);
                // notificacion_user
                NotificacionUser::create([
                    "notificacion_id" => $notificacion->id,
                    "user_id" => $publicacion->user_id,
                ]);

                DB::commit();

                return response()->JSON([
                    "subasta_cliente" => $subasta_cliente->load(["cliente", "subasta"]),
                    "message" => "Comprobante registrado, podra hacer una puja cuando su comprobante sea verificado"
                ], 200);
            } else {
                throw new Exception("El role de usuario que tiene no puede realizar ofertas/pujas sobre las publicaciones", 400);
            }
        } catch (\Exception $e) {
            Log::debug($e->getMessage());
            DB::rollBack();
            return response()->JSON([
                "message" => $e->getMessage()
            ], $e->getCode());
        }
    }

    public function infoSubastaPorPublicacion(Request $request)
    {
        $monto_puja_actual = "-";
        $publicacion_id = $request->publicacion_id;
        $subasta = null;
        $publicacion = Publicacion::find($publicacion_id);
        if ($publicacion && $publicacion->subasta) {
            $subasta = $publicacion->subasta;
            $monto_puja_actual = SubastaController::getMontoPujaActual($publicacion);
        }
        return response()->JSON([
            "monto_puja_actual" => $monto_puja_actual,
            "subasta" => $subasta->load(["subasta_clientes_puja"]),
        ]);
    }

    public static function getMontoPujaActual($publicacion)
    {
        $monto_puja_actual = -1;
        if ($publicacion->subasta) {
            $subasta = $publicacion->subasta;
            $monto_puja_actual = $publicacion->oferta_inicial;
            // verificar pujas
            $max_subasta_clientes = SubastaCliente::where("subasta_id", $subasta->id)
                ->where("puja", ">", 0)
                ->where("estado_comprobante", 1)
                ->orderBy("puja", "desc")
                ->get()->first();
            if ($max_subasta_clientes) {
                $monto_puja_actual = $max_subasta_clientes->puja;
            }
        }

        return $monto_puja_actual;
    }

    public function ofertas(Subasta $subasta)
    {
        $subasta_clientes = SubastaCliente::where("subasta_id", $subasta->id)
            ->where("estado_comprobante", 1)
            ->where("puja", ">", 0)
            ->orderBy("puja", "desc")
            ->get()->take(10);

        $historial_ofertas = HistorialOferta::where("subasta_id", $subasta->id)
            ->orderBy("puja", "desc")
            ->get()->take(10);

        $estado_puja = null;
        if (Auth::check() && Auth::user()->role_id == 2) {
            $subasta_cliente = SubastaCliente::where("subasta_id", $subasta->id)
                // ->where("estado_comprobante", 1)
                ->where("cliente_id", Auth::user()->cliente->id)
                ->get()->first();
            // Log::debug($subasta_cliente);
            if ($subasta_cliente) {
                $estado_puja = $subasta_cliente->estado_puja;
            }
        }

        return response()->JSON([
            "historial_ofertas" => $historial_ofertas,
            "subasta_clientes" => $subasta_clientes,
            "estado_puja" => $estado_puja
        ]);
    }
}
