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

async function findStudents(active, page, page_size, order) {
    const offset = (page - 1) * page_size;
    const validOrderValues = ['ASC', 'DESC'];
    const sortOrder = validOrderValues.includes(order.toUpperCase()) ? order.toUpperCase() : 'ASC';

    const [[totalResult]] = await pool.query(
        'SELECT COUNT(*) as total FROM students WHERE active = ?',
        [active]
    );

    const [data] = await pool.query(
        `SELECT   
        users.id,
        users.name,
        users.last_names,
        users.phone,
        users.email,
        users.username,
        users.image,
        users.role_id,
        students.active
        FROM 
            users
        INNER JOIN 
            students ON users.id = students.id
        INNER JOIN 
            roles ON users.role_id = roles.id
        WHERE 
            roles.name = 'student'
            AND students.active = ?
        ORDER BY
            users.id ${sortOrder}
        LIMIT ? OFFSET ?;`, [active, Number(page_size), offset]
    );

    return {
        total: totalResult.total,
        data,
    };

}


module.exports = {
    findById, deleteStudent, findStudents
}