import { Injectable } from '@angular/core';

import { Router } from '@angular/router';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  
  private URL = 'http://127.0.0.1:8000/';

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
