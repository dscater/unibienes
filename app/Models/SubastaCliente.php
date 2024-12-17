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
        "hora_oferta",
        "devolucion",
        "descripcion_devolucion",
        "fecha_devolucion",
        "hora_devolucion",
    ];

    protected $appends = ["estado_comprobante_t", "estado_puja_t", "tipo_comprobante", "url_comprobante", "fecha_oferta_t", "hora_oferta_t", "fecha_registro", "fecha_hora_registro", "puja_t", "devolucion_span", "devolucion_txt", "fecha_devolucion_t", "fecha_hora_devolucion", "monto_garantia_pub", "moneda_abrev_pub"];

    public function getMonedaAbrevPubAttribute()
    {
        $moneda = "USD"; // DÓLARES (USD)
        if ($this->subasta->publicacion->moneda == 'BOLIVIANOS (BS)')
            $moneda = "BS";

        return $moneda;
    }

    public function getMontoGarantiaPubAttribute()
    {
        return number_format($this->subasta->publicacion->monto_garantia, 2, ".", ",");
    }

    public function getFechaHoraDevolucionAttribute()
    {
        if ($this->fecha_devolucion && $this->hora_devolucion) {
            return date("d/m/Y H:i", strtotime($this->fecha_devolucion . ' ' . $this->hora_devolucion));
        }

        if ($this->fecha_devolucion) {
            return date("d/m/Y", strtotime($this->fecha_devolucion));
        }

        return "-";
    }

    public function getFechaDevolucionTAttribute()
    {
        if ($this->fecha_devolucion) {
            return date("d/m/Y", strtotime($this->fecha_devolucion));
        }

        return "-";
    }

    public function getDevolucionTxtAttribute()
    {
        $span = 'PENDIENTE';

        if ($this->devolucion == 1) {
            $span = 'REALIZADO';
        }

        return $span;
    }

    public function getDevolucionSpanAttribute()
    {
        $span = '<span class="badge bg-gray">PENDIENTE</span>';

        if ($this->devolucion == 1) {
            $span = '<span class="badge bg-success">REALIZADO</span>';
        }

        return $span;
    }

    public function getPujaTAttribute()
    {
        if ($this->estado_comprobante == 0) {
            return '<span class="badge bg-gray">SIN PUJA</span>';
        }

        if ($this->estado_comprobante == 2) {
            if ($this->puja > 0) {
                return '<span class="badge bg-danger">' . number_format($this->puja, 2, ".", ",") . '</span>';
            } else {
                return '<span class="badge bg-danger">SIN PUJA</span>';
            }
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
