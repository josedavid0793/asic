<?php

namespace App\Helpers;

use Firebase\JWT\JWT;
use Illuminate\Support\Facades\DB;
use App\User;

class JwtAuth {

	public $key;

	public function __construct(){
		$this->key = 'Clave secreta $%&&&#&%$##';
	}




	public function signup($email,$password,$getToken =null){

		//Buscar si el usuario ingresado existe

		$user = User::where([
			'email' =>$email,
			'password' => $password
		])->first();//Metodo first para sacar el unico registro
        //Comprobar si son correctas (Object) por defecto la autenticación va ser false hasta que se compruebe
		$signup = false;

		if(is_object($user)){

			$signup = true;
		}

		if($signup){

			$token = array (
				'sub'       => $user->id,
				'email'       =>  $user->email,//en JWT hace referencia al id del usuario
                'nombres'   =>  $user->nombres,
                'apellidos' =>  $user->apellidos,
                'iat'       =>  time(),//function en JWT para saber el tiempo en que se creo el token
                'exp'       =>  time() + (7*24*60*60),//Fecha de caducacion del token
			);


            //Guardamos la informacion llamando a la libreria JWT
			$jwt     = JWT::encode($token,$this->key,'HS256');//La key solo la va a saber el programador no pasar el HS256
			$decoded = JWT::decode($jwt,$this->key,['HS256']);


			//Devolver los datos decodificados del usuario

			if(is_null($getToken)){
				$data = $jwt;
			}else{
				$data = $decoded;

			}
		}else{

			$data = array(
				'status'  => 'error',
				'message' => 'Login incorrecto.',

			);
		}

     return $data;
	}

	public function checkToken ($jwt,$getIdentity = false){

		$auth = false;

		try{
			$jwt = str_replace('"','', $jwt);
			$decoded = JWT::decode($jwt,$this->key,['HS256']);
		}catch(\UnexpectedValueException $e){
			$auth = false;
		}catch(\DomainException $e){
			$auth = false;
		}

		if(!empty($decoded)&& is_object($decoded) && isset($decoded->sub) ){

			$auth = true;
		}else{
			$auth = false;
		}
		if($getIdentity){

			return $decoded;
		}

		return $auth;

		
	}
}