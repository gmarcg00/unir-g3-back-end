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

async function findKnowledgeBranchesByTeacherId(id){
    const [result] = await pool.query(
        'SELECT s.* FROM knowledge_branches s JOIN teacher_has_knowledge_branches ths ON s.id = ths.knowledge_branches_id WHERE ths.teachers_id = ?;',
        [id]);
    return result;
}

module.exports = {
    findById,
    activateTeacher,
    findKnowledgeBranchesByTeacherId
}