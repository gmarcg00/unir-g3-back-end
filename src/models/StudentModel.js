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

async function findAllStudents() {
    const [result] = await pool.query(
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
        roles.name = 'student';`
    );

    return result;
}

async function findStudentByTeacherId(id) {
    const [result] = await pool.query(
        `   SELECT DISTINCT
                u.id,
                u.name,
                u.last_names,
                u.phone,
                u.email,
                u.username,
                u.image,
                u.role_id,
                s.active
            FROM 
                student_teacher_relations strl
            JOIN 
                students s ON strl.students_id = s.id
            JOIN 
                users u ON s.id = u.id
            WHERE 
                strl.teachers_id = ?;`, [id]);
    return result;
}

module.exports = {
    findById, deleteStudent, findAllStudents, findStudentByTeacherId
}