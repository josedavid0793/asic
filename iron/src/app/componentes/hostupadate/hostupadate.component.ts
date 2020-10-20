import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {Host_clientes} from '../../modelos/host_clientes';
import {Clientes} from '../../modelos/clientes';
//import {Host_clientes} from '../../interfaces/host_clientes';
import {HostService} from '../../services/host.service';
import {VistahostService} from '../../services/vistahost.service';


@Component({
  selector: 'app-hostupadate',
  templateUrl: './hostupadate.component.html',
  styleUrls: ['./hostupadate.component.css'],
  providers: [HostService,VistahostService]
})
export class HostupadateComponent implements OnInit {
  public titulo:string;
  public host_clientes: Host_clientes= {
    id:0,
    host_name:'',
    ip: '',
    cliente: '',
    ambiente: '',
    sistema_operativo: '',
    escalamiento : '',
    notas : '',

 };
  public status:string;
  public response:string;
  editing:boolean=false;
  id:any;
  clientes:string[]=[
  "TERPEL",
  "FLAMINGO",
  "VANTI",
  "MEFIA"
  ];

  
  constructor(private _HostService: HostService,private _VistahostService: VistahostService,private activatedRoute: ActivatedRoute,private _router: Router,) {
    
    this.titulo ='Actualizar host';
   }

  ngOnInit(){
  	const params=this.activatedRoute.snapshot.params;
    if (params.id) {
      
      this._VistahostService.editarHostid(params.id).subscribe(

          response=>{
        
        this.host_clientes=response;
        this.editing = true;
        console.log(response);
     //this.response=response.find(this.id);
        
     },
     error => {
            this.status = 'error';
            console.log (<any>error);
          }


        );
    }else{
      this.editing=false;
    }
    
  }

  onSubmit(form){


    this._VistahostService.updateHost(this.host_clientes,this.id).subscribe(
          response =>{
            this.host_clientes=response;
       
               /*form.reset();*/
          },
          error => {
            this.status = 'error';
            console.log (<any>error);
          }
      );
      alert("Se actualizo");
      this._router.navigate(['viewhost']);
    
  }


}
