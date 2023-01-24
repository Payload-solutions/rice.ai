import { ChartConfiguration } from "chart.js"
import { interval } from "rxjs";
let humidity: number[] = [];
let idSoil: number[] = [];
let ph: number[] = [];
let dates: string[] = [];
let temperatureSoil: number[] = [];
let temperatureEnviron: number[] = [];
let dataFetched = [];


/**
 * {
    "soil_id": 1,
    "soil_dates": "2023-01-24T09:57:21-05:00",
    "temperature_soil": 24.388,
    "temperature_environ": 22.694,
    "ph": 6.747,
    "humidity": 77,
    "soil_state": 1
  }
 */
 
const loadData = () => {
    //humidity=[];
    //idSoil=[];
    //ph=[];
    //dates=[];
    //temperatureSoil=[];
    //temperatureEnviron=[];
    //dataFetched=[];
    fetch("http://159.223.205.198:3000/last-environ")
        .then((res) => res.json())
        .then((data) => {
            dataFetched = data;
            dataFetched.forEach((element: any) => {
                ph.push(element.ph);
                idSoil.push(element.soil_id);
                temperatureSoil.push(element.temperature_soil);
                temperatureEnviron.push(element.temperature_environ);
                humidity.push(element.humidity);
                dates.push(element.soil_dates);
            });
        });
}
//interval(10000).subscribe(x => {
//    loadData();
//});

loadData();
export const RealTimeValues: ChartConfiguration | any = {
    type: 'line', //denotes tha type of chart

    data: {// values on X-Axis
        labels: idSoil,
        datasets: [{
            label: 'ph',
            data: ph,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(218,112,214)'
        }, {
            label: 'temperatura del suelo',
            data: temperatureSoil,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(75, 192, 192)'
        }, {
            label: 'temperatura del ambiente',
            data: temperatureEnviron,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(5, 192, 170)'
        }, {
            label: 'humedad del suelo',
            data: humidity,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(3, 145, 192)'
        }]
    },
    options: {
        aspectRatio: 2.5,
        AnimationEffect: false
    }

}
