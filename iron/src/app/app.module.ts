import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import {FormsModule} from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import {HttpClientModule,} from '@angular/common/http';
import {routing, appRoutingProviders} from './app.routing';
import { DataTablesModule } from 'angular-datatables';


import { AppComponent } from './app.component';
import { RegisterComponent } from './componentes/register/register.component';
import { LoginComponent } from './componentes/login/login.component';
import { ErrorComponent } from './componentes/error/error.component';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { RequestResetComponent } from './componentes/request-reset/request-reset.component';
import { ResponseResetComponent } from './componentes/password/response-reset/response-reset.component';
import { HostComponent } from './componentes/host/host.component';
import { ServicesComponent } from './componentes/services/services.component';
import { ClientesComponent } from './componentes/clientes/clientes.component';
import { VistaHostComponent } from './componentes/vista-host/vista-host.component';
import { HostupadateComponent } from './componentes/hostupadate/hostupadate.component';
import { EspecialistasComponent } from './componentes/especialistas/especialistas.component';
import { GerentesComponent } from './componentes/gerentes/gerentes.component';



@NgModule({
  declarations: [
    AppComponent,
    RegisterComponent,
    LoginComponent,
    ErrorComponent,
    InicioComponent,
    ResponseResetComponent,
    RequestResetComponent,
    HostComponent,
    ServicesComponent,
    ClientesComponent,
    VistaHostComponent,
    HostupadateComponent,
    EspecialistasComponent,
    GerentesComponent,
    

  ],
  imports: [
    BrowserModule,
    routing,
    FormsModule,
    HttpClientModule,
    NgSelectModule,
    DataTablesModule,
  ],
  providers: [
    appRoutingProviders
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
