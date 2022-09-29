-- MySQL Script generated by MySQL Workbench
-- Wed Sep 28 15:51:36 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rts
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rts` DEFAULT CHARACTER SET utf8 ;
USE `rts` ;

-- -----------------------------------------------------
-- Table `rts`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`players` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nick` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rts`.`villages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`villages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `x` INT NOT NULL,
  `y` INT NOT NULL,
  `players_id` INT NOT NULL,
  PRIMARY KEY (`id`, `players_id`, `name`),
  CONSTRAINT `fk_villages_players1`
    FOREIGN KEY (`players_id`)
    REFERENCES `rts`.`players` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rts`.`troops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`troops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `damage` INT NOT NULL,
  `distance damage` INT NOT NULL,
  `defence` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rts`.`resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`resources` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rts`.`buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`buildings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rts`.`villages_has_resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`villages_has_resources` (
  `villages_id` INT NOT NULL,
  `resources_id` INT NOT NULL,
  `value` INT NOT NULL,
  PRIMARY KEY (`villages_id`, `resources_id`, `value`),
  CONSTRAINT `fk_villages_has_resources_villages1`
    FOREIGN KEY (`villages_id`)
    REFERENCES `rts`.`villages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_villages_has_resources_resources1`
    FOREIGN KEY (`resources_id`)
    REFERENCES `rts`.`resources` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rts`.`villages_has_buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`villages_has_buildings` (
  `villages_id` INT NOT NULL,
  `villages_name` VARCHAR(45) NOT NULL,
  `buildings_id` INT NOT NULL,
  PRIMARY KEY (`villages_id`, `buildings_id`),
  CONSTRAINT `fk_villages_has_buildings_villages1`
    FOREIGN KEY (`villages_id` , `villages_name`)
    REFERENCES `rts`.`villages` (`id` , `name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_villages_has_buildings_buildings1`
    FOREIGN KEY (`buildings_id`)
    REFERENCES `rts`.`buildings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rts`.`villages_has_troops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rts`.`villages_has_troops` (
  `villages_id` INT NOT NULL,
  `troops_id` INT NOT NULL,
  PRIMARY KEY (`villages_id`, `troops_id`),
  CONSTRAINT `fk_villages_has_troops_villages1`
    FOREIGN KEY (`villages_id`)
    REFERENCES `rts`.`villages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_villages_has_troops_troops1`
    FOREIGN KEY (`troops_id`)
    REFERENCES `rts`.`troops` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
