const checkMessagePayload = async (req, res, next) => {
    const {message, sender_id} = req.body;
    
    if ( !message || !sender_id) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the fields SENDER_ID and MESSAGE'
        });
    }
    next();
};

const checkCreateChatPayload = async (req, res, next) => {
    const {student_id, teacher_id} = req.body;
        
    if ( !student_id || !teacher_id ) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the field STUDENT_ID and TEACHER_ID'
        });
    }
    next();
}



module.exports = {
    checkMessagePayload, checkCreateChatPayload
};