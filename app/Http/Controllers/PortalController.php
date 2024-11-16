<?php

namespace App\Http\Controllers;

use App\Models\Parametrizacion;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PortalController extends Controller
{
    public function index()
    {
        return Inertia::render("Portal/Inicio");
    }

    public function vehiculos()
    {
        return Inertia::render("Portal/Vehiculos");
    }

    public function otros_bienes()
    {
        return Inertia::render("Portal/OtrosBienes");
    }

    public function ecologicos()
    {
        return Inertia::render("Portal/Ecologicos");
    }

    public function mis_subastas()
    {
        return Inertia::render("Portal/MisSubastas");
    }

    public function getTerminosCondiciones()
    {
        $terminos_condiciones = "";
        $parametrizacion = Parametrizacion::first();
        if ($parametrizacion) {
            $terminos_condiciones = $parametrizacion->terminos_condiciones;
        }

        return response()->JSON($terminos_condiciones);
    }
}
