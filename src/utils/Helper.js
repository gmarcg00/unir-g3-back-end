const jwt = require('jsonwebtoken');

const createToken = (user) => {
    const data = {
        id: user.id,
        email: user.email,
        role: user.role_id
    }
    return jwt.sign(data, 'clave super secreta');
}

const getTokenId = (req, res) => {
    const token = req.headers['authorization'];
    try{
        let data = jwt.verify(token,'clave super secreta');
        return data.id;
    }catch (error){
        return res.status(403).json({code: "UNAUTHORIZED", message: 'Invalid token.'});
    }
}

const getTokenRole = (req, res) => {
    const token = req.headers['authorization'];
    try{
        let data = jwt.verify(token,'clave super secreta');
        return data.role;
    }catch (error){
        return res.status(403).json({code: "UNAUTHORIZED", message: 'Invalid token.'});
    }
}

module.exports = {
    createToken,
    getTokenRole,
    getTokenId
}