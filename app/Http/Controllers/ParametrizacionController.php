<?php

namespace App\Http\Controllers;

use App\Models\Parametrizacion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class ParametrizacionController extends Controller
{
    public $validacion = [
        "inactividad_cliente" => "required|int|min:1",
        "tipo_cambio" => "required|numeric",
        "nro_imagenes_pub" => "required|int|min:1",
        "tiempo_pub" => "required|int|min:1",
        "terminos_condiciones" => "required|string|min:4",
        "verificar_comprobante" => "required|string|min:4",
        "comp_rechazado" => "required|string|min:4",
        "host" => "required",
        "puerto" => "required|int",
        "encriptado" => "required",
        "correo" => "required|email",
        "nombre" => "required",
        "password" => "required",
        "driver" => "required",
        "titular" => "required",
        "banco" => "required",
        "nro_cuenta" => "required",


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
        "verificar_comprobante.required" => "Este campo es obligatorio",
        "verificar_comprobante.string" => "Debes ingresar solo texto",
        "verificar_comprobante.min" => "Debes ingresar al menos :min caracteres",
        "comp_rechazado.required" => "Este campo es obligatorio",
        "comp_rechazado.string" => "Debes ingresar solo texto",
        "comp_rechazado.min" => "Debes ingresar al menos :min caracteres",
        "host.required" => "Este campo es obligatorio",
        "puerto.required" => "Este campo es obligatorio",
        "puerto.int" => "Ingresa un valor entero",
        "encriptado.required" => "Este campo es obligatorio",
        "correo.required" => "Este campo es obligatorio",
        "correo.email" => "Debes ingresar un correo valido",
        "nombre.required" => "Este campo es obligatorio",
        "password.required" => "Este campo es obligatorio",
        "driver.required" => "Este campo es obligatorio",
        "titular.required" => "Este campo es obligatorio",
        "banco.required" => "Este campo es obligatorio",
        "nro_cuenta.required" => "Este campo es obligatorio",
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
        if ($request->hasFile("qr")) {
            $this->validacion["qr"] = "image|mimes:jpeg,jpg,png|max:4096";
        }

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

            $datos_banco = [
                "titular" => $request->titular,
                "banco" => $request->banco,
                "nro_cuenta" => $request->nro_cuenta,
                "qr" => $parametrizacion->o_datos_banco->qr,
            ];
            if ($request->hasFile("qr")) {
                $file = $request->qr;
                $nom_qr = time() . '.' . $file->getClientOriginalExtension();
                $datos_banco["qr"] = $nom_qr;
                if ($parametrizacion->qr != 'qr.png') {
                    \File::delete(public_path("imgs/" . $parametrizacion->qr));
                }
                $file->move(public_path("imgs/"), $nom_qr);
            }
            Log::debug($datos_banco);
            $datos_banco = json_encode($datos_banco);

            $datos = [
                "inactividad_cliente" => $request->inactividad_cliente,
                "tipo_cambio" => $request->tipo_cambio,
                "servidor_correo" => $servidor_correo,
                "datos_banco" => $datos_banco,
                "nro_imagenes_pub" => $request->nro_imagenes_pub,
                "tiempo_pub" => $request->tiempo_pub,
                "terminos_condiciones" => $request->terminos_condiciones,
                "verificar_comprobante" => $request->verificar_comprobante,
                "comp_rechazado" => $request->comp_rechazado,
            ];
            if (!$parametrizacion) {
                Parametrizacion::create($datos);
            } else {
                $parametrizacion->update($datos);
            }



            DB::commit();
            return redirect()->route("parametrizacions.index")->with("success", "Registro correcto");
        } catch (\Exception $e) {
            Log::debug($e->getMessage());
            DB::rollBack();
            return redirect()->back()->with("error", $e->getMessage());
        }
    }
}
