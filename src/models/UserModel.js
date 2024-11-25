const pool = require("../config/db");

async function register(user){
    const imageValue = user.image || null;
    const [result] = await pool.query('insert into users (name,last_names,phone,email,username,password,image,role_id) values (?,?,?,?,?,?,?,?)',
        [user.name, user.last_names, user.phone, user.email, user.username, user.password, imageValue, user.role]);
    return result.insertId;
}

async function saveStudent(id) {
    const [result] = await pool.query('insert into students (id,active) values (?,?)',
        [id, true]);
    return result.insertId;
}

async function saveTeacher(id, description, resume, price_hour, address, city, postal_code) {
    const [result] = await pool.query(`INSERT INTO 
                                        teachers (id, description, resume, price_hour, address, city, postal_code) 
                                        VALUES (?,?,?,?,?,?,?) `,
        [id, description, resume, price_hour, address, city, postal_code]);
    return result.insertId;
}

async function saveTeacherBranches(userId, branches) {
    const results = []
    const sql_statement = 'INSERT INTO teacher_has_knowledge_branches (teachers_id, knowledge_branches_id) VALUES (?,?)';   
    for (let branch of branches){
            const values = [userId, branch];
            const result = await pool.query( sql_statement, values);
            results.push(result);
        }
        return results;
}

async function findById(id){
    const [result] = await pool.query('SELECT * FROM users WHERE id = ?;', [id]);
    if(result.length === 0) return null;
    return result[0];
}

async function findByEmail(email){
    const [result] = await pool.query('SELECT * FROM users WHERE email = ?;', [email]);
    if(result.length === 0) return null;
    return result[0];
}

async function findByUsername(username){
    const [result] = await pool.query('SELECT * FROM users WHERE username = ?;', [username]);
    if(result.length === 0) return null;
    return result[0];
}

module.exports = {
    register,
    saveStudent,
    saveTeacher,
    saveTeacherBranches,
    findById,
    findByEmail,
    findByUsername
}