<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class PublicacionImagen extends Model
{
    use HasFactory;

    protected $fillable  = [
        "publicacion_id",
        "imagen",
    ];

    protected $appends = ["url_imagen"];

    public function getUrlImagenAttribute()
    {
        $imagen = "default.png";
        if ($this->imagen) {
            $imagen = $this->imagen;
        }
        return asset("imgs/publicacions/" . $imagen);
    }

    public function publicacion()
    {
        return $this->belongsTo(Publicacion::class, 'publicacion_id');
    }

    // FUNCIONES
    public static function registraImagensPublicacion($publicacion, $publicacion_imagens)
    {
        $remover_files = [];
        $path = public_path("imgs/publicacions/");

        foreach ($publicacion_imagens as $key => $pi) {
            if ($pi["imagen"] && !is_string($pi["imagen"])) {
                $file = $pi["imagen"];
                $extension = "." . $file->getClientOriginalExtension();
                $nom_file = $key . time() . $extension;
                if ($pi["id"] == 0) {
                    $publicacion->publicacion_imagens()->create([
                        "imagen" => $nom_file,
                    ]);
                } else {
                    $publicacion_imagen = PublicacionImagen::find($pi["id"]);
                    if (file_exists($path . $publicacion_imagen->imagen)) {
                        // \File::delete($path . $publicacion_imagen->imagen);
                        $remover_files[] = $path . $publicacion_imagen->imagen;
                    }
                    $publicacion_imagen->update([
                        "imagen" => $nom_file,
                    ]);
                }


                $file->move($path, $nom_file);
            }
        }

        return $remover_files;
    }

    public static function eliminarImagensPublicacion($id_eliminados, $fisico = false)
    {
        $remover_files = [];
        if ($id_eliminados) {
            foreach ($id_eliminados as $value) {
                if ($fisico) {
                    $publicacion_imagen = PublicacionImagen::find($value);
                    $remover_files[] = public_path("imgs/publicacions/" . $publicacion_imagen->imagen);
                    $publicacion_imagen->delete();
                }
            }
        }

        return $remover_files;
    }

    public static function removerArchivos($archivos)
    {
        foreach ($archivos as $archivo) {
            \File::delete($archivo);
        }

        return true;
    }
}
