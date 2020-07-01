import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {
  
public titulo: string;

  constructor() { }

  ngOnInit(): void {
  this.titulo ='Sistema de información del NOC de Asic';
  }

}
