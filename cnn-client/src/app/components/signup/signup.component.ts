import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ISignupUser } from 'src/app/models/ISignup';
import { SignupService } from 'src/app/services/signup.service';
import { FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {

  signupForm = new FormGroup({
    name: new FormControl(''),
    last_name: new FormControl(''),
    email: new FormControl('',[Validators.required, Validators.email]),
    username: new FormControl(''),
    password: new FormControl(''),
    password2: new FormControl(''),
    role: new FormControl(''),
  })

  //userSignup:ISignupUser | any = {};
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
  constructor(private signupService: SignupService,
    private router: Router) { }

  ngOnInit(): void {
  }


  signUp(){
    console.log(this.signupForm.value);
    let pass1: string | any = this.signupForm.value["password"];
    let pass2: string | any = this.signupForm.value["password2"];
    if (this.checkingPasswords(pass1, pass2)){
      this.signupService.signup(this.signupForm.value)
      .subscribe(res=>{
        this.router.navigate(['/login'])
      }, err=>{
          console.log(err);
      })
    }else{
      alert("las contraseñas deben ser iguales")
    }
    
  }

  checkingPasswords(password1: string, password2: string): boolean{
    return password1 === password2;
  }

  

}
