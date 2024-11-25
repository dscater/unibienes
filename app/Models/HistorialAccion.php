<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;

class HistorialAccion extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "accion",
        "descripcion",
        "datos_original",
        "datos_nuevo",
        "modulo",
        "fecha",
        "hora",
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public static function getDetalleRegistro($item, $table)
    {
        $columns = Schema::getColumnListing($table);
        $datos = "";
        foreach ($columns as $key => $col) {
            $datos .= $col . ": " . $item[$col];
            if ($key < count($columns)) {
                $datos .= '<br/>';
            }
        }
        return $datos;
    }

    public static function registraHistorialAccion($registro, $tabla, $modulo, $accion, $descripcion, $update = null)
    {
        if (Auth::check()) {
            $datos_nuevo = null;
            $datos_original = self::getDetalleRegistro($registro, $tabla);
            if ($update) {
                $datos_nuevo = HistorialAccion::getDetalleRegistro($update, "publicacions");
            }

            return HistorialAccion::create([
                "user_id" => Auth::user()->id,
                "accion" => $accion,
                "descripcion" => $descripcion,
                "datos_original" => $datos_original,
                "datos_nuevo" => $datos_nuevo,
                "modulo" => $modulo,
                "fecha" => date("Y-m-d"),
                "hora" => date("H:i:s")

            ]);
        }
        return false;
    }
}
