<?php

namespace App\Http\Controllers;

use App\Mail\MensajeComprobanteMail;
use App\Models\Cliente;
use App\Models\NotificacionUser;
use App\Models\Parametrizacion;
use App\Models\Publicacion;
use App\Models\SubastaCliente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Mail;
use Inertia\Inertia;

class SubastaClienteController extends Controller
{
    public function verificaSubastaCliente(Request $request)
    {
        $publicacion = Publicacion::find($request->publicacion_id);

        $cliente = Cliente::where("user_id", $request->user_id)->get()->first();
        $subasta_cliente = null;
        if ($cliente && $publicacion->subasta) {
            $subasta_cliente = SubastaCliente::where("cliente_id", $cliente->id)
                ->where("subasta_id", $publicacion->subasta->id)
                ->get()
                ->first();
        }

        return response()->JSON([
            "cliente" => $cliente,
            "subasta_cliente" => $subasta_cliente
        ]);
    }

    public function show(SubastaCliente $subasta_cliente, Request $request)
    {
        $notificacionUserId = $request->input('notificacion_user_id');
        if ($notificacionUserId) {
            $notificacion_user = NotificacionUser::find($notificacionUserId);
            $notificacion_user->visto = 1;
            $notificacion_user->save();
        }

        $subasta_cliente = $subasta_cliente->load(["cliente", "subasta.publicacion"]);
        return Inertia::render("Admin/Publicacions/SubastaCliente", compact("subasta_cliente"));
    }

    public function getInfo(SubastaCliente $subasta_cliente)
    {
        return response()->JSON($subasta_cliente);
    }

    public function update(SubastaCliente $subasta_cliente, Request $request)
    {
        $subasta_cliente->estado_comprobante = $request->estado_comprobante;
        if ($request->estado_comprobante == 0) {
            $subasta_cliente->estado_puja = 0;
        }

        $subasta_cliente->save();
        // enviar mensaje segun el caso
        $parametrizacion = Parametrizacion::first();
        if ($parametrizacion) {
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

            $publicacion = $subasta_cliente->subasta->publicacion;
            $url =  route('publicacions.publicacionPortal', $publicacion->id);

            $mensaje = 'Tu comprobante ha sido verificado. Ahora puedes realizar tus ofertas/pujas en esta  <a href="' . $url . '">PUBLICACIÓN</a>';
            if ($request->estado_comprobante == 0) {
                $mensaje = 'Tu comprobante ha sido rechazado. Por favor verifica que no vea un problema con tu banco o que el monto de garantía sea correcto en la siguiente  <a href="' . $url . '">PUBLICACIÓN</a>';
            }

            $datos = [
                "mensaje" =>  $mensaje,
            ];

            Mail::to($subasta_cliente->cliente->email)
                ->send(new MensajeComprobanteMail($datos));
        }

        return response()->JSON($subasta_cliente);
    }
}
