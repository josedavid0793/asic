import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import {User} from '../../modelos/user';
import {UserService} from '../../services/user.service';

@Component({
  selector: 'app-request-reset',
  templateUrl: './request-reset.component.html',
  styleUrls: ['./request-reset.component.css'],
  providers: [UserService],
})
export class RequestResetComponent implements OnInit {

  public titulo: string;
  public user:User;

  constructor(
  private _UserService: UserService
  	) {
   this.titulo ='Restablecer su contraseña';
   this.user = new User(1,'','','','','','administrador');
   }

  ngOnInit(): void {
  	
  }


  onSubmit(form){

  }
}
