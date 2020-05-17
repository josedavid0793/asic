<?php

namespace App\Helpers;

use Firebase\JWT\JWT;
use Illuminate\Support\Facades\DB;
use App\Usuario;

class JwtAuth {

	public $key;

	public function __construct(){
		$this->key = 'Clave---64678secreta';
	}

	  public function signup($usuario, $password, $getToken = null){
        
    //Buscar si existe el usuario con las credenciales 
    $usuario = Usuario::where([
        'usuario' => $usuario,
        'password' => $password
    ])->first();
    //Comprobar si son correctas
    $signup = false;
    if(is_object($usuario)){
        $signup = true;
    }
    //Generar el token con los datos del usuario identificado
    if ($signup){
       $token = array (

           'sub'       => $usuario->id,
           'usuario'    => $usuario->usuario,
           'nombres'     => $usuario->nombres,
           'apellidos'  => $usuario->apellidos,
           'Correo'  => $usuario->correo,
           'password'  => $usuario->password,
           'Rol'  => $usuario->rol,
           'iat'      => time(), //Inicio de el token de sesion
           'exp'      => time () + (7*24*60*60),//cuando caducaría opcional
       ) ;
       $jwt = JWT::encode($token, $this->key,'HS256');//metodo estatico encode indicar el token y la clave
       $decoded = JWT::decode($jwt, $this->key,['HS256']);
       
     //devolver los datos decodificados o el token en function de un parametro
       if (is_null($getToken)){
           $data = $jwt;
          // return $jwt;
       }else{
          $data = $decoded;
          // return $decoded;
       }
       
    }else{
        $data = array (
            'staatus' => 'error',
            'message' => 'Login Incorrecto',
        );
    }

      return $data; 
    }
    public function checkToken($jwt,$getIdentity = false){
        $auth    = false;
        try{
        $decoded = JWT::decode($jwt, $this->key,['HS256']);
        
        } catch (\UnexpectedValueException $e){
            $auth = false;
        } catch (\DomainException $e){
            $auth = false;
        }
        if(!empty($decoded)&& is_object($decoded)&& isset($decoded->sub)){
            $auth = true;          
        }else{
            $auth =false;
        }
        if($getIdentity){
            return $decoded;
        }
        return $auth;
    }



}