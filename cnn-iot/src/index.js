const express = require('express');
const morgan = require('morgan');
const app = express();
const fs = require("fs");
const csvtojson = require('csvtojson');
const pool = require('./mysql/connection');
const cors = require("cors");

app.set('port', process.env.PORT || 3000);
app.use(express.json());



// middlewares
app.use(cors());
app.use(morgan('dev'));
app.use('', require('./router/iot'))
app.use(express.urlencoded({ extended: false }));
app.use(express.json());


// try {
//     const fileName = `${__dirname}/csv/soil.csv`;
//     csvtojson().fromFile(fileName).then(source => {
//         for (let row = 0; row < source.length; row++) {
//             let temperature = source[row]['temperature'],
//                 ph = source[row]['ph'],
//                 dates = source[row]['dates']

//             const newResult = {
//                 temperature,
//                 ph,
//                 dates
//             }
//             console.log(newResult);
//             pool.query('INSERT INTO soil_values set ?', [newResult]);
//         }
//     })

// } catch (error) {
//     console.log(error);
// }

app.listen(app.get('port'), () => {
    console.log(`${__dirname}`);
    console.log("server is running in port 3000");
});
