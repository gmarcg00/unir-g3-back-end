const pool = require("../config/db");

async function findById(id) {
    const [result] = await pool.query('SELECT * FROM teachers WHERE id = ?;', [id]);
    if (result.length === 0) return null;
    return result[0];
}

async function activateTeacher(id) {
    const [result] = await pool.query(
        'UPDATE teachers SET active = ? WHERE id = ?',
        [true, id]
    );
    return result.affectedRows;
}

async function findKnowledgeBranchesByTeacherId(id) {
    const [result] = await pool.query(
        'SELECT s.* FROM knowledge_branches s JOIN teacher_has_knowledge_branches ths ON s.id = ths.knowledge_branches_id WHERE ths.teachers_id = ?;',
        [id]);
    return result;
}

async function checkKnowledgeBranchForTeacher(teacher_id, branch_id){
    const [result] = await pool.query(
        `SELECT knowledge_branches_id 
        FROM teacher_has_knowledge_branches 
        WHERE teachers_id = ? AND knowledge_branches_id = ?;`,
        [teacher_id, branch_id]);
    if (result.length === 0){
        return false;
    } else {
        return true;
    }
}

async function findAll(active, branches, priceHour, rating, size, page, sort, order) {
    const offset = (page - 1) * size;
    const validSortFields = ['id', 'price_hour', 'average_rating'];
    const validOrderValues = ['ASC', 'DESC'];

    const sortField = validSortFields.includes(sort) ? sort : 'id';
    const sortOrder = validOrderValues.includes(order.toUpperCase()) ? order.toUpperCase() : 'ASC';

    const whereConditions = [];
    const params = [];

    if (active !== null) {
        whereConditions.push('teachers.active = ?');
        params.push(active);
    }

    if (priceHour !== null) {
        const priceHours = priceHour.split(',').map(ph => Number(ph));
        const pricePlaceholders = priceHours.map(() => '?').join(', ');
        whereConditions.push(`teachers.price_hour IN (${pricePlaceholders})`);
        params.push(...priceHours);
    }

    if (rating !== null) {
        const ratings = rating.split(',').map(r => Number(r));
        const ratingConditions = ratings.map(() => '(teachers.average_rating >= ? AND teachers.average_rating < ?)').join(' OR ');
        whereConditions.push(`(${ratingConditions})`);
        params.push(...ratings.flatMap(r => [r, r + 1]));
    }

    if (branches && branches.length > 0) {
        const splitBranches = branches.split(',');
        const branchPlaceholders = splitBranches.map(() => '?').join(', ');
        whereConditions.push(`teacher_has_knowledge_branches.knowledge_branches_id IN (${branchPlaceholders})`);
        params.push(...splitBranches);
    }

    const whereClause = whereConditions.length > 0 ? `WHERE ${whereConditions.join(' AND ')}` : '';

    const [[totalResult]] = await pool.query(
        `SELECT COUNT(DISTINCT teachers.id) as total
         FROM teachers
                  JOIN teacher_has_knowledge_branches
                       ON teachers.id = teacher_has_knowledge_branches.teachers_id
             ${whereClause}`,
        params
    );

    const [data] = await pool.query(
        `SELECT DISTINCT teachers.*
         FROM teachers
                  JOIN teacher_has_knowledge_branches
                       ON teachers.id = teacher_has_knowledge_branches.teachers_id
             ${whereClause}
         ORDER BY ${sortField} ${sortOrder}
             LIMIT ? OFFSET ?`,
        [...params, size, offset]
    );

    return {
        total: totalResult.total,
        data,
    };
}


async function findStudentsByTeacherId(teacher_id, page_size, page, order) {
    const offset = (page - 1) * page_size;
    const validOrderValues = ['ASC', 'DESC'];
    const sortOrder = validOrderValues.includes(order.toUpperCase()) ? order.toUpperCase() : 'ASC';
    const [[totalResult]] = await pool.query(
        `   SELECT 
                COUNT(DISTINCT u.id) AS total
            FROM 
                student_teacher_relations strl
            JOIN 
                students s ON strl.students_id = s.id
            JOIN 
                users u ON s.id = u.id
            WHERE 
                strl.teachers_id = ?;`, [teacher_id]
    );

    const [data] = await pool.query(
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
                strl.teachers_id = ?
            ORDER BY 
                u.name ${sortOrder}
            LIMIT ? OFFSET ?;`, [teacher_id, page_size, offset]
    );

    return {
        total: totalResult.total,
        data,
    };
}

async function findTeacherById(id) {
    const [result] = await pool.query('SELECT * FROM teachers WHERE id = ?;', [id]);
    if (result.length === 0) return null;
    return result[0];
}

async function updateTeacher(id, data) {
    const { name, last_names, phone, username, image, description, price_hour, branches } = data;

    const query = `
        UPDATE profesores
        SET 
            name = ?, 
            last_names = ?, 
            phone = ?, 
            username = ?, 
            image = ?, 
            description = ?, 
            price_hour = ?, 
            branches = ?
        WHERE id = ?
    `;
    const [result] = await pool.execute(query, [name, last_names, phone, username, image, description, price_hour, branches, id]);
    return result.affectedRows;
}

module.exports = {
    findById,
    activateTeacher,
    findTeacherById,
    updateTeacher,
    findKnowledgeBranchesByTeacherId,
    findAll,
    findStudentsByTeacherId,
    checkKnowledgeBranchForTeacher
}