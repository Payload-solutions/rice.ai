const express = require('express');
const fs = require('fs')
const router = express.Router();
const pool = require("../mysql/connection");

router.get('', async(req, res)=>{
    res.json({
        "ping":"pong"
    });
});

router.get('/iot-values', async(req, res)=>{
    const values = await pool.query("select * from soil_values");
    console.log(values);
})

module.exports = router;