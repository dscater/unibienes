<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public static $permisos = [
        "SUPER USUARIO" => [
            "usuarios.index",
            "usuarios.create",
            "usuarios.edit",
            "usuarios.destroy",

            "reportes.usuarios",
        ],
        "SUPERVISOR DE SUCURSAL" => [],
        "OPERADOR" => [],
    ];



    public function permisosUsuario(Request $request)
    {
        return response()->JSON([
            "permisos" => Auth::user()->getPermisos()
        ]);
    }

    public function getUser()
    {
        return response()->JSON([
            "user" => Auth::user()
        ]);
    }

    public static function getInfoBoxUser()
    {
        $tipo = Auth::user()->tipo;
        $array_infos = [];

        // if (in_array('usuarios.index', self::$permisos[$tipo])) {
        //     $array_infos[] = [
        //         'label' => 'USUARIOS',
        //         'cantidad' => User::where('id', '!=', 1)->where("tipo", "!=", "CLIENTE")->count(),
        //         'color' => 'bg-blue',
        //         'icon' => "fa-users",
        //         "url" => "usuarios.index"
        //     ];
        // }

        return $array_infos;
    }
}
