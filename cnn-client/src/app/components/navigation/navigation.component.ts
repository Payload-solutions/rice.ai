import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {

  userLogged: string | any = "";

  constructor(public authService:AuthenticationService) { }

  ngOnInit(): void {
    this.userLogged = this.authService.getUserName();
  }

}
