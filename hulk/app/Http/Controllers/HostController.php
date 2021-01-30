<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use App\host_clientes;
use App\clientes;
use App\Exports\host_clientesExport;

class HostController extends Controller
{
    public function ingreso(Request $request){
       $json = $request->input('json',null);
       $params =json_decode($json);
       $params_array =json_decode($json,true);

       if (!empty($params) && !empty($params_array)) {
       	
       	$params_array=array_map('trim', $params_array);

       	$validate=\Validator::make($params_array,[
         'host_name'          =>'required|alpha_num',
         'ip'                 =>'required|ip',
         'cliente'            =>'required|alpha',
         'ambiente'           =>'required|alpha',
         'sistema_operativo'  =>'required|alpha',
         'escalamiento'       =>'regex:/^[\pL\s\-]+$/u',
         'notas'              =>'regex:/^[\pL\s\-]+$/u',
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
        

           //crear el host
           $host = new host_clientes();
           $host->host_name = $params_array['host_name'];
           $host->ip = $params_array['ip'];
           $host->cliente = $params_array['cliente'];
           $host->ambiente = $params_array['ambiente'];
           $host->sistema_operativo = $params_array['sistema_operativo'];
           $host->escalamiento = $params_array['escalamiento'];
           $host->notas = $params_array['notas'];
    
           //Guardar el usuario en base de datos
           $host->save();
    
            $data = array (
             'status'     => 'success',
             'code'       => 200,
             'message'    => 'El Host se a incluido',
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

    public function editarHost(){
      $hostclientes=host_clientes::orderBy('cliente','ASC')->get();

      return response()->json($hostclientes);
    }

    public function editarHostid(Request $request,$host_id){
      $host=host_clientes::find($host_id);

      return response()->json($host);
    }

    public function updateHost(Request $request,$id){
          
          $json = $request->input('json',null);
          $params =json_decode($json);
          $params_array =json_decode($json,true);

          if(!empty($params)&&!empty($params_array)){
           
            $params_array=array_map('trim', $params_array);

            $validate=\Validator::make($params_array,[
              'host_name'          =>'required|alpha_num',
              'ip'                 =>'required|ip',
              'cliente'            =>'required|alpha',
              'ambiente'           =>'required|alpha',
              'sistema_operativo'  =>'required|alpha',
              'escalamiento'       =>'regex:/^[\pL\s\-]+$/u',
              'notas'              =>'regex:/^[\pL\s\-]+$/u',
                ]);

                if ($validate->fails()) {
       	  
                  $data = array (
                   'status'     => 'error',
                   'code'       => 404,
                   'message'    => 'No se ha ingresado el host',
                   'errors'     => $validate->errors(),
                     );
                   }else{
           $host = host_clientes::find($id);
           $host->host_name = $params_array['host_name'];
           $host->ip = $params_array['ip'];
           $host->cliente = $params_array['cliente'];
           $host->ambiente = $params_array['ambiente'];
           $host->sistema_operativo = $params_array['sistema_operativo'];
           $host->escalamiento = $params_array['escalamiento'];
           $host->notas = $params_array['notas'];

           $host->save();
           $data = array (
            'status'     => 'success',
            'code'       => 200,
            'message'    => 'El Host se a actualizado',
             );
                   }
          }else {
            $data = array (
             'status'     => 'error',
             'code'       => 404,
             'message'    => 'Los datos enviados no son correctossssssssss',
    
                 );
              }

           

              return response()->json($data,$data['code']);
    
    }

    public function deleteHost(Request $request,$host_id){
      $host = host_clientes::find($host_id);
      $host->delete();
      return response()->json($host);
    }

    public function exportHost(Request $request){
      $file = Excel::download(new host_clientesExport,'host.xlsx');
      return $file;
    }

    /*Funcion para llamar los clientes desde el front*/
    public function editarCliente(){
      $clientes=clientes::orderBy('nombre','ASC')->get();

      return response()->json($clientes);
    }
}
