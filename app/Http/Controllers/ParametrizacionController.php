<?php

namespace App\Http\Controllers;

use App\Models\Parametrizacion;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ParametrizacionController extends Controller
{
    public function index()
    {
        return Inertia::render("Admin/Parametrizacions/Index");
    }

    public function listado()
    {
        $parametrizacions = Parametrizacion::get();
        return response()->JSON([
            "parametrizacions" => $parametrizacions
        ]);
    }

    public function api(Request $request)
    {
        $parametrizacions = Parametrizacion::select("parametrizacions.*");
        $parametrizacions = $parametrizacions->paginate(10);
        return response()->JSON([
            'data' => $parametrizacions->items(),
            'recordsTotal' => $parametrizacions->total(),
            'recordsFiltered' => $parametrizacions->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $parametrizacions = Parametrizacion::select("parametrizacions.*");
        $parametrizacions = $parametrizacions->paginate($request->itemsPerPage);
        return response()->JSON([
            'data' => $parametrizacions->items(),
            'recordsTotal' => $parametrizacions->total(),
            'recordsFiltered' => $parametrizacions->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }
}
