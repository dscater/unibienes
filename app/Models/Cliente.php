<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "nombre",
        "paterno",
        "materno",
        "ci",
        "complemento",
        "ci_exp",
        "fono",
        "dpto_residencia",
        "email",
        "foto_ci_anverso",
        "foto_ci_reverso",
        "banco",
        "nro_cuenta",
        "moneda",
        "fecha_registro",
    ];

    protected $appends = ["full_ci"];

    public function getFullCiAttribute()
    {
        return $this->ci . ' ' . $this->ci_exp;
    }
}
