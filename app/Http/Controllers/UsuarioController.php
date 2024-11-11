<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\User;
use App\Models\Venta;
use App\Models\VentaLote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use PgSql\Lob;

class UsuarioController extends Controller
{
    public $validacion = [
        "nombres" => "required|min:1",
        "apellidos" => "required|min:1",
        "role_id" => "required",
    ];

    public $mensajes = [
        "nombres.required" => "Este campo es obligatorio",
        "nombres.min" => "Debes ingresar al menos :min caracteres",
        "apellidos.required" => "Este campo es obligatorio",
        "apellidos.min" => "Debes ingresar al menos :min caracteres",
        "role_id.required" => "Este campo es obligatorio",
        "usuario.required" => "Este campo es obligatorio",
        "password.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        return Inertia::render("Admin/Usuarios/Index");
    }

    public function listado()
    {
        $usuarios = User::with(["role"])->where("id", "!=", 1)->get();
        return response()->JSON([
            "usuarios" => $usuarios
        ]);
    }

    public function byTipo(Request $request)
    {
        $usuarios = User::with(["role"])->where("id", "!=", 1);
        if (isset($request->tipo) && trim($request->tipo) != "") {
            $usuarios = $usuarios->where("tipo", $request->tipo);
        }

        if ($request->order && $request->order == "desc") {
            $usuarios->orderBy("users.id", "desc");
        }

        $usuarios = $usuarios->get();

        return response()->JSON([
            "usuarios" => $usuarios
        ]);
    }

    public function api(Request $request)
    {
        // Log::debug($request);
        $usuarios = User::with(["role"])->where("id", "!=", 1);
        $usuarios = $usuarios->paginate(10);

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
        $usuarios = User::with(["role"])->where("id", "!=", 1);

        if (trim($search) != "") {
            $usuarios->where("nombre", "LIKE", "%$search%");
            $usuarios->orWhere("paterno", "LIKE", "%$search%");
            $usuarios->orWhere("materno", "LIKE", "%$search%");
            $usuarios->orWhere("ci", "LIKE", "%$search%");
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
        $this->validacion['usuario'] = 'required|min:4|unique:users,usuario';
        $this->validacion['password'] = 'required|min:4';
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $request['fecha_registro'] = date('Y-m-d');

            // crear el Usuario
            $nuevo_usuario = User::create([
                "usuario" => mb_strtoupper($request->usuario),
                "nombres" => mb_strtoupper($request->nombres),
                "apellidos" => mb_strtoupper($request->apellidos),
                "password" => "123456",
                "role_id" => $request->role_id,
                "acceso" => $request->acceso,
                "fecha_registro" => $request->fecha_registro,
            ]);
            $nuevo_usuario->password = Hash::make($request->password);
            $nuevo_usuario->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_usuario, "users");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN USUARIO',
                'datos_original' => $datos_original,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("usuarios.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(User $user)
    {
        return response()->JSON($user);
    }

    public function actualizaAcceso(User $user, Request $request)
    {
        $user->acceso = $request->acceso;
        $user->save();
        return response()->JSON([
            "user" => $user,
            "message" => "Acceso actualizado"
        ]);
    }

    public function update(User $user, Request $request)
    {
        $this->validacion['usuario'] = 'required|min:4|unique:users,usuario,' . $user->id;
        if ($request->password && trim($request->password)) {
            $this->validacion['password'] = 'required|min:4';
        } else {
            unset($request["password"]);
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($user, "users");
            $user->update([
                "usuario" => mb_strtoupper($request->usuario),
                "nombres" => mb_strtoupper($request->nombres),
                "apellidos" => mb_strtoupper($request->apellidos),
                "role_id" => $request->role_id,
                "acceso" => $request->acceso,
            ]);
            if ($request->password && trim($request->password)) {
                $user->password = Hash::make($request->password);
            }
            $user->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($user, "users");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN USUARIO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return redirect()->route("usuarios.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function actualizaPassword(User $user, Request $request)
    {
        $request->validate([
            "password" => "required"
        ]);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($user, "users");
            $user->password = Hash::make($request->password);
            $user->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($user, "users");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);


            DB::commit();
            if ($user->tipo == 'CLIENTE') {
                return redirect()->route("clientes.index")->with("bien", "Registro actualizado");
            }
            return redirect()->route("usuarios.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(User $user)
    {
        DB::beginTransaction();
        try {
            // $usos = Venta::where("user_id", $user->id)->get();
            // if (count($usos) > 0) {
            //     throw ValidationException::withMessages([
            //         'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
            //     ]);
            // }

            $antiguo = $user->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/users/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($user, "users");
            $user->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN USUARIO',
                'datos_original' => $datos_original,
                'modulo' => 'USUARIOS',
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
