<?php

namespace App\Http\Controllers;

use App\Models\Subasta;
use App\Models\SubastaCliente;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SubastaController extends Controller
{
    public function clientes(Subasta $subasta)
    {
        return Inertia::render("Admin/Publicacions/SubastaClientes", compact("subasta"));
    }

    public function getClientesApi(Request $request, Subasta $subasta)
    {
        $length = $request->input('length', 10); // Valor de `length` enviado por DataTable
        $start = $request->input('start', 0); // Índice de inicio enviado por DataTable
        $page = ($start / $length) + 1; // Cálculo de la página actual
        $search = $request->input('search');

        $publicacions = SubastaCliente::select("subasta_clientes.*");
        if ($search && trim($search) != '') {
            $publicacions->where("nombre", "LIKE", "%$search%");
        }

        $publicacions->where("subasta_id", $subasta->id);

        $publicacions = $publicacions->paginate($length, ['*'], 'page', $page);

        return response()->JSON([
            'data' => $publicacions->items(),
            'recordsTotal' => $publicacions->total(),
            'recordsFiltered' => $publicacions->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }
}
