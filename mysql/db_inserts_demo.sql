USE hogwarts;

-- Insertar roles en la tabla roles
-------------------------------------
INSERT INTO `roles` (`name`) VALUES
('admin'),
('teacher'),
('student');

-- Insertar usuarios ADMIN y ALUMNOS en la tabla users
---------------------------------------
-- Todas las Passwords encryptadas con bcrypt 8 iteraciones, con la clave super secreta: 12345678
INSERT INTO `users` (`username`, `name`, `last_names`, `phone`, `email`, `password`, `role_id`) VALUES
-- Admin (id 1)
('albus.dumbledore', 'Albus', 'Dumbledore', '601123456', 'albus.dumbledore@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 1),


-- Students (2 - 25)
('harry.potter', 'Harry', 'Potter', '603123458', 'harry.potter@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('hermione.granger', 'Hermione', 'Granger', '604123459', 'hermione.granger@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('luna.lovegood', 'Luna', 'Lovegood', '607123452', 'luna.lovegood@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('ginny.weasley', 'Ginny', 'Weasley', '609123454', 'ginny.weasley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('cedric.diggory', 'Cedric', 'Diggory', '610123455', 'cedric.diggory@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('cho.chang', 'Cho', 'Chang', '611123456', 'cho.chang@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('ron.weasley', 'Ron', 'Weasley', '603123460', 'ron.weasley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3), 
('draco.malfoy', 'Draco', 'Malfoy', '603123461', 'draco.malfoy@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('neville.longbottom', 'Neville', 'Longbottom', '603123464', 'neville.longbottom@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('seamus.finnigan', 'Seamus', 'Finnigan', '603123467', 'seamus.finnigan@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('dean.thomas', 'Dean', 'Thomas', '603123468', 'dean.thomas@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('parvati.patil', 'Parvati', 'Patil', '603123469', 'parvati.patil@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('padma.patil', 'Padma', 'Patil', '603123470', 'padma.patil@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('fred.weasley', 'Fred', 'Weasley', '603123471', 'fred.weasley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('george.weasley', 'George', 'Weasley', '603123472', 'george.weasley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('percy.weasley', 'Percy', 'Weasley', '603123473', 'percy.weasley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('oliver.wood', 'Oliver', 'Wood', '603123474', 'oliver.wood@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('angelina.johnson', 'Angelina', 'Johnson', '603123475', 'angelina.johnson@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('katie.bell', 'Katie', 'Bell', '603123476', 'katie.bell@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('colin.creevey', 'Colin', 'Creevey', '603123482', 'colin.creevey@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('dennis.creevey', 'Dennis', 'Creevey', '603123483', 'dennis.creevey@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('lavender.brown', 'Lavender', 'Brown', '603123484', 'lavender.brown@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('ernie.macmillan', 'Ernie', 'Macmillan', '603123485', 'ernie.macmillan@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('justin.finchfletchley', 'Justin', 'Finch-Fletchley', '603123486', 'justin.finchfletchley@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3);


-- Insertar usuarios TEACHERS en la tabla users
INSERT INTO `users` (`username`, `name`, `last_names`, `phone`, `email`, `password`, `role_id`, `latitude`,`longitude`) VALUES
('severus.snape', 'Severus', 'Snape', '615123450', 'severus.snape@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.9147 ,-5.4911),
('minerva.mcgonagall', 'Minerva', 'McGonagall', '602123457', 'minerva.mcgonagall@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.4557, -6.1503),
('remus.lupin', 'Remus', 'Lupin', '617123452', 'remus.lupin@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.5462, -6.5987),
('gilderoy.lockhart', 'Gilderoy', 'Lockhart', '618123453', 'gilderoy.lockhart@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.4584, -6.0585),
('sybill.trelawney', 'Sybill', 'Trelawney', '620123455', 'sybill.trelawney@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.5995, -5.5662),
('pomona.sprout', 'Pomona', 'Sprout', '615123453', 'pomona.sprout@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,43.1815, -4.8195),
('filius.flitwick', 'Filius', 'Flitwick', '615123454', 'filius.flitwick@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.6082, -6.8135),
('rubeus.hagrid', 'Rubeus', 'Hagrid', '615123455', 'rubeus.hagrid@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.0989, -6.6978),
('rolanda.hooch', 'Rolanda', 'Hooch', '615123458', 'rolanda.hooch@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.4663, -6.6667),
('quirinus.quirrell', 'Quirinus', 'Quirrell', '615123460', 'quirinus.quirrell@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.9734, -5.0112),
('aurora.sinistra', 'Aurora', 'Sinistra', '615123461', 'aurora.sinistra@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.8479, -5.4941),
('charity.burbage', 'Charity', 'Burbage', '615123462', 'charity.burbage@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.4593, -6.7702),
('horace.slughorn', 'Horace', 'Slughorn', '615123463', 'horace.slughorn@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.5461, -6.5984),
('alastor.moody', 'Alastor', 'Moody', '615123464', 'alastor.moody@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.6857, -6.9784),
('bathsheba.babbling', 'Bathsheba', 'Babbling', '615123465', 'bathsheba.babbling@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2,42.3048, -5.7525);


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

-- Insert teachers info 
---------------------------------------

-- Insertar Severus Snape en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Potions Master and former Head of Slytherin House.Severus Snape is a highly skilled wizard in Potions and Occlumency. 
     He served as Potions Master at Hogwarts for years and briefly held the position of Defence Against the Dark Arts professor. 
	' AS description,
    1 AS active,
    95 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'severus.snape';

-- Insertar Minerva McGonagall en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Transfiguration Professor and Head of Gryffindor House. Minerva McGonagall is a skilled witch with expertise in Transfiguration. She served as the Deputy Headmistress and was a key figure in the fight against dark forces during the Second Wizarding War.' AS description,
    1 AS active,
    90 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'minerva.mcgonagall';

-- Insertar Remus Lupin en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Defence Against the Dark Arts Professor. Remus Lupin was a skilled and empathetic wizard, known for his expertise in Defense Against the Dark Arts and for being a werewolf. He was beloved by students for his gentle nature and ability to teach difficult subjects.' AS description,
    1 AS active,
    70 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'remus.lupin';

-- Insertar Gilderoy Lockhart en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Former Defence Against the Dark Arts Professor. Gilderoy Lockhart was a charismatic but incompetent wizard, known more for his fame and self-promotion than for actual magical skill. He wrote several books about his supposed adventures.' AS description,
    1 AS active,
    50 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'gilderoy.lockhart';

-- Insertar Sybill Trelawney en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Divination Professor. Sybill Trelawney is known for her eccentric personality and her occasional prophetic abilities. She taught at Hogwarts for many years, often predicting doom and gloom.' AS description,
    1 AS active,
    60 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'sybill.trelawney';

-- Insertar Pomona Sprout en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Herbology Professor and Head of Hufflepuff House. Pomona Sprout is a highly skilled witch with extensive knowledge of magical plants and herbology. She was also known for her nurturing approach to students.' AS description,
    1 AS active,
    90 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'pomona.sprout';

-- Insertar Filius Flitwick en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Charms Professor and Head of Ravenclaw House. Filius Flitwick is a short but extremely skilled wizard, known for his expertise in Charms. He has a kind and encouraging personality.' AS description,
    1 AS active,
    90 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'filius.flitwick';

-- Insertar Rubeus Hagrid en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Care of Magical Creatures Professor and Keeper of Keys and Grounds. Rubeus Hagrid is a giant of a man, both in stature and heart. He has a deep love for magical creatures and is known for his caring and down-to-earth nature.' AS description,
    1 AS active,
    70 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'rubeus.hagrid';

-- Insertar Rolanda Hooch en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Flying Instructor and Quidditch Referee. Rolanda Hooch is known for her no-nonsense attitude, her expertise in flying, and for being a skilled Quidditch referee.' AS description,
    1 AS active,
    60 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'rolanda.hooch';

-- Insertar Quirinus Quirrell en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Defence Against the Dark Arts Professor (First Year). Quirinus Quirrell was a timid but well-meaning teacher, who was later revealed to be under the control of Lord Voldemort.' AS description,
    1 AS active,
    50 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'quirinus.quirrell';

-- Insertar Aurora Sinistra en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Astronomy Professor. Aurora Sinistra teaches the study of stars and planets at Hogwarts. She is known for her quiet and mysterious nature.' AS description,
    1 AS active,
    60 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'aurora.sinistra';

-- Insertar Charity Burbage en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Muggle Studies Professor. Charity Burbage was a kind and passionate professor who taught about Muggle culture and society. She was tragically killed by Voldemort during the Second Wizarding War.' AS description,
    1 AS active,
    70 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'charity.burbage';

-- Insertar Horace Slughorn en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Potions Professor. Horace Slughorn is a brilliant but self-serving potions master, known for his "Slug Club" and his connections with talented students.' AS description,
    1 AS active,
    90 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'horace.slughorn';

-- Insertar Alastor Moody en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Defence Against the Dark Arts Professor (Fourth Year). Alastor "Mad-Eye" Moody is a former Auror with a reputation for being paranoid but incredibly skilled in defending against dark magic.' AS description,
    1 AS active,
    80 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'alastor.moody';

-- Insertar Bathsheba Babbling en teachers
INSERT INTO teachers (id, description, active, price_hour)
SELECT 
    u.id, 
    'Muggle Studies Professor. Bathsheba Babbling taught the study of Muggle culture, though not much is known about her as she was not involved in many major events at Hogwarts.' AS description,
    1 AS active,
    50 AS price_hour
FROM 
    users u
WHERE 
    u.username = 'bathsheba.babbling';

-- INSERT Teachers knowledge Branches
INSERT INTO teacher_has_knowledge_branches (teachers_id, knowledge_branches_id)
VALUES (26,1),
	(26,7),
	(27,3),
	(27,4),
	(27,9),
	(28,10),
	(29,8),
	(30,6),
	(31,10),
	(32,5),
	(33,2),
	(34,4),
	(35,3),
	(36,7),
	(37,2),
	(38,8),
	(39,1),
	(40,10);

-- Insert relationships into the student_teacher_relations table
INSERT INTO student_teacher_relations (students_id, teachers_id, knowledge_branches_id, register_data)
VALUES (9,26,1,"2024-06-15"),
(6,26,1,"2024-09-17"),
(2,26,1,"2024-11-22"),
(5,26,7,"2024-04-30"),
(11,26,7,"2024-08-29"),
(2,26,7,"2024-09-11"),
(19,26,7,"2024-05-11"),
(19,27,3,"2024-10-28"),
(2,27,3,"2024-06-26"),
(7,27,3,"2023-07-01"),
(9,27,3,"2023-07-26"),
(19,27,3,"2023-07-29"),
(2,27,4,"2023-07-03"),
(4,27,4,"2024-07-16"),
(18,27,4,"2024-12-17"),
(6,27,4,"2024-07-20"),
(23,27,4,"2023-12-05"),
(16,27,9,"2024-01-31"),
(24,27,9,"2024-01-03"),
(19,28,10,"2024-04-06"),
(2,28,10,"2023-07-24"),
(25,29,8,"2023-11-29"),
(5,30,6,"2024-09-29"),
(11,31,10,"2024-07-29"),
(21,32,5,"2023-11-19"),
(25,33,2,"2024-10-31"),
(3,35,3,"2023-08-10"),
(2,36,7,"2023-07-15"),
(5,36,7,"2023-10-26"),
(12,38,8,"2024-02-02"),
(8,40,10,"2024-05-09");

-- Insert ratings from student to teacher
INSERT INTO student_rates_teacher (student_id, teacher_id, rating, text_rating)
VALUES (5,36,5,"Es un profesor increíble, siempre explica todo de forma clara y comprensible."),
		(2,27,3,"Muy buen profesor, tiene mucha paciencia y se preocupa por todos."),
		(2,26,4,"Me encanta su forma de enseñar, hace que todo sea interesante."),
		(11,31,3,"Siempre motivando a los estudiantes a dar lo mejor de sí mismos."),
		(25,33,5,"Explica de forma sencilla y se toma el tiempo para resolver dudas."),
		(24,27,4,"Un profesor con mucho conocimiento y siempre dispuesto a ayudar."),
		(12,38,5,"Sus clases son divertidas y siempre aprendo algo nuevo."),
		(19,28,5,"Hace el aprendizaje más fácil y entretenido, siempre explica bien."),
		(11,26,4,"Es muy atento y tiene una gran capacidad para enseñar."),
		(19,27,4,"Siempre está disponible para aclarar cualquier duda y explicar mejor.");

-- Insert CHAT creation
INSERT INTO chats (student_id, teacher_id)
VALUES (2,26),
		(2,27),
		(5,30),
		(11,31),
		(12,38),
		(16,27);

-- Insert CHAT_MESSAGES
INSERT INTO chat_messages (chat_id, sender_id, moment, message)
VALUES (1,2,CURRENT_TIMESTAMP,"Con la venia!"),
	(2,2,CURRENT_TIMESTAMP,"Hola, no quiero que esto suene a excusa, pero no voy a poder entregarte la tarea... mi lechuza se la comió!"),
        (3,2,CURRENT_TIMESTAMP,"Hola, no entendí nada de la clase de hoy... tendrás que grabarlas en vídeo!"),
        (4,11,CURRENT_TIMESTAMP,"Disculpe, ¿cuando piensa corregir los exámenes?"),
        (5,12,CURRENT_TIMESTAMP,"Hola profe, tienes un minuto?"),
        (6,16,CURRENT_TIMESTAMP,"Me gustaba más el profe de antes. Este chat es anónimo, ¿no?"),
        (1,26,CURRENT_TIMESTAMP,"Esto no es un juicio, Harry! Soy profesor, no juez!"),
	(2,27,CURRENT_TIMESTAMP,"Tu lechuza se ha comido las tareas del último mes también? No has entregado ni una!"),
        (3,30,CURRENT_TIMESTAMP,"Ya está grabada, la tienes MagTube.com"),
        (4,31,CURRENT_TIMESTAMP,"Empecé hace un mes, pero me puse a llorar y tuve que parar...?"),
        (5,38,CURRENT_TIMESTAMP,"Para ti, no, pesao!"),
        (6,27,CURRENT_TIMESTAMP,"Si claro, es anónimo. Como el Quijote. :D");