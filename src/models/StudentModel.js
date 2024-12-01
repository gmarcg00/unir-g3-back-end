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

async function findStudents(active, size, page,sort, order) {
    const offset = (page - 1) * size;
    const validSortFields = ['id'];
    const validOrderValues = ['ASC', 'DESC'];

    const sortField = validSortFields.includes(sort) ? sort : 'id';
    const sortOrder = validOrderValues.includes(order.toUpperCase()) ? order.toUpperCase() : 'ASC';

    const [[totalResult]] = await pool.query(
        'SELECT COUNT(*) as total FROM students WHERE active = ?',
        [active]
    );

    const [data] = await pool.query(
        `SELECT students.*, users.*
         FROM students
                  JOIN users ON students.id = users.id
         WHERE students.active = ?
         ORDER BY students.${sortField} ${sortOrder} 
     LIMIT ? OFFSET ?`,
        [active, size, offset]
    );

    return {
        total: totalResult.total,
        data,
    };

}


module.exports = {
    findById, deleteStudent, findStudents
}