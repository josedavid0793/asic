<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Categorias;

class CategoriasController extends Controller
{

	public function __construct(){
      $this->middleware('api.auth',['except' => ['index','show']]);

	}

    public function index(){
    	$categorias = Categorias::all();

    	return response()->json([
    		'code'       => 200,
    		'status'     =>'Success',
    		'categories' =>$categorias,


    	]);

    }

    public function show($id_categoria){
    	$categoria = Categorias::find($id_categoria);

    	if(is_object($categoria)){
        return   $data =array([
    		'code'       => 200,
    		'status'     =>'Success',
    		'categories' =>$categoria,

    	]);

    	}else{
           return $data =array([
    		'code'       => 404,
    		'status'     =>'Error',
    		'categories' =>'La categoría no existe',

    	]);

    	}
    }

    public function store(Request $request){
    	//recoger los datos por post
    	$json =$request->input('json',null);
    	$params_array =json_decode($json,true);

    	if(!empty($params_array)){


    	//Validar los datos

    	$validate = Validator::make($request = $params_array,[
          'nombre_categoria' =>'required',
    	]);

    	//guardar los datos
    	if($validate->fails()){
           $data =[
    		'code'       => 400,
    		'status'     =>'Error',
    		'categories' =>'No se ha guardado la categoria',

    	];

    	}else{

    		$categoria =new Categorias();
    		$categoria->nombre_categoria=$params_array['nombre_categoria'];
    		$categoria->descripcion_categoria=$params_array['descripcion_categoria'];
    		$categoria->save();
    		$data = [
    		'code'       => 200,
    		'status'     =>'Success',
    		'categoria' =>$categoria,
              ];
           }


    		
    	}else{
              $data =[
    		'code'       => 400,
    		'status'     =>'Error',
    		'categories' =>'No has enviado ninguna categoria',
    	];

    	}

        //Devolver el resultado

        return response()->json($data, $data['code']);


     }

     public function update($id,Request $request){

     	//Recoger los datos 
     	$json =$request->input('json',null);
    	$params_array =json_decode($json,true);

    	if(!empty($params_array)){

         
        //validar los datos
    	$validate = Validator::make($request = $params_array,[
          'nombre_categoria' =>'required',

    	]);

     	//Quitar lo que no quiero actualizar
     	unset($params_array['id']);
     	unset($params_array['created_at']);

     	//Actualizar la categoria

     	$categoria = Categorias::where('id',$id)->update($params_array);

     	     $data = [
    		'code'       => 200,
    		'status'     =>'Success',
    		'categoria' =>$categoria,
              ];

    	}else{
          $data =[
    		'code'       => 400,
    		'status'     =>'Error',
    		'categories' =>'No se a actualizado la  categoria',
    	];


    	}
     	//Devolver respuesta

     	return response()->json($data,$data['code']);
     }
}
