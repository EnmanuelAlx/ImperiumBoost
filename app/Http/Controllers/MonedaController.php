<?php

namespace App\Http\Controllers;

use App\Moneda;
use Illuminate\Http\Request;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;
use function GuzzleHttp\json_decode;
class MonedaController extends Controller
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
     * @param  \App\Moneda  $moneda
     * @return \Illuminate\Http\Response
     */
    public function show(Moneda $moneda)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Moneda  $moneda
     * @return \Illuminate\Http\Response
     */
    public function edit(Moneda $moneda)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Moneda  $moneda
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Moneda $moneda)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Moneda  $moneda
     * @return \Illuminate\Http\Response
     */
    public function destroy(Moneda $moneda)
    {
        //
    }

    public function getTasa(){
        $url = "http://ip-api.com/json";
        $client = new Client();
        $response = $client->get($url);
        $data = $response->getBody();
        $data = json_decode($data, true);
        $moneda = Moneda::where('codigo', $data['countryCode'])->first();
        if($moneda){
            return response()->json($moneda, 200);
        }
        return Moneda::where('codigo', 'US')->first();
    }
}
