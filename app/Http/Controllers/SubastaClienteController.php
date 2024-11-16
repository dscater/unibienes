<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\NotificacionUser;
use App\Models\Publicacion;
use App\Models\SubastaCliente;
use Illuminate\Http\Request;
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
        $subasta_cliente->update();
        // --verificar nuevo ganador

        return response()->JSON($subasta_cliente);
    }
}
