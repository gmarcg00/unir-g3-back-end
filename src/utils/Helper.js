const jwt = require('jsonwebtoken');

const createToken = (user) => {
    const data = {
        id: user.id,
        email: user.email,
        role: user.role_id
    }
    return jwt.sign(data, 'clave super secreta');
}

module.exports = {
    createToken
}