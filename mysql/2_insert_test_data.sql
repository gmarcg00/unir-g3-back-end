USE `magic_teachers_db`;

-- Insertar roles en la tabla roles
-------------------------------------
INSERT INTO `roles` (`name`) VALUES
('admin'),
('student'),
('teacher');


-- Insertar usuarios en la tabla users
---------------------------------------
-- Todas las Passwords encryptadas con bcrypt 8 iteraciones, con la clave super secreta: 12345678
INSERT INTO `users` (`username`, `name`, `last_names`, `phone`, `email`, `password`, `roles_id`) VALUES
-- Admin
('albus.dumbledore', 'Albus', 'Dumbledore', '601123456', 'albus.dumbledore@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 1),

-- Students
('harry.potter', 'Harry', 'Potter', '603123458', 'harry.potter@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),
('hermione.granger', 'Hermione', 'Granger', '604123459', 'hermione.granger@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),

-- Teachers
('severus.snape', 'Severus', 'Snape', '615123450', 'severus.snape@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('minerva.mcgonagall', 'Minerva', 'McGonagall', '602123457', 'minerva.mcgonagall@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3);

-- Insert knowledge_branches
---------------------------------------
INSERT INTO `knowledge_branches` (`name`) VALUES
('Defence Against the Dark Arts'), -- Severus Snape
('Care of Magical Creatures'),    -- Rubeus Hagrid
('Charms'),                       -- Filius Flitwick
('Herbology'),                    -- Pomona Sprout
('Defence Against the Dark Arts'),-- Remus Lupin
('Defence Against the Dark Arts'),-- Gilderoy Lockhart
('Dark Arts Enforcement'),        -- Dolores Umbridge
('Divination'),                   -- Sybill Trelawney
('Potions'),                      -- Horace Slughorn
('Auror Studies');                -- Alastor Moody


-- Insert teachers info 
---------------------------------------

-- Insert Severus Snape into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code` )
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

-- Insert Minerva McGonagall into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code` )
SELECT id, 
    'Transfiguration professor and Head of Gryffindor House.',
    'Minerva McGonagall is a strict yet fair Transfiguration teacher and Head of Gryffindor House. 
     A highly skilled witch, she is known for her sharp intellect, no-nonsense demeanor, and 
     deep dedication to her students and Hogwarts. McGonagall played a crucial role in the 
     fight against Voldemort, exemplifying courage, wisdom, and leadership.',
    95,
    1,
    'Calle Mayor, 5',
    'Alcala de Henares',
    '28001'
FROM users
WHERE username = 'minerva.mcgonagall';

-- Insert relationships into the teachers_has_knowledge_branches table
INSERT INTO `teachers_has_knowledge_branches` (`teachers_id`, `knowledge_branches_id`) VALUES
-- Severus Snape teaches Defence Against the Dark Arts and Potions ...
 (4,1),
 (4,9),
-- Minerva McGonagall teaches ...
 (5,6),
 (5,7),
 (5,8);


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
        'hermione.granger'
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