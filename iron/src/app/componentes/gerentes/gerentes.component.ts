import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {HttpClient,HttpResponse} from '@angular/common/http';
import {Gerentes_proyectos} from '../../interfaces/gerentes_proyectos';
import {GerentesService} from '../../services/gerentes.service';
import {global} from '../../services/global';

@Component({
  selector: 'app-gerentes',
  templateUrl: './gerentes.component.html',
  styleUrls: ['./gerentes.component.css'],
  providers: [GerentesService],
})
export class GerentesComponent implements OnInit {
  public titulo:string;
  public status:string;
  public HttpResponse:Blob;
  public gerentes_proyectos: Gerentes_proyectos= {
    gp_id:0,
    gp_nombres:'',
    gp_apellidos: '',
    gp_correo: '',
    gp_celular_coorporativo: '',
    gp_celular_personal: '',
    gp_cliente : '',
    gp_centro_costos : '',

 };
  public response:string;
  constructor(private _GerentesService: GerentesService,private activatedRoute: ActivatedRoute) { 
     this.getGerentes();
  }

  ngOnInit(){
  }

  getGerentes(){
    this._GerentesService.editarGerente(this.gerentes_proyectos).subscribe(
      response=>{
      this.response=response;

         
      },
      error => {
             this.status = 'error';
             console.log (<any>error);
           }
 
      );

 
  }

}
