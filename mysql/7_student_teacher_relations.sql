USE `magic_teachers_db`;

INSERT INTO `student_teacher_relations` (`students_id`, `teachers_id`, `knowledge_branches_id`, `register_data`) 
SELECT s.id, thkb.teachers_id, thkb.knowledge_branches_id, DATE_SUB(CURDATE(),INTERVAL 1 MONTH) 
FROM `students` s 
JOIN `teachers_has_knowledge_branches` thkb ON thkb.teachers_id IN (SELECT id FROM `users` WHERE username IN ('severus.snape', 'minerva.mcgonagall'))
JOIN `knowledge_branches` kb ON kb.id = thkb.knowledge_branches_id
WHERE s.id = (SELECT id FROM `users` WHERE username = 'harry.potter');
