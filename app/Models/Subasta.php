<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subasta extends Model
{
    use HasFactory;

    protected $fillable = [
        "publicacion_id",
        "estado",
        "fecha_registro",
    ];

    protected $appends  = ["fecha_registro_t", "estado_t"];

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
            ->orderBy("puja", "desc");
    }
}
