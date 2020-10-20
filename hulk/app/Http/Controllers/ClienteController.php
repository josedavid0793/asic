<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\host_clientes;
use App\hostService_clientes;

class ClienteController extends Controller
{
    public function buscar(Request $request){

     $host          = $request->get('buscarpor');
     $ip            = $request->get('buscarporip');
     $host_clientes =host_clientes::host_name($host)->ip($ip)paginate(5);

     return compact($host_clientes);
    }

    public function cliente(){
    	//select * from host_clientes h join hostservice_clientes hs where h.host_name=hs.host
    }
}
