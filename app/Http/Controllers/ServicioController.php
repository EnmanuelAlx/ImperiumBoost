<?php

namespace App\Http\Controllers;

use App\Cupon;
use App\Cuenta;
use App\Trabajo;
use App\Producto;
use App\Servicio;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ServicioController extends Controller
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
     * @param  \App\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function show(Servicio $servicio)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function edit(Servicio $servicio)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Servicio $servicio)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function destroy(Servicio $servicio)
    {
        //
    }
    
    public function getBoostPrices(){
        $productos = Producto::where('servicio_id', 1)->orderBy('descripcion', 'asc')->get();
        return response()->json($productos, 200);
    }
    
    public function getMaestrias(){
        $productos = Producto::where('servicio_id', 2)->orderBy('id', 'asc')->get();
        // dd($productos);
        return response()->json($productos, 200);
    }
    
    public function getPrecioLvl(){
        $producto = Producto::where('servicio_id', 3)->first();
        return response()->json($producto, 200);
    }

    public function getHonores(){
        $productos = Producto::where('servicio_id', 4)->orderBy('id', 'asc')->get();
        return response()->json($productos, 200);
    }

    public function getPrecioBajaPrioridad(){
        $productos = Producto::where('servicio_id', 5)->first();
        return response()->json($productos, 200);
    }

    public function getPrecioPosicionamiento(){
        $productos = Producto::where('servicio_id', 6)->first();
        return response()->json($productos, 200);
    }

    public function getCuentas(){
        $cuentas = Cuenta::where('vendido', 0)->get();
        return response()->json($cuentas, 200);
    }
    
    private function verifyCupon($nombre){
        
        $cupon = Cupon::where('nombre', $nombre)->first();
        if($cupon->usado){
            return null;
        }
        $cupon->usado = 1;
        $cupon->save();
        return $cupon->id;
    }

    public function pay(Request $request){
        $status = 500;
        switch ($request->input('service')['id']) {
            case 1:
                $status = $this->eloboostService($request->all());
                break;
            case 2:
                $status = $this->masteryService($request->all());
                break;
            case 3:
                $status = $this->levelService($request->all());
                break;
            case 4:
                $status = $this->honorService($request->all());
                break;
            case 5:
                $status = $this->lowPriorityService($request->all());
                break;
            case 6:
                $status = $this->positioningGamesService($request->all());
                break;
            default:
                # code...
                break;
        }
        return response()->json('Ok', $status);
    }

    private function eloboostService($info){
        $data = $info['info'];
        try {
            $cupon = null;
            if(isset($info['cupon'])){
                $cupon = $this->verifyCupon($info['cupon']);
                if(is_null($cupon)){
                    return 205;
                }
            }
            $tipo_boost = $info['service']['tipo_servicio'];
            $desde = $data['desde'];
            $hasta = $data['hasta'];
            $campeones = $data['campeones_selected'];
            $nombre = $info['name'];
            $server = $info['server'];
            $metodo_pago = $info['payment_method'];
            $nota = <<<EOT
Tipo de bost: $tipo_boost
Desde: $desde
Hasta: $hasta

EOT;
            if($campeones){
                $nota.= "Campeones seleccionados: $campeones
                ";
            }
            $nota.= 'Nota del cliente: '.$info['nota'];

            $trabajo = Trabajo::create([
                'nota' => $nota,
                'cuenta' => $info['name'],
                'servidor' => $info['server'],
                'monto' => $info['total'],
                'servicio_id' => $info['service']['id'],
                'user_id' => Auth::user()->id,
                'trabajador_id' => null,
                'cupon_id' => $cupon,
                'metodo_id' => $metodo_pago,
            ]);
            
            foreach ($data['ligas'] as $producto) {
                $trabajo->productos()->attach($producto);
            }
            foreach ($data['adicionales'] as $adicional) {
                $trabajo->adicionales()->attach($adicional);
            }
            return 200;
        } catch (\Throwable $th) {
            return 500;
        }
    }

    private function masteryService($info){
        $data = $info['info'];

        try {
            $cupon = null; 
            if($info['cupon']){
                $cupon = $this->verifyCupon($info['cupon']);
                if(is_null($cupon)){
                    return 205;
                }
            }
            $tipo_servicio = $info['service']['tipo_servicio'];
            $desde = $data['desde'];
            $hasta = $data['hasta'];
            $nombre = $info['name'];
            $server = $info['server'];
            $metodo_pago = $info['payment_method'];

            $nota = <<<EOT
Tipo de servicio: $tipo_servicio
Desde: $desde
Hasta: $hasta

EOT;
            $nota.= 'Nota del cliente: '.$info['nota'];

            $trabajo = Trabajo::create([
                'nota' => $nota,
                'cuenta' => $nombre,
                'servidor' => $server,
                'monto' => $info['total'],
                'servicio_id' => $info['service']['id'],
                'user_id' => Auth::user()->id,
                'trabajador_id' => null,
                'cupon_id' => $cupon,
                'metodo_id' => $metodo_pago,
            ]);
            
            foreach ($data['productos'] as $producto) {
                $trabajo->productos()->attach($producto);
            }
            return 200;
        } catch (\Throwable $th) {
            return 500;
        }

    }

    public function levelService($info){
        $data = $info['info'];

        try {
            $cupon = null; 
            if($info['cupon']){
                $cupon = $this->verifyCupon($info['cupon']);
                if(is_null($cupon)){
                    return 205;
                }
            }
            $tipo_servicio = $info['service']['tipo_servicio'];
            $desde = $data['desde'];
            $hasta = $data['hasta'];
            $nombre = $info['name'];
            $server = $info['server'];
            $metodo_pago = $info['payment_method'];

            $nota = <<<EOT
Tipo de servicio: $tipo_servicio
Desde: $desde
Hasta: $hasta

EOT;
            $nota.= 'Nota del cliente: '.$info['nota'];

            $trabajo = Trabajo::create([
                'nota' => $nota,
                'cuenta' => $nombre,
                'servidor' => $server,
                'monto' => $info['total'],
                'servicio_id' => $info['service']['id'],
                'user_id' => Auth::user()->id,
                'trabajador_id' => null,
                'cupon_id' => $cupon,
                'metodo_id' => $metodo_pago,
            ]);
            
            foreach ($data['productos'] as $producto) {
                $trabajo->productos()->attach($producto);
            }
            return 200;
        } catch (\Throwable $th) {
            return 500;
        }
    }

    public function honorService($info){
        $data = $info['info'];

        try {
            $cupon = null; 
            if($info['cupon']){
                $cupon = $this->verifyCupon($info['cupon']);
                if(is_null($cupon)){
                    return 205;
                }
            }
            $tipo_servicio = $info['service']['tipo_servicio'];
            $desde = $data['desde'];
            $hasta = $data['hasta'];
            $nombre = $info['name'];
            $server = $info['server'];
            $metodo_pago = $info['payment_method'];

            $nota = <<<EOT
Tipo de servicio: $tipo_servicio
Desde: $desde
Hasta: $hasta

EOT;
            $nota.= 'Nota del cliente: '.$info['nota'];

            $trabajo = Trabajo::create([
                'nota' => $nota,
                'cuenta' => $nombre,
                'servidor' => $server,
                'monto' => $info['total'],
                'servicio_id' => $info['service']['id'],
                'user_id' => Auth::user()->id,
                'trabajador_id' => null,
                'cupon_id' => $cupon,
                'metodo_id' => $metodo_pago,
            ]);
            
            foreach ($data['productos'] as $producto) {
                $trabajo->productos()->attach($producto);
            }
            return 200;
        } catch (\Throwable $th) {
            return 500;
        }
    }


    public function lowPriorityService($info){
        $data = $info['info'];

        try {
            $cupon = null; 
            if($info['cupon']){
                $cupon = $this->verifyCupon($info['cupon']);
                if(is_null($cupon)){
                    return 205;
                }
            }
            $tipo_servicio = $info['service']['tipo_servicio'];
            $hasta = $data['hasta'];
            $nombre = $info['name'];
            $server = $info['server'];
            $metodo_pago = $info['payment_method'];

            $nota = <<<EOT
Tipo de servicio: $tipo_servicio
Cantidad de partidas: $hasta

EOT;
            $nota.= 'Nota del cliente: '.$info['nota'];

            $trabajo = Trabajo::create([
                'nota' => $nota,
                'cuenta' => $nombre,
                'servidor' => $server,
                'monto' => $info['total'],
                'servicio_id' => $info['service']['id'],
                'user_id' => Auth::user()->id,
                'trabajador_id' => null,
                'cupon_id' => $cupon,
                'metodo_id' => $metodo_pago,
            ]);
            
            foreach ($data['productos'] as $producto) {
                $trabajo->productos()->attach($producto);
            }
            return 200;
        } catch (\Throwable $th) {
            return 500;
        }
    }

    public function positioningGamesService($info){
        $data = $info['info'];
        try {
            $cupon = null;
            if($info['cupon']){
                $cupon = $this->verifyCupon($info['cupon']);
                if(is_null($cupon)){
                    return 205;
                }
            }
            $tipo_servicio = $info['service']['tipo_servicio'];
            $hasta = $data['hasta'];
            $nombre = $info['name'];
            $server = $info['server'];
            $metodo_pago = $info['payment_method'];
            $nota = <<<EOT
Tipo de servicio: $tipo_servicio
Cantidad de partidas: $hasta

EOT;
            
            $nota.= 'Nota del cliente: '.$info['nota'];

            $trabajo = Trabajo::create([
                'nota' => $nota,
                'cuenta' => $nombre,
                'servidor' => $server,
                'monto' => $info['total'],
                'servicio_id' => $info['service']['id'],
                'user_id' => Auth::user()->id,
                'trabajador_id' => null,
                'cupon_id' => $cupon,
                'metodo_id' => $metodo_pago,
            ]);
            
            foreach ($data['productos'] as $producto) {
                $trabajo->productos()->attach($producto);
            }
            return 200;
        } catch (\Throwable $th) {
            return 500;
        }
    }


}
