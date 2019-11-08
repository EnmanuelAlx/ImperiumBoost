<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
      /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function modifyImage(Request $request){
        $request->validate([
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg',
        ]);
        $user = Auth::user();
        $imagen = $request->file('image');
        $image_name = $user->id.'_avatar'.time().'.'.$imagen->getClientOriginalName();
        $destinationPath = storage_path('app\public\users');
        $imagen->move($destinationPath, $image_name);
        $user->avatar = 'users/'.$image_name;
        $user->save();
        return response()->json($user->avatar, 200);
    }

    public function changeEmail(Request $request){
        $email = $request->input('email');
        $exist = User::where('email', $email)->count();
        if($exist){
            return response()->json('El email ya esta en uso', 500);
        }
        else{
            $user = Auth::user();
            $user->email = $email;
            $user->save();
            return response()->json([
                'email' => $email,
                'message' => 'Correo actualizado'
            ], 200);
        }
    }

    public function changePassword(Request $request){
        $request->validate([
            'password'=>'required|confirmed',
        ]);
        $user = Auth::user();
        $password = $request->input('password');
        $user->password = (bcrypt($password));
        $user->save();
        return response()->json('Contraseña actualizada', 200);
    }

    public function getTrabajadores(){
        $trabajadores = User::where('role_id', 3)->get();
        return response()->json($trabajadores, 200);
    }
}
