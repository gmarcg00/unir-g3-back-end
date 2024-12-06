const router = require('express').Router();
const bcrypt  = require('bcryptjs')
const {register, saveStudent, saveTeacher, saveTeacherBranches, findById, findByEmail} = require("../models/UserModel");
const {createToken} = require("../utils/Helper");
const {checkRegisterStudentPayload, checkRegisterTeacherPayload, checkLoginPayload} = require("../utils/AuthMiddleware");


/**
 * Endpoint para registrar un estudiante
 */
router.post('/students/register',checkRegisterStudentPayload, async (req,res,next) => {
    req.body.password = await bcrypt.hash(req.body.password,8);
    try{
        const userId = await register(req.body)
        await saveStudent(userId)
        const user = await findById(userId);
        const token = createToken(user);
        return res.status(201).json({token: token});
    }catch (error){
        next(error);
    }
});


/**
 * Endpoint para registrar un profesor
 */
router.post('/teachers/register', checkRegisterTeacherPayload, async (req,res,next) => {
    req.body.password = await bcrypt.hash(req.body.password,8);
    const {description, price_hour, branches } = req.body;
    try{
        const userId = await register(req.body)
        await saveTeacher(userId,description,price_hour)
        await saveTeacherBranches(userId, branches)
        const user = await findById(userId);
        const token = createToken(user);
        return res.status(201).json({token: token});
    }catch (error){
        next(error);
    }
});


/**
 * Endpoint para hacer login
 */
router.post('/login', checkLoginPayload, async (req,res,next) => {
    const {email,password} = req.body;
    const user = await findByEmail(email);
    if(!user) return res.status(401).json({code: "UNAUTHORIZED", message: 'Invalid credentials.'});
    const isValid = await bcrypt.compare(password, user.password);
    if(!isValid) return res.status(401).json({code: "UNAUTHORIZED", message: 'Invalid credentials.'});
    const token = createToken(user);
    return res.status(200).json({token: token});
});

module.exports = router;