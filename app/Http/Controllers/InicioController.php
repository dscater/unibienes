<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class InicioController extends Controller
{
    public function inicio()
    {
        $array_infos = UserController::getInfoBoxUser();
        return Inertia::render('Admin/Home', compact('array_infos'));
    }

    public function getParcialDatosPago()
    {

        $html = vieW("parcials.datos_pago")->render();

        return response()->JSON($html);
    }
}
