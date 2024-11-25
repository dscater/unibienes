<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class Publicacion extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "categoria",
        "moneda",
        "oferta_inicial",
        "ubicacion",
        "observaciones",
        "fecha_limite",
        "hora_limite",
        "monto_garantia",
        "estado_sub", // [0:sin_publicar, 1:vigente, 2:tiempo_concluido_mostrar, 3:tiempo_concluido_NO_mostrar, 4:tiempo_concluido_NO_mostrar_SinGanador,5:eliminado]
    ];

    // APPENDS
    protected $appends = ["fecha_hora_limite", "fecha_hora_limite_am", "fecha_limite_t", "hora_limite_t", "estado_sub_t", "estado_txt"];

    public function getEstadoTxtAttribute()
    {
        $estado = "SIN PUBLICAR";
        if ($this->estado_sub == 1) {
            $estado = "VIGENTE";
        }

        if ($this->estado_sub == 2 || $this->estado_sub == 3 || $this->estado_sub == 4) {
            $estado = "FINALIZADO";
        }

        return $estado;
    }

    public function getEstadoSubTAttribute()
    {
        $estado = "PENDIENTE";

        if ($this->estado_sub === 1) {
            $estado = "PUBLICADO";
        }

        if ($this->estado_sub === 2) {
            $estado = "TERMINADO";
        }

        return $estado;
    }

    public function getFechaHoraLimiteAttribute()
    {
        return date("d/m/Y H:i:s", strtotime($this->fecha_limite . ' ' . $this->hora_limite));
    }

    public function getFechaHoraLimiteAMAttribute()
    {
        return date("d/m/Y H:i a", strtotime($this->fecha_limite . ' ' . $this->hora_limite));
    }

    public function getFechaLimiteTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_limite));
    }

    public function getHoraLimiteTAttribute()
    {
        return date("H:i a", strtotime($this->hora_limite));
    }

    // RELACIONES

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function publicacion_detalles()
    {
        return $this->hasMany(PublicacionDetalle::class, 'publicacion_id');
    }

    public function publicacion_imagens()
    {
        return $this->hasMany(PublicacionImagen::class, 'publicacion_id');
    }

    public function subasta()
    {
        return $this->hasOne(Subasta::class, 'publicacion_id');
    }

    // FUNCIONES

    public function actualizaPublicacionesEstado()
    {
        $parametrizacion = Parametrizacion::first();
        $dias_maximo = 8;
        if ($parametrizacion) {
            $dias_maximo = (int)$parametrizacion->tiempo_pub;
        }
        $fecha_mostrar = date("Y-m-d", strtotime("-" . $dias_maximo . " days"));
        $publicaciones = Publicacion::where("fecha_limite", "<=", $fecha_mostrar)
            ->where("estado_sub", 2)
            ->get();
        foreach ($publicaciones as $item) {
            $item->estado_sub = 3;
            $item->save();
        }
        return true;
    }

    public static function actualizaEstadoUsuario()
    {
        $parametrizacion = Parametrizacion::first();
        $anios_maximo = 1;
        if ($parametrizacion) {
            $anios_maximo = (int)$parametrizacion->inactividad_cliente;
        }
        $fecha_ultima = date("Y-m-d", strtotime("-" . $anios_maximo . " year"));
        $users = User::where("ultima_sesion", "<=", $fecha_ultima)
            ->where("status", 1)
            ->get();
        foreach ($users as $item) {
            $item->status = 0;
            $item->save();
        }
        return true;
    }

    public function validaDatos($data_request, $publicacion_detalles, $publicacion_imagens)
    {
        $validacion = [
            "categoria" => "required",
            "moneda" => "required",
            "oferta_inicial" => "required|numeric|min:1",
            "ubicacion" => "required",
            "fecha_limite" => "required",
            "hora_limite" => "required",
            "monto_garantia" => "required|numeric|min:1",
        ];

        $mensajes = [
            "categoria.required" => "Este campo es obligatorio",
            "moneda.required" => "Este campo es obligatorio",
            "oferta_inicial.required" => "Este campo es obligatorio",
            "oferta_inicial.numeric" => "Debes ingresar un valor númerico",
            "oferta_inicial.min" => "Debes ingresar al menos :min",
            "ubicacion.required" => "Este campo es obligatorio",
            "fecha_limite.required" => "Este campo es obligatorio",
            "hora_limite.required" => "Este campo es obligatorio",
            "monto_garantia.required" => "Este campo es obligatorio",
            "monto_garantia.numeric" => "Debes ingresar un valor númerico",
            "monto_garantia.min" => "Debes ingresar al menos :min",
            "publicacion_detalles.required" => "Este campo es obligatorio",
            "publicacion_detalles.min" => "Debes agregar al menos :min caracteristicas",
            "publicacion_detalles.*.required" => "Este campo es obligatorio",
            "publicacion_detalles.*.min" => "Debes ingresar al menos :min caracteres",
            "publicacion_imagens.required" => "Este campo es obligatorio",
            "publicacion_imagens.min" => "Debes ingresar al menos :min imagenes",
        ];

        $validator = Validator::make($data_request, $validacion, $mensajes);

        $errores = [];
        if ($validator->fails()) {
            $errores = $validator->errors()->toArray();
        }

        foreach ($errores as $key => $err) {
            $errores[$key] = $err[0];
        }

        // Validar detalles 
        $parametrizacion = Parametrizacion::get()->first();
        if (!$publicacion_detalles || count($publicacion_detalles) < 3) {
            // $errores->add("publicacion_detalles", "Debes agregar al menos 3 detalles y caracteristicas");
            $errores["publicacion_detalles"] = "Debes agregar al menos 3 detalles y caracteristicas";
        } else {
            foreach ($publicacion_detalles as $pd) {
                if (strlen($pd["caracteristica"]) < 3 || strlen($pd['detalle']) < 3) {
                    // $errores->add("publicacion_detalles", 'Debes ingresar al menos 1 caracter en cada detalle y caracteristica');
                    $errores["publicacion_detalles"] = 'Debes ingresar al menos 1 caracter en cada detalle y caracteristica';
                    break;
                }
            }
        }

        if (!$publicacion_imagens || count($publicacion_imagens) < $parametrizacion->nro_imagenes_pub) {
            // $errores->add("publicacion_imagens", "Debes agregar al menos " . $parametrizacion->nro_imagenes_pub . " imagenes");
            $errores["publicacion_imagens"] = "Debes agregar al menos " . $parametrizacion->nro_imagenes_pub . " imagenes";
        } else {
            foreach ($publicacion_imagens as $pi) {
                if ($pi["id"] == 0 && empty($pi['imagen'])) {
                    // $errores->add("publicacion_imagens", 'Debes cargar todas las imagenes');
                    $errores["publicacion_imagens"] = 'Debes cargar todas las imagenes';
                    break;
                }
            }
        }

        // Si hay errores personalizados, los agregamos al validador
        if (!empty($errores)) {
            throw ValidationException::withMessages($errores);
        }
        return true;
    }

    public function generaData($data_request)
    {
        $datos_publicacion = [
            "user_id" => Auth::user()->id,
            "categoria" => $data_request->categoria,
            "moneda" => $data_request->moneda,
            "oferta_inicial" => $data_request->oferta_inicial,
            "ubicacion" => $data_request->ubicacion,
            "observaciones" => mb_strtoupper($data_request->observaciones),
            "fecha_limite" => $data_request->fecha_limite,
            "hora_limite" => $data_request->hora_limite,
            "monto_garantia" => $data_request->monto_garantia,
        ];

        return $datos_publicacion;
    }

    public static function crearPublicacion($data_request)
    {
        $static = new static;
        DB::beginTransaction();
        try {
            // crear la Publicacion
            $datos_publicacion = $static->generaData($data_request);
            $static->validaDatos($datos_publicacion, $data_request->publicacion_detalles, $data_request->publicacion_imagens);
            // crear
            $nueva_publicacion = Publicacion::create($datos_publicacion);
            // imagenes
            PublicacionImagen::registraImagensPublicacion($nueva_publicacion, $data_request->publicacion_imagens);

            // detalles
            PublicacionDetalle::registraDetallesPublicacion($nueva_publicacion, $data_request->publicacion_detalles);
            // historial_accion
            HistorialAccion::registraHistorialAccion($nueva_publicacion, "publicacions", "PUBLICACIONES", "CREACIÓN", 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA PUBLICACIÓN');

            DB::commit();

            return $nueva_publicacion;
        } catch (ValidationException $e) {
            DB::rollBack();
            $errors = $e->errors();

            foreach ($errors as $key => $err) {
                $errors[$key] = $err[0];
            }
            throw ValidationException::withMessages($errors);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::debug("ERROR: " . $e->getMessage());
            throw Exception::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public static function actualizarPublicacion(Publicacion $publicacion, $data_request)
    {
        $static = new static;
        DB::beginTransaction();
        try {
            $datos_publicacion = $static->generaData($data_request);
            $static->validaDatos($datos_publicacion, $data_request->publicacion_detalles, $data_request->publicacion_imagens);

            // actualizar
            $publicacion->update($datos_publicacion);
            // imagenes
            $remover_files = PublicacionImagen::registraImagensPublicacion($publicacion, $data_request->publicacion_imagens);
            $remover_files2 = PublicacionImagen::eliminarImagensPublicacion($data_request->eliminados_imagens, true);
            $remover_files = array_merge($remover_files, $remover_files2);
            // detalles
            PublicacionDetalle::registraDetallesPublicacion($publicacion, $data_request->publicacion_detalles);
            PublicacionDetalle::eliminaDetallesPublicacion($data_request->eliminados_detalles, true);

            // historial_accion
            HistorialAccion::registraHistorialAccion($publicacion, "publicacions", "PUBLICACIONES", "MODIFICACIÓN", 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA PUBLICACIÓN');

            DB::commit();
            // eliminar archivos
            if ($remover_files && count($remover_files)) {
                foreach ($remover_files as $file) {
                    \File::delete($file);
                }
            }
            return $publicacion;
        } catch (ValidationException $e) {
            DB::rollBack();
            $errors = $e->errors();
            foreach ($errors as $key => $err) {
                $errors[$key] = $err[0];
            }
            throw ValidationException::withMessages($errors);
        } catch (\Exception $e) {
            Log::debug("ERROR: " . $e->getMessage());
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public static function eliminarPublicacion(Publicacion $publicacion)
    {
        $static = new static;
        DB::beginTransaction();
        try {
            // imagenes
            $eliminados_imagens = $publicacion->publicacion_imagens()->pluck("id")->toArray();
            $remover_files = PublicacionImagen::eliminarImagensPublicacion($eliminados_imagens);
            // detalles
            $eliminados_detalles = $publicacion->publicacion_detalles()->pluck("id")->toArray();
            PublicacionDetalle::eliminaDetallesPublicacion($eliminados_detalles);

            // eliminar
            $publicacion->estado_sub = 5;
            $publicacion->save();

            // historial_accion
            HistorialAccion::registraHistorialAccion($publicacion, "publicacions", "PUBLICACIONES", "ELIMINACIÓN", 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA PUBLICACIÓN');

            DB::commit();
            // eliminar archivos
            if ($remover_files && count($remover_files)) {
                foreach ($remover_files as $file) {
                    \File::delete($file);
                }
            }
            return $publicacion;
        } catch (ValidationException $e) {
            DB::rollBack();
            $errors = $e->errors();

            foreach ($errors as $key => $err) {
                $errors[$key] = $err[0];
            }
            throw ValidationException::withMessages($errors);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
