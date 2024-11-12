const {checkToken, checkRole} = require("../utils/UserMiddleware");
const {findById, activateTeacher} = require("../models/TeacherModel");
const router = require('express').Router();

router.post('/:id/activate', checkToken, checkRole(1), async (req,res,next) => {
    const id = req.params.id;
    const teacher = await findById(id);
    if(teacher === null) return res.status(404).json({code: 'NOT_FOUND', message: `Teacher with id ${id} not found.`});
    if(teacher.active) return res.status(400).json({code: 'BAD_REQUEST', message: `Teacher with id ${id} is already active.`});
    try{
        await activateTeacher(id);
        return res.status(200).json({code: 'OK', message: `Teacher with id ${id} has been activated.`});
    }catch (error){
        next(error);
    }
});


module.exports = router;