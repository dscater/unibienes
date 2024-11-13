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
    ];

    protected $appends = ["fecha_hora_limite", "fecha_limite_t", "hora_limite_t"];

    public function getFechaHoraLimiteAttribute()
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
}
