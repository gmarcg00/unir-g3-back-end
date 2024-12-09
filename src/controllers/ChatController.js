const router = require('express').Router();
const { checkToken } = require("../utils/UserMiddleware");
const { getTokenRole, getTokenId } = require("../utils/Helper");
const { findById: findStudentById } = require("../models/StudentModel");
const { findTeacherById } = require("../models/TeacherModel");
const { checkCreateChatPayload, checkChatPermissions} = require("../utils/ChatMiddleware");
const { createChat, checkChatExists, getChatsFromTeacher, getChatsFromStudent } = require("../models/ChatModel");
const ChatResponse = require("./models/ChatResponse");


/**
 * Endpoint para crear un chat
 */
router.post('', checkToken, checkChatPermissions, checkCreateChatPayload, async (req, res, next) => {
    const { student_id, teacher_id } = req.body;

    const student = await findStudentById(student_id);
    if (student === null) return res.status(400).json({ code: 'BAD_REQUEST', message: `Student with id ${student_id} not found.` });
    
    const teacher = await findTeacherById(teacher_id);
    if (teacher === null) return res.status(400).json({ code: 'BAD_REQUEST', message: `Teacher with id ${teacher_id} not found.` });

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


/**
 * Endpoint para recuperar el listado de chats de un usuario
 */
router.get('/', checkToken,checkChatPermissions, async (req, res, next) => {

    const requestRole = getTokenRole(req, res);
    const requestId   = getTokenId(req, res);

    let results = [];

    if (requestRole === 2) results = await getChatsFromTeacher(requestId);
    if (requestRole === 3) results = await getChatsFromStudent(requestId);

    results = results.map((chat) => new ChatResponse(chat));
    return res.status(200).json({data: results});
});

module.exports = router;