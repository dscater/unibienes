<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class RoleController extends Controller
{
    public $validacion = [
        "nombre" => "required|min:1",
    ];

    public $mensajes = [
        "nombre.required" => "Este campo es obligatorio",
        "nombre.min" => "Debes ingresar al menos :min caracteres",
    ];

    public function index()
    {
        return Inertia::render("Admin/Roles/Index");
    }

    public function listado()
    {
        $usuarios = Role::select("roles.*")->get();
        return response()->JSON([
            "usuarios" => $usuarios
        ]);
    }

    public function api(Request $request)
    {

        $length = $request->input('length', 10); // Valor de `length` enviado por DataTable
        $start = $request->input('start', 0); // Índice de inicio enviado por DataTable
        $page = ($start / $length) + 1; // Cálculo de la página actual
        $search = $request->input('search');

        $usuarios = Role::select("roles.*");
        if ($search && trim($search) != '') {
            $usuarios->where("nombre", "LIKE", "%$search%");
        }
        $usuarios = $usuarios->paginate($length, ['*'], 'page', $page);

        return response()->JSON([
            'data' => $usuarios->items(),
            'recordsTotal' => $usuarios->total(),
            'recordsFiltered' => $usuarios->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $usuarios = Role::select("roles.*");

        if (trim($search) != "") {
            $usuarios->where("nombre", "LIKE", "%$search%");
        }

        $usuarios = $usuarios->paginate($request->itemsPerPage);
        return response()->JSON([
            'data' => $usuarios->items(),
            'recordsTotal' => $usuarios->total(),
            'recordsFiltered' => $usuarios->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Role
            $nuevo_usuario = Role::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_usuario, "roles");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN ROLE',
                'datos_original' => $datos_original,
                'modulo' => 'ROLES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("roles.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Role $role)
    {
        return response()->JSON($role);
    }

    public function update(Role $role, Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($role, "roles");
            $datos_nuevo = HistorialAccion::getDetalleRegistro($role, "roles");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN ROLE',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'ROLES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("roles.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(Role $role)
    {
        DB::beginTransaction();
        try {
            $usos = User::where("role_id", $role->id)->get();
            if (count($usos) > 0) {
                throw ValidationException::withMessages([
                    'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($role, "roles");
            $role->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN ROLE',
                'datos_original' => $datos_original,
                'modulo' => 'ROLES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
