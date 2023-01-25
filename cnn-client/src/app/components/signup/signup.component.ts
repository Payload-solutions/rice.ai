import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ISignupUser } from 'src/app/models/ISignup';
import { SignupService } from 'src/app/services/signup.service';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Directive, ElementRef} from '@angular/core';


@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {

  signupForm = new FormGroup({
    name: new FormControl(''),
    last_name: new FormControl(''),
    email: new FormControl('', [Validators.required, Validators.email, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
    username: new FormControl(''),
    password: new FormControl('', [Validators.required, Validators.minLength(6)]),
    password2: new FormControl('', [Validators.required, Validators.minLength(6)]),
    role: new FormControl(''),
  });
  submitted = false;
  visible = false;

  //userSignup:ISignupUser | any = {};
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
  constructor(private signupService: SignupService,
    private router: Router, private el: ElementRef) {
      this.setup();
     }

  ngOnInit(): void {
  }

  get f() { return this.signupForm.controls; }


  signUp() {
    this.submitted = true;
    
    let pass1: string | any = this.signupForm.value["password"];
    let pass2: string | any = this.signupForm.value["password2"];

    if (this.signupForm.invalid) {
      return;
    }
    if (this.checkingPasswords(pass1, pass2)) {
      console.log(pass1, pass2);
      this.signupService.signup(this.signupForm.value)
        .subscribe(res => {
          this.router.navigate(['/login'])
        }, err => {
          console.log(err);
        })
    } else {
      alert("las contraseñas deben ser iguales")
    }

  }

  checkingPasswords(password1: string, password2: string): boolean {
    return password1 === password2;
  }

  fieldTextType: boolean | any;



  toggleFieldTextType() {
    this.fieldTextType = !this.fieldTextType;
  }

  toggle(span: HTMLElement) {
    this.visible = !this.visible;
    if (this.visible) {
      this.el.nativeElement.setAttribute('type', 'text');
      span.innerHTML = 'Hide password';
    } else {
      this.el.nativeElement.setAttribute('type', 'password');
      span.innerHTML = 'Show password';
    }
  }

  setup() {
    
    const button = document.getElementById("clickeme");
    
    button?.addEventListener('click', (event) => {
      this.toggle(button);
    });
    //parent.appendChild(button);
  }
}

