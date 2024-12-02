<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistorialOferta extends Model
{
    use HasFactory;

    protected $fillable = [
        "subasta_cliente_id",
        "subasta_id",
        "cliente_id",
        "puja",
        "fecha_oferta",
        "hora_oferta",
    ];

    protected $appends = ["hora_oferta_t", "fecha_oferta_t", "fecha_hora_oferta_t"];

    public function getFechaHoraOfertaTAttribute()
    {
        return date("d/m/Y H:i", strtotime($this->fecha_oferta . ' ' . $this->hora_oferta));
    }

    public function getHoraOfertaTAttribute()
    {
        return date("H:i", strtotime($this->hora_oferta));
    }
    public function getFechaOfertaTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_oferta));
    }

    public function subasta_cliente()
    {
        return $this->belongsTo(SubastaCliente::class, 'subasta_cliente_id');
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
