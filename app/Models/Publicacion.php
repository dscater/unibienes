<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Publicacion extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "categoria",
        "moneda",
        "oferta_inicial",
        "ubicacion",
        "observaciones",
        "fecha_limite",
        "hora_limite",
        "monto_garantia",
        "estado_sub", // [0:sin_publicar, 1:vigente, 2:tiempo_concluido_mostrar, 3:tiempo_concluido_NO_mostrar, 4:tiempo_concluido_NO_mostrar_SinGanador,5:eliminado]
    ];

    protected $appends = ["fecha_hora_limite", "fecha_hora_limite_am", "fecha_limite_t", "hora_limite_t", "estado_sub_t", "estado_txt"];

    public function getEstadoTxtAttribute()
    {
        $estado = "SIN PUBLICAR";
        if ($this->estado_sub == 1) {
            $estado = "VIGENTE";
        }

        if ($this->estado_sub == 2 || $this->estado_sub == 3 || $this->estado_sub == 4) {
            $estado = "FINALIZADO";
        }

        return $estado;
    }

    public function getEstadoSubTAttribute()
    {
        $estado = "PENDIENTE";

        if ($this->estado_sub === 1) {
            $estado = "PUBLICADO";
        }

        if ($this->estado_sub === 2) {
            $estado = "TERMINADO";
        }

        return $estado;
    }

    public function getFechaHoraLimiteAttribute()
    {
        return date("d/m/Y H:i:s", strtotime($this->fecha_limite . ' ' . $this->hora_limite));
    }

    public function getFechaHoraLimiteAMAttribute()
    {
        return date("d/m/Y H:i a", strtotime($this->fecha_limite . ' ' . $this->hora_limite));
    }

    public function getFechaLimiteTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_limite));
    }

    public function getHoraLimiteTAttribute()
    {
        return date("H:i a", strtotime($this->hora_limite));
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function publicacion_detalles()
    {
        return $this->hasMany(PublicacionDetalle::class, 'publicacion_id');
    }

    public function publicacion_imagens()
    {
        return $this->hasMany(PublicacionImagen::class, 'publicacion_id');
    }

    public function subasta()
    {
        return $this->hasOne(Subasta::class, 'publicacion_id');
    }

    public function actualizaPublicacionesEstado()
    {
        $parametrizacion = Parametrizacion::first();
        $dias_maximo = 8;
        if ($parametrizacion) {
            $dias_maximo = (int)$parametrizacion->tiempo_pub;
        }
        $fecha_mostrar = date("Y-m-d", strtotime("-" . $dias_maximo . " days"));
        $publicaciones = Publicacion::where("fecha_limite", "<=", $fecha_mostrar)
            ->where("estado_sub", 2)
            ->get();
        foreach ($publicaciones as $item) {
            $item->estado_sub = 3;
            $item->save();
        }
        return true;
    }

    public static function actualizaEstadoUsuario()
    {
        $parametrizacion = Parametrizacion::first();
        $anios_maximo = 1;
        if ($parametrizacion) {
            $anios_maximo = (int)$parametrizacion->inactividad_cliente;
        }
        $fecha_ultima = date("Y-m-d", strtotime("-" . $anios_maximo . " year"));
        $users = User::where("ultima_sesion", "<=", $fecha_ultima)
            ->where("status", 1)
            ->get();
        foreach ($users as $item) {
            $item->status = 0;
            $item->save();
        }
        return true;
    }
}
