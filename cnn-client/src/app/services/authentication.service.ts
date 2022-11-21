import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor() { }


  isLoggedIn(): boolean{
    return !!localStorage.getItem("token");
  }
}
