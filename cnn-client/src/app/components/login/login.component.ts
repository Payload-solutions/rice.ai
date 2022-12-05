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

  signIn(){
  
    
    this.authService.signIn(this.userLogin)
      .subscribe(res=>{
        //console.log(res.token)
        localStorage.setItem("token", res.token)
        //console.log("this man i know"+localStorage.getItem('token'))
        this.router.navigate(['/'])
      }, err=>{
        console.log(err);
      })
  }

}
