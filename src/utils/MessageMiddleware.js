
const checkGetMessagesParams = (req, res, next) => {
    const {chat_id} = req.params;

    if (!chat_id) {
        return res.status(400).json({
            code: 'BAD_REQUEST',
            message: 'The request params must contain the field CHAT_ID'
        });
    }
    next();
}

module.exports = {
    checkGetMessagesParams
}