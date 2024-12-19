const { checkToken, checkRole } = require("../utils/UserMiddleware");
const { findById, activateTeacher, findKnowledgeBranchesByTeacherId, findAll, findStudentsByTeacherId } = require("../models/TeacherModel");
const { findById: findUserById } = require("../models/UserModel");
const TeacherInfoResponse = require("./models/TeacherInfoResponse");
const router = require('express').Router();

router.post('/:id/activate', checkToken, checkRole(1), async (req, res, next) => {
    const id = req.params.id;
    const teacher = await findById(id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${id} not found.` });
    if (teacher.active) return res.status(400).json({ code: 'BAD_REQUEST', message: `Teacher with id ${id} is already active.` });
    try {
        await activateTeacher(id);
        return res.status(200).json({ code: 'OK', message: `Teacher with id ${id} has been activated.` });
    } catch (error) {
        next(error);
    }
});

router.get('', async (req, res, next) => {
    const { latitude = null, longitude = null, range = null, branches = null, price_hour = null, average_rating = null, active = 1, page = 1, page_size = 10, sort = "id", order = "ASC" } = req.query;
    let teachers = await findAll(active, branches, price_hour, average_rating, Number(page_size), Number(page), sort, order);
    let data = await Promise.all(teachers.data.map(async (teacher) => {
        let user = await findUserById(teacher.id);
        let knowledgeBranches = await findKnowledgeBranchesByTeacherId(teacher.id);
        return new TeacherInfoResponse(user, teacher, knowledgeBranches);
    }))
    if (latitude !== null && longitude !== null && range !== null) {
        const currentLocation = { lat: latitude, lon: longitude };
        data = filterByDistance(currentLocation, data, range);
        teachers.total = data.length;
    }
    const response = {
        total: teachers.total,
        data
    }
    return res.status(200).json(response);
});

router.get('/:id/info', checkToken, async (req, res, next) => {
    const id = req.params.id;
    const teacher = await findById(id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${id} not found.` });
    const user = await findUserById(id);
    if (user === null) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: 'An error occurred while processing the request.' });
    const knowledgeBranches = await findKnowledgeBranchesByTeacherId(id);
    return res.status(200).json(new TeacherInfoResponse(user, teacher, knowledgeBranches));
});


/// Teacher: list of students he has now (table Relation)
router.get('/:id/students', checkToken, checkRole(2), async (req, res, next) => {
    const teacher_id = req.params.id;
    const teacher = await findById(teacher_id);
    if (teacher === null) return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${teacher_id} not found.` });

    const { active = 0, page = 1, page_size = 10, order = "ASC" } = req.query;
    const students = await findStudentsByTeacherId(teacher_id, Number(page_size), Number(page), order);

    if (students === null) return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: 'An error occurred while processing the request.' });
    if (students.total === 0) return res.status(200).json([`No estudents for ${teacher.name} teacher.`]);
    return res.status(200).json(students);
})


function filterByDistance(currentLocation, elements, maxDistance) {
    const R = 6371;

    function calculateDistance(lat1, lon1, lat2, lon2) {
        const toRadians = (degree) => (degree * Math.PI) / 180;

        const dLat = toRadians(lat2 - lat1);
        const dLon = toRadians(lon2 - lon1);

        const a =
            Math.sin(dLat / 2) ** 2 +
            Math.cos(toRadians(lat1)) * Math.cos(toRadians(lat2)) * Math.sin(dLon / 2) ** 2;

        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        return R * c;
    }

    return elements.filter((element) => {
        const distance = calculateDistance(
            currentLocation.lat,
            currentLocation.lon,
            element.latitude,
            element.longitude
        );
        return distance <= maxDistance;
    });
}
/**
 * Endpoint para actualizar toda la información de un profesor
 */
router.put('/:id/update', checkToken, checkRole(2), async (req, res, next) => {
    const id = req.params.id;
    const { name, last_names, phone, username, image, description, price_hour, branches } = req.body;

    try {
        // Verificar si el profesor existe
        const teacher = await findTeacherById(id);
        if (teacher === null) {
            return res.status(404).json({ code: 'NOT_FOUND', message: `Teacher with id ${id} not found.` });
        }

        // Actualizar la información del profesor en la base de datos
        const affectedRows = await updateTeacher(id, {
            name,
            last_names,
            phone,
            username,
            image,
            description,
            price_hour,
            branches
        });

        if (affectedRows === 0) {
            return res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: 'Failed to update the teacher.' });
        }

        // Obtener la información actualizada
        const updatedTeacher = await findTeacherById(id);

        // Devolver la respuesta con los datos actualizados
        return res.status(200).json({ 
            code: 'OK', 
            message: 'Teacher updated successfully.', 
            teacher: updatedTeacher 
        });
    } catch (error) {
        next(error); // Manejo de errores global
    }
});


module.exports = router;