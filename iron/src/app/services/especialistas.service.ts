import { Injectable } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {HttpClient, HttpHeaders, HttpErrorResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Especialistas} from '../interfaces/especialistas';
import {global} from './global';

@Injectable()
export class EspecialistasService {
  public url:string;
  constructor(
  public _http: HttpClient
  	) { 
  this.url = global.url;
  }
  editarEspecialistas(especialistas):Observable<any>{

    let json=JSON.stringify(especialistas);
  	let params = 'json='+json;

  	let headers = new HttpHeaders().set('Content-Type','application/x-www-form-urlencoded');
                                   //peticion ajax URL
  	return this._http.get(this.url+'especialistas',{headers: headers});//,{headers: headers}

  }
}
