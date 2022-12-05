import { Injectable } from '@angular/core';

import { Router } from '@angular/router';
import {HttpClient} from '@angular/common/http';
import { LoginEnvironment } from '../models/environment';



@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  
  private URL = LoginEnvironment.apiUrl;

  constructor(private http:HttpClient, private router: Router) { }


  signIn(userLogin: any){
    return this.http.post<any>(this.URL, userLogin);
  }


  isLoggedIn(): boolean{
    return !!localStorage.getItem("token");
  }


  getToken(){
    return localStorage.getItem("token");
  }

  logOut(){
    this.router.navigate(["/login"]);
    localStorage.setItem("token", "");
    localStorage.removeItem("email");
    localStorage.removeItem("userId");
    
  }
}
