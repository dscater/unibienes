<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PublicacionDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "publicacion_id",
        "caracteristica",
        "detalle",
    ];

    public function publicacion()
    {
        return $this->belongsTo(Publicacion::class, 'publicacion_id');
    }


    // FUNCIONES
    public static function registraDetallesPublicacion($publicacion, $publicacion_detalles)
    {
        foreach ($publicacion_detalles as $pd) {
            if ($pd["id"] == 0) {
                $publicacion->publicacion_detalles()->create([
                    "caracteristica" => mb_strtoupper($pd["caracteristica"]),
                    "detalle" => mb_strtoupper($pd["detalle"]),
                ]);
            } else {
                $publicacion_detalle = PublicacionDetalle::find($pd["id"]);
                $publicacion_detalle->update([
                    "caracteristica" => mb_strtoupper($pd["caracteristica"]),
                    "detalle" => mb_strtoupper($pd["detalle"]),
                ]);
            }
        }

        return true;
    }

    public static function eliminaDetallesPublicacion($id_eliminados, $fisico = false)
    {
        if ($id_eliminados) {
            foreach ($id_eliminados as $value) {
                if ($fisico) {
                    $publicacion_detalle = PublicacionDetalle::find($value);
                    $publicacion_detalle->delete();
                }
            }
        }
        return true;
    }
}
