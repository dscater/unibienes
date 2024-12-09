<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class ClienteController extends Controller
{
    public function listado()
    {
        $clientes = Cliente::select("clientes.*")->get();
        return response()->JSON([
            "clientes" => $clientes
        ]);
    }

    public function update(Request $request, Cliente $cliente)
    {
        $validacion = [
            "cliente.nombre" => "required|regex:/^[\pL\s\.\,áéíóúÁÉÍÓÚñÑ]+$/u",
            "cliente.paterno" => "required|regex:/^[\pL\s\.\,áéíóúÁÉÍÓÚñÑ]+$/u",
            "cliente.ci_exp" => "required",
        ];

        $validacion["cliente.ci"] = [
            "required",
            "numeric",
            "digits_between:7,10",
            Rule::unique('clientes', 'ci')
                ->where(function ($query) {
                    $complemento = request()->input('cliente.complemento');
                    if (is_null($complemento)) {
                        $query->whereIn('complemento', [NULL, ""]);
                    } else {
                        $query->where('complemento', $complemento);
                    }
                })
                ->ignore($cliente->id), // Ignorar el registro actual
        ];

        if ($request->complemento && trim($request->complemento) != '') {
            $validacion["complemento"] = "required|regex:/^[\pL\s\.\,0-9áéíóúÁÉÍÓÚñÑ]+$/u";
        }

        if ($request->materno && trim($request->materno) != '') {
            $validacion["materno"] = "regex:/^[\pL\s\.\,áéíóúÁÉÍÓÚñÑ]+$/u";
        }

        if ($request->hasFile("cliente.foto_ci_anverso")) {
            $validacion["cliente.foto_ci_anverso"] = "required|file|mimes:pdf,jpg,jpeg,png,webp|max:5120";
        }

        if ($request->hasFile("cliente.foto_ci_reverso")) {
            $validacion["cliente.foto_ci_reverso"] = "required|file|mimes:pdf,jpg,jpeg,png,webp|max:5120";
        }
        // $validacion["banco"] = "required|regex:/^[\pL\s\.\'\"\,0-9áéíóúÁÉÍÓÚñÑ]+$/u";
        // $validacion["nro_cuenta"] = "required|regex:/^[\pL\s\-\.\'\"\,0-9áéíóúÁÉÍÓÚñÑ]+$/u";
        // $validacion["moneda"] = "required|regex:/^[\pL\s\.\,0-9áéíóúÁÉÍÓÚñÑ]+$/u";

        $mensajes = [
            "cliente.nombre.required" => "Este campo es obligatorio",
            "cliente.nombre.regex" => "Debes ingresar solo texto",
            "cliente.paterno.required" => "Este campo es obligatorio",
            "cliente.paterno.regex" => "Debes ingresar solo texto",
            "cliente.materno.regex" => "Debes ingresar solo texto",
            "cliente.ci.required" => "Este campo es obligatorio",
            "cliente.ci.numeric" => "Debes ingresar solo números",
            "cliente.ci.digits_between" => "Debes ingresar un valor entre 7-10 digitos",
            "cliente.ci.unique" => "Este documento de identidad ya fue registrado",
            "cliente.ci_exp.required" => "Este campo es obligatorio",
            "cliente.fono.required" => "Este campo es obligatorio",
            "cliente.fono.numeric" => "Debes ingresar solo números",
            "cliente.fono.digits_between" => "Debes ingresar un valor entre 7-10 digitos",
            "cliente.dpto_residencia.required" => "Este campo es obligatorio",
            "cliente.email.required" => "Este campo es obligatorio",
            "cliente.email.email" => "Debes ingresar un correo valido",
            "cliente.email.unique" => "Este correo ya fue registrado",
            "cliente.foto_ci_anverso.required" => "Este campo es obligatorio",
            "cliente.foto_ci_reverso.required" => "Este campo es obligatorio",
        ];

        $request->validate($validacion, $mensajes);
        DB::beginTransaction();
        try {
            $user = $cliente->user;
            $user->update([
                "nombres" => mb_strtoupper($request["cliente"]["nombre"]),
                'apellidos' => mb_strtoupper($request["cliente"]["paterno"] . (trim($request["cliente"]["materno"]) != '' ? ' ' . $request["cliente"]["materno"] : '')),
                'email' => $request["cliente"]["email"],
            ]);

            $datos_original = HistorialAccion::getDetalleRegistro($cliente, "clientes");

            $datos_update = [
                "nombre" => mb_strtoupper($request["cliente"]["nombre"]),
                "paterno" => mb_strtoupper($request["cliente"]["paterno"]),
                "materno" => mb_strtoupper($request["cliente"]["materno"]),
                "ci" => trim($request["cliente"]["ci"]),
                "complemento" => trim($request["cliente"]["complemento"]),
                "ci_exp" => trim($request["cliente"]["ci_exp"]),
            ];
            $path = public_path("imgs/users/");
            $old_value = Cliente::find($cliente->id);
            if ($request["cliente"]["foto_ci_anverso"] && !is_string($request["cliente"]["foto_ci_anverso"])) {
                \File::delete($path . $old_value->foto_ci_anverso);
                $foto_ci_anverso = $request["cliente"]["foto_ci_anverso"];
                $extension = "." . $foto_ci_anverso->getClientOriginalExtension();
                $nom_file_ci_anverso = '1' . $user->id . time() . $extension;
                $datos_update["foto_ci_anverso"] = $nom_file_ci_anverso;
                $foto_ci_anverso->move($path, $nom_file_ci_anverso);
            }
            if ($request["cliente"]["foto_ci_reverso"] && !is_string($request["cliente"]["foto_ci_reverso"])) {
                \File::delete($path . $old_value->foto_ci_reverso);
                $foto_ci_reverso = $request["cliente"]["foto_ci_reverso"];
                $extension = "." . $foto_ci_reverso->getClientOriginalExtension();
                $nom_file_ci_reverso = '1' . $user->id . time() . $extension;
                $datos_update["foto_ci_reverso"] = $nom_file_ci_reverso;
                $foto_ci_reverso->move($path, $nom_file_ci_reverso);
            }
            $cliente->update($datos_update);

            $datos_nuevo = HistorialAccion::getDetalleRegistro($cliente, "clientes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN CLIENTE',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CLIENTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("usuarios.clientes")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
