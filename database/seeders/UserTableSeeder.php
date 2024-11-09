<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Role::create([
            "nombre" => "SUPER USUARIO",
            "permisos" => 1,
            "usuarios" => 0,
        ]);

        User::create([
            "usuario" => "admin",
            "nombres" => "admin",
            "apellidos" => "admin",
            "password" => "$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC",
            "role_id" => 1,
            "acceso" => 1,
            "fecha_registro" => date("Y-m-d"),
        ]);
    }
}
