<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubastaCliente extends Model
{
    use HasFactory;

    protected $fillable = [
        "subasta_id",
        "cliente_id",
        "garantia",
        "puja",
        "comprobante",
        "estado_comprobante",
        "estado_puja",
    ];

    protected $appends = ["estado_comprobante_t", "estado_puja_t", "tipo_comprobante", "url_comprobante"];

    public function getUrlComprobanteAttribute()
    {
        return asset("files/comprobantes/" . $this->comprobante);
    }

    public function getTipoComprobanteAttribute()
    {
        $array_comprobante = explode(".", $this->comprobante);
        $extension = $array_comprobante[1];
        $array_imgs = ["jpg", "jpeg", "webp", "png"];

        if (in_array($extension, $array_imgs)) {
            return "imagen";
        }
        return "file";
    }

    public function getEstadoComprobanteTAttribute()
    {
        $estado = "PENDIENTE";

        if ($this->estado_comprobante === 1) {
            $estado = 'VERIFICADO';
        }

        return $estado;
    }

    public function getEstadoPujaTAttribute()
    {
        $estado = "";

        if ($this->estado_puja === 1) {
            $estado = 'GANADOR';
        }

        return $estado;
    }

    public function subasta()
    {
        return $this->belongsTo(Subasta::class, 'subasta_id');
    }

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }
}
