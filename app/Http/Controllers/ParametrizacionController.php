<?php

namespace App\Http\Controllers;

use App\Models\Parametrizacion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class ParametrizacionController extends Controller
{
    public $validacion = [
        "inactividad_cliente" => "required|int|min:1",
        "tipo_cambio" => "required|numeric",
        "nro_imagenes_pub" => "required|int|min:1",
        "tiempo_pub" => "required|int|min:1",
        "terminos_condiciones" => "required|string|min:4",
        "host" => "required",
        "puerto" => "required|int",
        "encriptado" => "required",
        "correo" => "required|email",
        "nombre" => "required",
        "password" => "required",
        "driver" => "required",
    ];

    public $messages = [
        "inactividad_cliente.required" => "Este campo es obligatorio",
        "inactividad_cliente.int" => "Debes ingresar un valor entero",
        "inactividad_cliente.min" => "Debes ingresar al menos :min",
        "tipo_cambio.required" => "Este campo es obligatorio",
        "tipo_cambio.numeric" => "Debes ingresar un valor númerico",
        "servidor_correo.required" => "Este campo es obligatorio",
        "nro_imagenes_pub.required" => "Este campo es obligatorio",
        "nro_imagenes_pub.int" => "Debes ingresar un valor entero",
        "nro_imagenes_pub.min" => "Debes ingresar al menos :min",
        "tiempo_pub.required" => "Este campo es obligatorio",
        "tiempo_pub.int" => "Debes ingresar un valor entero",
        "tiempo_pub.min" => "Debes ingresar al menos :min",
        "terminos_condiciones.required" => "Este campo es obligatorio",
        "terminos_condiciones.string" => "Debes ingresar solo texto",
        "terminos_condiciones.min" => "Debes ingresar al menos :min caracteres",
        "host.required" => "Este campo es obligatorio",
        "puerto.required" => "Este campo es obligatorio",
        "puerto.int" => "Ingresa un valor entero",
        "encriptado.required" => "Este campo es obligatorio",
        "correo.required" => "Este campo es obligatorio",
        "correo.email" => "Debes ingresar un correo valido",
        "nombre.required" => "Este campo es obligatorio",
        "password.required" => "Este campo es obligatorio",
        "driver.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        $parametrizacion = Parametrizacion::first();
        return Inertia::render("Admin/Parametrizacions/Index", compact("parametrizacion"));
    }


    public function getParametrizacion()
    {
        $parametrizacion = Parametrizacion::first();
        return response()->JSON([
            "parametrizacion" => $parametrizacion
        ], 200);
    }

    public function update(Request $request)
    {
        $request->validate($this->validacion, $this->messages);
        DB::beginTransaction();
        try {

            $parametrizacion = Parametrizacion::first();
            $servidor_correo = [
                "host" => $request->host,
                "puerto" => $request->puerto,
                "encriptado" => $request->encriptado,
                "correo" => $request->correo,
                "nombre" => $request->nombre,
                "password" => $request->password,
                "driver" => $request->driver,
            ];
            $servidor_correo = json_encode($servidor_correo);
            $datos = [
                "inactividad_cliente" => $request->inactividad_cliente,
                "tipo_cambio" => $request->tipo_cambio,
                "servidor_correo" => $servidor_correo,
                "nro_imagenes_pub" => $request->nro_imagenes_pub,
                "tiempo_pub" => $request->tiempo_pub,
                "terminos_condiciones" => $request->terminos_condiciones,
            ];
            if (!$parametrizacion) {
                Parametrizacion::create($datos);
            } else {
                $parametrizacion->update($datos);
            }



            DB::commit();
            return redirect()->route("parametrizacions.index")->with("success", "Registro correcto");
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with("error", $e->getMessage());
        }
    }
}
