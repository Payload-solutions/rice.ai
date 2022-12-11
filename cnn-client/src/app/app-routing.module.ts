import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Components

import { AboutComponent } from './components/about/about.component';
import { ConvolutionComponent } from './components/convolution/convolution.component';
import { ChartsComponent } from './components/charts/charts.component';
import { MainComponent } from './components/main/main.component';
import { LoginComponent } from './components/login/login.component';
import { AuthGuard } from './services/auth.guard';
import { SignupComponent } from './components/signup/signup.component';
import { ListImagesComponent } from './components/list-images/list-images.component';


const routes: Routes = [
  /*{
    path: '',
    component:ConvolutionComponent,
    pathMatch:'full'
  },*/{
    path: '',
    component:MainComponent,
    canActivate:[AuthGuard]
  },{
    path: 'measurements',
    component: ChartsComponent,
    canActivate:[AuthGuard]
  },
  {
    path: 'convolution',
    component: ConvolutionComponent,
    canActivate:[AuthGuard]
  },
  {
    path:'about',
    component: AboutComponent
  },{
    path: 'login',
    component: LoginComponent
  },{
    path: 'signup',
    component: SignupComponent
  },{
    path:'list_images',
    component: ListImagesComponent,
    //canActivate:[AuthGuard]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
