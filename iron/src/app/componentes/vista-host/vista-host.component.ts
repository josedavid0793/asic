import { Component,OnDestroy, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {HttpClient,HttpResponse} from '@angular/common/http';
import { Subject } from 'rxjs';
import {Host_clientes} from '../../interfaces/host_clientes';
import {Clientes} from '../../modelos/clientes';
import {VistahostService} from '../../services/vistahost.service';
import {global} from '../../services/global';
import {DataTable} from '../../class/data-table';


@Component({
  selector: 'app-vista-host',
  templateUrl: './vista-host.component.html',
  styleUrls: ['./vista-host.component.css'],
  providers: [VistahostService],
})


export class VistaHostComponent implements  OnInit {
  
  /*dtOptions: DataTables.Settings = {};OnDestroy
  dtTrigger: Subject<any> = new Subject<any>();*/

  public filename = 'host.xlsx';
  public titulo:string;
  public status:string;
  public HttpResponse:Blob;
  hostclientes: Host_clientes[];
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
  public response:any;
  public query:string;
  id: any;
  editing:boolean=false;
 

  
 

  constructor(private _VistahostService: VistahostService,private activatedRoute: ActivatedRoute, private http: HttpClient) {

  this.titulo ='Host Clientes';
    this.getHost();
  }
  ngOnInit(): void{
   //const that = this;


   /* this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 25,
    };
     this.http.get<host_clientes[]>('http://localhost/asic/hulk/public/viewhost')
      .subscribe(data => {
        this.response = (data as any).data;

        // Calling the DT trigger to manually render the table
        this.dtTrigger.next();
      });
  }
  ngOnDestroy(): void {
    // Do not forget to unsubscribe the event
    this.dtTrigger.unsubscribe();*/
  }

  getHost(){
    this._VistahostService.editarHost(this.hostclientes).subscribe(
      response=>{
      this.response=response;
         
      },
      error => {
             this.status = 'error';
             console.log (<any>error);
           }
 
      );
   console.log(this.response+this.id);
 
  }
  deleteHost(id:string,host_name:string){
    if (confirm("Seguro que deseas Eliminar" + " "+ host_name)) {
      this._VistahostService.deleteHost(id,host_name).subscribe(
      response=>{
        this.id=response;
           console.log(response);
           this.getHost();
        },
        error => {
               this.status = 'error';
               console.log (<any>error);
             }
   

      );
    }
  }


   getFileName(response: HttpResponse<Blob>) {
    let filename: string;
    try {
      const contentDisposition: string = response.headers.get('content-disposition');
      const r = /(?:filename=")(.+)(?:")/
      filename = r.exec(contentDisposition)[1];
    }
    catch (e) {
      filename = 'host.xlsx'
    }
    return filename
  }
  exportHost(uuid){
    this._VistahostService.exportHost(uuid).subscribe(
      (response: HttpResponse<Blob>)=>{
        let filename: string = this.getFileName(response)
        let binaryData = [];
        binaryData.push(response.body);
        let downloadLink = document.createElement('a');
        downloadLink.href = window.URL.createObjectURL(new Blob(binaryData, { type: 'blob' }));
        downloadLink.setAttribute('download', filename);
        document.body.appendChild(downloadLink);
        downloadLink.click();
        console.log(response);
        },
        error => {
               this.status = 'error';
               console.log (<any>error);
             }
   

    );
  }
  buscaHost(){
    this._VistahostService.buscaHost(this.query).subscribe(
      response=>{
      this.response=response;
      //console.log(this.response)
         
      },
      error => {
             this.status = 'error';
             console.log (<any>error);
           }
 
      );
   //console.log(this.response+this.query);
 
  }

}
