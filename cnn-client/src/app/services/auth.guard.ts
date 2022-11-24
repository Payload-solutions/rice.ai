import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { AuthenticationService } from './authentication.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthenticationService,
    private router:Router){

  }
  canActivate(){
    if(this.authService.isLoggedIn()){
      return true;
    }
    this.router.navigate(['login'])
    return false;
  }
  
}
