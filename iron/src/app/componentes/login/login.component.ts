import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {User} from '../../modelos/user';
import {UserService} from '../../services/user.service';

@Component({
  selector: 'login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  providers: [UserService],
})
export class LoginComponent implements OnInit {
	public titulo:string;
	public user:User;
	public status:string;
	public token;
	public identity;

  constructor(
  private _userService: UserService,
  private _router: Router,
  private _route: ActivatedRoute,
  	) {

this.titulo = 'Ingresa por favor';
this.user = new User(1,'','','','','','administrador');
   }

  ngOnInit() {
    //Se ejecuta siempre y cierra sesión solo cuando le llega el parametro sure por la url
    this.logout();
  }

  onSubmit(form){
  //	console.log(this.user);
  this._userService.signup(this.user).subscribe(
      response =>{
           //TOKEN
           if(response.status != 'error'){
           	//this.status ='success';
           	this.token =response;
           	

           	//OBJETO USUARIO IDENTIFICADO
           	 this._userService.signup(this.user,true).subscribe(
      response =>{

              this.identity =response;
           
            //console.log(this.identity);

            //persistir datos usuarios identificados

            localStorage.setItem('token',this.token);
           	localStorage.setItem('identity',JSON.stringify(this.identity));
            console.log(this.token);
            console.log(this.identity);
          	
            this._router.navigate(['inicio']);

           
      	},
      	/*error =>{
      		this.status ='error';
      		console.log(<any>error);
      	}*/
  	);

           	
      	}else{
      		this.status = 'Usuario o contraseña incorrecta';
      	}
      	},
      	/*error =>{
      		this.status ='error';
      		console.log(<any>error);
      	}*/
  	);
}



logout(){
    this._route.params.subscribe(params=>{

      let logout = +params['sure'];
      if (logout== 1) {
        localStorage.removeItem('identity');
        localStorage.removeItem('token');

        this.identity = null;
        this.token = null;

        // Redireccionamos al inicio

        this._router.navigate(['inicio']);
      }
    });
}

}