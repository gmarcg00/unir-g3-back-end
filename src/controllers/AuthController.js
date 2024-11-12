const router = require('express').Router();
const bcrypt  = require('bcryptjs')
const {register, saveStudent, findById} = require("../models/UserModel");
const {createToken} = require("../utils/Helper");
const {checkRegisterStudentPayload} = require("../utils/Middlewares");

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


module.exports = router;