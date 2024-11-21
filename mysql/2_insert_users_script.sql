USE `magic_teachers_db`;

-- Insertar roles en la tabla roles
INSERT INTO `roles` (`name`) VALUES
('admin'),
('student'),
('teacher');

-- Insertar usuarios en la tabla users
INSERT INTO `users` (`username`, `name`, `last_names`, `phone`, `email`, `password`, `roles_id`) VALUES
-- Admin
('albus.dumbledore', 'Albus', 'Dumbledore', '601123456', 'albus.dumbledore@hogwarts.edu', 'AlbusDumbledore2024', 1),

-- Students
('harry.potter', 'Harry', 'Potter', '603123458', 'harry.potter@hogwarts.edu', 'HarryPotter2024', 2),
('hermione.granger', 'Hermione', 'Granger', '604123459', 'hermione.granger@hogwarts.edu', 'HermioneGranger2024', 2),

-- Teachers
('severus.snape', 'Severus', 'Snape', '615123450', 'severus.snape@hogwarts.edu', 'SeverusSnape2024', 3),
('minerva.mcgonagall', 'Minerva', 'McGonagall', '602123457', 'minerva.mcgonagall@hogwarts.edu', 'MinervaMcGonagall2024', 3);
