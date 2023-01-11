import { Component, OnInit } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { Chart, registerables } from 'chart.js';
import { chartTemperature, phValues } from 'src/app/charts/chart-values';
@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.css']
})
export class ChartsComponent implements OnInit {

  public chart: any;
  public chart2: any;

  constructor(private http:HttpClient) {
    Chart.register(...registerables);
  }

  ngOnInit(): void {
    this.createChart();
  }

  createChart(){    
    this.chart = new Chart("MyChart", chartTemperature);
    this.chart2 = new Chart("MyChart2", phValues);
    
  }

}
