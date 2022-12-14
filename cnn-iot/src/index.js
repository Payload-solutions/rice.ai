const express = require('express');
const morgan  = require('morgan');
const app = express();
const fs = require("fs");
const csvtojson = require('csvtojson');
const pool = require('./mysql/connection');


app.set('port', process.env.PORT || 3000);
app.use(express.json());



// middlewares
app.use(morgan('dev'));

app.use('', require('./router/iot'))
app.use(express.urlencoded({extended:false}));
app.use(express.json());


// try{
//     const fileName = `${__dirname}/csv/soil.csv`;
//     csvtojson().fromFile(fileName).then(source =>{
//         for(let row = 0; row < source.length; row++){
//             let relative_humidity = source[row]['relative_humidity'],
//                 nitrogen_percent = source[row]['nitrogen_percent'],
//                 temperature = source[row]['temperature'],
//                 dates = source[row]['dates']
    
//             const newResult = {
//                 relative_humidity,
//                 nitrogen_percent,
//                 temperature,
//                 dates
//             }
//             console.log(newResult);
//             pool.query('INSERT INTO soil_values set ?', [newResult]);
    
    
//             //let queryInsert = "INSERT INTO soil_values(relative_humidity,nitrogen_percent,temperature,dates) values(?,?,?,?)";
//             //let items = [relative_humidity,
//             //    nitrogen_percent,
//             //    temperature,
//             //    dates];
//         }
//     })
    
// }catch(error){
//     console.log(error);
// }

app.listen(app.get('port'), ()=>{
    console.log(`${__dirname}`);
    console.log("server is running in port 3000");
});