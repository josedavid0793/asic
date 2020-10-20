import{Injectable} from '@angular/core';
import {HttpClient, HttpHeaders, HttpErrorResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Host_clientes} from '../modelos/host_clientes';
import {global} from './global';


@Injectable()

export class HostService{
  public url:string;
  constructor(
      public _http: HttpClient
  	){
      this.url = global.url;
   }

   ingreso (Host_clientes):Observable<any>{
  	let json=JSON.stringify(Host_clientes);
  	let params = 'json='+json;

  	let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
  	return this._http.post(this.url+'host',params,{headers: headers});
  }

}