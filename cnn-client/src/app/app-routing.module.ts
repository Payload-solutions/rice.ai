import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Components

import { AboutComponent } from './components/about/about.component';
import { ConvolutionComponent } from './components/convolution/convolution.component';
import { ChartsComponent } from './components/charts/charts.component';
import { MainComponent } from './components/main/main.component';

const routes: Routes = [
  /*{
    path: '',
    component:ConvolutionComponent,
    pathMatch:'full'
  },*/{
    path: '',
    component:MainComponent
  },{
    path: 'measurements',
    component: ChartsComponent
  },
  {
    path: 'convolution',
    component: ConvolutionComponent
  },
  {
    path:'about',
    component: AboutComponent
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
