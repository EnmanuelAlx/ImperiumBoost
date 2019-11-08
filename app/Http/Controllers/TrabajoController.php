<?php

namespace App\Http\Controllers;

use App\Trabajo;
use Illuminate\Http\Request;

class TrabajoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
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
     * @param  \App\Trabajo  $trabajo
     * @return \Illuminate\Http\Response
     */
    public function show(Trabajo $trabajo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Trabajo  $trabajo
     * @return \Illuminate\Http\Response
     */
    public function edit(Trabajo $trabajo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Trabajo  $trabajo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Trabajo $trabajo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Trabajo  $trabajo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Trabajo $trabajo)
    {
        //
    }

    public function chat($trabajo){
        $trabajos = Trabajo::where('status', '!=', -1)->get();
        $chatActual = Trabajo::find($trabajo);
        $chatActual->servicio;
        $chatActual->cupon;
        $chatActual->metodoPago;
        $chatActual->trabajador;
        return view('chat', ['trabajos' => $trabajos, 'chatActual' => $chatActual]);
    }

    public function marcarPagado(Request $request){
        $trabajo = Trabajo::find($request->id);
        $trabajo->status = 1;
        $trabajo->save();
        return response()->json($trabajo, 200);
    }

    public function asignarTrabajador(Request $request){
        // dd($request->all());
        $trabajo = Trabajo::find($request->trabajo_id);
        $trabajo->trabajador_id = $request->trabajador_id;
        $trabajo->fecha_culminacion_trabajo = $request->fecha_culminacion_trabajo;
        $trabajo->porcentaje_trabajador = $request->porcentaje_trabajador;
        $trabajo->fecha_asignacion_trabajador = date('Y-m-d');
        $trabajo->status = 2;
        $trabajo->save();
        return response()->json($trabajo, 200);
    }
}
