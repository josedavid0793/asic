<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoDocumento extends Model
{
    public function user(){

    	return $this->hasMany('App\User','tipo_documento');
    }

}
