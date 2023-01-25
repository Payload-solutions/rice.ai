import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { AuthenticationService } from 'src/app/services/authentication.service';
import { IUserLogin } from 'src/app/models/IUser';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  userLogin:IUserLogin | any = {};

  constructor(private router:Router,
    private authService: AuthenticationService) { }

  ngOnInit(): void {
    localStorage.setItem("token", "");
  }

  create(){
    this.router.navigate(['/signup'])
  }

  signIn(){
  
    
    this.authService.signIn(this.userLogin)
      .subscribe(res=>{
        //console.log(res)
        console.log(res.status);
        
        localStorage.setItem("token", res.token)
        localStorage.setItem("user", res.user.name)
        //console.log("this man i know"+localStorage.getItem('token'))
        this.router.navigate(['/'])
      }, err=>{
        alert("Credenciales incorrectas");
      })
  }

}
