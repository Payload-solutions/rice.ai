import { Component, OnInit } from '@angular/core';
import { Chart, registerables } from 'chart.js';
import { RealTimeValues } from 'src/app/charts/real-time';
import { interval, Subscription } from 'rxjs';
import { RealRecords } from 'src/app/models/environment';
import { HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-real-time',
  templateUrl: './real-time.component.html',
  styleUrls: ['./real-time.component.css']
})
export class RealTimeComponent implements OnInit {

  public chartReal: any;
  url = RealRecords.apiUrl;
  realBody: any = [];

  constructor(private http:HttpClient) {
    Chart.register(...registerables);
    interval(2000).subscribe(x => {
      this.loadingRealValues();
    });
  }

  loadingRealValues(){
    this.http.get<any>(this.url)
      .subscribe(res=>{
        this.realBody = res;
      })
  }

  ngOnInit(): void {
    this.createChart();
    this.loadingRealValues();

  }

  createChart() {
    this.chartReal = new Chart("MyChartReal", RealTimeValues);
  }

  loadData() {
    console.log("heheha");
    //this.createChart();
    //window.location.reload();
  }



}
