
const router = require('express').Router();
const {findById} = require("../models/StudentModel");
const {findById: findUserById} = require("../models/UserModel");
const {checkToken} = require("../utils/UserMiddleware");
const StudentInfoResponse = require("./models/StudentInfoResponse");

router.get('/:id/info',checkToken, async (req, res,next) => {
    const id = req.params.id;
    const student = await findById(id);
    if(student === null) return res.status(404).json({code: 'NOT_FOUND', message: `Student with id ${id} not found.`});
    const user = await findUserById(id);
    if(user === null) return res.status(500).json({code: 'INTERNAL_SERVER_ERROR', message: 'An error occurred while processing the request.'});
    return res.status(200).json(new StudentInfoResponse(user,student));
});




module.exports = router;