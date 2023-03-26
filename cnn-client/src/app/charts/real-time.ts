import { ChartConfiguration } from "chart.js"
import { interval } from "rxjs";
import { RealRecords } from "../models/environment";


let temperature: number[] = [];
let idSoil: number[] = [];
let ph: number[] = [];
let dates: string[] = [];
let humiditySoil: number[] = [];
let humidityEnviron: number[] = [];
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
    fetch(RealRecords.apiUrl)
        .then((res) => res.json())
        .then((data) => {
            dataFetched = data;
            dataFetched.forEach((element: any) => {
                ph.push(element.ph);
                idSoil.push(element.soil_id);
                humiditySoil.push(element.humidity_soil);
                humidityEnviron.push(element.temperature_environ);
                temperature.push(element.temperature);
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
            label: 'humedad del suelo',
            data: humiditySoil,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(75, 192, 192)'
        }, {
            label: 'humedad del ambiente',
            data: humidityEnviron,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(34,139,34)'
        }, {
            label: 'temperatura del suelo',
            data: temperature,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(139,69,19)'
        }]
    },
    options: {
        aspectRatio: 2.5,
        AnimationEffect: false
    }

}
