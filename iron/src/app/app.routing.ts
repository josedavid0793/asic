//Imports Necesarios
import {ModuleWithProviders} from '@angular/core';
import {Routes,RouterModule} from '@angular/router';

//Imports De nuestros componentes
import {RegisterComponent} from './componentes/register/register.component';
import { LoginComponent } from './componentes/login/login.component';
import { ErrorComponent } from './componentes/error/error.component';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { RequestResetComponent } from './componentes/password/request-reset/request-reset.component';
import { ResponseResetComponent } from './componentes/password/response-reset/response-reset.component';



//Definir rutas

const appRoutes: Routes = [
           {path:'inicio', component:InicioComponent},
          // {path:'inicio', component: DefaultComponent},
           {path: 'login', component: LoginComponent},
           {path: 'logout/:sure', component: LoginComponent},
           {path: 'registro', component: RegisterComponent},
           {path: '**', component: ErrorComponent},
           { path:'reset-pasword',component:RequestResetComponent},
           { path:'response-pasword',component:ResponseResetComponent},
];

//exportar todo para que se tome por parte ANGULAR

export const appRoutingProviders: any []=[];
export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);