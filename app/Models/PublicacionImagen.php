<?php

namespace App\Models;

use App\Http\Controllers\PublicacionImagenController;
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

    protected $appends = ["url_imagen", "url_archivo", "url_file", "name", "ext"];

    public function getExtAttribute()
    {
        return PublicacionImagenController::getExtensionImagenDB($this->imagen);
    }

    public function getNameAttribute()
    {
        return $this->imagen;
    }

    public function getUrlFileAttribute()
    {
        $array_imgs = ["jpg", "jpeg", "png", "webp", "gif"];
        $ext = PublicacionImagenController::getExtensionImagenDB($this->imagen);
        if (in_array($ext, $array_imgs)) {
            return asset("/imgs/publicacions/" . $this->imagen);
        }
        return asset("/imgs/attach.png");
    }

    public function getUrlArchivoAttribute()
    {
        return asset("imgs/publicacions/" . $this->imagen);
    }

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
            if (isset($pi["file"]) && !is_string($pi["file"])) {
                $file = $pi["file"];
                $extension = "." . $file->getClientOriginalExtension();
                $nom_file = $key . time() . $extension;
                if ($pi["id"] == 0) {
                    $publicacion->publicacion_imagens()->create([
                        "imagen" => $nom_file,
                    ]);
                }
                $file->move($path, $nom_file);
            }
            //  elseif ($pi["id"] != 0) {
            //     $publicacion_imagen = PublicacionImagen::find($pi["id"]);
            //     if (file_exists($path . $publicacion_imagen->imagen)) {
            //         // \File::delete($path . $publicacion_imagen->imagen);
            //         $remover_files[] = $path . $publicacion_imagen->imagen;
            //     }
            // }
        }

        return $remover_files;
    }

    public static function eliminarImagensPublicacion($id_eliminados, $fisico = false)
    {
        $remover_files = [];
        if ($id_eliminados) {
            foreach ($id_eliminados as $value) {
                $publicacion_imagen = PublicacionImagen::find($value);
                if ($fisico) {
                    $remover_files[] = public_path("imgs/publicacions/" . $publicacion_imagen->imagen);
                    $publicacion_imagen->delete();
                } else {
                    $publicacion_imagen->status = 0;
                    $publicacion_imagen->save();
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
