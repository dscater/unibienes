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

    protected $appends = ["fecha_registro_t", "full_ci", "full_name", "url_ci_anverso", "url_ci_reverso"];

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function getUrlCiAnversoAttribute()
    {
        return asset("imgs/users/" . $this->foto_ci_anverso);
    }

    public function getUrlCiReversoAttribute()
    {
        return asset("imgs/users/" . $this->foto_ci_reverso);
    }

    public function getFullNameAttribute()
    {
        return $this->nombre . ' ' . $this->paterno . ($this->materno ? ' ' . $this->materno : '');
    }

    public function getFullCiAttribute()
    {
        return $this->ci . ' ' . $this->ci_exp;
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
