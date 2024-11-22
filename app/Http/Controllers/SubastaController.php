<?php

namespace App\Http\Controllers;

use App\Models\Notificacion;
use App\Models\NotificacionUser;
use App\Models\Publicacion;
use App\Models\Subasta;
use App\Models\SubastaCliente;
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
        $length = $request->input('length', 10); // Valor de `length` enviado por DataTable
        $start = $request->input('start', 0); // Índice de inicio enviado por DataTable
        $page = ($start / $length) + 1; // Cálculo de la página actual
        $search = $request->input('search');

        $publicacions = SubastaCliente::with(["cliente", "subasta"])->select("subasta_clientes.*");
        if ($search && trim($search) != '') {
            $publicacions->where("nombre", "LIKE", "%$search%");
        }

        $publicacions->where("subasta_id", $subasta->id);

        $publicacions = $publicacions->orderBy("subasta_clientes.estado_puja", "desc")
            ->orderBy("subasta_clientes.puja", "desc")
            ->paginate($length, ['*'], 'page', $page);

        return response()->JSON([
            'data' => $publicacions->items(),
            'recordsTotal' => $publicacions->total(),
            'recordsFiltered' => $publicacions->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    public function registrarPuja(Request $request)
    {
        $request->validate([
            "monto_puja" => "required|int"
        ], [
            "monto_puja.required" => "Debes cargar un archivo",
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

        if ($fecha_hora_actual < $fecha_hora_limite) {
            $subasta_cliente->update([
                "puja" => $monto_puja,
                "fecha_oferta" => date("Y-m-d"),
                "hora_oferta" => date("H:i"),
            ]);

            // actualizar ganador
            $subasta->subasta_clientes()->update(["estado_puja" => 0]);

            $maxima_puja = SubastaCliente::where("subasta_id", $subasta->id)->orderBy("puja", "desc")->get()->first();
            $maxima_puja->estado_puja = 1;
            $maxima_puja->save();

            return response()->JSON($publicacion->load(["subasta.subasta_clientes_puja"]));
        }
        return response()->JSON([
            "message" => "No se pudo registrar su oferta/puja debido a que la hora y fecha limite de subasta ya vencio"
        ], 422);
    }

    public function registrarComprobante(Request $request)
    {
        $request->validate([
            "comprobante" => "required|file|mimes:pdf,jpg,jpeg,webp,png|max:5120"
        ], [
            "comprobante.required" => "Debes cargar un archivo",
            "comprobante.file" => "Debes cargar un archivo",
            "comprobante.mimes" => "Solo puedes cargar archivos pdf,jpg,jpeg,webp,png",
            "comprobante.max" => "El archivo no puede pesar mas de 5MB",
        ]);

        DB::beginTransaction();
        try {
            $user = Auth::user();
            if ($user->role_id == 2) {
                $publicacion_id = $request->publicacion_id;
                $comprobante = $request->comprobante;

                $subasta_cliente_id = null;
                $subasta_cliente = null;
                $eliminar_archivo = null;
                if (isset($request->subasta_cliente_id)) {
                    $subasta_cliente_id = $request->subasta_cliente_id;
                    $subasta_cliente = SubastaCliente::findOrFail($subasta_cliente_id);
                    $eliminar_archivo = $subasta_cliente->comprobante;
                }

                $publicacion = Publicacion::find($publicacion_id);
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
            }
        } catch (\EXception $e) {
            Log::debug($e->getMessage());
            DB::rollBack();
            return response()->JSON([
                "message" => "Ocurrió un error inesperado, intente nuevamente mas tarde"
            ], 500);
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
        return response()->JSON([
            "monto_puja_actual" => $monto_puja_actual,
            "subasta" => $subasta,
        ]);
    }
}
