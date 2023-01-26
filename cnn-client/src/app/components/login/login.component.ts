import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { IUserLogin } from 'src/app/models/IUser';
import { debounceTime } from 'rxjs/operators';
import { NgbAlert, NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';




@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  private _success = new Subject<string>();
  userLogin:IUserLogin | any = {};
  staticAlertClosed = false;
	successMessage = '';

  @ViewChild('staticAlert', { static: false }) staticAlert: NgbAlert | any;
  @ViewChild('selfClosingAlert', { static: false }) selfClosingAlert: NgbAlert | any;


  constructor(private router:Router,
    private authService: AuthenticationService) { }

  ngOnInit(): void {
    localStorage.setItem("token", "");
    setTimeout(() => this.staticAlert.close(), 20000);

		this._success.subscribe((message) => (this.successMessage = message));
		this._success.pipe(debounceTime(5000)).subscribe(() => {
			if (this.selfClosingAlert) {
				this.selfClosingAlert.close();
			}
		});
  }

  public changeSuccessMessage() {
		this._success.next(`${new Date()} - Credenciales incorrectas.`);
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
        this._success.next(`Credenciales incorrectas.`);
        //alert("Credenciales incorrectas");
      })
  }

}
