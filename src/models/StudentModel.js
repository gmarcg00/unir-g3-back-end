const pool = require("../config/db");

async function findById(id){
    const [result] = await pool.query('SELECT * FROM students WHERE id = ?;', [id]);
    if(result.length === 0) return null;
    return result[0];
}

module.exports = {
    findById
}