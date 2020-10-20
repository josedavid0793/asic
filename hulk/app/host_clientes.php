<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class host_clientes extends Model
{
    protected $table ='host_clientes';

    protected $fillable = [
        'id','host_name','ip','cliente','ambiente','sistema_operativo','escalamiento','notas'
    ];

	
    public function clientes(){
    	return $this->belongsTo('App\clientes','host_clientes');
    }

  /*  public function scopehost_name($query, $host_name) {
    	if ($host_name) {
    		return $query->where('host_name','like',"%$host_name%");
    	}
    }
    public function scopeip($query, $ip) {
    	if ($ip) {
    		return $query->where('ip','like',"%$ip%");
    	}
    }*/
    public $timestamps = false;
}
