import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

import { Chart, registerables } from 'chart.js';
import { MainEnvironment, IMain, TrainRecords } from 'src/app/models/environment';

import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  public chart: any;
  url = MainEnvironment.apiUrl;
  convUrl = TrainRecords.apiUrl;
  mainBody:IMain | any = {};
  convBody: any = [];
  userLogged: string | any = "";

  constructor(private http: HttpClient, private authenticationService: AuthenticationService) {
    Chart.register(...registerables);
  }

  ngOnInit(): void {
    this.lineGenerateChart();
    this.loadMainValues();
    this.loadingConvolution();
    //console.log(this.mainBody);
  }



  loadMainValues(){
    this.http.get<any>(this.url)
      .subscribe(res=>{
        console.log(res)
        this.mainBody= res;
      })
      this.userLogged = this.authenticationService.getUserName();
     
  }


  loadingConvolution(){
    this.http.get<any>(this.convUrl)
      .subscribe(res=>{
        console.log(res);
        this.convBody= res;
      }, err => {
        console.log(err);
      })
  }




  lineGenerateChart() {
    //const labels = ['April','May','June','July','August','September','November'];
    const labels: string[] | any = [];

    for (var a = [], i = 0; i < 100; ++i) a[i] = i;

    // http://stackoverflow.com/questions/962802#962890
    function shuffle(array: number[]) {
      var tmp, current, top = array.length;
      if (top) while (--top) {
        current = Math.floor(Math.random() * (top + 1));
        tmp = array[current];
        array[current] = array[top];
        array[top] = tmp;
      }
      return array;
    }

    a = shuffle(a);



    for (let i = 0; i <= 100; i++) {
      labels.push(i.toString());
    }
    this.chart = new Chart("MyChart2", {
      type: 'line', //this denotes tha type of chart

      data: {// values on X-Axis
        labels: labels,
        datasets: [{
          label: 'Record of the convolutions',
          data: a,//[65, 59, 80, 81, 56, 55, 40],
          fill: false,
          borderColor: 'rgb(75, 192, 192)',
          tension: 0.1
        }]
      },
      options: {
        aspectRatio: 2.5
      }

    });
  }
}


