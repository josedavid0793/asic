<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class roles extends Model
{   

	protected $table ='roles';
	
    public function Usuario(){
    	return $this->belongsTo('App\Usuario','roles');
    }
}
