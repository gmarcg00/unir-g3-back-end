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
    console.log(`La select devuelve ${ result.length } `)

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

    console.log(result[0]);

    console.log(typeof result[0].avg_rating)
    let avg_rating = parseFloat(result[0].avg_rating)
    console.log(typeof avg_rating)
    console.log(avg_rating)
    
   let  [result2] = await pool.query(
        `UPDATE teachers SET average_rating = ?
        WHERE id = ?`,
        [avg_rating, teacher_id]);
   
        console.log(`Registros actualizados de profesores: ${result2.affectedRows}`)
   return result2.affectedRows;
 }

 async function getRatingStudentTeacher(student_id, teacher_id){
    const [result] = await pool.query(
        `SELECT student_id, teacher_id, rating, text_rating 
        FROM student_rates_teacher
        WHERE student_id = ? AND teacher_id = ?`,
        [student_id, teacher_id]);
        return result;
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
        'SELECT * FROM students WHERE id = ?;',
        [id]);
    return result;
}
module.exports = {
    findById, deleteStudent, findAllStudents, findStudentByTeacherId, studentRatesTeacher, getRatingStudentTeacher
}