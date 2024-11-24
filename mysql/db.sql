-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS hogwarts;
USE hogwarts;

-- Crear la tabla de roles
CREATE TABLE roles (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(100) NOT NULL
);

-- Crear la tabla de usuarios
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       last_names VARCHAR(255) NOT NULL,
                       phone VARCHAR(20),
                       email VARCHAR(255) UNIQUE NOT NULL,
                       username VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       image LONGTEXT,
                       role_id INT,
                       FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Crear la tabla de estudiantes
CREATE TABLE students (
                          id INT PRIMARY KEY,
                          active BOOLEAN DEFAULT TRUE,
                          FOREIGN KEY (id) REFERENCES users(id)
);

-- Crear la tabla de profesores
CREATE TABLE teachers (
                          id INT PRIMARY KEY,
                          description VARCHAR(2000),
                          resume VARCHAR(2000),
                          active BOOLEAN DEFAULT FALSE,
                          price_hour INT NOT NULL,
                          average_rating DOUBLE NULL,
                          address VARCHAR(255) NOT NULL,
                          city VARCHAR(100) NOT NULL,
                          postal_code VARCHAR(20) NOT NULL,
                          FOREIGN KEY (id) REFERENCES users(id)
);

-- Crear la tabla de asignaturas
CREATE TABLE knowledge_branches (
                                    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                    name VARCHAR(255) NOT NULL
);

-- Crear la tabla de relación de profresores y asignaturas
CREATE TABLE teacher_has_knowledge_branches (
                                                id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                                teachers_id INT NOT NULL,
                                                knowledge_branches_id INT NOT NULL,
                                                FOREIGN KEY (teachers_id) REFERENCES teachers(id),
                                                FOREIGN KEY (knowledge_branches_id) REFERENCES knowledge_branches(id),
                                                UNIQUE KEY unique_teacher_branch(teachers_id, knowledge_branches_id)
);

-- Crear la tabla de relaciones clases de estudiantes-profesores
CREATE TABLE IF NOT EXISTS  `student_teacher_relations` (
                                            `id` INT NOT NULL AUTO_INCREMENT,
                                            `register_data` DATE NOT NULL,
                                            `withdraw_data` DATE NULL,
                                            `students_id` INT NOT NULL,
                                            `teachers_id` INT NOT NULL,
                                            `knowledge_branches_id` INT NOT NULL,
                                            PRIMARY KEY (`id`),
                                            INDEX `fk_student_teacher_relations_students1_idx` (`students_id` ASC) VISIBLE,
                                            INDEX `fk_student_teacher_relations_teachers1_idx` (`teachers_id` ASC) VISIBLE,
                                            INDEX `fk_student_teacher_relations_knowledge_branches1_idx` (`knowledge_branches_id` ASC) VISIBLE,
                                            UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
                                            CONSTRAINT `fk_student_teacher_relations_students1`
                                                FOREIGN KEY (`students_id`)
                                                REFERENCES  `students` (`id`)
                                                ON DELETE NO ACTION
                                                ON UPDATE NO ACTION,
                                            CONSTRAINT `fk_student_teacher_relations_teachers1`
                                                FOREIGN KEY (`teachers_id`)
                                                REFERENCES  `teachers` (`id`)
                                                ON DELETE NO ACTION
                                                ON UPDATE NO ACTION,
                                            CONSTRAINT `fk_student_teacher_relations_knowledge_branches1`
                                                FOREIGN KEY (`knowledge_branches_id`)
                                                REFERENCES  `knowledge_branches` (`id`)
                                                ON DELETE NO ACTION
                                                ON UPDATE NO ACTION)
