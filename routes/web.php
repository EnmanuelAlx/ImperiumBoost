<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@home')->name('home')->middleware("guest");;
Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');
Route::get('verificarUsuario', 'HomeController@verificarUsuario');

Route::group(['prefix' => 'user', 'middleware' => 'auth'], function () {
    Route::get('dashboard', 'HomeController@userDashboard')->name('user.dashboard');
    Route::post('pay', 'ServicioController@pay');
    Route::get('verificarCupon', 'CuponController@verificarCupon');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('logout', 'HomeController@logout')->name('voyager.logout');
});
