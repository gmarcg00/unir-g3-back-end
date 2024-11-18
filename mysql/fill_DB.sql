-- --Cambiar base de datos en la siguiente linea si hace falta ... 
USE `teacherapp_db` ;


-- -----------------------------------------------------
-- Filling Table `roles`
-- -----------------------------------------------------
INSERT INTO `roles` (`name`) 
VALUES
  ('admin'),
  ('student'),
  ('teacher');


-- -----------------------------------------------------
-- Filling Table  `users`   
-- -----------------------------------------------------
INSERT INTO `users` (`name`, `last_names`, `phone`, `email`, `username`, `passwd`, `roles_id`) VALUES
('Carlos', 'Gómez López', '612345678', 'carlos.gomez1@example.com', 'cgomez1', 'password1', 1),
('Ana', 'Martínez Pérez', '622345678', 'ana.martinez@example.com', 'amartinez', 'password2', 1),

('Lucía', 'Sánchez Ruiz', '632345678', 'lucia.sanchez@example.com', 'lsanchez', 'password3', 2),
('Raúl', 'Fernández García', '642345678', 'raul.fernandez@example.com', 'rfernandez', 'password4', 2),
('Sofía', 'López Martínez', '652345678', 'sofia.lopez@example.com', 'slopez', 'password5', 2),
('Pablo', 'Jiménez Sánchez', '662345678', 'pablo.jimenez@example.com', 'pjimenez', 'password6', 2),
('Elena', 'Romero Díaz', '672345678', 'elena.romero@example.com', 'eromero', 'password7', 2),
('Jorge', 'Alonso Muñoz', '682345678', 'jorge.alonso@example.com', 'jalonso', 'password8', 2),
('María', 'Gutiérrez Santos', '692345678', 'maria.gutierrez@example.com', 'mgutierrez', 'password9', 2),
('Juan', 'Moreno Torres', '612345689', 'juan.moreno@example.com', 'jmoreno', 'password10', 2),
('Teresa', 'Ortega Ramos', '622345679', 'teresa.ortega@example.com', 'tortega', 'password11', 2),

('Marta', 'Navarro Vega', '632345679', 'marta.navarro@example.com', 'mnavarro', 'password12', 3),
('Daniel', 'Pérez González', '642345679', 'daniel.perez@example.com', 'dperez', 'password13', 3),
('Cristina', 'Rubio Herrera', '652345679', 'cristina.rubio@example.com', 'crubio', 'password14', 3),
('Luis', 'Blanco Lozano', '662345679', 'luis.blanco@example.com', 'lblanco', 'password15', 3),
('Laura', 'Castro Domínguez', '672345679', 'laura.castro@example.com', 'lcastro', 'password16', 3),
('David', 'Torres Gil', '682345679', 'david.torres@example.com', 'dtorres', 'password17', 3),
('Isabel', 'Molina Cruz', '692345679', 'isabel.molina@example.com', 'imolina', 'password18', 3),
('Sergio', 'Santos Paredes', '612345688', 'sergio.santos@example.com', 'ssantos', 'password19', 3),
('Paula', 'Vargas Ortiz', '622345688', 'paula.vargas@example.com', 'pvargas', 'password20', 3);


-- -----------------------------------------------------
-- Filling Table  `students`  
-- -----------------------------------------------------
INSERT INTO `students` (`users_id`, `logical_deletion`)
VALUES 
  (3, 0),
  (4, 0),
  (5, 0),
  (6, 0),
  (7, 0),
  (8, 0),
  (9, 0),
  (10, 0),
  (11, 0),
  (12, 0);



