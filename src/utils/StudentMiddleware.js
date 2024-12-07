
const checkStudentRatesTeacherPayload= async (req, res, next) => {
    const {rating, text_rating} = req.body;
    //const student_id = req.params.student_id;
    //const teacher_id = req.params.teacher_id;

    //if (!student_id || !teacher_id || !rating || !text_rating ) {
        if ( !rating || !text_rating ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            //message: 'The request params must contain the fields student_id and teacher_id, and the request body must contain the fields: rating and text_rating'
            message: 'The request body must contain the fields: rating and text_rating'
        });
    }
    next();
}

module.exports = {
    checkStudentRatesTeacherPayload
};