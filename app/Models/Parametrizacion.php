<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Parametrizacion extends Model
{
    use HasFactory;

    protected $fillable = [
        "inactividad_cliente",
        "tipo_cambio",
        "servidor_correo",
        "nro_imagenes_pub",
        "tiempo_pub",
        "terminos_condiciones",
    ];

    protected $appends = ["o_servidor_correo"];

    public function getOServidorCorreoAttribute()
    {
        return json_decode($this->servidor_correo);
    }
}
