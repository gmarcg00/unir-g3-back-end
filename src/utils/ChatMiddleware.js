const checkMessagePayload= async (req, res, next) => {
    const {message} = req.body;
    
    if ( !message ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the field MESSAGE'
        });
    }
    next();
}

module.exports = {
    checkMessagePayload
};