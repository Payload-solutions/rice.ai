import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ISignupUser } from 'src/app/models/ISignup';
import { SignupService } from 'src/app/services/signup.service';
@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {

  userSignup:ISignupUser | any = {};
  constructor(private signupService: SignupService,
    private router: Router) { }

  ngOnInit(): void {
  }


  signUp(){
    //console.log(this.userSignup);
    this.signupService.signup(this.userSignup)
      .subscribe(res=>{
        this.router.navigate(['/login'])
      }, err=>{
          console.log(err);
      })
  }

}
