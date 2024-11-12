const router = require('express').Router();
const bcrypt  = require('bcryptjs')
const {register, saveStudent, findById, findByEmail} = require("../models/UserModel");
const {createToken} = require("../utils/Helper");
const {checkRegisterStudentPayload, checkLoginPayload} = require("../utils/AuthMiddleware");

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

router.post('/login', checkLoginPayload, async (req,res,next) => {
    const {email,password} = req.body;
    const user = await findByEmail(email);
    if(!user) return res.status(401).json({code: "UNAUTHORIZED", message: 'Invalid credentials.'});
    const isValid = await bcrypt.compare(password, user.password);
    if(!isValid) return res.status(401).json({code: "UNAUTHORIZED", message: 'Invalid credentials.'});
    const token = createToken(user);
    return res.status(200).json({token: token});
})


module.exports = router;