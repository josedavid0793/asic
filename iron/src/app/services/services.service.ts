import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpErrorResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Host_clientes} from '../modelos/host_clientes';
import {Hostservice_clientes} from '../modelos/hostservice_clientes';
import {global} from './global';

@Injectable()
export class ServicesService {
  public url:string;
  constructor(
     public _http: HttpClient
  	) { 
     this.url = global.url;
  }

  agregar (Hostservice_clientes):Observable<any>{
  	let json=JSON.stringify(Hostservice_clientes);
  	let params = 'json='+json;

  	let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
  	return this._http.post(this.url+'service',params,{headers: headers});
  }
}
