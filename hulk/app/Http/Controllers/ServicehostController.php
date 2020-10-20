<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\hostService_clientes;

class ServicehostController extends Controller
{
    public function agregar(Request $request){
       $json = $request->input('json',null);
       $params =json_decode($json);
       $params_array =json_decode($json,true);

       if (!empty($params) && !empty($params_array)) {
       	
       	$params_array=array_map('trim', $params_array);

       	$validate=\Validator::make($params_array,[
         'service_name'          =>'required|regex:/^[\pL\s\-]+$/u',
         'host'                  =>'required|alpha_num',
         'ip'                    =>'required|ip',
         'cliente'               =>'required|alpha',
         'ambiente'              =>'required|alpha',
         'sistema_operativo'     =>'required|alpha',
         'escalamiento'          =>'regex:/^[\pL\s\-]+$/u',
         'notas'                 =>'regex:/^[\pL\s\-]+$/u',
           ]);

       	if ($validate->fails()) {
       	  
       	  $data = array (
            'status'     => 'error',
            'code'       => 404,
            'message'    => 'No se ha ingresado el host',
            'errors'     => $validate->errors(),
              );
       	   }else{
            //Validación pasada correctamente
        

           //crear el service
           $service = new hostService_clientes();
           $service->service_name=$params_array['service_name'];
           $service->host = $params_array['host'];
           $service->ip = $params_array['ip'];
           $service->cliente = $params_array['cliente'];
           $service->ambiente = $params_array['ambiente'];
           $service->sistema_operativo = $params_array['sistema_operativo'];
           $service->escalamiento = $params_array['escalamiento'];
           $service->notas = $params_array['notas'];
    
           //Guardar el usuario en base de datos
           $service->save();
    
            $data = array (
             'status'     => 'success',
             'code'       => 200,
             'message'    => 'El Servicio se a incluido',
              );
            }

       }else {
        $data = array (
         'status'     => 'error',
         'code'       => 404,
         'message'    => 'Los datos enviados no son correctos',

             );
          }
     
          return response()->json($data,$data['code']);
    }
}
