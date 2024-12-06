
const router = require('express').Router();
const { findById, deleteStudent, findStudents, studentRatesTeacher, getRatingStudentTeacher } = require("../models/StudentModel");
const { findTeacherById } = require("../models/TeacherModel");
const { findById: findUserById } = require("../models/UserModel");
const { checkToken, checkRole } = require("../utils/UserMiddleware");
const StudentInfoResponse = require("./models/StudentInfoResponse");


router.get('/:id/info', checkToken, async (req, res, next) => {
    const id = req.params.id;
    const student = await findById(id);
    if (student === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Student with id ${id} not found.` });
    const user = await findUserById(id);
    if (user === null) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: 'An error occurred while processing the request.' });
    return res.status(200).json(new StudentInfoResponse(user, student));
});

// Admin : Student deletion
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

router.post('/:student_id/rates-teacher/:teacher_id', checkToken, checkRole(3), async (req, res, next) => {
    
    const student_id = req.params.student_id;
    const teacher_id = req.params.teacher_id;
    console.log(`Aquí llega. Student_id:${student_id} Teacher_id:${teacher_id}`)

    // verificamos que el profesor existe
    //const teacher = await findTeacherById(teacher_id);
    const teacher = await findTeacherById(teacher_id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} not found.` });

    const {rating, text_rating} = req.body;
    try{
        const result = await studentRatesTeacher(student_id, teacher_id, rating, text_rating);
        return res.status(200).json({ code: 'OK', message: `Student ${student_id} has rated Teacher ${teacher_id} with ${rating} stars` });
    }catch (error){
        next(error);
    } 
});

router.get('/:student_id/rates-teacher/:teacher_id',checkToken, checkRole(3), async (req, res, next) => {
    
    const student_id = req.params.student_id;
    const teacher_id = req.params.teacher_id;

    const teacher = await findTeacherById(teacher_id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} not found.` });

    try{
        const result = await getRatingStudentTeacher(student_id, teacher_id);
        if (result.length === 1){
            console.log(result)
             //return res.status(200).json({rating:`${result.rating}`, text_rating: `${result.text_rating}`});
             return res.status(200).json(result);
        }
        else {
        return res.status(404).json({rating:'No valorado', text_rating: 'No valorado'});
        }
        
        
    }catch (error){
        next(error);
    } 

});

router.get('/', checkToken, checkRole(1), async (req, res, next) => {
    const { active = 1, page = 1, page_size = 10, sort = "id", order = "ASC" } = req.query;
    const students = await findStudents(active, Number(page_size),Number(page),sort,order);
    const response = {
        total: students.total,
        data: students.data
    }
    return res.status(200).json(response);
})

module.exports = router;