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

    protected $appends = ["estado_comprobante_t", "estado_puja_t", "tipo_comprobante", "url_comprobante", "fecha_oferta_t", "hora_oferta_t", "fecha_registro", "fecha_hora_registro", "puja_t"];

    public function getPujaTAttribute()
    {
        if ($this->estado_comprobante == 0) {
            return '<span class="badge bg-gray">SIN PUJA</span>';
        }

        if ($this->estado_comprobante == 2) {
            return '<span class="badge bg-danger">SIN PUJA</span>';
        }

        return number_format($this->puja, 2, ".", ",");
    }

    public function getFechaRegistroAttribute()
    {
        if ($this->created_at) {
            return date("d/m/Y", strtotime($this->created_at));
        }
        return "-";
    }

    public function getFechaHoraRegistroAttribute()
    {
        if ($this->created_at) {
            return date("d/m/Y H:i", strtotime($this->created_at));
        }
        return "-";
    }

    public function getHoraOfertaTAttribute()
    {
        if ($this->hora_oferta) {
            return date("H:i", strtotime($this->hora_oferta));
        }
        return "-";
    }
    public function getFechaOfertaTAttribute()
    {
        if ($this->fecha_oferta) {
            return date("d/m/Y", strtotime($this->fecha_oferta));
        }
        return "-";
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
        $estado = "SIN VERIFICAR";

        if ($this->estado_comprobante === 1) {
            $estado = 'VERIFICADO';
        }

        if ($this->estado_comprobante === 2) {
            $estado = 'RECHAZADO';
        }

        return $estado;
    }

    public function getEstadoPujaTAttribute()
    {
        $estado = "PARTICIPANDO";

        if ($this->estado_puja === 1) {
            $estado = 'PARTICIPANDO';
        }

        if ($this->estado_puja === 2) {
            $estado = 'GANADOR';
        }

        if ($this->estado_comprobante === 0) {
            $estado = 'PENDIENTE';
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
