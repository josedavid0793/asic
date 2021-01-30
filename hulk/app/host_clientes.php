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

    public static function buscar($query='') {
            if(!$query){
                return self::all();
            }
            return self::where('host_name','like',"%$query%")
            ->orWhere('ip','like',"%$query%")
            ->orWhere('cliente','like',"%$query%")
            ->get();

    }
   /* public function scopeip($query, $ip) {
    	if ($ip) {
    		return $query->where('ip','LIKE',"%$ip%");
    	}
    }*/
    public $timestamps = false;
}
