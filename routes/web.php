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
Route::get('/messages/trabajador/{id}', 'MessageController@fetchWorkerMessageToAdmin');
Route::get('/messages/anonimos/{email}', 'MessageController@fetchAnonimusMessageToAdmin');
Route::post('/message-guest', 'MessageController@guestMessageToAdmin');


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
    Route::post('modifyImage', 'UserController@modifyImage');
    Route::post('changeEmail', 'UserController@changeEmail');
    Route::post('changePassword', 'UserController@changePassword');
    Route::get('getHistorial', "ServicioController@getHistorial");
    Route::get('/getServicios', 'ServicioController@getServicios');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('logout', 'HomeController@logout')->name('voyager.logout');

    Route::post('marcar-pago', 'TrabajoController@marcarPagado');
    Route::post('asignarTrabajador', 'TrabajoController@asignarTrabajador');
    Route::post('/cerrarTrabajo/{trabajo}', 'TrabajoController@cerrarTrabajo');
    Route::post('/cambiarContrasena/{trabajo}', 'TrabajoController@cambiarContrasena');
    Route::get('/chatUsuarios/{trabajo}', 'TrabajoController@chat')->name('chat-admin');
    Route::get('/chatAnonimos', 'TrabajoController@chatAnonimos')->name('chat-anonimos');
    Route::get('/chatAnonimos/{anonimo}', 'TrabajoController@chatAnonimo')->name('chat-anonimos');
    Route::get('/chatTrabajadores', 'TrabajoController@chatTrabajadores')->name('chat-trabajadores');
    Route::get('/chatTrabajadores/{trabajador}', 'TrabajoController@chatTrabajador')->name('chat-trabajador');
    
    
    Route::post('/messages', 'MessageController@sentMessageAdmin');
    Route::post('/messages-files', 'MessageController@sentFilesAdmin');
    Route::get('/getChatsAnonimos', 'MessageController@getChatsAnonimos');
    Route::post('/fetchWorkerMessage', 'MessageController@fetchWorkerMessage');
    Route::post('/messagesToAdmin', 'MessageController@messagesToAdminFromWorker');
    Route::post('/messages/anonimo', 'MessageController@sentMessageAdminToAnonimo');
    Route::post('/messages/trabajador', 'MessageController@sentMessageAdminToTrabajador');
    Route::post('/eliminarConversacionAnonima', 'MessageController@eliminarConversacionAnonima');
});
