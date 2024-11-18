<?php

namespace Database\Seeders;

use App\Models\Modulo;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ModuloTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // PARAMETRIZACIÓN
        Modulo::create([
            "modulo" => "Parametrización",
            "nombre" => "parametrizacion.index",
            "accion" => "VER",
            "descripcion" => "VER DATOS DE PARAMETRIZACIÓN"
        ]);

        Modulo::create([
            "modulo" => "Parametrización",
            "nombre" => "parametrizacion.edit",
            "accion" => "EDITAR",
            "descripcion" => "EDITAR DATOS DE PARAMETRIZACIÓN"
        ]);

        // GESTIÓN DE USUARIOS
        Modulo::create([
            "modulo" => "Gestión de usuarios",
            "nombre" => "usuarios.index",
            "accion" => "VER",
            "descripcion" => "VER LA LISTA DE USUARIOS"
        ]);

        Modulo::create([
            "modulo" => "Gestión de usuarios",
            "nombre" => "usuarios.create",
            "accion" => "CREAR",
            "descripcion" => "CREAR USUARIOS"
        ]);

        Modulo::create([
            "modulo" => "Gestión de usuarios",
            "nombre" => "usuarios.edit",
            "accion" => "EDITAR",
            "descripcion" => "EDITAR USUARIOS"
        ]);

        Modulo::create([
            "modulo" => "Gestión de usuarios",
            "nombre" => "usuarios.destroy",
            "accion" => "ELIMINAR",
            "descripcion" => "ELIMINAR USUARIOS"
        ]);

        // ROLES Y PERMISOS
        Modulo::create([
            "modulo" => "Roles y Permisos",
            "nombre" => "roles.index",
            "accion" => "VER",
            "descripcion" => "VER LA LISTA DE ROLES Y PERMISOS"
        ]);

        Modulo::create([
            "modulo" => "Roles y Permisos",
            "nombre" => "roles.create",
            "accion" => "CREAR",
            "descripcion" => "CREAR ROLES Y PERMISOS"
        ]);

        Modulo::create([
            "modulo" => "Roles y Permisos",
            "nombre" => "roles.edit",
            "accion" => "EDITAR",
            "descripcion" => "EDITAR ROLES Y PERMISOS"
        ]);

        Modulo::create([
            "modulo" => "Roles y Permisos",
            "nombre" => "roles.destroy",
            "accion" => "ELIMINAR",
            "descripcion" => "ELIMINAR ROLES Y PERMISOS"
        ]);

        // CONFIGURACIÓN DEL SISTEMA
        Modulo::create([
            "modulo" => "Configuración",
            "nombre" => "configuracions.index",
            "accion" => "VER",
            "descripcion" => "VER INFORMACIÓN DE LA CONFIGURACIÓN DEL SISTEMA"
        ]);

        Modulo::create([
            "modulo" => "Configuración",
            "nombre" => "configuracions.edit",
            "accion" => "EDITAR",
            "descripcion" => "EDITAR LA CONFIGURACIÓN DEL SISTEMA"
        ]);


        // PUBLICACIONES
        Modulo::create([
            "modulo" => "Publicaciones",
            "nombre" => "publicacions.index",
            "accion" => "VER",
            "descripcion" => "VER LA LISTA DE PUBLICACIONES"
        ]);

        Modulo::create([
            "modulo" => "Publicaciones",
            "nombre" => "publicacions.create",
            "accion" => "CREAR",
            "descripcion" => "CREAR PUBLICACIONES"
        ]);

        Modulo::create([
            "modulo" => "Publicaciones",
            "nombre" => "publicacions.edit",
            "accion" => "EDITAR",
            "descripcion" => "EDITAR PUBLICACIONES"
        ]);

        Modulo::create([
            "modulo" => "Publicaciones",
            "nombre" => "publicacions.destroy",
            "accion" => "ELIMINAR",
            "descripcion" => "ELIMINAR PUBLICACIONES"
        ]);
        
        Modulo::create([
            "modulo" => "Publicaciones",
            "nombre" => "publicacions.todos",
            "accion" => "TODAS LAS PUBLICACIONES",
            "descripcion" => "VER TODAS LAS PUBLICACIONES"
        ]);

        // REPORTES
        Modulo::create([
            "modulo" => "Reportes",
            "nombre" => "reportes.publicacions",
            "accion" => "REPORTE PUBLICACIONES",
            "descripcion" => "GENERAR REPORTES DE PUBLICACIONES"
        ]);
        
        Modulo::create([
            "modulo" => "Reportes",
            "nombre" => "reportes.subasta_clientes",
            "accion" => "REPORTE CLIENTES POR SUBASTA",
            "descripcion" => "GENERAR REPORTES DE LOS CLIENTES POR CADA UNA DE LAS SUBASTAS"
        ]);
        
        Modulo::create([
            "modulo" => "Reportes",
            "nombre" => "reportes.clientes",
            "accion" => "REPORTE DE CLIENTES",
            "descripcion" => "GENERAR REPORTES DE LOS CLIENTES REGISTRADOS"
        ]);
    }
}
