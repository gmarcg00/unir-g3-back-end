-- NO USAR ESTE FICHERO, SOLO PARA CONSULTAS, USAR db.sql

-- -----------------------------------------------------
-- Schema magic_teachers_db
-- ----------------------------------------------------- 
CREATE SCHEMA IF NOT EXISTS `magic_teachers_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `magic_teachers_db` ;


-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `users`   
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `last_names` VARCHAR(40) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_roles1_idx` (`roles_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  CONSTRAINT `fk_users_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES  `roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `students`  
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `students` (
  `id` INT NOT NULL,
  `active` TINYINT NOT NULL COMMENT 'When set to false is similar to logical_deletion  ',
  INDEX `fk_students_users1_idx` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_students_users1`
    FOREIGN KEY (`id`)
    REFERENCES  `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `teachers` (
  `id` INT NOT NULL,
  `about_me` VARCHAR(250) NOT NULL,
  `resume` VARCHAR(2000) NOT NULL,
  `validated` TINYINT NOT NULL COMMENT 'Si el profesor ha sido validado o no. ',
  `price_hour` INT NOT NULL,
  `average_score` DOUBLE NULL,
  `adress` VARCHAR(255) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `postal_code` VARCHAR(20) NOT NULL,
  INDEX `fk_teachers_users1_idx` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_teachers_users1`
    FOREIGN KEY (`id`)
    REFERENCES  `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `knowledge_branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `knowledge_branches` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `teacher_reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `teacher_reviews` (
  `score` INT NOT NULL COMMENT 'Puntuación dada al profesor , de 1 a 5. ',
  `review` VARCHAR(1000) NOT NULL COMMENT 'Texto de opinión sobre el profesor.',
  `students_id` INT NOT NULL,
  `teachers_id` INT NOT NULL,
  `knowledge_branches_id` INT NOT NULL,
  PRIMARY KEY (`students_id`, `teachers_id`, `knowledge_branches_id`),
  INDEX `fk_teacher_reviews_teachers1_idx` (`teachers_id` ASC) VISIBLE,
  INDEX `fk_teacher_reviews_knowledge_branches1_idx` (`knowledge_branches_id` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_reviews_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES  `students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_reviews_teachers1`
    FOREIGN KEY (`teachers_id`)
    REFERENCES  `teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_reviews_knowledge_branches1`
    FOREIGN KEY (`knowledge_branches_id`)
    REFERENCES  `knowledge_branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `student_teacher_relations`
-- -----------------------------------------------------
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `teachers_has_knowledge_branches` 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `teachers_has_knowledge_branches` (
  `knowledge_branches_id` INT NOT NULL,
  `teachers_id` INT NOT NULL,
  PRIMARY KEY (`knowledge_branches_id`, `teachers_id`),
  INDEX `fk_teachers_has_knowledge_branches_knowledge_branches1_idx` (`knowledge_branches_id` ASC) VISIBLE,
  INDEX `fk_teachers_has_knowledge_branches_teachers1_idx` (`teachers_id` ASC) VISIBLE,
  CONSTRAINT `fk_teachers_has_knowledge_branches_knowledge_branches1`
    FOREIGN KEY (`knowledge_branches_id`)
    REFERENCES  `knowledge_branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_has_knowledge_branches_teachers1`
    FOREIGN KEY (`teachers_id`)
    REFERENCES  `teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `chats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `chats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `students_id` INT NOT NULL,
  `teachers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chats_students1_idx` (`students_id` ASC) VISIBLE,
  INDEX `fk_chats_teachers1_idx` (`teachers_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_chats_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES  `students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chats_teachers1`
    FOREIGN KEY (`teachers_id`)
    REFERENCES  `teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table  `messages` 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `t_stamp` TIMESTAMP NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  `id_sender` INT NOT NULL,
  `viewed` TINYINT NOT NULL,
  `chats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_chats1_idx` (`chats_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_chats1`
    FOREIGN KEY (`chats_id`)
    REFERENCES  `chats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

