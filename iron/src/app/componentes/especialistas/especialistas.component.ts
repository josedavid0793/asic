import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {HttpClient,HttpResponse} from '@angular/common/http';
import {Especialistas} from '../../interfaces/especialistas';
import {Gerentes_proyectos} from '../../interfaces/gerentes_proyectos';
import {EspecialistasService} from '../../services/especialistas.service';
import {global} from '../../services/global';

@Component({
  selector: 'app-especialistas',
  templateUrl: './especialistas.component.html',
  styleUrls: ['./especialistas.component.css'],
  providers: [EspecialistasService],
})
export class EspecialistasComponent implements OnInit {
  public titulo:string;
  public status:string;
  public HttpResponse:Blob;

  public especialistas: Especialistas= {
    es_id:0,
    es_nombres:'',
    es_apellidos: '',
    es_correo: '',
    es_celular_coorporativo: '',
    es_celular_personal: '',
    es_especialidad : '',

 };

 
  public response:string;
  constructor(private _EspecialistasService: EspecialistasService,private activatedRoute: ActivatedRoute) {
      this.titulo ='Especialistas';
      this.getEspecialistas();
      
   }

  ngOnInit(): void {
  }

  getEspecialistas(){
    this._EspecialistasService.editarEspecialistas(this.especialistas).subscribe(
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
