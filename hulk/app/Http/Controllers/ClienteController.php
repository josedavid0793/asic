<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\host_clientes;
use App\hostService_clientes;

class ClienteController extends Controller
{
    public function index(Request $request){
      /*  $json = $request->input('json',null);
        $params = json_decode($json);
        $params_array =json_decode($json,true);*/
     #$host_cliente = host_clientes::host_name($request->get('host_name'))->orderBy('id','ASC');
     #$host_name = $request->get('host_name');
     #$ip = $request->get('ip');
     #$host = host_clientes::orderBy("id","ASC")->host_name($host_name)->ip($ip);
     #$host_clientes =host_clientes::host_name($host)->ip($ip)paginate(5);

     #return response('host_clientes.host_name.buscar',compact('host_cliente'));
     #return response()->json(host_clientes::search($request->busqueda));
     return host_clientes::buscar($request->busqueda);

    }

    public function cliente(){
    	//select * from host_clientes h join hostservice_clientes hs where h.host_name=hs.host
    }
}
