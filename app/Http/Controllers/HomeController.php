<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{

    public function home(){
        return view('home');
    }
    
    public function logout(){
        dd('hola');
        app('VoyagerAuth')->logout();
        return redirect()->route('home');
    }


    public function userDashboard(){
        return view('Application.dashboard');
    }
    
    public function workerDashboard(){
        return view('Application.dashboard');
    }

    public function verificarUsuario(){
        if(Auth::check()){
            return response()->json(true, 200);
        }
        return response()->json(false, 200);
    }
}
