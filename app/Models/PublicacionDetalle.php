<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PublicacionDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "publicacion_id",
        "caracteristica",
        "detalle",
    ];

    public function publicacion()
    {
        return $this->belongsTo(Publicacion::class, 'publicacion_id');
    }
}
