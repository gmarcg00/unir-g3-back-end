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


// FUNCIÓN PARA PUNTUAR AL PROFESOR
 async function studentRatesTeacher(student_id, teacher_id, rating, text_rating) {
     
    let [result] = await pool.query(
        `SELECT * FROM student_rates_teacher 
            WHERE student_id = ? AND teacher_id = ?`
        ,[student_id, teacher_id]);

    if ( result.length === 0 ) {
       [result] = await pool.query(
                `INSERT INTO student_rates_teacher (student_id, teacher_id, rating, text_rating) 
                VALUES (?,?,?,?)`,[student_id, teacher_id, rating, text_rating]);
    } else {
        [result] = await pool.query(
            `UPDATE student_rates_teacher
            SET rating = ?, text_rating = ? 
            WHERE student_id = ? AND teacher_id = ?`,[rating, text_rating, student_id, teacher_id]);
    }
    
    [result] = await pool.query(
        `SELECT teacher_id, AVG(rating) as avg_rating
            FROM student_rates_teacher
            WHERE teacher_id = ?`,
        [teacher_id]);

    let avg_rating = parseFloat(result[0].avg_rating)
    await pool.query(
        `UPDATE teachers SET average_rating = ?
        WHERE id = ?`,
        [avg_rating, teacher_id]);
 }

 async function getRatingStudentTeacher(student_id, teacher_id){
    const [result] = await pool.query(
        `SELECT student_id, teacher_id, rating, text_rating 
        FROM student_rates_teacher
        WHERE student_id = ? AND teacher_id = ?`,
        [student_id, teacher_id]);
        return result;
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

async function getStudentTeachersList(student_id) {

    const [result] = await pool.query(
        `SELECT t.id, t.name, t.last_names, t.image, k.name AS branch
            FROM student_teacher_relations AS str 
            INNER JOIN users AS t ON str.teachers_id = t.id
	        INNER JOIN knowledge_branches AS k ON k.id = str.knowledge_branches_id
        WHERE str.students_id = ?
        AND str.register_data <= current_date
        AND ( str.withdraw_data >= current_date OR
				str.withdraw_data IS NULL )`,
        [student_id]);
    return result;

}

module.exports = {
    findById, deleteStudent, findStudents, studentRatesTeacher, getRatingStudentTeacher, getStudentTeachersList
}