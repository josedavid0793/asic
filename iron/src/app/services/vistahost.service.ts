import { Injectable,Query } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {HttpClient, HttpHeaders, HttpErrorResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Host_clientes} from '../interfaces/host_clientes';
import {global} from './global';



@Injectable()
export class VistahostService {
  public url:string;
  public uploadForm:any;
  constructor(
  public _http: HttpClient
  ) { 
  this.url = global.url;
  }

  editarHost(host_clientes):Observable<any>{

    let json=JSON.stringify(host_clientes);
  	let params = 'json='+json;

  	let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
  	return this._http.get(this.url+'viewhost',{headers: headers});//,{headers: headers}

  }
  editarHostid(id:string):Observable<any>{

    let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
    return this._http.get(this.url+'host/'+id,{headers: headers});//,{headers: headers}

  }
  updateHost(host_clientes,id:string):Observable<any>{
    
    let json=JSON.stringify(host_clientes);
  	let params = 'json='+json;
    let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
    return this._http.put(this.url+'hostupdate/'+host_clientes.id,params,{headers: headers});//,{headers: headers}

  }
  deleteHost(id:string,host_name:string):Observable<any>{

    let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
    //peticion ajax URL
    return this._http.delete(this.url+'host/'+id,{headers: headers});//,{headers: headers} 
  }
  /*Servicio para traer la data excel*/ 
  exportHost(uuid: string){

    return this._http.get<Blob>(this.url+'hostExport', { observe: 'response', responseType: 'blob' as 'json' });//,{headers: headers} {responseType: 'blob' as 'json'}

  }

  buscaHost(query:string=''):Observable<any>{
    
    let json=JSON.stringify(query);
    let params = 'json='+json;
    //let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
    //return this._http.get(this.url+'buscar',{params: {busqueda:query}});
    return this._http.get(this.url+'buscar',{params: {busqueda:query}});

  }

}
