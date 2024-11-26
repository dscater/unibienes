<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PublicacionImagenController extends Controller
{
    public static function getExtensionImagenDB($imagen)
    {
        $array = explode(".", $imagen);
        return $array[1];
    }
}
