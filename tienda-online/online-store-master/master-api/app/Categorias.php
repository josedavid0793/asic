<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categorias extends Model
{
    protected $table ='categorias';
    //Declaración de metodo para relacion de tablas de uno a muchos
    public function producto(){
           /*$fillable = [
        'nombre_categoria', 'descripcion_categoria',];*/
        return $this->hasMany('App\Productos');

    }

       public $timestamps = false;
}
