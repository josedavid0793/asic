<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});


Route::post('/registro','UsuarioController@register');
Route::post('/login','UsuarioController@login');
Route::post('/host','HostController@ingreso');
Route::get('/host/{id}','HostController@editarHostid');
Route::post('/service','ServicehostController@agregar');
Route::get('/viewhost','HostController@editarHost');
Route::put('/usuario/actualizar','UsuarioController@update');
Route::put('/hostupdate/{id}','HostController@updateHost');
Route::delete('/host/{id}','HostController@deleteHost');
Route::get('/hostExport','HostController@exportHost');
Route::get('/especialistas','especialistaController@editarEspecialista');
Route::get('/gerentes','especialistaController@editarGerenteP');
Route::get('/clientes','HostController@editarCliente');
Route::get('/buscar','ClienteController@index');



