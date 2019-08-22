<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('getSummoner', 'RiotController@getSummoner');
Route::post('getLeague', 'RiotController@getLeague');
Route::get('getBoostPrices', 'ServicioController@getBoostPrices');
Route::get('getAdicionalesBoost', 'AdicionalController@getAdicionalesBoost');
Route::get('getMetodosDePago', 'MetodoPagoController@getMetodosDePago');
Route::get('getChamps', 'RiotController@getChamps');
Route::get('getMaestrias', 'ServicioController@getMaestrias');
Route::get('getPrecioLvl', 'ServicioController@getPrecioLvl');
Route::get('getHonores', 'ServicioController@getHonores');
Route::get('getVersion', 'RiotController@getVersion');
Route::get('getPrecioBajaPrioridad', 'ServicioController@getPrecioBajaPrioridad');
Route::get('getPrecioPosicionamiento', 'ServicioController@getPrecioPosicionamiento');
Route::get('getCuentas', 'ServicioController@getCuentas');



