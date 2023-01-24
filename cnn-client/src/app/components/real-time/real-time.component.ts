import { Component, OnInit } from '@angular/core';
import { Chart, registerables } from 'chart.js';
import { ContinuosPhValues } from 'src/app/charts/chart-values';
@Component({
  selector: 'app-real-time',
  templateUrl: './real-time.component.html',
  styleUrls: ['./real-time.component.css']
})
export class RealTimeComponent implements OnInit {

  public chartReal: any;

  constructor() { 
    Chart.register(...registerables);
  }

  ngOnInit(): void {
    this.createChart();
  }

  createChart(){
    this.chartReal = new Chart("MyChartReal", ContinuosPhValues);
  }

}
