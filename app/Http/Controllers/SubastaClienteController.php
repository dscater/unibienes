<?php

namespace App\Http\Controllers;

use App\Mail\MensajeComprobanteMail;
use App\Models\Cliente;
use App\Models\HistorialOferta;
use App\Models\NotificacionUser;
use App\Models\Parametrizacion;
use App\Models\Publicacion;
use App\Models\SubastaCliente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
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
            if ($subasta_cliente) {
                $subasta_cliente = $subasta_cliente->load(["historial_ofertas"]);
            }
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

        $subasta_cliente = $subasta_cliente->load(["cliente", "subasta.publicacion.publicacion_detalles", "subasta.publicacion.publicacion_imagens", "historial_ofertas"]);
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
            if ($subasta_cliente->estado_comprobante == 2) {
                $mensaje = 'Tu comprobante ha sido rechazado. Por favor verifica que no vea un problema con tu banco o que el monto de garantía sea correcto en la siguiente  <a href="' . $url . '">PUBLICACIÓN</a>';
                if ($parametrizacion->comp_rechazado) {
                    $mensaje = $parametrizacion->comp_rechazado;
                    $mensaje .= '<br/><a href="' . $url . '">Ver publicación</a>';
                }
            }

            $datos = [
                "mensaje" =>  $mensaje,
            ];

            Mail::to($subasta_cliente->cliente->email)
                ->send(new MensajeComprobanteMail($datos));
        }

        return response()->JSON($subasta_cliente->load(["cliente", "subasta.publicacion", "historial_ofertas"]));
    }

    public function registrarDevolucion(SubastaCliente $subasta_cliente, Request $request)
    {

        $validacion = [
            "fecha_devolucion" => "required|date",
            "hora_devolucion" => "required|date_format:H:i",
        ];
        if ($request->descripcion_devolucion && trim($request->descripcion_devolucion) != '') {
            $validacion["descripcion_devolucion"] = "string|min:2";
        }

        $mensajes = [
            "fecha_devolucion.required" => "Esta campo es obligatorio",
            "fecha_devolucion.date" => "Debes ingresar una fecha valida",
            "hora_devolucion.required" => "Esta campo es obligatorio",
            "hora_devolucion.date_format" => "Debes ingresar una hora valida",
            "descripcion_devolucion.string" => "Debes ingresar texto",
            "descripcion_devolucion.min" => "Debes ingresar al menos :min caracteres",
        ];

        $request->validate($validacion, $mensajes);

        $subasta_cliente->update([
            "devolucion" => 1,
            "descripcion_devolucion" => (trim($request->descripcion_devolucion) != '' ? mb_strtoupper($request->descripcion_devolucion) : NULL),
            "fecha_devolucion" => (trim($request->fecha_devolucion) != '' ? $request->fecha_devolucion : NULL),
            "hora_devolucion" => (trim($request->hora_devolucion) != '' ? $request->hora_devolucion : NULL),
        ]);
        // enviar mensaje de devolución
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

            $monto = number_format($subasta_cliente->subasta->publicacion->monto_garantia, 2, ".", ",");
            $moneda = $subasta_cliente->subasta->publicacion->moneda_txt;

            $txt_monto = $moneda . ' ' . $monto;

            $txt_banco = $subasta_cliente->cliente->nro_cuenta . ' (' . $subasta_cliente->cliente->banco . ')';

            $mensaje = 'Se acaba de realizar la devolución de <b>' . $txt_monto . '</b>; en tu cuenta ' . $txt_banco . '<br/>Puedes ver la publicación de la cual se realizó la devolución <a href="' . $url . '">aquí</a>';

            $datos = [
                "mensaje" =>  $mensaje,
            ];

            Mail::to($subasta_cliente->cliente->email)
                ->send(new MensajeComprobanteMail($datos));
        }

        return response()->JSON($subasta_cliente->load(["cliente", "subasta.publicacion", "historial_ofertas"]));
    }


    public function historialOfertas(Request $request)
    {
        $publicacion_id = $request->publicacion_id;
        $user = Auth::user();
        $cliente = $user->cliente;
        $historial_ofertas = [];
        if ($cliente) {
            $publicacion = Publicacion::find($publicacion_id);
            if ($publicacion && $publicacion->subasta) {
                $subasta = $publicacion->subasta;
                $historial_ofertas = HistorialOferta::where("subasta_id", $subasta->id)
                    ->where("cliente_id", $cliente->id)->orderBy("created_at", "desc")->get();
            }
        }

        return response()->JSON($historial_ofertas);
    }
}