-- -----------------------------------------------------
-- Table  `teachers`
-- -----------------------------------------------------
INSERT INTO `teachers` (`users_id`, `about_me`, `resume`, `validated`, `price_hour`, `average_score`)
VALUES
  (13, 'Licenciado en Matemáticas con amplia experiencia en docencia y aplicación práctica.', 'Licenciado en Matemáticas, especializado en enseñanza y resolución de problemas complejos.', 'true', 18, NULL),
  (15, 'Licenciado en Física apasionado por la investigación y la enseñanza de conceptos avanzados.', 'Licenciado en Física, con experiencia en enseñanza y laboratorios de investigación.', 'true', 20, NULL),
  (14, 'Licenciado en Química enfocado en procesos químicos industriales y académicos.', 'Licenciado en Química, especializado en análisis químico y desarrollo de materiales.', 'true', 17, NULL),
  (16, 'Licenciado en Biología dedicado a la conservación y el estudio de la biodiversidad.', 'Licenciado en Biología, con experiencia en conservación y trabajo de campo.', 'true', 19, NULL),
  (17, 'Licenciado en Ingeniería con experiencia en proyectos de construcción y tecnología avanzada.', 'Licenciado en Ingeniería, especializado en gestión de proyectos y tecnologías aplicadas.', 'true', 15, NULL),
  (18, 'Licenciado en Ciencias de la Computación, experto en desarrollo y algoritmos.', 'Licenciado en Ciencias de la Computación, con experiencia en desarrollo de software y optimización de algoritmos.', 'true', 19, NULL),
  (19, 'Licenciado en Economía y Finanzas, con experiencia en análisis de mercados y finanzas personales.', 'Licenciado en Economía y Finanzas, especializado en asesoría financiera y mercados de capitales.', 'true', 16, NULL),
  (20, 'Licenciado en Psicología, especializado en psicoterapia y desarrollo personal.', 'Licenciado en Psicología, con experiencia en psicoterapia y programas de desarrollo personal.', 'true', 18, NULL);


-- -----------------------------------------------------
-- Table  `knowledge_branches`
-- -----------------------------------------------------
INSERT INTO `knowledge_branches` (`name`)
VALUES 
  ('Matemáticas'),
  ('Física'),
  ('Química'),
  ('Biología'),
  ('Ingeniería'),
  ('Ciencias de la Computación'),
  ('Economía y Finanzas'),
  ('Psicología'),
  ('Derecho'),
  ('Humanidades y Ciencias Sociales');


-- -----------------------------------------------------
-- Table  `teacher_reviews`
-- -----------------------------------------------------
INSERT INTO `teacher_reviews` (`score`, `review`, `students_users_id`, `teachers_users_id`, `knowledge_branches_id`)
VALUES 
  (3, 'Las explicaciones del profesor son regulares y podrían mejorar en claridad.', 3, 13, 1),
  (4, 'El profesor da buenas explicaciones, aunque en algunos temas puede mejorar.', 4, 14, 2),
  (5, 'Las explicaciones del profesor son muy buenas, es claro y atento.', 5, 15, 3),
  (3, 'Explicaciones regulares, se entiende lo básico pero falta más detalle.', 6, 16, 4),
  (5, 'Las explicaciones son muy buenas, el profesor demuestra gran conocimiento.', 7, 17, 5),
  (4, 'Explicaciones buenas, en general son claras y completas.', 8, 18, 6),
  (3, 'Explicaciones regulares, con oportunidad de mejorar en algunos temas.', 9, 19, 7);


-- -----------------------------------------------------
-- Table  `student_teacher_relations`
-- -----------------------------------------------------
INSERT INTO `student_teacher_relations` (`register_data`, `withdraw_data`, `students_users_id`, `teachers_users_id`, `knowledge_branches_id`)
VALUES 
  ('2024-10-05', NULL, 3, 13, 1),
  ('2024-10-12', NULL, 4, 15, 2),
  ('2024-10-20', NULL, 5, 14, 3),
  ('2024-10-28', NULL, 6, 16, 4),
  ('2024-11-01', NULL, 7, 17, 5),
  ('2024-11-05', NULL, 8, 18, 6),
  ('2024-11-10', NULL, 9, 19, 7),
  ('2024-11-15', NULL, 10, 20, 8),
  ('2024-11-20', NULL, 11, 13, 9),
  ('2024-11-25', NULL, 12, 15, 10);


