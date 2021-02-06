import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {HttpClient,HttpResponse} from '@angular/common/http';
import {Host_clientes} from '../../interfaces/host_clientes';
import {Clientes} from '../../modelos/clientes';
import {VistahostService} from '../../services/vistahost.service';
import {global} from '../../services/global';
import {DataTable} from '../../class/data-table';
//import { Host_clientes } from 'src/app/modelos/host_clientes';

class DataTablesResponse {
  data: any[];
  draw: number;
  recordsFiltered: number;
  recordsTotal: number;
}

@Component({
  selector: 'app-vista-host',
  templateUrl: './vista-host.component.html',
  styleUrls: ['./vista-host.component.css'],
  providers: [VistahostService],
})


export class VistaHostComponent implements OnInit {
  
  dtOptions: DataTables.Settings = {};

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
  public response:string;
  public query:string;
  id: any;
  editing:boolean=false;

  
 

  constructor(private _VistahostService: VistahostService,private activatedRoute: ActivatedRoute, private http: HttpClient) {

  this.titulo ='Host Clientes';
    this.getHost();
  }
  ngOnInit(): void {
    const that = this;


    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 25,
      serverSide: true,
      processing: true,
      ajax: (dataTablesParameters: any, callback) => {
        that.http.get<DataTablesResponse>(
            'http://localhost/asic/hulk/public/viewhost',
             {}
          ).subscribe(resp => {
            that.hostclientes = resp.data;

            callback({
              recordsTotal: resp.recordsTotal,
              recordsFiltered: resp.recordsFiltered,
              data: []
            });
          });
      },
      columns: [{ data: 'id' }, { data: 'host_name' }, { data: 'ip' }, { data: 'cliente' }, { data: 'ambiente' }, { data: 'sistema_operativo' }, { data: 'escalamiento' }, { data: 'notas' }]
    };
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
  deleteHost(id:string){
    this._VistahostService.deleteHost(id).subscribe(
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
