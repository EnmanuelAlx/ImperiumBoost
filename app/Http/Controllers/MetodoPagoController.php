<?php

namespace App\Http\Controllers;

use App\MetodoPago;
use Illuminate\Http\Request;

class MetodoPagoController extends Controller
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
     * @param  \App\MetodoPago  $metodoPago
     * @return \Illuminate\Http\Response
     */
    public function show(MetodoPago $metodoPago)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\MetodoPago  $metodoPago
     * @return \Illuminate\Http\Response
     */
    public function edit(MetodoPago $metodoPago)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\MetodoPago  $metodoPago
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MetodoPago $metodoPago)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\MetodoPago  $metodoPago
     * @return \Illuminate\Http\Response
     */
    public function destroy(MetodoPago $metodoPago)
    {
        //
    }

    public function getMetodosDePago(){
        $metodos = MetodoPago::all();
        return response()->json($metodos, 200);
    }
}
