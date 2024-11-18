<?php

use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\NotificacionController;
use App\Http\Controllers\ParametrizacionController;
use App\Http\Controllers\PortalController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\PublicacionController;
use App\Http\Controllers\RecuperarContrasenaController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SubastaClienteController;
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
Route::get('/getTerminosCondiciones', [PortalController::class, 'getTerminosCondiciones'])->name("getTerminosCondiciones");
Route::get('/olvido_contrasena', [RecuperarContrasenaController::class, 'olvido_contrasena'])->name("olvido_contrasena");
Route::post('/solicitar_recuperacion', [RecuperarContrasenaController::class, 'solicitar_recuperacion'])->name("solicitar_recuperacion");
Route::get('/recuperar_password/{recuperar_password}', [RecuperarContrasenaController::class, 'recuperar_password'])->name("recuperar_password");
Route::post('/registrar_recuperacion/{recuperar_password}', [RecuperarContrasenaController::class, 'registrar_recuperacion'])->name("registrar_recuperacion");

Route::get("configuracions/getConfiguracion", [ConfiguracionController::class, 'getConfiguracion'])->name("configuracions.getConfiguracion");

// PORTAL
Route::get("vehiculos", [PortalController::class, 'vehiculos'])->name("portal.vehiculos");
Route::get("otros_bienes", [PortalController::class, 'otros_bienes'])->name("portal.otros_bienes");
Route::get("ecologicos", [PortalController::class, 'ecologicos'])->name("portal.ecologicos");
Route::get("mis_subastas", [PortalController::class, 'mis_subastas'])->name("portal.mis_subastas");

// publicaciones
Route::get("publicacions/porCategoriaLimitado", [PublicacionController::class, 'porCategoriaLimitado'])->name("publicacions.porCategoriaLimitado");
Route::get("publicacions/porCategoriaPagina", [PublicacionController::class, 'porCategoriaPagina'])->name("publicacions.porCategoriaPagina");
Route::get("publicacions/porClientePaginado", [PublicacionController::class, 'porClientePaginado'])->name("publicacions.porClientePaginado");
Route::get("publicacions/{publicacion}", [PublicacionController::class, 'publicacionPortal'])->name("publicacions.publicacionPortal");

Route::get('profile_cliente', [ProfileController::class, 'profile_cliente'])->name('profile.profile_cliente');
Route::get('getInfoCliente', [ProfileController::class, 'getInfoCliente'])->name('profile.getInfoCliente');
Route::post('updateInfoCliente', [ProfileController::class, 'updateInfoCliente'])->name('profile.updateInfoCliente');

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

    // CLIENTES
    Route::get("clientes/listado", [ClienteController::class, 'listado'])->name("clientes.listado");

    // PARAMETRIZACIÓN
    Route::get("parametrizacions/api", [ParametrizacionController::class, 'api'])->name("parametrizacions.api");
    Route::get("parametrizacions/paginado", [ParametrizacionController::class, 'paginado'])->name("parametrizacions.paginado");
    Route::get("parametrizacions/listado", [ParametrizacionController::class, 'listado'])->name("parametrizacions.listado");
    Route::put("parametrizacions/update", [ParametrizacionController::class, 'update'])->name("parametrizacions.update");
    Route::resource("parametrizacions", ParametrizacionController::class)->only(
        ["index", "show"]
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
    Route::post("publicacions/verificaGanador/{publicacion}", [PublicacionController::class, 'verificaGanador'])->name("publicacions.verificaGanador");
    Route::resource("publicacions", PublicacionController::class)->only(
        ["index", "store", "show", "update", "destroy"]
    );

    // subastas
    Route::get("publicacions/getsubasta/infoSubastaPorPublicacion", [SubastaController::class, 'infoSubastaPorPublicacion'])->name("subastas.infoSubastaPorPublicacion");
    Route::get("publicacions/subastas/clientes/{subasta}", [SubastaController::class, 'clientes'])->name("subastas.clientes");
    Route::get("publicacions/subastas/getClientesApi/{subasta}", [SubastaController::class, 'getClientesApi'])->name("subastas.getClientesApi");
    Route::post("publicacions/subastas/registrarPuja", [SubastaController::class, 'registrarPuja'])->name("subastas.registrarPuja");
    Route::post("publicacions/subastas/registrarComprobante", [SubastaController::class, 'registrarComprobante'])->name("subastas.registrarComprobante");

    // subastas clientes
    Route::get("publicacions/subastas_clientes/verificaSubastaCliente", [SubastaClienteController::class, 'verificaSubastaCliente'])->name("subasta_clientes.verificaSubastaCliente");
    Route::get("publicacions/subastas_clientes/show/{subasta_cliente}", [SubastaClienteController::class, 'show'])->name("subasta_clientes.show");
    Route::get("publicacions/subastas_clientes/getInfo/{subasta_cliente}", [SubastaClienteController::class, 'getInfo'])->name("subasta_clientes.getInfo");
    Route::put("publicacions/subastas_clientes/update/{subasta_cliente}", [SubastaClienteController::class, 'update'])->name("subasta_clientes.update");


    // NOTIFICACIONES
    Route::get("notificacions/listadoPorUsuario", [NotificacionController::class, 'listadoPorUsuario'])->name("notificacions.listadoPorUsuario");

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");

    Route::get('reportes/publicacions', [ReporteController::class, 'publicacions'])->name("reportes.publicacions");
    Route::get('reportes/r_publicacions', [ReporteController::class, 'r_publicacions'])->name("reportes.r_publicacions");

    Route::get('reportes/subasta_clientes', [ReporteController::class, 'subasta_clientes'])->name("reportes.subasta_clientes");
    Route::get('reportes/r_subasta_clientes', [ReporteController::class, 'r_subasta_clientes'])->name("reportes.r_subasta_clientes");


    Route::get('reportes/g_subasta_clientes', [ReporteController::class, 'g_subasta_clientes'])->name("reportes.g_subasta_clientes");
    Route::get('reportes/gr_subasta_clientes', [ReporteController::class, 'gr_subasta_clientes'])->name("reportes.gr_subasta_clientes");

    Route::get('reportes/clientes', [ReporteController::class, 'clientes'])->name("reportes.clientes");
    Route::get('reportes/r_clientes', [ReporteController::class, 'r_clientes'])->name("reportes.r_clientes");
});
require __DIR__ . '/auth.php';
