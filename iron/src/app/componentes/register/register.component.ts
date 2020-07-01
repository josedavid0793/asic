import { Component, OnInit } from '@angular/core';
import {User} from '../../modelos/user';
import {UserService} from '../../services/user.service';

@Component({
  selector: 'register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
  providers: [UserService],
})
export class RegisterComponent implements OnInit {
    public titulo:string;
      public user: User;
      public status:string;
   constructor(
  private _UserService: UserService
    ) {
     this.titulo = 'Registro de usuario';
     this.user = new User(1,'','','','','','');


   }

  ngOnInit() {
    console.log('Componente de registro lanzado!!');
    console.log(this._UserService.test());
  }
  //componente declarado en el formulario el onSubmit
  onSubmit(form){
    this._UserService.register(this.user).subscribe(
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
    console.log(this.user);
 
  }

}
