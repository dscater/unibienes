<?php

namespace App\Http\Controllers;

use App\Models\NotificacionUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificacionController extends Controller
{
    public function listadoPorUsuario(Request $request)
    {
        $ultimo = $request->id;
        $sin_ver = 0;

        $notificacion_users = NotificacionUser::with(["notificacion", "user"])->where("user_id", Auth::user()->id)
            ->where("id", ">", $ultimo)
            ->orderBy("created_at", "desc")->get();

        $sin_ver = NotificacionUser::where("user_id", Auth::user()->id)->where("visto", 0)->count();
        if (count($notificacion_users) > 0) {
            $ultimo = $notificacion_users[0]->id;
        }

        return response()->JSON([
            "notificacion_users" => $notificacion_users,
            "ultimo" => $ultimo,
            "sin_ver" => $sin_ver,
        ]);
    }
}
