import { Injectable } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {HttpClient, HttpHeaders, HttpErrorResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Gerentes_proyectos} from '../interfaces/gerentes_proyectos';
import {global} from './global';

@Injectable()
export class GerentesService {

  public url:string;
  constructor(
  public _http: HttpClient
  	) { 
  this.url = global.url;
  }

  editarGerente(gerentes_proyectos):Observable<any>{

    let json=JSON.stringify(gerentes_proyectos);
    let params = 'json='+json;

    let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
    return this._http.get(this.url+'gerentes',{headers: headers});//,{headers: headers}

  }
}
