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

// Route::get('chatt', 'MessageController@index');
Route::get('/messages/{id}', 'MessageController@fetch');
Route::post('/messages', 'MessageController@sentMessage');
Route::post('/messages-files', 'MessageController@sentFiles');

Route::get('/', 'HomeController@home')->name('home')->middleware("guest");
Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');
Route::get('verificarUsuario', 'HomeController@verificarUsuario');



Route::group(['prefix' => 'user', 'middleware' => 'auth'], function () {
    Route::get('dashboard', 'HomeController@userDashboard')->name('user.dashboard');
    Route::post('pay', 'ServicioController@pay');
    Route::get('verificarCupon', 'CuponController@verificarCupon');
});

Route::group(['prefix' => 'worker', 'middleware' => 'auth'], function () {
    Route::get('dashboard', 'HomeController@workerDashboard')->name('worker.dashboard');     
});

Route::group(['middleware' => ['auth']], function () {
    Route::get('/getServicios', 'ServicioController@getServicios');
    Route::post('modifyImage', 'UserController@modifyImage');
    Route::post('changeEmail', 'UserController@changeEmail');
    Route::post('changePassword', 'UserController@changePassword');
    Route::get('getHistorial', "ServicioController@getHistorial");
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::get('/chatUsuarios/{trabajo}', 'TrabajoController@chat')->name('chat-admin');
    Route::post('logout', 'HomeController@logout')->name('voyager.logout');
    Route::post('marcar-pago', 'TrabajoController@marcarPagado');
    Route::post('asignarTrabajador', 'TrabajoController@asignarTrabajador');
    Route::post('/messages', 'MessageController@sentMessageAdmin');
    Route::post('/messages-files', 'MessageController@sentFilesAdmin');
    Route::post('/cerrarTrabajo/{trabajo}', 'TrabajoController@cerrarTrabajo');
});
