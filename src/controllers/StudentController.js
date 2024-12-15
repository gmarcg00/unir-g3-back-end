
const router = require('express').Router();
const { findById, deleteStudent, findStudents, studentRatesTeacher, getRatingStudentTeacher, getStudentTeachersList, createStudentTeacherLink, checkStudentTeacherLink } = require("../models/StudentModel");
const { findTeacherById, checkKnowledgeBranchForTeacher, findKnowledgeBranchesByTeacherId} = require("../models/TeacherModel");
const { findById: findUserById } = require("../models/UserModel");
const { checkToken, checkRole } = require("../utils/UserMiddleware");
const { checkStudentRatesTeacherPayload, checkLinkTeacherPayload } = require("../utils/StudentMiddleware");
const StudentInfoResponse = require("./models/StudentInfoResponse");
const { getTokenId } = require('../utils/Helper');
const TeacherInfoResponse = require("./models/TeacherInfoResponse");

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
router.get('/:id/teachers', checkToken, checkRole(3), async (req, res, next) => {

    const student_id = getTokenId(req, res);
    if( student_id !== Number(req.params.id)) return res.status(403).json({code: 'FORBIDDEN', message: 'You are not authorized to access this resource'});

    const teachers = await getStudentTeachersList(student_id);
    let data = await Promise.all(teachers.map(async (teacher) => {
        let user = await findUserById(teacher.id);
        let knowledgeBranches = await findKnowledgeBranchesByTeacherId(teacher.id);
        return new TeacherInfoResponse(user, teacher, knowledgeBranches);
    }))
    return res.status(200).json({data:data});
});

/**
 * Endpoint para linkar alumno y profesor
 */ 
router.post('/:id/link-teacher', checkToken, checkRole(3), checkLinkTeacherPayload, async (req, res, next) => {

    const student_id = getTokenId(req, res);
    if( student_id !== Number(req.params.id)) return res.status(403).json({code: 'FORBIDDEN', message: 'You are not authorized to access this resource'});

    const { teacher_id, knowledge_branch_id } = req.body;
    const branchApplies = await checkKnowledgeBranchForTeacher(teacher_id, knowledge_branch_id);
    if (branchApplies === false) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} doesn't teach knowledge branch ${knowledge_branch_id}` });

    const teacher = await findTeacherById(teacher_id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} not found.` });

    const alreadyExists = await checkStudentTeacherLink(student_id, teacher_id, knowledge_branch_id);
    if ( alreadyExists ) return res.status(409).json({code:'CONFLICT',message:'Student and Teacher are already linked by this branch'});

    const created = await createStudentTeacherLink(student_id, teacher_id, knowledge_branch_id);
    if ( created ) return res.status(200).json({message:'Student and teacher are now linked'})
    return res.status(500).json({code:'INTERNAL_SERVER_ERROR', message:`Link can't be created`});
});

module.exports = router;