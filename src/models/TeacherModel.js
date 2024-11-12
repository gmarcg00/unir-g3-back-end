const pool = require("../config/db");


async function findById(id){
    const [result] = await pool.query('SELECT * FROM teachers WHERE id = ?;', [id]);
    if(result.length === 0) return null;
    return result[0];
}

async function activateTeacher(id){
    const [result] = await pool.query(
        'UPDATE teachers SET active = ? WHERE id = ?',
        [true, id]
    );
    return result.affectedRows;
}

module.exports = {
    findById,
    activateTeacher
}