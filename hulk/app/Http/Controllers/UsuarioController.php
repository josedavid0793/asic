<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Usuario;

class UsuarioController extends Controller
{
    public function register(Request $request){
        $json = $request->input('json',null);
        $params = json_decode($json);
        $params_array =json_decode($json,true);

        if (!empty($params) && !empty($params_array)) {
        	$params_array=array_map('trim', $params_array);

        	$validate=\Validator::make($params_array,[
         'usuario'     =>'required|alpha',
         'nombres'     => 'required|regex:/^[\pL\s\-]+$/u',
         'apellidos'   => 'required|regex:/^[\pL\s\-]+$/u',
         'correo'      => 'required|email|unique:usuarios',//unique comprueba si existe el usuario
         'password'   => 'required',
         'rol'         =>'required',
     ]);
        	if($validate->fails()){
         //La validación ha fallado
     $data = array (
         'status'     => 'error',
         'code'       => 404,
         'message'    => 'El Usuario no se a creado',
         'errors'     => $validate->errors(),
          );
     }else{
         //Validación pasada correctamente
         
      //Cifrar la contraseña
    $pwd = hash('sha256',$params->password);

     //crear el usuario
    $usuario = new Usuario();
    $usuario->usuario = $params_array['usuario'];
    $usuario->nombres = $params_array['nombres'];
    $usuario->apellidos = $params_array['apellidos'];
    $usuario->correo = $params_array['correo'];
    $usuario->password = $pwd;
    $usuario->rol = $params_array['rol'];
    
       //Guardar el usuario en base de datos
    $usuario->save();
    
       $data = array (
         'status'     => 'success',
         'code'       => 200,
         'message'    => 'El Usuario se a creado correctamente',
           );
     }
     } else {
        $data = array (
         'status'     => 'error',
         'code'       => 404,
         'message'    => 'Los datos enviados no son correctos',

          );
     }
     
    return response()->json($data,$data['code']);
        }
    


    public function login(Request $request){
      
      $jwtAuth = new \JwtAuth();

      //Recibir datos por post
      $json =$request->input('json',null);
      $params = json_decode($json);
      $params_array=json_decode($json,true);

      //Validar datos
      $validate = Validator::make($request = $params_array, [
             'usuario'        =>'required',
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
       //$pwd = $params->password;

        //Devolver token o datos

        $signup = $jwtAuth->signup($params->usuario,$pwd);
        if(!empty($params->getToken)){

          $signup = $jwtAuth->signup($params->usuario,$pwd,true);
        }
      }


      return response()->json($signup,200);

    }

      public function update(Request $request){
     //Comprobar si el usuario esta identificado
     $token = $request->header('Authorization');
     $jwtAuth = new \JwtAuth();
     $checkToken = $jwtAuth->checkToken($token);
     
//Recoger los datos por POST
    $json = $request->input('json',null);
    $params_array = json_decode($json,true);
if($checkToken && !empty($params_array)){
    
    //Sacar usuario identificado
    $usuario = $jwtAuth->checkToken($token,true);
    //Validar los datos
    $validate = \Validator::make($params_array,[
         'nombres'       => 'required|alpha',
         'apellidos'    => 'required|alpha',
         'correo'      => 'required|email|unique:usuario,'.$usuario->sub,//unique comprueba si existe el usuario
    ]);
    //Quitar los datos que no quiero actualizar
    unset($params_array['id']);
    unset($params_array['role']);
    unset($params_array['password']);
    unset($params_array['create_at']);
    unset($params_array['remember_token']);
    //Actualizar usuario en DB
    $usuario_update =Usuario::where('id', $usuario->sub)->update($params_array);
    //Devolver array con resultado
    $data = array (
        'code'     => 200,
        'status'   =>'success',
        'usuario'  =>$usuario_update
    );
 
}else{
    $data = array(
        'code'     => 400,
        'status'   =>'error',
        'message'  =>'El usuario no esta identificado correctamente'
    );
}
return response()->json($data,$data['code']);
 }

   public function upload (Request $request){
     
     //Recoger datos de la petición
     $image = $request->file('file0');
     
     //Validación de imagen 
     $validate = \validator::make($request->all(),[
         'file0' =>'requerid|image|mimes:jpg,jpeg,png,gif'
     ]);
     //guardar la imagen
     if(!$image ||$validate->fails()){
   $data = array(
        'code'     => 400,
        'status'   =>'error',
        'message'  =>'Error al subir imagen',
         );
     }else{
         $image_name= time().$image->getClientOriginalName();
         \Storage::disk('usuarios')->put($image_name,\File::get($image));
         
         $data = array (
             'code'     =>200,
             'status'   =>'success',
             'image'    =>$image_name
 
    ); 
     }
   
     return response()->json($data,$data['code']);
 }
 public function getImage($filename){
     $isset = \Storage::disk('usuarios')->exists($filename);
     if ($isset){
     $file = \Storage::disk('usuarios')->get($filename);
     return new Response ($file,200);
     }else{
           $data = array (
             'code'     =>404,
             'status'   =>'success',
             'message'  =>'la imagen no existe'
               );
           return response()->json($data,$data['code']);
     }

 }
 public function detail($id){
     $usuario = Usuario::find($id);
 if(is_object($user)){
     $data = array(
         'code'   =>200,
         'status' =>'success',
         'user'   =>$usuario
         
     );
 }else{
      $data = array(
         'code'   =>404,
         'status' =>'error',
         'message'   =>'El usuario no existe.'
          );
 }
 return response()->json($data,$data['code']);
 }
}
