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
-- Table `teacherapp_db`.`admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`admins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `last_names` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `passwd` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `last_names` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NULL,
  `username` VARCHAR(20) NOT NULL,
  `passwd` VARCHAR(20) NOT NULL,
  `logical_deletion` TINYINT NOT NULL COMMENT 'Al borrar un estudiante se activará a \"true\" = \"1\" el campo logical_deletion.  ',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`teachers` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `last_names` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `passwd` VARCHAR(20) NOT NULL,
  `about_me` VARCHAR(250) NOT NULL,
  `resume` VARCHAR(2000) NOT NULL,
  `validated` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`teacher_reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`teacher_reviews` (
  `students_id` INT NOT NULL,
  `teachers_id` INT NOT NULL,
  `score` INT NOT NULL COMMENT 'Puntuación dada al profesor , de 1 a 5. ',
  `review` VARCHAR(1000) NOT NULL COMMENT 'Texto de opinión sobre el profesor.',
  PRIMARY KEY (`students_id`, `teachers_id`),
  INDEX `fk_table1_t_reviews1_idx` (`teachers_id` ASC) VISIBLE,
  CONSTRAINT `fk_table1_students`
    FOREIGN KEY (`students_id`)
    REFERENCES `teacherapp_db`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_t_reviews1`
    FOREIGN KEY (`teachers_id`)
    REFERENCES `teacherapp_db`.`teachers` (`id`)
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
  `students_id` INT NOT NULL,
  `teachers_id` INT NOT NULL,
  `register_data` DATE NOT NULL,
  `withdraw_data` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_registrations_students1_idx` (`students_id` ASC) VISIBLE,
  INDEX `fk_student_registrations_teachers1_idx` (`teachers_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_registrations_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `teacherapp_db`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_registrations_teachers1`
    FOREIGN KEY (`teachers_id`)
    REFERENCES `teacherapp_db`.`teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacherapp_db`.`teachers_has_knowledge_branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacherapp_db`.`teachers_has_knowledge_branches` (
  `teachers_id` INT NOT NULL,
  `knowledge_branches_id` INT NOT NULL,
  `price_hour` INT NULL,
  PRIMARY KEY (`teachers_id`, `knowledge_branches_id`),
  INDEX `fk_teachers_has_knowledge_branches_knowledge_branches1_idx` (`knowledge_branches_id` ASC) VISIBLE,
  INDEX `fk_teachers_has_knowledge_branches_teachers1_idx` (`teachers_id` ASC) VISIBLE,
  CONSTRAINT `fk_teachers_has_knowledge_branches_teachers1`
    FOREIGN KEY (`teachers_id`)
    REFERENCES `teacherapp_db`.`teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_has_knowledge_branches_knowledge_branches1`
    FOREIGN KEY (`knowledge_branches_id`)
    REFERENCES `teacherapp_db`.`knowledge_branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
