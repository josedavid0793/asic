import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {Host_clientes} from '../../modelos/host_clientes';
import {Clientes} from '../../modelos/clientes';
//import {Host_clientes} from '../../interfaces/host_clientes';
import {HostService} from '../../services/host.service';
import {VistahostService} from '../../services/vistahost.service';


@Component({
  selector: 'app-host',
  templateUrl: './host.component.html',
  styleUrls: ['./host.component.css'],
  providers: [HostService,VistahostService]
})
export class HostComponent implements OnInit {
  public titulo:string;
  public host_clientes: Host_clientes;
  public status:string;
  public response:string;
  editing:boolean=false;
  id:string;
  clientes:string[]=[
  "TERPEL",
  "FLAMINGO",
  "VANTI",
  "MEFIA"
  ];

  
  constructor(private _HostService: HostService,private _VistahostService: VistahostService,private activatedRoute: ActivatedRoute) {
    
    this.titulo ='Agregar host';
    this.host_clientes = new Host_clientes(1,'','','','','','','');
   }

  ngOnInit(){
    
  }

  onSubmit(form){
    this._HostService.ingreso(this.host_clientes).subscribe(
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
    console.log(this.host_clientes);
  }

}

