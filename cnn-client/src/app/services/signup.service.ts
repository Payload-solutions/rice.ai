import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { SignupEnvironment } from '../models/environment';
import { Router } from '@angular/router';


@Injectable({
  providedIn: 'root'
})
export class SignupService {

  private url = SignupEnvironment.apiUrl;

  constructor(private http:HttpClient, private router:Router) { }



  signup(userSignup: any){
    return this.http.post<any>(this.url, userSignup);
    //this.router.navigate(["/login"]);
  }
}
