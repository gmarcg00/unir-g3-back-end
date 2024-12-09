const router = require('express').Router();
const { checkToken } = require("../utils/UserMiddleware");
const { getTokenRole, getTokenId } = require("../utils/Helper");
const { findById: findStudentById } = require("../models/StudentModel");
const { findTeacherById } = require("../models/TeacherModel");
const { checkMessagePayload, checkCreateChatPayload } = require("../utils/ChatMiddleware");
const { createChat, getMessagesFromChat, postMessage, checkChatExists, checkParticipantInChat, getChatsFromTeacher, getChatsFromStudent } = require("../models/ChatModel");

// crear chat
router.post('/create', checkToken, checkCreateChatPayload, async (req, res, next) => {
    const { student_id, teacher_id } = req.body;
    //const teacher_id = req.body.teacher_id;
    
    const requestRole = getTokenRole(req, res);
    if ( requestRole != 2 && requestRole != 3 ) return res.status(401).json({ code: 'NOT_AUTHORIZED', message: `Admins can't create chats` });

    const requestId   = getTokenId(req, res);
    if ( requestId != student_id && requestId != teacher_id ) return res.status(403).json({ code: 'FORBIDDEN', message: `Only participants can create chats` });

    const student = await findStudentById(student_id);
    if (student === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Student with id ${student_id} not found.` });
    
    const teacher = await findTeacherById(teacher_id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} not found.` });
try{
    const chatExists = await checkChatExists(student_id, teacher_id);
    if ( chatExists ) return res.status(400).json({message:'A chat with these participants already exist'});

    const insertId = await createChat(student_id, teacher_id)
    if ( insertId === null ) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: 'An error occurred while processing the request.' });

    return res.status(201).json({message:`CHAT Created with ID: ${ insertId }`});
} catch (error){
    next(error);
}
});

router.post('/post-message/:chat_id/', checkToken, checkMessagePayload, async (req, res, next) => {
    const chat_id = req.params.chat_id;
    const { message, sender_id} = req.body;
    
    const chatExists = await checkChatExists(chat_id);
    if ( chatExists === false ) return res.status(404).json({ code: 'NOT_FOUND', message: `Chat with ID ${chat_id} doesn't exist.` });
    
    const SenderInChat = await checkParticipantInChat(sender_id, chat_id);
    if (SenderInChat === false) return res.status(403).json({ code: 'FORBIDDEN', message: `User with ID ${sender_id} doesn't take part in chat ${chat_id}` });

    const messagePosted = await postMessage(chat_id, sender_id, message);
    if (!messagePosted) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message:'The message has not been posted'});

    return res.status(200).json({message:'The message has been posted.'});

});

router.get('/', checkToken, async (req, res, next) => {

    const requestRole = getTokenRole(req, res);
    const requestId   = getTokenId(req, res);

    console.log(`User: ${requestId}`)
    console.log(`Role: ${requestRole}`)

    if ( requestRole === 1 )  return res.status(404).json({ code: 'NOT_FOUND', message: `Admins doesn't have chats` });

    if ( requestRole === 2 ) {
        console.log('Teacher')
        const resultTeacher = await getChatsFromTeacher(requestId);
        return res.status(200).json(resultTeacher);
    } else {
        console.log('Student')
        const resultStudent = await getChatsFromStudent(requestId);
        return res.status(200).json(resultStudent);
    }

});

router.get('/:chat_id/chat-messages', checkToken, async (req, res, next) => {

    const chat_id = req.params.chat_id;

    const requestId   = getTokenId(req, res);
    const ParticipantInChat = await checkParticipantInChat(requestId,chat_id);
    if (ParticipantInChat){
        const result = await getMessagesFromChat(chat_id);
        return res.status(200).json(result);
    } else {
        return res.status(401).json({code:'NOT_AUTHORIZED', message:`The requester doesn't participate in this chat`});
    }

});

module.exports = router;