<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PublicacionImagen extends Model
{
    use HasFactory;

    protected $fillable  = [
        "publicacion_id",
        "imagen",
    ];

    protected $appends = ["url_imagen"];

    public function getUrlImagenAttribute()
    {
        $imagen = "default.png";
        if ($this->imagen) {
            $imagen = $this->imagen;
        }
        return asset("imgs/publicacions/" . $imagen);
    }

    public function publicacion()
    {
        return $this->belongsTo(Publicacion::class, 'publicacion_id');
    }
}
