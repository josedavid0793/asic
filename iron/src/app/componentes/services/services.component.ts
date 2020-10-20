import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {Host_clientes} from '../../modelos/host_clientes';
import {Clientes} from '../../modelos/clientes';
import {Hostservice_clientes} from '../../modelos/hostservice_clientes';
import {ServicesService} from '../../services/services.service';

@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.css'],
  providers: [ServicesService],
})
export class ServicesComponent implements OnInit {
  public titulo:string;
  public hostservice_clientes: Hostservice_clientes;
  public status:string;

  clientes:string[]=[
  "TERPEL",
  "FLAMINGO",
  "VANTI",
  "MEFIA"
  ];

  constructor(
   private _ServicesService: ServicesService
  	) {
   this.titulo ='Agregar Servicio de Host';
    this.hostservice_clientes = new Hostservice_clientes(1,'','','','','','','','');
  	 }

  ngOnInit(): void {
  }

   onSubmit(form){
    this._ServicesService.agregar(this.hostservice_clientes).subscribe(
          response =>{
           if(response.status == "success"){
            this.status = response.status;
//vacío el formulario
            form.reset();

           }else {
            this.status = 'error';
           }

               form.reset();
          },
          error => {
            this.status = 'error';
            console.log (<any>error);
          }
      );
    console.log(this.hostservice_clientes);
  }

}
