<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class gerentes_proyectos extends Model
{
    protected $table ='gerentes_proyectos';
    protected $fillable=[
       'gp_id','gp_nombres','gp_apellidos','gp_correo','gp_celular_coorporativo','gp_celular_personal','gp_cliente','gp_centro_costos',
    ];

    public $timestamps = false;
}
