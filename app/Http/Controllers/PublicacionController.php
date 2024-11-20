<?php

namespace App\Http\Controllers;

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

class PublicacionController extends Controller
{
    public $validacion = [
        "categoria" => "required",
        "moneda" => "required",
        "oferta_inicial" => "required|numeric|min:1",
        "ubicacion" => "required",
        "fecha_limite" => "required",
        "hora_limite" => "required",
        "monto_garantia" => "required|numeric|min:1",
    ];

    public $mensajes = [
        "categoria.required" => "Este campo es obligatorio",
        "moneda.required" => "Este campo es obligatorio",
        "oferta_inicial.required" => "Este campo es obligatorio",
        "oferta_inicial.numeric" => "Debes ingresar un valor númerico",
        "oferta_inicial.min" => "Debes ingresar al menos :min",
        "ubicacion.required" => "Este campo es obligatorio",
        "fecha_limite.required" => "Este campo es obligatorio",
        "hora_limite.required" => "Este campo es obligatorio",
        "monto_garantia.required" => "Este campo es obligatorio",
        "monto_garantia.numeric" => "Debes ingresar un valor númerico",
        "monto_garantia.min" => "Debes ingresar al menos :min",
        "publicacion_detalles.required" => "Este campo es obligatorio",
        "publicacion_detalles.min" => "Debes agregar al menos :min caracteristicas",
        "publicacion_detalles.*.required" => "Este campo es obligatorio",
        "publicacion_detalles.*.min" => "Debes ingresar al menos :min caracteres",
        "publicacion_imagens.required" => "Este campo es obligatorio",
        "publicacion_imagens.min" => "Debes ingresar al menos :min imagenes",
    ];

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
            ->join("users", "users.id", "=", "publicacions.user_id");
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
            ->paginate(10);

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
        $parametrizacion = Parametrizacion::get()->first();
        $this->validacion["publicacion_detalles"] = "required|array|min:3";
        if ($parametrizacion) {
            $this->validacion["publicacion_imagens"] = "required|array|min:" . $parametrizacion->nro_imagenes_pub;
        } else {
            $this->validacion["publicacion_imagens"] = "required|array|min:3";
        }

        $request->validate($this->validacion, $this->mensajes);

        // Validar detalles 
        $errors = [];
        foreach ($request->publicacion_detalles as $pd) {
            if (strlen($pd["caracteristica"]) < 1 || strlen($pd['detalle']) < 1) {
                $errors["publicacion_detalles"] = 'Debes ingresar al menos 1 caracter en cada detalle y caracteristica';
                break;
            }
        }

        foreach ($request->publicacion_imagens as $pi) {
            if ($pi["id"] == 0 && empty($pi['imagen'])) {
                $errors["publicacion_imagens"] = 'Debes cargar todas las imagenes';
                break;
            }
        }

        // Si hay errores personalizados, los agregamos al validador
        if (!empty($errors)) {
            throw ValidationException::withMessages($errors);
        }

