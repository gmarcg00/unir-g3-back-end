class MessageResponse {
    constructor (message) {
        this.id = message.id;
        this.chat_id = message.chat_id;
        this.sender_id = message.sender_id;
        this.content = message.message;
        this.sended_at = message.moment;
    }
}

module.exports = MessageResponse;