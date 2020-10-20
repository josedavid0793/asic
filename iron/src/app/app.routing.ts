//Imports Necesarios
import {ModuleWithProviders} from '@angular/core';
import {Routes,RouterModule} from '@angular/router';

//Imports De nuestros componentes
import {RegisterComponent} from './componentes/register/register.component';
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





//Definir rutas

const appRoutes: Routes = [
           {path:'inicio', component:InicioComponent},
           //{path:'inicio', component: DefaultComponent},
           {path: 'login', component: LoginComponent},
           {path: 'logout/:sure', component: LoginComponent},
           {path: 'registro', component: RegisterComponent},
           {path:'response-password',component: ResponseResetComponent},
           {path:'request-reset',component: RequestResetComponent},
           {path: 'host', component: HostComponent},
           {path: 'hostupdate/:id', component: HostupadateComponent},
           {path: 'service', component: ServicesComponent},
           {path: 'client', component: ClientesComponent},
           {path: 'viewhost', component: VistaHostComponent},
           {path: 'hostExport', component: VistaHostComponent},
           {path: '**', component: ErrorComponent},
           

];

//exportar todo para que se tome por parte ANGULAR

export const appRoutingProviders: any []=[];
export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);