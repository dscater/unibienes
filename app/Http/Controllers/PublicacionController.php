<?php

namespace App\Http\Controllers;

use App\Mail\MensajeGanadorMail;
use App\Models\HistorialAccion;
use App\Models\Parametrizacion;
use App\Models\Publicacion;
use App\Models\PublicacionDetalle;
use App\Models\PublicacionImagen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Mail;

class PublicacionController extends Controller
{
    public function index()
    {
        return Inertia::render("Admin/Publicacions/Index");
    }

    public function listado()
    {
        $publicacions = Publicacion::select("publicacions.*");

        $permisos = Auth::user()->permisos;
        if (is_array($permisos) && !in_array("publicacions.todos", $permisos)) {
            $publicacions->where("user_id", Auth::user()->id);
        }

        $publicacions = $publicacions->get();
        return response()->JSON([
            "publicacions" => $publicacions
        ]);
    }

    public function api(Request $request)
    {
        $length = $request->input('length', 10); // Valor de `length` enviado por DataTable
        $start = $request->input('start', 0); // Índice de inicio enviado por DataTable
        $page = ($start / $length) + 1; // Cálculo de la página actual
        $search = $request->input('search');

        $publicacions = Publicacion::with(["user", "subasta.subasta_clientes"])
            ->selectRaw("publicacions.*, CONCAT(users.nombres,' ',users.apellidos) as full_name, publicacions.fecha_limite as fecha_hora_limite")
            ->join("users", "users.id", "=", "publicacions.user_id")
            ->where("estado_sub", "!=", 5);
        if ($search && trim($search) != '') {
            $publicacions->whereRaw("CONCAT(users.nombres,' ',users.apellidos) LIKE ?", ["%$search%"]);
            $publicacions->orWhere("categoria", "LIKE", "%$search%");
            $publicacions->orWhere("moneda", "LIKE", "%$search%");
            $publicacions->orWhere("oferta_inicial", "LIKE", "%$search%");
            $publicacions->orWhere("ubicacion", "LIKE", "%$search%");
            $publicacions->orWhere("observaciones", "LIKE", "%$search%");
            $publicacions->orWhereRaw("DATE_FORMAT(CONCAT(fecha_limite,' ',hora_limite), '%d/%m/%Y %H:%i') LIKE ?", ["%$search%"]);
            $publicacions->orWhere("monto_garantia", "LIKE", "%$search%");
        }

        // verificar permiso
        $permisos = Auth::user()->permisos;
        if (is_array($permisos) && !in_array("publicacions.todos", $permisos)) {
            $publicacions->where("user_id", Auth::user()->id);
        }

        // order
        if (isset($request->order)) {
            $order = $request->order;
            $nro_col = $order[0]["column"];
            $asc_desc = $order[0]["dir"];
            $columns = $request->columns;
            if ($columns[$nro_col]["data"]) {
                $col_data = $columns[$nro_col]["data"];
                $publicacions->orderBy($col_data, $asc_desc);
            }
        }

        $publicacions = $publicacions->paginate($length, ['*'], 'page', $page);

        return response()->JSON([
            'data' => $publicacions->items(),
            'recordsTotal' => $publicacions->total(),
            'recordsFiltered' => $publicacions->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $publicacions = Publicacion::with(["user"])->select("publicacions.*");

        if (trim($search) != "") {
            $publicacions->where("nombre", "LIKE", "%$search%");
        }

        $permisos = Auth::user()->permisos;
        if (is_array($permisos) && !in_array("publicacions.todos", $permisos)) {
            $publicacions->where("user_id", Auth::user()->id);
        }

        $publicacions = $publicacions->paginate($request->itemsPerPage);
        return response()->JSON([
            'data' => $publicacions->items(),
            'recordsTotal' => $publicacions->total(),
            'recordsFiltered' => $publicacions->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    public function porCategoriaLimitado(Request $request)
    {
        $categoria = $request->categoria;
        $publicacions = Publicacion::with(["publicacion_imagens", "publicacion_detalles"])
            ->select("publicacions.*")
            ->where("categoria", $categoria)
            ->where("estado_sub", 1)
            ->orderBy("created_at", "desc")
            ->get()
            ->take(6);

        return response()->JSON($publicacions);
    }

    public function porCategoriaPagina(Request $request)
    {
        $categoria = $request->categoria;
        $publicacions = Publicacion::with(["publicacion_imagens", "publicacion_detalles", "subasta.subasta_clientes_puja"])
            ->select("publicacions.*")
            ->where("categoria", $categoria)
            ->whereIn("estado_sub", [1, 2])
            ->orderBy("created_at", "desc")
            ->paginate(8);

        return response()->JSON([
            "publicacions" => $publicacions,
        ]);
    }

    public function porClientePaginado(Request $request)
    {
        $publicacions = [];
        $cliente = Auth::user()->cliente;
        $publicacions = Publicacion::with(["publicacion_imagens", "publicacion_detalles", "subasta.subasta_clientes_puja"])
            ->select("publicacions.*")
            ->join("subastas", "subastas.publicacion_id", "=", "publicacions.id")
            ->join("subasta_clientes", "subasta_clientes.subasta_id", "=", "subastas.id")
            ->whereIn("estado_sub", [1, 2, 3])
            ->where("subasta_clientes.cliente_id", $cliente->id);

        $publicacions = $publicacions->orderBy("created_at", "desc")
            ->paginate(10);

        return response()->JSON([
            "publicacions" => $publicacions,
        ]);
    }

    public function store(Request $request)
    {
        Publicacion::crearPublicacion($request);
        return redirect()->route("publicacions.index")->with("bien", "Registro realizado");
    }

    public function verificaGanador(Publicacion $publicacion)
    {
        $subasta = $publicacion->subasta;
        $subasta_cliente = null;
        $subasta_clientes = $subasta->subasta_clientes_puja;
        if (count($subasta_clientes) > 0) {
            $publicacion->estado_sub = 2;
            $subasta->estado = 2;
            $subasta_cliente = $subasta_clientes[0];
            $subasta_cliente->estado_puja = 2;
            $subasta_cliente->save();

            // enviar mensaje ganador
            // enviar correo

            $parametrizacion = Parametrizacion::first();
            if ($parametrizacion) {
                $servidor_correo = json_decode($parametrizacion->servidor_correo);
                Config::set(
                    [
                        'mail.mailers.default' => $servidor_correo->driver,
                        'mail.mailers.smtp.host' => $servidor_correo->host,
                        'mail.mailers.smtp.port' => $servidor_correo->puerto,
                        'mail.mailers.smtp.encryption' => $servidor_correo->encriptado,
                        'mail.mailers.smtp.username' => $servidor_correo->correo,
                        'mail.mailers.smtp.password' => $servidor_correo->password,
                        'mail.from.address' => $servidor_correo->correo,
                        'mail.from.name' => $servidor_correo->nombre,
                    ]
                );

                $publicacion = $subasta_cliente->subasta->publicacion;
                $url =  route('publicacions.publicacionPortal', $publicacion->id);

                $mensaje = 'Felicidades acabas de ganar la subasta de la siguiente  <a href="' . $url . '">PUBLICACIÓN</a>';
                $datos = [
                    "mensaje" =>  $mensaje,
                ];

                Mail::to($subasta_cliente->cliente->email)
                    ->send(new MensajeGanadorMail($datos));
            }
        } else {
            // sin ganador
            $publicacion->estado_sub = 2;
            $subasta->estado = 0;
        }

        $subasta->save();
        $publicacion->save();

        return response()->JSON([
            "subasta_cliente" => $subasta_cliente->load(["cliente"])
        ]);
    }

    public function show(Publicacion $publicacion)
    {
        return response()->JSON($publicacion->load(["publicacion_detalles", "publicacion_imagens"]));
    }

    public function publicacionPortal(Publicacion $publicacion)
    {
        $publicacion = $publicacion->load(["publicacion_detalles", "publicacion_imagens", "subasta.subasta_clientes_puja"]);
        return Inertia::render("Portal/Publicacion", compact("publicacion"));
    }

    public function habilitaPublicacion(Publicacion $publicacion)
    {
        $publicacion->estado_sub = 1;
        $publicacion->save();

        // registrar subasta
        if (!$publicacion->subasta) {
            $publicacion->subasta()->create([
                "estado" => 1,
                "fecha_registro" => date("Y-m-d")
            ]);
        }

        return redirect()->route("publicacions.index")->with("bien", "Registro realizado");
    }

    public function update(Publicacion $publicacion, Request $request)
    {
        Publicacion::actualizarPublicacion($publicacion, $request);
        return redirect()->route("publicacions.index")->with("bien", "Registro actualizado");
    }

    public function destroy(Publicacion $publicacion)
    {
        Publicacion::eliminarPublicacion($publicacion);
        return response()->JSON([
            'sw' => true,
            'message' => 'El registro se eliminó correctamente'
        ], 200);
    }
}
