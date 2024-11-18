<?php

namespace App\Http\Controllers;

use App\Models\Publicacion;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class UserController extends Controller
{

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
        $permisos = [];
        $array_infos = [];
        if (Auth::check()) {
            $oUser = new User();
            $permisos = $oUser->getPermisos();
            if ($permisos == '*' || in_array('usuarios.index', $permisos)) {
                $array_infos[] = [
                    'label' => 'USUARIOS',
                    'cantidad' => User::where('id', '!=', 1)->count(),
                    'color' => 'bg-principal',
                    'icon' => "fa-users",
                    "url" => "usuarios.index"
                ];
            }
            if ($permisos == '*' || in_array('usuarios.index', $permisos)) {
                $publicacions = Publicacion::count();

                $array_infos[] = [
                    'label' => 'PUBLICACIONES',
                    'cantidad' => $publicacions,
                    'color' => 'bg-principal',
                    'icon' => "fa-list",
                    "url" => "publicacions.index"
                ];
            }
        }


        return $array_infos;
    }
}
