USE hogwarts;

-- Insertar roles en la tabla roles
-------------------------------------
INSERT INTO `roles` (`name`) VALUES
('admin'),
('student'),
('teacher');


-- Insertar usuarios en la tabla users
---------------------------------------
-- Todas las Passwords encryptadas con bcrypt 8 iteraciones, con la clave super secreta: 12345678
INSERT INTO `users` (`username`, `name`, `last_names`, `phone`, `email`, `password`, `role_id`) VALUES
-- Admin
('albus.dumbledore', 'Albus', 'Dumbledore', '601123456', 'albus.dumbledore@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 1),


-- Students (2 - 7)
('harry.potter', 'Harry', 'Potter', '603123458', 'harry.potter@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('hermione.granger', 'Hermione', 'Granger', '604123459', 'hermione.granger@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('luna.lovegood', 'Luna', 'Lovegood', '607123452', 'luna.lovegood@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('ginny.weasley', 'Ginny', 'Weasley', '609123454', 'ginny.weasley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('cedric.diggory', 'Cedric', 'Diggory', '610123455', 'cedric.diggory@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('cho.chang', 'Cho', 'Chang', '611123456', 'cho.chang@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),

-- Teachers (8 - 12)
('severus.snape', 'Severus', 'Snape', '615123450', 'severus.snape@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('minerva.mcgonagall', 'Minerva', 'McGonagall', '602123457', 'minerva.mcgonagall@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('remus.lupin', 'Remus', 'Lupin', '617123452', 'remus.lupin@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('gilderoy.lockhart', 'Gilderoy', 'Lockhart', '618123453', 'gilderoy.lockhart@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('sybill.trelawney', 'Sybill', 'Trelawney', '620123455', 'sybill.trelawney@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3);

-- Insert knowledge_branches
---------------------------------------
INSERT INTO `knowledge_branches` (`name`) VALUES
('Defence Against the Dark Arts'), -- Severus Snape
('Care of Magical Creatures'),    -- Rubeus Hagrid
('Charms'),                       -- Filius Flitwick
('Herbology'),                    -- Pomona Sprout
('Potions Advanced'),-- Remus Lupin
('Divination Advanced'),-- Gilderoy Lockhart
('Dark Arts Enforcement'),        -- Dolores Umbridge
('Divination'),                   -- Sybill Trelawney
('Potions'),                      -- Horace Slughorn
('Auror Studies');                -- Alastor Moody


-- Insert teachers info 
---------------------------------------

-- Insertar Severus Snape en teachers
INSERT INTO teachers (id, description, resume, price_hour, active, address, city, postal_code)
SELECT 
    u.id, 
    'Potions Master and former Head of Slytherin House.' AS description,
    'Severus Snape is a highly skilled wizard in Potions and Occlumency. 
     He served as Potions Master at Hogwarts for years and briefly held the 
     position of Defence Against the Dark Arts professor. Despite his stern demeanor, 
     Snape was instrumental in the fight against Voldemort and a deeply complex character.' AS resume,
    95 AS price_hour,
    1 AS active,
    'Calle de Serrano, 45' AS address,
    'Madrid' AS city,
    '28001' AS postal_code
FROM 
    users u
WHERE 
    u.username = 'severus.snape';

-- Insertar Remus Lupin en teachers
INSERT INTO teachers (id, description, resume, price_hour, active, address, city, postal_code)
SELECT 
    u.id, 
    'Defence Against the Dark Arts professor and member of the Order of the Phoenix.' AS description,
    'Remus Lupin is a skilled wizard with a kind and empathetic nature. 
     Despite his condition as a werewolf, he dedicated his life to teaching and 
     fighting against the forces of darkness. His classes were practical, engaging, 
     and beloved by students.' AS resume,
    90 AS price_hour,
    1 AS active,
    'Avenida de la Constitución, 15' AS address,
    'Alcalá de Henares' AS city,
    '28801' AS postal_code
FROM 
    users u
WHERE 
    u.username = 'remus.lupin';

-- Insertar Gilderoy Lockhart en teachers
INSERT INTO teachers (id, description, resume, price_hour, active, address, city, postal_code)
SELECT 
    u.id, 
    'Famous author and former Defence Against the Dark Arts professor.' AS description,
    'Gilderoy Lockhart is a charming yet self-absorbed wizard known for his 
     books on magical creatures and encounters. Though his competence as a teacher 
     was questionable, his flamboyant personality and charisma made him a memorable figure.' AS resume,
    100 AS price_hour,
    1 AS active,
    'Calle Mayor, 12' AS address,
    'San Lorenzo de El Escorial' AS city,
    '28200' AS postal_code
FROM 
    users u
WHERE 
    u.username = 'gilderoy.lockhart';

-- Insertar Sybill Trelawney en teachers
INSERT INTO teachers (id, description, resume, price_hour, active, address, city, postal_code)
SELECT 
    u.id, 
    'Divination professor at Hogwarts.' AS description,
    'Sybill Trelawney is a seer who teaches Divination at Hogwarts. 
     Often eccentric and dramatic, she is known for her cryptic prophecies. 
     Though not always accurate, she has made a few genuine predictions 
     that were crucial to the wizarding world.' AS resume,
    65 AS price_hour,
    1 AS active,
    'Calle de la Luna, 3' AS address,
    'Aranjuez' AS city,
    '28300' AS postal_code
FROM 
    users u
WHERE 
    u.username = 'sybill.trelawney';

-- Insertar Minerva McGonagall en teachers
INSERT INTO teachers (id, description, resume, price_hour, active, address, city, postal_code)
SELECT 
    u.id, 
    'Transfiguration professor and Head of Gryffindor House.' AS description,
    'Minerva McGonagall is a strict yet fair Transfiguration teacher and Head of Gryffindor House. 
     A highly skilled witch, she is known for her sharp intellect, no-nonsense demeanor, and 
     deep dedication to her students and Hogwarts. McGonagall played a crucial role in the 
     fight against Voldemort, exemplifying courage, wisdom, and leadership.' AS resume,
    95 AS price_hour,
    1 AS active,
    'Calle de los Álamos, 8' AS address,
    'Torrelodones' AS city,
    '28250' AS postal_code
FROM 
    users u
WHERE 
    u.username = 'minerva.mcgonagall';


-- Insert relationships into the teacher_has_knowledge_branches table
-- Severus Snape: Defence Against the Dark Arts, Potions
INSERT IGNORE INTO teacher_has_knowledge_branches (teachers_id, knowledge_branches_id)
SELECT 
    u.id AS teachers_id,
    kb.id AS knowledge_branches_id
FROM 
    users u
JOIN 
    knowledge_branches kb ON kb.name IN ('Defence Against the Dark Arts', 'Potions')
WHERE 
    u.username = 'severus.snape';

-- Remus Lupin: Defence Against the Dark Arts
INSERT IGNORE INTO teacher_has_knowledge_branches (teachers_id, knowledge_branches_id)
SELECT 
    u.id AS teachers_id,
    kb.id AS knowledge_branches_id
FROM 
    users u
JOIN 
    knowledge_branches kb ON kb.name = 'Defence Against the Dark Arts'
WHERE 
    u.username = 'remus.lupin';

-- Gilderoy Lockhart: Defence Against the Dark Arts
INSERT IGNORE INTO teacher_has_knowledge_branches (teachers_id, knowledge_branches_id)
SELECT 
    u.id AS teachers_id,
    kb.id AS knowledge_branches_id
FROM 
    users u
JOIN 
    knowledge_branches kb ON kb.name = 'Defence Against the Dark Arts'
WHERE 
    u.username = 'gilderoy.lockhart';

-- Sybill Trelawney: Divination
INSERT IGNORE INTO teacher_has_knowledge_branches (teachers_id, knowledge_branches_id)
SELECT 
    u.id AS teachers_id,
    kb.id AS knowledge_branches_id
FROM 
    users u
JOIN 
    knowledge_branches kb ON kb.name = 'Divination'
WHERE 
    u.username = 'sybill.trelawney';

-- Minerva McGonagall: Charms, Herbology
INSERT IGNORE INTO teacher_has_knowledge_branches (teachers_id, knowledge_branches_id)
SELECT 
    u.id AS teachers_id,
    kb.id AS knowledge_branches_id
FROM 
    users u
JOIN 
    knowledge_branches kb ON kb.name IN ('Charms', 'Herbology')
WHERE 
    u.username = 'minerva.mcgonagall';




-- Insert records into the students table , active = 1
--------------------------------------------------------
INSERT INTO students (id, active)
SELECT 
    u.id AS student_id,
    TRUE AS active
FROM 
    users u
JOIN 
    roles r ON u.role_id = r.id
WHERE 
    r.name = 'student';


-- Insert relationships into the student_teacher_relations table
-----------------------------------------------------------------
INSERT INTO student_teacher_relations (students_id, teachers_id, knowledge_branches_id, register_data)
SELECT 
    s.id AS students_id,
    t.id AS teachers_id,
    thkb.knowledge_branches_id AS knowledge_branches_id,
    '2024-01-01' AS register_data -- Cambiar a la fecha deseada
FROM 
    students s
CROSS JOIN 
    teachers t
JOIN 
    teacher_has_knowledge_branches thkb ON t.id = thkb.teachers_id -- Filtra las materias asignadas a cada profesor
WHERE 
    s.active = TRUE;



-- -- VERIFICACION DE DATOS CREADOS : 
-- USE hogwarts;
-- -- Verificar relaciones creadas en las tablas students, teacher_has_knowledge_branches y student_teacher_relations

-- SELECT 
--     CONCAT(su.name, ' ', su.last_names) AS student_name,
--     CONCAT(tu.name, ' ', tu.last_names) AS teacher_name,
--     kb.name AS knowledge_branch,
--     DATE_FORMAT(str.register_data, '%Y-%m-%d') AS register_date
-- FROM
--     student_teacher_relations str
--         JOIN
--     students s ON str.students_id = s.id
--         JOIN
--     users su ON s.id = su.id
--         JOIN
--     teacher_has_knowledge_branches thkb ON str.teachers_id = thkb.teachers_id
--         AND str.knowledge_branches_id = thkb.knowledge_branches_id
--         JOIN
--     users tu ON thkb.teachers_id = tu.id
--         JOIN
--     knowledge_branches kb ON thkb.knowledge_branches_id = kb.id
-- WHERE
--     s.active = TRUE
-- ORDER BY teacher_name , student_name , knowledge_branch;



-----------------------------------------------------------------------------
-- VERIFICACION DE DATOS PRUEBA:
-----------------------------------------------------------------------------
-- -- Verificar datos tabla students ----------------------------------------
-- SELECT 
--     CONCAT(u.name, ' ', u.last_names) AS student_name,
--     u.username AS student_username,
--     u.email AS student_email,
--     s.active AS is_active
-- FROM 
--     students s
-- JOIN 
--     users u ON s.id = u.id
-- ORDER BY 
--     student_name;


-- -- Verificar datos tabla teacher_has_knowledge_branches --------------------
-------------------------------------------------------------------------------
-- SELECT 
--     CONCAT(u.name, ' ', u.last_names) AS teacher_name,
--     u.username AS teacher_username,
--     kb.name AS knowledge_branch
-- FROM 
--     teacher_has_knowledge_branches thkb
-- JOIN 
--     users u ON thkb.teachers_id = u.id
-- JOIN 
--     knowledge_branches kb ON thkb.knowledge_branches_id = kb.id
-- ORDER BY 
--     teacher_name, knowledge_branch;

