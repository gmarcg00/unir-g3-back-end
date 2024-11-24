-- NO USAR ESTE FICHERO, SOLO PARA CONSULTAS, USAR db_insert_test_data.sql 

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
-- Admin (1)
('albus.dumbledore', 'Albus', 'Dumbledore', '601123456', 'albus.dumbledore@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 1),

-- Students (2 - 7)
('harry.potter', 'Harry', 'Potter', '603123458', 'harry.potter@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('hermione.granger', 'Hermione', 'Granger', '604123459', 'hermione.granger@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('luna.lovegood', 'Luna', 'Lovegood', '607123452', 'luna.lovegood@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('ginny.weasley', 'Ginny', 'Weasley', '609123454', 'ginny.weasley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('cedric.diggory', 'Cedric', 'Diggory', '610123455', 'cedric.diggory@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('cho.chang', 'Cho', 'Chang', '611123456', 'cho.chang@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2);


-- Teachers (8 - 12)
('severus.snape', 'Severus', 'Snape', '615123450', 'severus.snape@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('minerva.mcgonagall', 'Minerva', 'McGonagall', '602123457', 'minerva.mcgonagall@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3);
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
('Defence Against the Dark Arts'),-- Remus Lupin
('Dark Arts Enforcement'),        -- Gilderoy Lockhart
('Divination'),                   -- Sybill Trelawney
('Potions'),                      -- Horace Slughorn
('Auror Studies');                -- Alastor Moody


-- Insert teachers info 
---------------------------------------

--- Insert Severus Snape into teachers
SELECT id, 
    'Potions Master and former Head of Slytherin House.',
    'Severus Snape is a highly skilled wizard in Potions and Occlumency. 
     He served as Potions Master at Hogwarts for years and briefly held the 
     position of Defence Against the Dark Arts professor. Despite his stern demeanor, 
     Snape was instrumental in the fight against Voldemort and a deeply complex character.',
    95,
    1,
    'Calle de Serrano, 45',
    'Madrid',
    '28001'
FROM users
WHERE username = 'severus.snape';

-- Insert Remus Lupin into teachers
SELECT id, 
    'Defence Against the Dark Arts professor and member of the Order of the Phoenix.',
    'Remus Lupin is a skilled wizard with a kind and empathetic nature. 
     Despite his condition as a werewolf, he dedicated his life to teaching and 
     fighting against the forces of darkness. His classes were practical, engaging, 
     and beloved by students.',
    90,
    1,
    'Avenida de la Constitución, 15',
    'Alcalá de Henares',
    '28801'
FROM users
WHERE username = 'remus.lupin';

-- Insert Gilderoy Lockhart into teachers
SELECT id, 
    'Famous author and former Defence Against the Dark Arts professor.',
    'Gilderoy Lockhart is a charming yet self-absorbed wizard known for his 
     books on magical creatures and encounters. Though his competence as a teacher 
     was questionable, his flamboyant personality and charisma made him a memorable figure.',
    100,
    1,
    'Calle Mayor, 12',
    'San Lorenzo de El Escorial',
    '28200'
FROM users
WHERE username = 'gilderoy.lockhart';

-- Insert Sybill Trelawney into teachers
SELECT id, 
    'Divination professor at Hogwarts.',
    'Sybill Trelawney is a seer who teaches Divination at Hogwarts. 
     Often eccentric and dramatic, she is known for her cryptic prophecies. 
     Though not always accurate, she has made a few genuine predictions 
     that were crucial to the wizarding world.',
    65,
    1,
    'Calle de la Luna, 3',
    'Aranjuez',
    '28300'
FROM users
WHERE username = 'sybill.trelawney';

-- Insert Minerva McGonagall into teachers
SELECT id, 
    'Transfiguration professor and Head of Gryffindor House.',
    'Minerva McGonagall is a strict yet fair Transfiguration teacher and Head of Gryffindor House. 
     A highly skilled witch, she is known for her sharp intellect, no-nonsense demeanor, and 
     deep dedication to her students and Hogwarts. McGonagall played a crucial role in the 
     fight against Voldemort, exemplifying courage, wisdom, and leadership.',
    95,
    1,
    'Calle de los Álamos, 8',
    'Torrelodones',
    '28250'
FROM users
WHERE username = 'minerva.mcgonagall';

-- Insert relationships into the teachers_has_knowledge_branches table
INSERT INTO `teachers_has_knowledge_branches` (`teachers_id`, `knowledge_branches_id`) VALUES
-- Severus Snape teaches Defence Against the Dark Arts and Potions ...
 (8,1),
 (8,9),
-- Remus Lupin teaches ...
 (9,1),
 (9,2),
 (9,3),
-- Gilderoy Lockhart teaches ...
 (10,4),
-- Sybill Trelawney teaches ...
 (11,5),
-- Minerva McGonagall teaches ...
 (12,6),
 (12,7),
 (12,8);


-- Insert records into the students table
--------------------------------------------------------
INSERT INTO `students` (`id`, `active`) 
SELECT id, 1
FROM `users`
WHERE id IN (
    SELECT id 
    FROM `users`
    WHERE username IN (
        'harry.potter',
        'hermione.granger',
        'luna.lovegood',
        'ginny.weasley',
        'cedric.diggory',
        'cho.chang'
    )
);

-- Insert relationships into the student_teacher_relations table
-----------------------------------------------------------------
INSERT INTO `student_teacher_relations` (`students_id`, `teachers_id`, `knowledge_branches_id`, `register_data`) 
SELECT s.id, thkb.teachers_id, thkb.knowledge_branches_id, DATE_SUB(CURDATE(),INTERVAL 1 MONTH) 
FROM `students` s 
JOIN `teachers_has_knowledge_branches` thkb ON thkb.teachers_id IN (SELECT id FROM `users` WHERE username IN ('severus.snape', 'minerva.mcgonagall'))
JOIN `knowledge_branches` kb ON kb.id = thkb.knowledge_branches_id
WHERE s.id = (SELECT id FROM `users` WHERE username = 'harry.potter');