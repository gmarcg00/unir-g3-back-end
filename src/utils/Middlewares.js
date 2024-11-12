const {findByEmail,findByUsername} = require('../models/UserModel');

const checkRegisterStudentPayload = async (req, res, next) => {
    const {name,last_names,phone,email,username,password,role} = req.body;
    if (!name || !last_names || !phone || !email || !username || !password ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the fields: name, last_names, phone, email, username, and password'
        });
    }
    let userExist = await findByEmail(email);
    if (userExist != null) return res.status(409).json({code: 'BAD_REQUEST', message: `User with email ${email} already exist.`});
    userExist = await findByUsername(username);
    if (userExist != null) return res.status(409).json({code: 'BAD_REQUEST', message: `User with username ${username} already exist.`});
    req.body.role = 3;
    next();
}

module.exports = {
    checkRegisterStudentPayload
}