const {checkToken, checkRole, checkUserId} = require("../utils/UserMiddleware");
const {findById} = require("../models/AdminModel");
const AdminInfoResponse = require("./models/AdminInfoResponse");

const router = require('express').Router();


router.get('/:id/info',checkToken,checkRole(1),checkUserId, async (req,res,next) => {
    const id = req.params.id;
    const user = await findById(id);
    if(user === null) return res.status(404).json({code: 'NOT_FOUND', message: `Admin with id ${id} not found.`});
    return res.status(200).json(new AdminInfoResponse(user));
});

module.exports = router;