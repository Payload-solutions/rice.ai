import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Components

import { ConvolutionComponent } from './components/convolution/convolution.component';
import { ChartsComponent } from './components/charts/charts.component';
import { MainComponent } from './components/main/main.component';
import { LoginComponent } from './components/login/login.component';
import { AuthGuard } from './services/auth.guard';
import { SignupComponent } from './components/signup/signup.component';
import { ListImagesComponent } from './components/list-images/list-images.component';
import { RealTimeComponent } from './components/real-time/real-time.component';

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
    path: 'login',
    component: LoginComponent
  },{
    path: 'signup',
    component: SignupComponent
  },{
    path:'list_images',
    component: ListImagesComponent,
    //canActivate:[AuthGuard]
  },{
    path:'real-time',
    component:RealTimeComponent,
    canActivate:[AuthGuard]
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
