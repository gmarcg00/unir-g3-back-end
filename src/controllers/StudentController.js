
const router = require('express').Router();
const { findById, deleteStudent, findStudents, studentRatesTeacher, getRatingStudentTeacher, getStudentTeachersList } = require("../models/StudentModel");
const { findTeacherById } = require("../models/TeacherModel");
const { findById: findUserById } = require("../models/UserModel");
const { checkToken, checkRole } = require("../utils/UserMiddleware");
const { checkStudentRatesTeacherPayload } = require("../utils/StudentMiddleware");
const StudentInfoResponse = require("./models/StudentInfoResponse");
const { getTokenId } = require('../utils/Helper');

/**
 * Endpoint para obtener la información de un estudiante
 */
router.get('/:id/info', checkToken, async (req, res, next) => {
    const id = req.params.id;
    const student = await findById(id);
    if (student === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Student with id ${id} not found.` });
    const user = await findUserById(id);
    if (user === null) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: 'An error occurred while processing the request.' });
    return res.status(200).json(new StudentInfoResponse(user, student));
});

/**
 * Endpoint para que un administrador desactive a un estudiante
 */
router.patch('/:id/delete', checkToken, checkRole(1), async (req, res, next) => {
    const id = req.params.id;
    let student = await findById(id);
    if (student === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Student with id ${id} not found.` });
    const affectedRows = await deleteStudent(student.id);
    if (affectedRows === 0) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: 'An error occurred while processing the request.' });
    student = await findById(id);
    const user = await findUserById(id);
    return res.status(200).json(new StudentInfoResponse(user, student));
});

/**
 * Endpoint para que un estudiante puntúe a un profesor
 */
router.post('/:student_id/rates-teacher/:teacher_id', checkToken, checkRole(3), checkStudentRatesTeacherPayload, async (req, res, next) => {
    
    const student_id = req.params.student_id;
    const teacher_id = req.params.teacher_id;

    const teacher = await findTeacherById(teacher_id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} not found.` });

    const {rating, text_rating} = req.body;
    try{
        await studentRatesTeacher(student_id, teacher_id, rating, text_rating);
        return res.status(200).json({ code: 'OK', message: `Student ${student_id} has rated Teacher ${teacher_id} with ${rating} stars` });
    }catch (error){
        next(error);
    } 
});

/**
 * Endpoint para obtener la valoración de un estudiante a un profesor
 */
router.get('/:student_id/rates-teacher/:teacher_id',checkToken, checkRole(3), async (req, res, next) => {
    
    const student_id = req.params.student_id;
    const teacher_id = req.params.teacher_id;

    const teacher = await findTeacherById(teacher_id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} not found.` });

    try{
        const result = await getRatingStudentTeacher(student_id, teacher_id);
        if (result.length === 1) return res.status(200).json(result[0]);
        else return res.status(500);
    }catch (error){
        next(error);
    } 

});

/**
 * Endpoint para obtener el listado de estudiantes
 */
router.get('/', checkToken, checkRole(1), async (req, res, next) => {
    const { active = 1, page = 1, page_size = 10, sort = "id", order = "ASC" } = req.query;
    const students = await findStudents(active, Number(page_size),Number(page),sort,order);
    const response = {
        total: students.total,
        data: students.data
    }
    return res.status(200).json(response);
});


/**
 * Endpoint para lista de profesores de un alumno
 */

router.get('/teachers', checkToken, checkRole(3), async (req, res, next) => {

    const student_id = getTokenId(req, res);

    const result = await getStudentTeachersList(student_id);
    if ( result.length === 0 ) return res.status(404).json({code: 'NOT_FOUND', message: `The student doesn't have teachers related`});
    
    return res.status(200).json(result);
});

module.exports = router;