const pool = require('../mysql/connection');

asyncgetValues = async ()=>{
    const values = await pool.query("SELECT * FROM soil_values");
    return values;
}

module.exports = asyncgetValues;