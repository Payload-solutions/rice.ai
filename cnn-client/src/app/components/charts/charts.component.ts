import { Component, OnInit } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { Chart, registerables } from 'chart.js';

@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.css']
})
export class ChartsComponent implements OnInit {

  public chart: any;
  public chart2: any;
  public chart3: any;

  temperature :number[] = [];
  ph:number[]= [];
  dates :string[] = [];

  

  constructor(private http:HttpClient) {
    Chart.register(...registerables);
    this.getChartValues();
  }

  ngOnInit(): void {
    
    this.createChart();
    //this.getChartValues();
    //this.getChartValues();
  }

  createChart(){    
    //console.log(temperature);
    
    const labels: string[] | any = [];
    for (let i = 1; i <= 93; i++) {
      labels.push(i.toString());
    }
    this.chart = new Chart("MyChart", {
      type: 'line', //this denotes tha type of chart

      data: {// values on X-Axis
        labels: this.dates,
        datasets: [{
          label: 'Temperature',
          data: this.temperature,//[65, 59, 80, 81, 56, 55, 40],
          fill: false,
          borderColor: 'rgb(75, 192, 192)',
          tension: 0.1
        }]
      },
      options: {
        aspectRatio: 2.5
      }

    });
    this.chart2 = new Chart("MyChart2", {
      type: 'line', //this denotes tha type of chart

      data: {// values on X-Axis
        labels: this.dates,
        datasets: [{
          label: 'ph',
          data: this.ph,//[65, 59, 80, 81, 56, 55, 40],
          fill: false,
          borderColor: 'rgb(75, 192, 192)',
          tension: 0.1
        }]
      },
      options: {
        aspectRatio: 2.5
      }

    });
    // this.chart3 = new Chart("MyChart3", {
    //   type: 'line', //this denotes tha type of chart

    //   data: {// values on X-Axis
    //     labels: labels,
    //     datasets: [{
    //       label: 'fechas',
    //       data: dates,//[65, 59, 80, 81, 56, 55, 40],
    //       fill: false,
    //       borderColor: 'rgb(75, 192, 192)',
    //       tension: 0.1
    //     }]
    //   },
    //   options: {
    //     aspectRatio: 2.5
    //   }

    // });
  }


  getChartValues(){
    this.http.get<any>("http://localhost:3000/iot-values")
      .subscribe(res =>{
        for(let x = 0; x < res.length; x++){
           
           this.temperature.push(res[x]["temperature"]);
           this.ph.push(res[x]["ph"]);
           this.dates.push(res[x]["dates"]);
         }
      })
  }

}
