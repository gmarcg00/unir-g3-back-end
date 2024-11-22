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

async function findAll(active, size, page){
    const offset = (page - 1) * size;
    const [[totalResult]] = await pool.query(
        'SELECT COUNT(*) as total FROM teachers WHERE active = ?',
        [active]
    );
    const [data] = await pool.query(
        'SELECT * FROM teachers WHERE active = ? LIMIT ? OFFSET ?',
        [active, size, offset]
    );
    return {
        total: totalResult.total,
        data,
    };
}

module.exports = {
    findById,
    activateTeacher,
    findKnowledgeBranchesByTeacherId,
    findAll
}