-- -----------------------------------------------------
-- Table  `teachers_has_knowledge_branches`  
-- -----------------------------------------------------
INSERT INTO `teachers_has_knowledge_branches` (`knowledge_branches_id`, `teachers_users_id`) 
VALUES 
  (1, 13),
  (2, 15),
  (3, 14),
  (4, 16),
  (5, 17),
  (6, 18),
  (7, 19),
  (8, 20),
  (9, 13),
  (10, 15);

INSERT INTO `chats` (`students_users_id`, `teachers_users_id`) 
VALUES 
  (3, 13),
  (4, 14),
  (5, 15),
  (6, 16),
  (7, 17),
  (8, 18),
  (9, 19);
  
-- -----------------------------------------------------
-- Table  `messages` 
-- -----------------------------------------------------
INSERT INTO `messages` (`t_stamp`, `text`, `id_sender`, `viewed`, `chats_id`) 
VALUES 
  -- Chat 1 (students_users_id = 3, teachers_users_id = 13)
  ('2024-10-30 10:00:00', 'Lorem ipsum dolor sit amet.', 3, 1, 1),
  ('2024-10-31 10:00:00', 'Consectetur adipiscing elit.', 13, 1, 1),
  ('2024-11-01 10:00:00', 'Sed do eiusmod tempor.', 3, 0, 1),

  -- Chat 2 (students_users_id = 4, teachers_users_id = 14)
  ('2024-10-30 11:00:00', 'Lorem ipsum dolor sit amet.', 4, 1, 2),
  ('2024-10-31 11:00:00', 'Consectetur adipiscing elit.', 14, 1, 2),
  ('2024-11-01 11:00:00', 'Sed do eiusmod tempor.', 4, 0, 2),

  -- Chat 3 (students_users_id = 5, teachers_users_id = 15)
  ('2024-10-30 12:00:00', 'Lorem ipsum dolor sit amet.', 5, 1, 3),
  ('2024-10-31 12:00:00', 'Consectetur adipiscing elit.', 15, 1, 3),
  ('2024-11-01 12:00:00', 'Sed do eiusmod tempor.', 5, 0, 3),

  -- Chat 4 (students_users_id = 6, teachers_users_id = 16)
  ('2024-10-30 13:00:00', 'Lorem ipsum dolor sit amet.', 6, 1, 4),
  ('2024-10-31 13:00:00', 'Consectetur adipiscing elit.', 16, 1, 4),
  ('2024-11-01 13:00:00', 'Sed do eiusmod tempor.', 6, 0, 4),

  -- Chat 5 (students_users_id = 7, teachers_users_id = 17)
  ('2024-10-30 14:00:00', 'Lorem ipsum dolor sit amet.', 7, 1, 5),
  ('2024-10-31 14:00:00', 'Consectetur adipiscing elit.', 17, 1, 5),
  ('2024-11-01 14:00:00', 'Sed do eiusmod tempor.', 7, 0, 5),

  -- Chat 6 (students_users_id = 8, teachers_users_id = 18)
  ('2024-10-30 15:00:00', 'Lorem ipsum dolor sit amet.', 8, 1, 6),
  ('2024-10-31 15:00:00', 'Consectetur adipiscing elit.', 18, 1, 6),
  ('2024-11-01 15:00:00', 'Sed do eiusmod tempor.', 8, 0, 6),

  -- Chat 7 (students_users_id = 9, teachers_users_id = 19)
  ('2024-10-30 16:00:00', 'Lorem ipsum dolor sit amet.', 9, 1, 7),
  ('2024-10-31 16:00:00', 'Consectetur adipiscing elit.', 19, 1, 7),
  ('2024-11-01 16:00:00', 'Sed do eiusmod tempor.', 9, 0, 7);

-- -----------------------------------------------------
-- Table  `chats`
-- -----------------------------------------------------

