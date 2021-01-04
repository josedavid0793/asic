import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpErrorResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Clientes} from '../interfaces/clientes';
import {global} from './global';


@Injectable()
export class ClientService {
  public url:string;
  constructor(
  public _http: HttpClient
  ) {
  this.url = global.url;
   }

     editarClientes(clientes):Observable<any>{

    let json=JSON.stringify(clientes);
  	let params = 'json='+json;

  	let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
  	return this._http.get(this.url+'clientes',{headers: headers});//,{headers: headers}

  }

}
