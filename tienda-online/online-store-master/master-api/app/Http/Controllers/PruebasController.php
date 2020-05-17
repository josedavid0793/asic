<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Productos;
use App\Categorias;

class PruebasController extends Controller
{
    public function index(){
        $titulo ='Miah';
    $miah = ['LINDA','HERMOSA','BONITA'];
    return view ('pruebas.index', array (
        'titulo' => $titulo,
        'miah' => $miah
    ));
    }



    public function Orm(){
        //Lo que hace lo siguiente es como un select * from saca todos los datos en un array  a la tabla posts 
        $posts = Post::all(); 
        foreach ($posts as $post){
            echo "<h1>".$post->title."</h1>";
            echo "<span style='color:gray;'>{$post->user->name} - {$post->category->name}</span>";
            echo "<p>".$post->content."</p>";
            echo "<hr>";
        }
        die ();
          
    }
}


