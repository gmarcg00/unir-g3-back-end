
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


const checkLinkTeacherPayload = async (req, res, next) => {
    const {teacher_id, knowledge_branch_id} = req.body;
    
    if ( !teacher_id || !knowledge_branch_id ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the fields TEACHER_ID and KNOWLEDGE_BRANCH_ID'
        });
    }
    next();
}


module.exports = {
    checkStudentRatesTeacherPayload, checkLinkTeacherPayload
};