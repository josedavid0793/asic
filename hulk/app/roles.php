<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class roles extends Model
{   

	protected $table ='roles';
	
    public function User(){
    	return $this->belongsTo('App\User','roles');
    }
}
