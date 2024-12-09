const {getTokenRole} = require("./Helper");

const checkMessagePayload = async (req, res, next) => {
    const {chat_id,message, sender_id} = req.body;
    
    if (!chat_id || !message || !sender_id) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request body must contain the fields CHAT_ID SENDER_ID and MESSAGE'
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

const checkChatPermissions = (req, res, next) => {
    const requestRole = getTokenRole(req, res);
    if ( requestRole !== 2 && requestRole !== 3 ) return res.status(403).json({ code: 'FORBIDDEN', message: `Admins can't create chats` });
    next();
}



module.exports = {
    checkMessagePayload, checkCreateChatPayload,checkChatPermissions
};