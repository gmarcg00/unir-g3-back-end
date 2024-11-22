USE `magic_teachers_db`;

-- Insertar roles en la tabla roles
INSERT INTO `roles` (`name`) VALUES
('admin'),
('student'),
('teacher');

-- Insertar usuarios en la tabla users
-- Todas las Passwords encryptadas con bcrypt 8 iteraciones, con la clave super secreta: 12345678
INSERT INTO `users` (`username`, `name`, `last_names`, `phone`, `email`, `password`, `roles_id`) VALUES
-- Admin
('albus.dumbledore', 'Albus', 'Dumbledore', '601123456', 'albus.dumbledore@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 1),

-- Students
('harry.potter', 'Harry', 'Potter', '603123458', 'harry.potter@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy4', 2),
('hermione.granger', 'Hermione', 'Granger', '604123459', 'hermione.granger@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 2),

-- Teachers
('severus.snape', 'Severus', 'Snape', '615123450', 'severus.snape@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3),
('minerva.mcgonagall', 'Minerva', 'McGonagall', '602123457', 'minerva.mcgonagall@hogwarts.edu', '$2a$08$t0RQ.6jfYyNJ2IJ.X8gFQO2..hloAJyH/zlAHXd.v0sE0s8JD.pcy', 3);
