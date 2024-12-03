<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Parametrizacion extends Model
{
    use HasFactory;

    protected $fillable = [
        "inactividad_cliente",
        "tipo_cambio",
        "servidor_correo",
        "datos_banco",
        "nro_imagenes_pub",
        "tiempo_pub",
        "terminos_condiciones",
    ];

    protected $appends = ["o_servidor_correo", "o_datos_banco", "url_qr"];

    public function getOServidorCorreoAttribute()
    {
        return json_decode($this->servidor_correo);
    }

    public function getODatosBancoAttribute()
    {
        return json_decode($this->datos_banco);
    }


    public function getUrlQrAttribute()
    {
        $data = json_decode($this->datos_banco);
        return asset("imgs/" . $data->qr);
    }
}
