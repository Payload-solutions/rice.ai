import { Injectable } from '@angular/core';

import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor(private router: Router) { }


  isLoggedIn(): boolean{
    return !!localStorage.getItem("token");
  }

  isConvolutionSessionIn():boolean{
    return !!localStorage.getItem("conv-session");
  }

  logOut(): void{
    this.router.navigate(['/login']);
  }
}
