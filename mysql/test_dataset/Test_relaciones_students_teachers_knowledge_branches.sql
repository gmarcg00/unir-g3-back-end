-- Verificar relaciones creadas en las tablas students, teacher_has_knowledge_branches y student_teacher_relations

SELECT 
    CONCAT(su.name, ' ', su.last_names) AS student_name,
    CONCAT(tu.name, ' ', tu.last_names) AS teacher_name,
    kb.name AS knowledge_branch,
    DATE_FORMAT(str.register_data, '%Y-%m-%d') AS register_date
FROM
    student_teacher_relations str
        JOIN
    students s ON str.students_id = s.id
        JOIN
    users su ON s.id = su.id
        JOIN
    teacher_has_knowledge_branches thkb ON str.teachers_id = thkb.teachers_id
        AND str.knowledge_branches_id = thkb.knowledge_branches_id
        JOIN
    users tu ON thkb.teachers_id = tu.id
        JOIN
    knowledge_branches kb ON thkb.knowledge_branches_id = kb.id
WHERE
    s.active = TRUE
ORDER BY teacher_name , student_name , knowledge_branch;
