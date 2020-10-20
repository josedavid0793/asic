<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class hostService_clientes extends Model
{
     protected $table ='hostService_clientes';

    protected $fillable = [
        'id','service_name','host','ip','cliente','ambiente','sistema_operativo','escalamiento','notas'
    ];

	
    public function host_clientes(){
    	return $this->belongsTo('App\host_clientes','hostService_clientes');
    }
    public $timestamps = false;
}
