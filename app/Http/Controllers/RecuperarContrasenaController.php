<?php

namespace App\Http\Controllers;

use App\Mail\CorreoRecuperarPassword;
use App\Models\Cliente;
use App\Models\Parametrizacion;
use App\Models\RecuperarPassword;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class RecuperarContrasenaController extends Controller
{
    public function olvido_contrasena()
    {
        return Inertia::render("Auth/OlvidoContrasena");
    }

    public function solicitar_recuperacion(Request $request)
    {
        $request->validate([
            "correo" => "required|email"
        ]);
        $correo = $request->correo;

        try {
            // verificar cliente
            $cliente = Cliente::where("email", $correo)->first();

            if (!$cliente) {
                throw ValidationException::withMessages([
                    'error' =>  "No se encontró ningun registro con ese correo electrónico",
                ]);
            }

            if (!$cliente->user) {
                throw ValidationException::withMessages([
                    'error' =>  "Error al validar el correo electrónico del usuario, intente mas tarde",
                ]);
            }

            $parametrizacion = Parametrizacion::first();
            if (!$parametrizacion) {
                throw ValidationException::withMessages([
                    'error' =>  "Error al validar el correo electrónico del usuario, intente mas tarde",
                ]);
            }
            $codigo = self::generaCodigoRecuperacion();

            // enviar correo
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

            DB::update("UPDATE recuperar_passwords SET status = 0 WHERE user_id = $cliente->user_id");
            $recuperar_password = RecuperarPassword::create([
                "cod" => $codigo,
                "user_id" => $cliente->user->id,
                "status" => 1
            ]);

            $datos = [
                "mensaje" => 'Este es tu código de recuperación <b>' . $codigo . '</b>, usalo en el siguiente <a href="' . route('recuperar_password', $recuperar_password->id) . '">link de recuperación</a>',
            ];

            Mail::to($correo)
                ->send(new CorreoRecuperarPassword($datos));

            return redirect()->route("olvido_contrasena");
        } catch (\Exception $e) {

            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }


    public function recuperar_password(RecuperarPassword $recuperar_password)
    {
        return Inertia::render("Auth/RecuperarPassword", compact("recuperar_password"));
    }

    public function registrar_recuperacion(Request $request, RecuperarPassword $recuperar_password)
    {

        $request->validate([
            "cod" => "required",
            "password" => "required|confirmed|min:8"
        ],[
            "password.required" => "Debes ingresar una contraseña",
            "password.confirmed" => "Debes confirmar la contraseña",
            "password.min" => "Debes ingresar al menos :min caracteres",
        ]);
        try {
            if ($request->cod != $recuperar_password->cod) {
                throw new Exception("El código ingresado no es valido");
            }
            if ($recuperar_password->status == 0) {
                throw new Exception("Este código de verificación ya fue usado o ya caducó");
            }

            $user = $recuperar_password->user;
            $user->password = Hash::make($request->password);
            $user->save();

            $recuperar_password->status = 0;
            $recuperar_password->save();
            return response()->JSON([
                'sw' => true,
                'message' => 'Contraseña actualizada con éxito'
            ], 200);
        } catch (\Exception $e) {
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public static function generaCodigoRecuperacion($longitud = 6)
    {
        // Caracteres permitidos para el código
        $caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        $codigo = '';

        // Generar el código aleatorio
        do {
            for ($i = 0; $i < $longitud; $i++) {
                $indiceAleatorio = rand(0, strlen($caracteres) - 1);
                $codigo .= $caracteres[$indiceAleatorio];
            }
            $existe = RecuperarPassword::where("cod", $codigo)->get()->first();
        } while ($existe);

        return $codigo;
    }
}
