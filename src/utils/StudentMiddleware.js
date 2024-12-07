
const checkStudentRatesTeacherPayload= async (req, res, next) => {
    const {rating, text_rating} = req.body;
    
    if ( !rating || !text_rating ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the fields: rating and text_rating'
        });
    }
    next();
}

module.exports = {
    checkStudentRatesTeacherPayload
};