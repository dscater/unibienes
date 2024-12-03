<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subasta extends Model
{
    use HasFactory;

    protected $fillable = [
        "publicacion_id",
        "estado", // [0:sin_ganador_finalizado ,1: vigente: 2: finalizado_con_ganador]
        "fecha_registro",
    ];

    protected $appends  = ["fecha_registro_t", "fecha_hora_pub_t", "fecha_hora_pub_am", "estado_t"];

    public function getEstadoTAttribute()
    {
        $estado = 'CONCLUIDA';
        if ($this->estado === 1) {
            $estado = 'VIGENTE';
        }
        if ($this->estado === 2) {
            $estado = 'TERMINADO';
        }

        return $estado;
    }

    public function getFechaHoraPubAmAttribute()
    {
        return date("d/m/Y H:i a", strtotime($this->created_at));
    }

    public function getFechaHoraPubTAttribute()
    {
        return date("d/m/Y H:i", strtotime($this->created_at));
    }

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function publicacion()
    {
        return $this->belongsTo(Publicacion::class, 'publicacion_id');
    }

    public function subasta_clientes()
    {
        return $this->hasMany(SubastaCliente::class, 'subasta_id');
    }

    public function subasta_clientes_puja()
    {
        return $this->hasMany(SubastaCliente::class, 'subasta_id')
            ->where("estado_comprobante", 1)
            ->where("puja", ">", 0)
            ->orderBy("puja", "desc")
            ->take(10);
    }

    public function historial_ofertas()
    {
        return $this->hasMany(HistorialOferta::class, 'subasta_id')
            ->orderBy("puja", "desc")
            ->take(10);
    }
}
