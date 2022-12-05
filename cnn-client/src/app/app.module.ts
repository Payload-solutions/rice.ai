import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms'; 
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AboutComponent } from './components/about/about.component';
import { ConvolutionComponent } from './components/convolution/convolution.component';
import { ChartsComponent } from './components/charts/charts.component';
import { LineComponent } from './components/line/line.component';
import { MeasuresComponent } from './components/measures/measures.component';
import { MainComponent } from './components/main/main.component';
import { LoginComponent } from './components/login/login.component';
import {HttpClientModule, HTTP_INTERCEPTORS} from '@angular/common/http'
import { TokenInterceptorService } from './services/token-interceptor.service';
import { AuthGuard } from './services/auth.guard';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { SignupComponent } from './components/signup/signup.component';



@NgModule({
  declarations: [
    AppComponent,
    AboutComponent,
    ConvolutionComponent,
    ChartsComponent,
    LineComponent,
    MeasuresComponent,
    MainComponent,
    LoginComponent,
    SignupComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    NgbModule
  ],
  providers: [
    AuthGuard,{
      provide:HTTP_INTERCEPTORS,
      useClass: TokenInterceptorService,
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
