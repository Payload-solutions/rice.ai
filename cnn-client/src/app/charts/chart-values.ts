import {ChartConfiguration } from "chart.js"
import { IotRecords } from "../models/environment";


let temperature: number[] = [];
let idValues: number[] = [];
let ph: number[] = [];
let dates: string[] = [];
let dataFetched = [];

let url = IotRecords.apiUrl;

fetch(url)
    .then((res) => res.json())
    .then((data) => {
        dataFetched = data;
        dataFetched.forEach((element: any) => {
            ph.push(element.ph);
            temperature.push(element.temperature);
            idValues.push(element.soil_id);
            dates.push(element.dates);
        });
    });



export const chartTemperature:ChartConfiguration | any = {
    type: 'line', //denotes tha type of chart

    data: {// values on X-Axis
        labels: idValues,
        datasets: [{
            label: 'Temperature',
            data: temperature,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(75, 192, 192)'
        }]
    },
    options: {
        aspectRatio: 2.5
    }

}

export const phValues:ChartConfiguration | any = {
    type: 'line', //denotes tha type of chart

    data: {// values on X-Axis
        labels: idValues,
        datasets: [{
            label: 'ph',
            data: ph,//[65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(218,112,214)'
        }]
    },
    options: {
        aspectRatio: 2.5,
        AnimationEffect:false
    }

}



