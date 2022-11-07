import { Component, OnInit } from '@angular/core';

import { Chart, registerables } from 'chart.js';

@Component({
  selector: 'app-line',
  templateUrl: './line.component.html',
  styleUrls: ['./line.component.css']
})
export class LineComponent implements OnInit {

  public chart: any;

  constructor() {
    Chart.register(...registerables);
  }

  ngOnInit(): void {
    this.generateChart();
  }

  generateChart() {
    this.chart = new Chart("MyChart1", {
      type: 'doughnut', //this denotes tha type of chart

      data: {// values on X-Axis
        labels: [
          'Red',
          'Blue',
          'Yellow'
        ],
        datasets: [{
          label: 'My First Dataset',
          data: [300, 50, 100],
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)'
          ],
          hoverOffset: 4
        }]
      },
      options: {
        aspectRatio: 2.5
      }

    });
  }

}
