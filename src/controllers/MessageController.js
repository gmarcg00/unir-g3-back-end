const {checkToken} = require("../utils/UserMiddleware");
const {checkMessagePayload, checkChatPermissions} = require("../utils/ChatMiddleware");
const {checkParticipantInChat, postMessage, getMessagesFromChat, checkChatExistsById} = require("../models/ChatModel");
const {getTokenId} = require("../utils/Helper");
const MessageResponse = require("./models/MessageResponse");
const router = require('express').Router();


/**
 * Endpoint para crear un mensaje en un chat
 */
router.post('', checkToken, checkMessagePayload, async (req, res, next) => {
    const {chat_id, message, sender_id} = req.body;

    const chatExists = await checkChatExistsById(chat_id);
    if ( chatExists === false ) return res.status(400).json({ code: 'BAD_REQUEST', message: `Chat with ID ${chat_id} doesn't exist.`});

    const SenderInChat = await checkParticipantInChat(sender_id, chat_id);
    if (SenderInChat === false) return res.status(400).json({ code: 'BAD_REQUEST', message: `User with ID ${sender_id} doesn't take part in chat ${chat_id}`});

    const messagePosted = await postMessage(chat_id, sender_id, message);
    if (!messagePosted) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message:'The message has not been posted'});

    return res.status(201).json({message:'The message has been posted.'});
});


/**
 * Endpoint para obtener los mensajes de un chat
 */
router.get('', checkToken, checkChatPermissions, async (req, res, next) => {

    const {chat_id} = req.query;

    const requestId   = getTokenId(req, res);
    const isInChat = await checkParticipantInChat(requestId,chat_id);

    if (isInChat){
        let result = await getMessagesFromChat(chat_id);
        result = result.map((message) => new MessageResponse(message));
        return res.status(200).json({data: result});
    } else {
        return res.status(403).json({code:'FORBIDDEN', message:`The requester doesn't participate in this chat`});
    }

});


module.exports = router;