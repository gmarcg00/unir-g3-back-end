-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema teacherapp_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema teacherapp_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `teacherapp_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `teacherapp_db` ;

-- -----------------------------------------------------
-- Table `teacherapp_db`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`roles` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`users` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `last_names` VARCHAR(40) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `passwd` VARCHAR(25) NOT NULL,
  `rols_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_rols1_idx` (`rols_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_rols1`
    FOREIGN KEY (`rols_id`)
    REFERENCES `teacherapp_db`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`students` (
  `logical_deletion` TINYINT NOT NULL COMMENT 'Al borrar un estudiante se activará a \"true\" = \"1\" el campo logical_deletion.  ',
  `users_id` INT NOT NULL,
  INDEX `fk_students_users1_idx` (`users_id` ASC) VISIBLE,
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_students_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `teacherapp_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`teachers` (
  `about_me` VARCHAR(250) NOT NULL,
  `resume` VARCHAR(2000) NOT NULL,
  `validated` VARCHAR(45) NOT NULL,
  `users_id` INT NOT NULL,
  `price_hour` INT NOT NULL,
  `average_square` DOUBLE NULL,
  INDEX `fk_teachers_users1_idx` (`users_id` ASC) VISIBLE,
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_teachers_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `teacherapp_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`teacher_reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`teacher_reviews` (
  `score` INT NOT NULL COMMENT 'Puntuación dada al profesor , de 1 a 5. ',
  `review` VARCHAR(1000) NOT NULL COMMENT 'Texto de opinión sobre el profesor.',
  `students_users_id` INT NOT NULL,
  `teachers_users_id` INT NOT NULL,
  PRIMARY KEY (`students_users_id`, `teachers_users_id`),
  INDEX `fk_teacher_reviews_teachers1_idx` (`teachers_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_reviews_students1`
    FOREIGN KEY (`students_users_id`)
    REFERENCES `teacherapp_db`.`students` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_reviews_teachers1`
    FOREIGN KEY (`teachers_users_id`)
    REFERENCES `teacherapp_db`.`teachers` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`knowledge_branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`knowledge_branches` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`student_registrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`student_registrations` (
  `id` INT NOT NULL,
  `register_data` DATE NOT NULL,
  `withdraw_data` DATE NULL,
  `students_users_id` INT NOT NULL,
  `teachers_users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_registrations_students1_idx` (`students_users_id` ASC) VISIBLE,
  INDEX `fk_student_registrations_teachers1_idx` (`teachers_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_registrations_students1`
    FOREIGN KEY (`students_users_id`)
    REFERENCES `teacherapp_db`.`students` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_registrations_teachers1`
    FOREIGN KEY (`teachers_users_id`)
    REFERENCES `teacherapp_db`.`teachers` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`teachers_has_knowledge_branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`teachers_has_knowledge_branches` (
  `knowledge_branches_id` INT NOT NULL,
  `teachers_users_id` INT NOT NULL,
  PRIMARY KEY (`knowledge_branches_id`, `teachers_users_id`),
  INDEX `fk_teachers_has_knowledge_branches_knowledge_branches1_idx` (`knowledge_branches_id` ASC) VISIBLE,
  INDEX `fk_teachers_has_knowledge_branches_teachers1_idx` (`teachers_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_teachers_has_knowledge_branches_knowledge_branches1`
    FOREIGN KEY (`knowledge_branches_id`)
    REFERENCES `teacherapp_db`.`knowledge_branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_has_knowledge_branches_teachers1`
    FOREIGN KEY (`teachers_users_id`)
    REFERENCES `teacherapp_db`.`teachers` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `teacherapp_db`.`chats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`chats` (
  `id` INT NOT NULL,
  `students_users_id` INT NOT NULL,
  `teachers_users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chats_students1_idx` (`students_users_id` ASC) VISIBLE,
  INDEX `fk_chats_teachers1_idx` (`teachers_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_chats_students1`
    FOREIGN KEY (`students_users_id`)
    REFERENCES `teacherapp_db`.`students` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chats_teachers1`
    FOREIGN KEY (`teachers_users_id`)
    REFERENCES `teacherapp_db`.`teachers` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`messages` (
  `id` INT NOT NULL,
  `t_stamp` TIMESTAMP NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  `id_sender` INT NOT NULL,
  `viewed` TINYINT NOT NULL,
  `chats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_chats1_idx` (`chats_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_chats1`
    FOREIGN KEY (`chats_id`)
    REFERENCES `teacherapp_db`.`chats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
