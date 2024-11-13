<?php

namespace App\Http\Controllers;

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
}
