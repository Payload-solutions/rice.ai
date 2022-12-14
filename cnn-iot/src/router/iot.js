const express = require('express');
const fs = require('fs')
const router = express.Router();
const {parse} = require("csv-parse");

router.get('', async(req, res)=>{
    res.json({
        "ping":"pong"
    });
});

router.get('', async(req, res)=>{

})

module.exports = router;