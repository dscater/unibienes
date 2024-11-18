<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;

class ClienteController extends Controller
{
    public function listado()
    {
        $clientes = Cliente::select("clientes.*")->get();
        return response()->JSON([
            "clientes" => $clientes
        ]);
    }
}
