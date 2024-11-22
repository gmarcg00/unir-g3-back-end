const jwt = require('jsonwebtoken');
const {findById} = require('../models/UserModel');
const {getTokenRole, getTokenId} = require("./Helper");

const checkToken = async (req, res, next) => {
    if(!req.headers['authorization']) return res.status(401).json({code: "UNAUTHORIZED", message: 'Token required.'});
    const token = req.headers['authorization'];
    let data;
    try{
        data = jwt.verify(token,'clave super secreta');
        console.log(data);
    }catch (error){
        return res.status(403).json({code: "UNAUTHORIZED", message: 'Invalid token.'});
    }

    const user = await findById(data.id);
    if(!user) return res.status(403).json({code: "UNAUTHORIZED", message: 'User not found.'});
    next();
}

const checkRole = (requiredRole) => {
    return (req,res,next) =>{
        const requestRole = getTokenRole(req, res);
        if(requestRole !== requiredRole) return res.status(403).json({code: "FORBIDDEN", message: 'User not authorized (IN CHECKROLE).'});
        next();
    }
}

const checkUserId =(req,res,next) =>{
    /// convertido a string para comparar string con string
    const requestId = (getTokenId(req, res)).toString();
    const userId = req.params.id;
    if(userId != requestId) return res.status(403).json({code: "FORBIDDEN", message: 'User not authorized. IN CHECKUSERID'});
    next();
}

module.exports = {
    checkToken,
    checkRole,
    checkUserId
};