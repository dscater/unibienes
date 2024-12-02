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
        "estado_puja", //[0:no_ganador, 1:ganador_parcial, 2:ganador]
        "fecha_oferta",
        "hora_oferta"
    ];

    protected $appends = ["estado_comprobante_t", "estado_puja_t", "tipo_comprobante", "url_comprobante", "fecha_oferta_t", "hora_oferta_t"];


    public function getHoraOfertaTAttribute()
    {
        return date("H:i", strtotime($this->hora_oferta));
    }
    public function getFechaOfertaTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_oferta));
    }

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

    public function historial_ofertas()
    {
        return $this->hasMany(HistorialOferta::class, 'subasta_cliente_id')->orderBy("created_at", "desc");
    }
}
