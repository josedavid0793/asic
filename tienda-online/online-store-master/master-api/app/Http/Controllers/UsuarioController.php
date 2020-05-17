<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\User;


class UsuarioController extends Controller
{
    public function pruebas(Request $request){

    	return "this is a message of test for UserController";
    }

    public function register(Request $request){

    	//Recoger datos del usuario los datos se recogen en json
    	$json=$request->input('json',null);
    	$params = json_decode($json);
    	$params_array=json_decode($json,true);//laravel ya tiene un metodo json

         if (!empty ($params_array)){
    	//Limpiar datos
    	$params_array = array_map('trim', $params_array);

    	//validar datos se pasa el params_array que sea = a el $request
    	$validate = Validator::make($request = $params_array, [
    		'email'        =>'required|email|unique:users',
    		'nombres'      =>'required|alpha',
    		'apellidos'    =>'required|alpha',
    		'password'     => 'required|min:6|confirmed',
            'password_confirmation' => 'required',
            'documento'    => 'required|digits:10',
            'tipo_documento' => 'required',
            'fecha_nacimiento' => 'required|date',
    	]);


    	if($validate->fails()){

    		$data = array(
    		'status' => 'error',
    		'code'   => 404,
    	    'errors' => $validate->errors(),
    	);

    	}else{

        //cifrar la contraseña
    	$pwd = hash('sha256',$params->password);
    	$pwd2 = hash('sha256',$params->password_confirmation);

    	//comprobar si ya existe

    	//crear el usuario
    	$user = new User();
    	$user->email     = $params_array['email'];
    	$user->nombres   = $params_array['nombres'];
    	$user->apellidos = $params_array['apellidos'];
    	$user->password  = $pwd;//$params_array['password'];
    	$user->password_confirmation  = $pwd2;//$params_array['password_confirmation'];
    	$user->documento = $params_array['documento'];
    	$user->tipo_documento = $params_array['tipo_documento'];
    	$user->fecha_nacimiento = $params_array['fecha_nacimiento'];

    	//Guardar datos en base de datos

    	$user->save();


    	$data = array(
    		'status' => 'success',
    		'code'   => 200,
    		'message'=>'El usuario se ha creado correctamente',
    		'user' => $user,
    	);


    	}
      }else{

      	$data = array(
    		'status' => 'error',
    		'code'   => 404,
    	    'message' => 'Los datos enviados no son correctos',
    	);
      }
    	   return response()->json($data,$data['code']);

    }

    public function login(Request $request){

    	$jwtAuth = new \JwtAuth();

    	//recibir datos por post
    	$json =$request->input('json', null);
    	$params = json_decode($json);
    	$params_array = json_decode($json,true);

    	//Validar datos

    	$validate = Validator::make($request = $params_array, [
             'email'        =>'required|email',
             'password'     => 'required',

         ]);

    	if($validate->fails()){

    		$signup = array(
    		'status' => 'error',
    		'code'   => 404,
    		'message'=>'El usuario no se ha podido loguear',
    	    'errors' => $validate->errors(),
    	);

    	}else{

    		//Cifrar la password
    		$pwd = hash('sha256',$params->password);

    		//Devolver token o datos

    		$signup = $jwtAuth->signup($params->email,$pwd);
    		if(!empty($params->getToken)){

    			$signup = $jwtAuth->signup($params->email,$pwd,true);
    		}
    	}


    	return response()->json($signup,200);

    }

    //Metodo para actualizar datos del usuario por medio del metodo checkToken de JwtAuth.php

    public function update(Request $request){

    	//Comprobar si el usuario esta identificado

    	$token = $request->header('Authorization');
    	$jwtAuth = new \JwtAuth();
    	$checkToken = $jwtAuth->checkToken($token);


    	//recoger los datos por posts
    	$json = $request->input('json', null);
    	$params_array = json_decode($json,true);

    	if($checkToken && !empty($params_array)){

    		//Actualizar usuario


    		//Sacar usuario identificado

    		$user = $jwtAuth->checkToken($token,true);

    		//Validar los datos
    		$validate =Validator::make($request = $params_array,[
    		'email'        =>'required|email|unique:users,'.$user->sub,
    		'nombres'      =>'required|alpha',
    		'apellidos'    =>'required|alpha',
            'fecha_nacimiento' => 'required|date',
    		]);

    		

    		//Quitar los campos que no quiero actualizar
    		unset($params_array['id']);
    		unset($params_array['password']);
    		unset($params_array['password_confirmation']);
    		unset($params_array['documento']);
    		unset($params_array['tipo_documento']);
    		unset($params_array['created_at']);

    		//Actualizar dtos en DB
    		$user_update = User::where('id', $user->sub)->update($params_array);

    		//devolver array

    		$data = array(
    			'code'   =>200,
    			'status' =>'Success',
    			'message'=>$user,
    			'changes'=>$params_array,

    		);

    			
    		
    	
    	}else{
    		$data = array(
    			'code'   =>400,
    			'status' =>'Error',
    			'message'=>'El usuario no esta identificado.',

    		);
    	}
    	return response()->json($data,$data['code']);
    }

    public function upload (Request $request){

    	//recoger los datos de la peticion
    	$image = $request->file('file0');

    	//Validacion de la imagen
    	$validate = Validator::make($request->all(),[
          'file0'  =>'required|image|mimes:jpg.jpeg,png,gif',

    	]);


    	//Guardar imagen
    	if(!$image || $validate->fails()){

    		$data = array(
    			'code'   =>400,
    			'status' =>'Error',
    			'message'=>'El usuario no esta identificado.',

    		);
    		
    	}else{
            $image_name = time().$image->getClientOriginalName();
            \Storage::disk('users')->put($image_name,\File::get($image));

            $data = array(
              'code'  =>200,
              'status'=>'success',
              'image' => $image_name,
            );


    	}

          

    	return response()->json($data,$data['code']);
    }

    public function getImage($filename){

    	$isset = \Storage::disk('users')->exists($filename);

    	if($isset){
    	$file = \Storage::disk('users')->get($filename);
    	return new Response($file,200);
    	}else{
    		$data = array(
    			'code'   =>404,
    			'status' =>'Error',
    			'message'=>'Imagen no existe',

    		);
    		return response()->json($data,$data['code']);
    	}

    }

    public function detail($id){

    	$user = User::find($id);

    	if(is_object($user)){
    		$data = array(
    			'code'   =>200,
    			'status' =>'Succes',
    			'message'=>$user,

    		);
    	}else{

    		$data = array(
    			'code'   =>404,
    			'status' =>'Error',
    			'message'=>'El usuario no existe',

    		);
    	}
    	return response()->json($data,$data['code']);
    }
}
