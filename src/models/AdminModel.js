const pool = require("../config/db");

async function findById(id){
    const [result] = await pool.query('SELECT * FROM users WHERE id = ?;', [id]);
    if(result.length === 0) return null;
    return result[0];
}


module.exports = {
    findById
}