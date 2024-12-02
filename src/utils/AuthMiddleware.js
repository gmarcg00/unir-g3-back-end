const {findByEmail,findByUsername} = require('../models/UserModel');

const checkRegisterStudentPayload = async (req, res, next) => {
    const {name,last_names,phone,image,email,username,password} = req.body;
    if (!name || !last_names || !phone || !image || !email || !username || !password ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the fields: name, last_names, phone, image, email, username, and password'
        });
    }
    let userExist = await findByEmail(email);
    if (userExist != null) return res.status(409).json({code: 'CONFLICT', message: `User with email ${email} already exist.`});
    userExist = await findByUsername(username);
    if (userExist != null) return res.status(409).json({code: 'CONFLICT', message: `User with username ${username} already exist.`});
    req.body.role = 3;
    next();
}

const checkRegisterTeacherPayload = async (req, res, next) => {
    const {name,last_names,phone,email,username,password, description, 
            resume, price_hour, address, city, postal_code, branches } = req.body;
    if (!name || !last_names || !phone || !email || !username || !password || !description 
        || !resume || !price_hour || !address || !city || !postal_code || !branches ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: `The request body must contain the fields: name, last_names, phone, email, username, password, description, resume, price_hour, address, city, postal_code, branches[]`
        });
    }
    let userExist = await findByEmail(email);
    if (userExist != null) return res.status(409).json({code: 'CONFLICT', message: `User with email ${email} already exist.`});
    userExist = await findByUsername(username);
    if (userExist != null) return res.status(409).json({code: 'CONFLICT', message: `User with username ${username} already exist.`});
    req.body.role = 3;
    next();
}

const checkLoginPayload = (req, res, next) => {
    const {email, password} = req.body;
    if (!email || !password) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the fields: email and password'
        });
    }
    next();
}

module.exports = {
    checkRegisterStudentPayload,
    checkRegisterTeacherPayload,
    checkLoginPayload
}