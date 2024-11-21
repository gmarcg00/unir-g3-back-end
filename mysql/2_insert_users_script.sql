USE `magic_teachers_db`;

-- Insertar roles en la tabla roles
INSERT INTO `roles` (`name`) VALUES
('admin'),
('student'),
('teacher');

-- Insertar usuarios en la tabla users
INSERT INTO `users` (`username`, `name`, `last_names`, `phone`, `email`, `password`, `roles_id`) VALUES
-- Admins
('albus.dumbledore', 'Albus', 'Dumbledore', '601123456', 'albus.dumbledore@hogwarts.edu', 'Fawkes2024', 1),
('minerva.mcgonagall', 'Minerva', 'McGonagall', '602123457', 'minerva.mcgonagall@hogwarts.edu', 'Animagus2024', 1),

-- Students
('harry.potter', 'Harry', 'Potter', '603123458', 'harry.potter@hogwarts.edu', 'Nimbus2000', 2),
('hermione.granger', 'Hermione', 'Granger', '604123459', 'hermione.granger@hogwarts.edu', 'Crookshanks2024', 2),
('ron.weasley', 'Ron', 'Weasley', '605123450', 'ron.weasley@hogwarts.edu', 'Scabbers2024', 2),
('draco.malfoy', 'Draco', 'Malfoy', '606123451', 'draco.malfoy@hogwarts.edu', 'Slytherin2024', 2),
('luna.lovegood', 'Luna', 'Lovegood', '607123452', 'luna.lovegood@hogwarts.edu', 'Quibbler2024', 2),
('neville.longbottom', 'Neville', 'Longbottom', '608123453', 'neville.longbottom@hogwarts.edu', 'Herbology2024', 2),
('ginny.weasley', 'Ginny', 'Weasley', '609123454', 'ginny.weasley@hogwarts.edu', 'BatBogey2024', 2),
('cedric.diggory', 'Cedric', 'Diggory', '610123455', 'cedric.diggory@hogwarts.edu', 'Hufflepuff2024', 2),
('cho.chang', 'Cho', 'Chang', '611123456', 'cho.chang@hogwarts.edu', 'Ravenclaw2024', 2),
('seamus.finnigan', 'Seamus', 'Finnigan', '612123457', 'seamus.finnigan@hogwarts.edu', 'Explosions2024', 2),

-- Teachers
('severus.snape', 'Severus', 'Snape', '613123458', 'severus.snape@hogwarts.edu', 'PotionsMaster2024', 3),
('rubeus.hagrid', 'Rubeus', 'Hagrid', '614123459', 'rubeus.hagrid@hogwarts.edu', 'Norbert2024', 3),
('filius.flitwick', 'Filius', 'Flitwick', '615123450', 'filius.flitwick@hogwarts.edu', 'Charms2024', 3),
('pomona.sprout', 'Pomona', 'Sprout', '616123451', 'pomona.sprout@hogwarts.edu', 'Mandrake2024', 3),
('remus.lupin', 'Remus', 'Lupin', '617123452', 'remus.lupin@hogwarts.edu', 'Moony2024', 3),
('gilderoy.lockhart', 'Gilderoy', 'Lockhart', '618123453', 'gilderoy.lockhart@hogwarts.edu', 'Obliviate2024', 3),
('dolores.umbridge', 'Dolores', 'Umbridge', '619123454', 'dolores.umbridge@hogwarts.edu', 'PinkRules2024', 3),
('sybill.trelawney', 'Sybill', 'Trelawney', '620123455', 'sybill.trelawney@hogwarts.edu', 'Prophecy2024', 3),
('horace.slughorn', 'Horace', 'Slughorn', '621123456', 'horace.slughorn@hogwarts.edu', 'SlugClub2024', 3),
('alastor.moody', 'Alastor', 'Moody', '622123457', 'alastor.moody@hogwarts.edu', 'ConstantVigilance2024', 3);