        DB::beginTransaction();
        try {
            // crear la Publicacion
            $datos_publicacion = [
                "user_id" => Auth::user()->id,
                "categoria" => $request->categoria,
                "moneda" => $request->moneda,
                "oferta_inicial" => $request->oferta_inicial,
                "ubicacion" => $request->ubicacion,
                "observaciones" => mb_strtoupper($request->observaciones),
                "fecha_limite" => $request->fecha_limite,
                "hora_limite" => $request->hora_limite,
                "monto_garantia" => $request->monto_garantia,
            ];
            $nueva_publicacion = Publicacion::create($datos_publicacion);

            // detalles
            foreach ($request->publicacion_detalles as $pd) {
                $nueva_publicacion->publicacion_detalles()->create([
                    "caracteristica" => mb_strtoupper($pd["caracteristica"]),
                    "detalle" => mb_strtoupper($pd["detalle"]),
                ]);
            }

            // imagenes
            foreach ($request->publicacion_imagens as $key => $pi) {
                if ($pi["imagen"]) {
                    $file = $pi["imagen"];
                    $extension = "." . $file->getClientOriginalExtension();
                    $nom_file = $key . time() . $extension;
                    $nueva_publicacion->publicacion_imagens()->create([
                        "imagen" => $nom_file,
                    ]);
                    $file->move(public_path("imgs/publicacions"), $nom_file);
                }
            }


            $datos_original = HistorialAccion::getDetalleRegistro($nueva_publicacion, "publicacions");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA PUBLICACIÓN',
                'datos_original' => $datos_original,
                'modulo' => 'PUBLICACIONES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("publicacions.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function verificaGanador(Publicacion $publicacion)
    {
        $subasta = $publicacion->subasta;
        $subasta_clientes = $subasta->subasta_clientes_puja;
        if (count($subasta_clientes) > 0) {
            $publicacion->estado_sub = 2;
            $subasta->estado = 2;
            $subasta_cliente = $subasta_clientes[0];
            $subasta_cliente->estado_puja = 2;
            $subasta_cliente->save();
        } else {
            // sin ganador
            $publicacion->estado_sub = 2;
            $subasta->estado = 0;
        }

        $subasta->save();
        $publicacion->save();

        return response()->JSON(true);
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
        $parametrizacion = Parametrizacion::get()->first();
        $this->validacion["publicacion_detalles"] = "required|array|min:3";
        if ($parametrizacion) {
            $this->validacion["publicacion_imagens"] = "required|array|min:" . $parametrizacion->nro_imagenes_pub;
        } else {
            $this->validacion["publicacion_imagens"] = "required|array|min:3";
        }

        $request->validate($this->validacion, $this->mensajes);

        // Validar detalles 
        $errors = [];
        foreach ($request->publicacion_detalles as $pd) {
            if (strlen($pd["caracteristica"]) < 1 || strlen($pd['detalle']) < 1) {
                $errors["publicacion_detalles"] = 'Debes ingresar al menos 1 caracter en cada detalle y caracteristica';
                break;
            }
        }

        foreach ($request->publicacion_imagens as $pi) {
            if ($pi["id"] == 0 && empty($pi['imagen'])) {
                $errors["publicacion_imagens"] = 'Debes cargar todas las imagenes';
                break;
            }
        }

        // Si hay errores personalizados, los agregamos al validador
        if (!empty($errors)) {
            throw ValidationException::withMessages($errors);
        }
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($publicacion, "publicacions");
            // actualizar la Publicacion
            $datos_publicacion = [
                "categoria" => $request->categoria,
                "moneda" => $request->moneda,
                "oferta_inicial" => $request->oferta_inicial,
                "ubicacion" => $request->ubicacion,
                "observaciones" => mb_strtoupper($request->observaciones),
                "fecha_limite" => $request->fecha_limite,
                "hora_limite" => $request->hora_limite,
                "monto_garantia" => $request->monto_garantia,
            ];
            $publicacion->update($datos_publicacion);

            // eliminados
            $eliminados_detalles = $request->eliminados_detalles;
            $eliminados_imagens = $request->eliminados_imagens;
            if ($eliminados_detalles) {
                foreach ($eliminados_detalles as $value) {
                    $publicacion_detalle = PublicacionDetalle::find($value);
                    $publicacion_detalle->delete();
                }
            }

            $remover_archivos = [];
            if ($eliminados_imagens) {
                foreach ($eliminados_imagens as $value) {
                    $publicacion_imagen = PublicacionImagen::find($value);
                    $remover_archivos[] = $publicacion_imagen->imagen;
                    $publicacion_imagen->delete();
                }
            }

            // detalles
            foreach ($request->publicacion_detalles as $pd) {
                if ($pd["id"] == 0) {
                    $publicacion->publicacion_detalles()->create([
                        "caracteristica" => mb_strtoupper($pd["caracteristica"]),
                        "detalle" => mb_strtoupper($pd["detalle"]),
                    ]);
                } else {
                    $publicacion_detalle = PublicacionDetalle::find($pd["id"]);
                    $publicacion_detalle->update([
                        "caracteristica" => mb_strtoupper($pd["caracteristica"]),
                        "detalle" => mb_strtoupper($pd["detalle"]),
                    ]);
                }
            }

            // imagenes
            foreach ($request->publicacion_imagens as $key => $pi) {
                if ($pi["imagen"] && !is_string($pi["imagen"])) {
                    $file = $pi["imagen"];
                    $extension = "." . $file->getClientOriginalExtension();
                    $nom_file = $key . time() . $extension;
                    if ($pi["id"] == 0) {
                        $publicacion->publicacion_imagens()->create([
                            "imagen" => $nom_file,
                        ]);
                    } else {
                        $publicacion_imagen = PublicacionImagen::find($pi["id"]);
                        if (file_exists(public_path("imgs/publicacions/" . $publicacion_imagen->imagen))) {
                            \File::delete(public_path("imgs/publicacions/" . $publicacion_imagen->imagen));
                        }
                        $publicacion_imagen->update([
                            "imagen" => $nom_file,
                        ]);
                    }

                    $file->move(public_path("imgs/publicacions"), $nom_file);
                }
            }
            $datos_nuevo = HistorialAccion::getDetalleRegistro($publicacion, "publicacions");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA PUBLICACIÓN',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PUBLICACIONES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            foreach ($remover_archivos as $value) {
                \File::delete(public_path('imgs/publicacions/' . $value));
            }

            DB::commit();
            return redirect()->route("publicacions.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(Publicacion $publicacion)
    {
        DB::beginTransaction();
        try {
            // $usos = Subasta::where("publicacion_id", $publicacion->id)->get();
            // if (count($usos) > 0) {
            //     throw ValidationException::withMessages([
            //         'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
            //     ]);
            // }

            $datos_original = HistorialAccion::getDetalleRegistro($publicacion, "publicacions");
            $publicacion->estado_sub = 5;
            $publicacion->save();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA PUBLICACIÓN',
                'datos_original' => $datos_original,
                'modulo' => 'PUBLICACIONES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
