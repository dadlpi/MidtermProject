-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema emporiumdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `emporiumdb` ;

-- -----------------------------------------------------
-- Schema emporiumdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `emporiumdb` DEFAULT CHARACTER SET utf8 ;
USE `emporiumdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `enabled` TINYINT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `password` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  `date_created` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `profile_image_url` VARCHAR(2000) NULL,
  `about_me` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_type` ;

CREATE TABLE IF NOT EXISTS `meal_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dish` ;

CREATE TABLE IF NOT EXISTS `dish` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `calories` INT NULL,
  `image_url` VARCHAR(2000) NULL,
  `protein_grams` INT NULL,
  `fat_grams` INT NULL,
  `carbs_grams` INT NULL,
  `user_id` INT NOT NULL,
  `recipe_url` VARCHAR(2000) NULL,
  `meal_type_id` INT NOT NULL,
  `date_created` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_meal_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_meal_type1`
    FOREIGN KEY (`meal_type_id`)
    REFERENCES `meal_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dietary_restriction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dietary_restriction` ;

CREATE TABLE IF NOT EXISTS `dietary_restriction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_diet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_diet` ;

CREATE TABLE IF NOT EXISTS `user_diet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `enabled` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_diet_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `strictness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `strictness` ;

CREATE TABLE IF NOT EXISTS `strictness` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `strictness_level` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_diet_restriction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_diet_restriction` ;

CREATE TABLE IF NOT EXISTS `user_diet_restriction` (
  `diet_id` INT NOT NULL,
  `dietary_restriction_id` INT NOT NULL,
  `strictness_id` INT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`diet_id`, `dietary_restriction_id`),
  CONSTRAINT `fk_diet_has_dietary_restriction_diet1`
    FOREIGN KEY (`diet_id`)
    REFERENCES `user_diet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diet_has_dietary_restriction_dietary_restriction1`
    FOREIGN KEY (`dietary_restriction_id`)
    REFERENCES `dietary_restriction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diet_has_dietary_restriction_strictness1`
    FOREIGN KEY (`strictness_id`)
    REFERENCES `strictness` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_has_dietary_restriction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_has_dietary_restriction` ;

CREATE TABLE IF NOT EXISTS `meal_has_dietary_restriction` (
  `meal_id` INT NOT NULL,
  `dietary_restriction_id` INT NOT NULL,
  PRIMARY KEY (`meal_id`, `dietary_restriction_id`),
  CONSTRAINT `fk_meal_has_dietary_restriction_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_has_dietary_restriction_dietary_restriction1`
    FOREIGN KEY (`dietary_restriction_id`)
    REFERENCES `dietary_restriction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_catagory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `diet_catagory` ;

CREATE TABLE IF NOT EXISTS `diet_catagory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_has_diet_catagory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_has_diet_catagory` ;

CREATE TABLE IF NOT EXISTS `meal_has_diet_catagory` (
  `meal_id` INT NOT NULL,
  `diet_catagory_id` INT NOT NULL,
  PRIMARY KEY (`meal_id`, `diet_catagory_id`),
  CONSTRAINT `fk_meal_has_diet_catagory_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_has_diet_catagory_diet_catagory1`
    FOREIGN KEY (`diet_catagory_id`)
    REFERENCES `diet_catagory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_catagory_has_dietary_restriction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `diet_catagory_has_dietary_restriction` ;

CREATE TABLE IF NOT EXISTS `diet_catagory_has_dietary_restriction` (
  `diet_catagory_id` INT NOT NULL,
  `dietary_restriction_id` INT NOT NULL,
  PRIMARY KEY (`diet_catagory_id`, `dietary_restriction_id`),
  CONSTRAINT `fk_diet_catagory_has_dietary_restriction_diet_catagory1`
    FOREIGN KEY (`diet_catagory_id`)
    REFERENCES `diet_catagory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diet_catagory_has_dietary_restriction_dietary_restriction1`
    FOREIGN KEY (`dietary_restriction_id`)
    REFERENCES `dietary_restriction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_plan` ;

CREATE TABLE IF NOT EXISTS `meal_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `enabled` TINYINT NOT NULL,
  `shared` TINYINT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_meal_plan_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal` ;

CREATE TABLE IF NOT EXISTS `meal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `planned_meal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `planned_meal` ;

CREATE TABLE IF NOT EXISTS `planned_meal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `meal_plan_id` INT NOT NULL,
  `dish_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
  `day_of_week` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_meal_plan_has_meal_meal_plan1`
    FOREIGN KEY (`meal_plan_id`)
    REFERENCES `meal_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_plan_has_meal_meal1`
    FOREIGN KEY (`dish_id`)
    REFERENCES `dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_plan_meal_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `meal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cuisine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cuisine` ;

CREATE TABLE IF NOT EXISTS `cuisine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_dish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_dish` ;

CREATE TABLE IF NOT EXISTS `favorite_dish` (
  `user_id` INT NOT NULL,
  `dish_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `dish_id`),
  CONSTRAINT `fk_user_has_dish_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_dish_dish1`
    FOREIGN KEY (`dish_id`)
    REFERENCES `dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cuisine_has_dish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cuisine_has_dish` ;

CREATE TABLE IF NOT EXISTS `cuisine_has_dish` (
  `cuisine_id` INT NOT NULL,
  `dish_id` INT NOT NULL,
  PRIMARY KEY (`cuisine_id`, `dish_id`),
  CONSTRAINT `fk_cuisine_has_dish_cuisine1`
    FOREIGN KEY (`cuisine_id`)
    REFERENCES `cuisine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuisine_has_dish_dish1`
    FOREIGN KEY (`dish_id`)
    REFERENCES `dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dish_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dish_rating` ;

CREATE TABLE IF NOT EXISTS `dish_rating` (
  `user_id` INT NOT NULL,
  `dish_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `remarks` TEXT NULL,
  `date_created` DATETIME NOT NULL,
  `last_update` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`, `dish_id`),
  CONSTRAINT `fk_user_has_dish_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_dish_dish2`
    FOREIGN KEY (`dish_id`)
    REFERENCES `dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS client@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'client'@'localhost' IDENTIFIED BY 'client';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'client'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `user` (`id`, `enabled`, `username`, `role`, `password`, `first_name`, `last_name`, `email`, `date_of_birth`, `date_created`, `last_update`, `profile_image_url`, `about_me`) VALUES (1, 1, 'joeadmin', NULL, 'admin', 'Joe', 'Admin', NULL, NULL, '2022-12-02', '2022-12-02', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (1, 'Meal', NULL);
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (2, 'Meal replacement', NULL);
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (3, 'Snack', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `strictness`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `strictness` (`id`, `strictness_level`, `description`) VALUES (1, 'Preference', NULL);
INSERT INTO `strictness` (`id`, `strictness_level`, `description`) VALUES (2, 'Sensitivity', NULL);
INSERT INTO `strictness` (`id`, `strictness_level`, `description`) VALUES (3, 'Allergy', NULL);
INSERT INTO `strictness` (`id`, `strictness_level`, `description`) VALUES (4, 'Religious', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `meal` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Breakfast', NULL, NULL);
INSERT INTO `meal` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Lunch', NULL, NULL);
INSERT INTO `meal` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Dinner', NULL, NULL);

COMMIT;

