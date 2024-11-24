USE hogwarts;
SELECT 
    CONCAT(u.name, ' ', u.last_names) AS teacher_name,
    kb.name AS knowledge_branch
FROM 
    teacher_has_knowledge_branches thkb
JOIN 
    users u ON thkb.teachers_id = u.id
JOIN 
    knowledge_branches kb ON thkb.knowledge_branches_id = kb.id
ORDER BY 
    teacher_name, knowledge_branch;
    


