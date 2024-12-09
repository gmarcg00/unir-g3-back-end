class ChatResponse {
    constructor(chat){
        this.id = chat.id;
        this.user = {
            id: chat.user_id,
            name: chat.name,
            last_names: chat.last_names,
            image: chat.image
        }
    }
}

module.exports = ChatResponse;