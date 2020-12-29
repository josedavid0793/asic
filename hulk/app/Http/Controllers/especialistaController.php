<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\especialistas;
use App\gerentes_proyectos;

class especialistaController extends Controller
{
     public function editarEspecialista(){
      $especialistas=especialistas::orderBy('es_nombres','ASC')->get();

      return response()->json($especialistas);
    }

    public function editarGerenteP(){
      $gerentes_proyectos=gerentes_proyectos::orderBy('gp_nombres','ASC')->get();

      return response()->json($gerentes_proyectos);
    }
}
