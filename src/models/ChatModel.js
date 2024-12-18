const pool = require("../config/db");

async function createChat(student_id, teacher_id) {
    const [result] = await pool.query(
        'INSERT INTO chats (student_id, teacher_id) values (?,?)',
        [student_id, teacher_id]);
    return result.insertId;
    };

    async function checkChatExists(student_id, teacher_id) {
        const [result] = await pool.query(
            'SELECT id FROM chats WHERE student_id = ? and teacher_id = ?',
            [student_id, teacher_id]);
        if ( result.length === 1 ){
            return true;
        } else {
            return false;
        }
    };    

    async function postMessage(chat_id, sender_id, message) {
        const [result] = await pool.query(
            'INSERT INTO chat_messages (chat_id, sender_id, message) values (?,?,?)',
            [chat_id, sender_id, message]);
        return result.insertId;
        };

async function checkChatExistsById(id_chat){
    const [result] = await pool.query(
        `SELECT id FROM chats where id = ?`, 
        [id_chat]);
    if ( result.length === 0 ){
        return false;
    } else {
        return true;
    }
} 

async function checkParticipantInChat(user_id, chat_id){
    const [result] = await pool.query(
        `SELECT id FROM chats where student_id = ? or teacher_id = ? and id = ?`, 
        [user_id, user_id, chat_id]);
    if ( result.length === 0 ){
        return false;
    } else {
        return true;
    }
}

async function getChatsFromTeacher(teacher_id){
    const [result] = await pool.query(
        `select chats.id, users.name, users.image
            from chats inner join users on users.id = chats.student_id
            where teacher_id = ?`,
        [teacher_id]
    );
    return result;
}

async function getChatsFromStudent(student_id){
    const [result] = await pool.query(
        `select chats.id as id, users.id as user_id, users.name, users.last_names, users.image
            from chats inner join users on users.id = chats.teacher_id
            where student_id = ?`,
        [student_id]
    );
    return result;
}

async function getMessagesFromChat(chat_id){
    const [result] = await pool.query(
        `select message.id, message.chat_id, message.sender_id, message.moment, message.message
            from chat_messages as message where message.chat_id = ?
            order by moment asc`,
        [chat_id]
    );
    return result;
}

module.exports = {
    createChat, postMessage, checkChatExists, getMessagesFromChat, checkParticipantInChat, getChatsFromStudent, getChatsFromTeacher,checkChatExistsById
}