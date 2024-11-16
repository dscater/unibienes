<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
        "estado_sub", // [0:eliminado, 1:vigente, 2:tiempo_concluido_mostrar, 3:tiempo_concluido_NO_mostrar, 4:tiempo_concluido_NO_mostrar_SinGanador]
    ];

    protected $appends = ["fecha_hora_limite", "fecha_hora_limite_am", "fecha_limite_t", "hora_limite_t", "estado_sub_t"];

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
}
