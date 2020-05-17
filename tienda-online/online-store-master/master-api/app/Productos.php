<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Productos extends Model
{
    protected $table = 'productos';

    public function categoria(){

    	return $this->hasMany('App\Categorias','id_categoria','nombre_categoria');
    }
}
