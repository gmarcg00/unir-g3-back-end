const router = require('express').Router();
const {findAll} = require("../models/KnowledgeBranchModel");

router.get('', async (req,res,next) => {
    const knowledgeBranches = await findAll();
    const total = knowledgeBranches.length;
    return res.status(200).json({total, data: knowledgeBranches});
});


module.exports = router;