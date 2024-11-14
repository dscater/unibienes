<?php

use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\ParametrizacionController;
use App\Http\Controllers\PortalController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\PublicacionController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SubastaController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', [PortalController::class, 'index'])->name("portal.index");

Route::get('/login', function () {
    if (Auth::check()) {
        return redirect()->route('inicio');
    }
    return Inertia::render('Auth/Login');
})->name("login");

Route::post('/registro/validaForm1', [RegisteredUserController::class, 'validaForm1'])->name("registro.validaForm1");
Route::get('/registro', function () {
    if (Auth::check()) {
        return redirect()->route('inicio');
    }
    return Inertia::render('Auth/Register');
})->name("registro");

Route::get("configuracions/getConfiguracion", [ConfiguracionController::class, 'getConfiguracion'])->name("configuracions.getConfiguracion");

// PORTAL
Route::get("vehiculos", [PortalController::class, 'vehiculos'])->name("portal.vehiculos");
Route::get("otros_bienes", [PortalController::class, 'otros_bienes'])->name("portal.otros_bienes");
Route::get("ecologicos", [PortalController::class, 'ecologicos'])->name("portal.ecologicos");

// publicaciones
Route::get("publicacions/porCategoriaLimitado", [PublicacionController::class, 'porCategoriaLimitado'])->name("publicacions.porCategoriaLimitado");

// ADMINISTRACION
Route::middleware('auth')->prefix("admin")->group(function () {
    // INICIO
    Route::get('/inicio', [InicioController::class, 'inicio'])->name('inicio');

    // CONFIGURACION
    Route::resource("configuracions", ConfiguracionController::class)->only(
        ["index", "show", "update"]
    );

    // USUARIO
    Route::get('profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::patch('profile/update_foto', [ProfileController::class, 'update_foto'])->name('profile.update_foto');
    Route::delete('profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get("getUser", [UserController::class, 'getUser'])->name('users.getUser');
    Route::get("permisosUsuario", [UserController::class, 'permisosUsuario']);

    // USUARIOS
    Route::put("usuarios/password/{user}", [UsuarioController::class, 'actualizaPassword'])->name("usuarios.password");
    Route::get("usuarios/api", [UsuarioController::class, 'api'])->name("usuarios.api");
    Route::get("usuarios/paginado", [UsuarioController::class, 'paginado'])->name("usuarios.paginado");
    Route::get("usuarios/listado", [UsuarioController::class, 'listado'])->name("usuarios.listado");
    Route::get("usuarios/listado/byTipo", [UsuarioController::class, 'byTipo'])->name("usuarios.byTipo");
    Route::get("usuarios/show/{user}", [UsuarioController::class, 'show'])->name("usuarios.show");
    Route::put("usuarios/update/{user}", [UsuarioController::class, 'update'])->name("usuarios.update");
    Route::delete("usuarios/{user}", [UsuarioController::class, 'destroy'])->name("usuarios.destroy");
    Route::resource("usuarios", UsuarioController::class)->only(
        ["index", "store"]
    );

    // PARAMETRIZACIÓN
    Route::get("parametrizacions/api", [ParametrizacionController::class, 'api'])->name("parametrizacions.api");
    Route::get("parametrizacions/paginado", [ParametrizacionController::class, 'paginado'])->name("parametrizacions.paginado");
    Route::get("parametrizacions/listado", [ParametrizacionController::class, 'listado'])->name("parametrizacions.listado");
    Route::resource("parametrizacions", ParametrizacionController::class)->only(
        ["index", "store", "show", "update", "destroy"]
    );

    // ROLES
    Route::get("roles/api", [RoleController::class, 'api'])->name("roles.api");
    Route::get("roles/paginado", [RoleController::class, 'paginado'])->name("roles.paginado");
    Route::get("roles/listado", [RoleController::class, 'listado'])->name("roles.listado");
    Route::post("roles/actualizaPermiso/{role}", [RoleController::class, 'actualizaPermiso'])->name("roles.actualizaPermiso");
    Route::resource("roles", RoleController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // PUBLICACIONES
    Route::get("publicacions/api", [PublicacionController::class, 'api'])->name("publicacions.api");
    Route::get("publicacions/paginado", [PublicacionController::class, 'paginado'])->name("publicacions.paginado");
    Route::get("publicacions/listado", [PublicacionController::class, 'listado'])->name("publicacions.listado");
    Route::put("publicacions/habilitaPublicacion/{publicacion}", [PublicacionController::class, 'habilitaPublicacion'])->name("publicacions.habilitaPublicacion");
    Route::resource("publicacions", PublicacionController::class)->only(
        ["index", "store", "show", "update", "destroy"]
    );

    // subastas
    Route::get("publicacions/subastas/clientes/{subasta}", [SubastaController::class, 'clientes'])->name("subastas.clientes");
    Route::get("publicacions/subastas/getClientesApi/{subasta}", [SubastaController::class, 'getClientesApi'])->name("subastas.getClientesApi");

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");
});
require __DIR__ . '/auth.php';
