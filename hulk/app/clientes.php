<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class clientes extends Model
{
    public function host_clientes(){
        return $this->hasMany('App\host_clientes');
    }
}
