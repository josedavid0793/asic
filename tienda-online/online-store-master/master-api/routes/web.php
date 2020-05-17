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
use  \App\Http\Middleware\ApiAuthMiddleware;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/welcome',function(){
     return '<h2>Welcome to my life</h2>';
});


//Route::get('/animales','PruebasController@index');



//Routes of API

  //Routes of test
/*Route::get('/usuario/pruebas','UsuarioController@pruebas');
Route::get('/producto/pruebas','ProductosController@pruebas');*/


  //Routes of Api controlador de Usuarios
Route::Post('/registro','UsuarioController@register');
Route::Post('/ingreso','UsuarioController@login');
Route::Put('/actualiza','UsuarioController@update');
Route::Post('/subir','UsuarioController@upload')->middleware(ApiAuthMiddleware::class);
Route::Get('/avatar/{filename}','UsuarioController@getImage');
Route::Get('/detalles/{id}','UsuarioController@detail');



//Routes del controlador de categoria de tipo resources

Route::Resource('/categoria','CategoriasController');