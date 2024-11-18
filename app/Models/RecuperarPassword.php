<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecuperarPassword extends Model
{
    use HasFactory;

    protected $fillable = [
        "cod",
        "user_id",
        "status",
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
