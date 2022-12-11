const express = require('express');

const app = express();

app.set('port', process.env.PORT || 3000);
app.use(express.json());



app.use('', require('./router/iot'))


app.listen(app.get('port'), ()=>{
    console.log("server is running in port 3000");
});