<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class especialistas extends Model
{
    
	protected $table ='especialistas';
    protected $fillable=[
       'es_nombres','es_apellidos','es_correo','es_celular_coorporativo','es_celular_personal','es_especialidad',
    ];

    public $timestamps = false;
}
