const pool = require("../config/db");

async function findById(id) {
    const [result] = await pool.query('SELECT * FROM students WHERE id = ?;', [id]);
    if (result.length === 0) return null;
    return result[0];
}

async function deleteStudent(id) {
    const [result] = await pool.query('UPDATE students SET active = ? WHERE id = ?',
        [false, id]);
    return result.affectedRows;
}


// ONLY TEST POURPOSES
async function restoreStudent(id) {
    const [result] = await pool.query('UPDATE students SET active = ? WHERE id = ?',
        [true, id]);
    return result.affectedRows;
}
module.exports = {
    findById, deleteStudent, restoreStudent
}