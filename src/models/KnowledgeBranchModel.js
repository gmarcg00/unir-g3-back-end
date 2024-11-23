const pool = require("../config/db");

async function findAll(){
    const [result] = await pool.query('SELECT * FROM knowledge_branches');
    return result;
}


module.exports = {
    findAll
}