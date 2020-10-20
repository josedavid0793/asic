import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpErrorResponse} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Host_clientes} from '../modelos/host_clientes';
import {global} from './global';


@Injectable({
  providedIn: 'root'
})
export class ClientService {
  public url:string;
  constructor(
  public _http: HttpClient
  ) {
  this.url = global.url;
   }

}
