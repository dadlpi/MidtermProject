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
  `name` VARCHAR(60) NOT NULL,
  `description` TEXT NULL,
  `calories` INT NULL,
  `image_url` VARCHAR(4000) NULL,
  `protein_grams` INT NULL,
  `fat_grams` INT NULL,
  `carbs_grams` INT NULL,
  `user_id` INT NOT NULL,
  `recipe_url` VARCHAR(2000) NOT NULL,
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
-- Table `dietary_friendly_dish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dietary_friendly_dish` ;

CREATE TABLE IF NOT EXISTS `dietary_friendly_dish` (
  `dish_id` INT NOT NULL,
  `dietary_restriction_id` INT NOT NULL,
  PRIMARY KEY (`dish_id`, `dietary_restriction_id`),
  CONSTRAINT `fk_meal_has_dietary_restriction_meal1`
    FOREIGN KEY (`dish_id`)
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
-- Table `diet_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `diet_category` ;

CREATE TABLE IF NOT EXISTS `diet_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dish_diet_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dish_diet_category` ;

CREATE TABLE IF NOT EXISTS `dish_diet_category` (
  `dish_id` INT NOT NULL,
  `diet_category_id` INT NOT NULL,
  PRIMARY KEY (`dish_id`, `diet_category_id`),
  CONSTRAINT `fk_meal_has_diet_catagory_meal1`
    FOREIGN KEY (`dish_id`)
    REFERENCES `dish` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_has_diet_catagory_diet_catagory1`
    FOREIGN KEY (`diet_category_id`)
    REFERENCES `diet_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_category_has_dietary_restriction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `diet_category_has_dietary_restriction` ;

CREATE TABLE IF NOT EXISTS `diet_category_has_dietary_restriction` (
  `diet_category_id` INT NOT NULL,
  `dietary_restriction_id` INT NOT NULL,
  PRIMARY KEY (`diet_category_id`, `dietary_restriction_id`),
  CONSTRAINT `fk_diet_catagory_has_dietary_restriction_diet_catagory1`
    FOREIGN KEY (`diet_category_id`)
    REFERENCES `diet_category` (`id`)
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
INSERT INTO `user` (`id`, `enabled`, `username`, `role`, `password`, `first_name`, `last_name`, `email`, `date_of_birth`, `date_created`, `last_update`, `profile_image_url`, `about_me`) VALUES (1, 1, 'joeadmin', NULL, 'admin', 'Joe', 'Admin', NULL, NULL, '2020-05-15 15:20:36', '2020-05-15 15:20:36', NULL, NULL);

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
-- Data for table `dish`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `dish` (`id`, `name`, `description`, `calories`, `image_url`, `protein_grams`, `fat_grams`, `carbs_grams`, `user_id`, `recipe_url`, `meal_type_id`, `date_created`, `last_update`, `enabled`) VALUES (1, 'Easy Butter Chicken', 'Super tasty dish with an amazing flavor. ', 430, 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fs3.amazonaws.com%2Fvideo-api-prod%2Fassets%2F6e6a56c27c68410991ce7d4e4acc7dee%2FBFV8692_Easy_Butter_Chicken_Thumb.jpg&tbnid=WEtK6AIBte2kTM&vet=12ahUKEwj0_f3eqYiDAxXpOkQIHQ7CCJsQMygBegQIARBP..i&imgrefurl=https%3A%2F%2Ftasty.co%2Frecipe%2Feasy-butter-chicken&docid=-S8rv04_knEP3M&w=1080&h=1080&q=easy%20butter%20chicken%20carbs&ved=2ahUKEwj0_f3eqYiDAxXpOkQIHQ7CCJsQMygBegQIARBP', 30, 28, 14, 1, 'https://tasty.co/recipe/easy-butter-chicken', 1, '2020-09-02 13:23:12', '2020-09-02 13:23:12', 1);
INSERT INTO `dish` (`id`, `name`, `description`, `calories`, `image_url`, `protein_grams`, `fat_grams`, `carbs_grams`, `user_id`, `recipe_url`, `meal_type_id`, `date_created`, `last_update`, `enabled`) VALUES (2, 'Veggie Garlic Noodles', 'Its good if you like veggies', 365, 'https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/tips/67a4489f9c30452999e10176b7a09e23.jpeg?downsize=800:*&output-format=auto&output-quality=auto', 7, 7, 66, 1, 'https://tasty.co/recipe/veggie-garlic-noodles', 1, '2020-09-02 13:23:12', '2020-09-02 13:23:12', 1);
INSERT INTO `dish` (`id`, `name`, `description`, `calories`, `image_url`, `protein_grams`, `fat_grams`, `carbs_grams`, `user_id`, `recipe_url`, `meal_type_id`, `date_created`, `last_update`, `enabled`) VALUES (3, 'Sheet Pan Quesadilla with Jalapeño Ranch', 'Spicy but yum yum yum deliciouso', 542, 'https://images.themodernproper.com/billowy-turkey/production/posts/2020/sheetpan-quesadilla-9.jpg?w=800&q=82&fm=jpg&fit=crop&dm=1603458592&s=512107d73984dfb25b200d1521e95934', 13, 34, 48, 1, 'https://themodernproper.com/sheet-pan-quesadilla-with-jalapeno-ranch', 1, '2020-09-02 13:23:12', '2020-09-02 13:23:12', 1);
INSERT INTO `dish` (`id`, `name`, `description`, `calories`, `image_url`, `protein_grams`, `fat_grams`, `carbs_grams`, `user_id`, `recipe_url`, `meal_type_id`, `date_created`, `last_update`, `enabled`) VALUES (4, 'Swedish Meatballs (Svenska Kottbullar)', 'A Nordic master piece  ', 309, 'https://www.allrecipes.com/thmb/2ndh4FTc4_n0i0aLhjTiB7MCFkE=/160x90/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/216564-swedish-meatballs-svenska-kottbullar-DDMFS-4x3-2cfaeac162c9485dbd7d632fd0b6ef0a.jpg', 17, 21, 12, 1, 'https://allrecipes.com/recipe/216564/swedish-meatballs-svenska-kottbullar/', 1, '2020-09-02 13:23:12', '2020-09-02 13:23:12', 1);
INSERT INTO `dish` (`id`, `name`, `description`, `calories`, `image_url`, `protein_grams`, `fat_grams`, `carbs_grams`, `user_id`, `recipe_url`, `meal_type_id`, `date_created`, `last_update`, `enabled`) VALUES (5, 'Authentic Swedish Pancakes\n', 'A divine breakfast delight', 66, 'https://www.allrecipes.com/thmb/sfOBZQ8Q3FEux9XBnaKhLtTsR48=/160x90/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/246952authentic-swedish-pancakeslutzflcat4x3-b41c3fdea3e04adc8eec0df7fd2f6b9f.jpg', 3, 3, 8, 1, 'https://www.allrecipes.com/recipe/246952/authentic-swedish-pancakes/', 1, '2020-09-02 13:23:12', '2020-09-02 13:23:12', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dietary_restriction`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Nuts', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Yeast', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Histamine ', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Lactose', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (5, 'Egg', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Chicken', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (7, 'Nightshade', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (8, 'Caffeine', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (9, 'Gluten', NULL, NULL);
INSERT INTO `dietary_restriction` (`id`, `name`, `description`, `image_url`) VALUES (10, 'Soy', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_diet`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `user_diet` (`id`, `name`, `description`, `user_id`, `date_created`, `last_update`, `enabled`) VALUES (1, 'Body Building', 'High in protein', 1, '2021-08-23 15:26:50', '2021-08-23 15:26:50', 1);
INSERT INTO `user_diet` (`id`, `name`, `description`, `user_id`, `date_created`, `last_update`, `enabled`) VALUES (2, 'Lean And Mean', 'Low Calorie, High Protein', 1, '2021-08-23 15:26:50', '2021-08-23 15:26:50', 2);
INSERT INTO `user_diet` (`id`, `name`, `description`, `user_id`, `date_created`, `last_update`, `enabled`) VALUES (3, 'Detox', 'Purging that body', 1, '2021-08-23 15:26:50', '2021-08-23 15:26:50', 1);

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
-- Data for table `user_diet_restriction`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `user_diet_restriction` (`diet_id`, `dietary_restriction_id`, `strictness_id`, `description`) VALUES (1, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diet_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `diet_category` (`id`, `name`) VALUES (1, 'Keto');
INSERT INTO `diet_category` (`id`, `name`) VALUES (2, 'Vegan');
INSERT INTO `diet_category` (`id`, `name`) VALUES (3, 'Carnivore ');
INSERT INTO `diet_category` (`id`, `name`) VALUES (4, 'Vegaterian');
INSERT INTO `diet_category` (`id`, `name`) VALUES (5, 'Kosher');
INSERT INTO `diet_category` (`id`, `name`) VALUES (6, 'Halal');
INSERT INTO `diet_category` (`id`, `name`) VALUES (7, 'Fruitarianism');
INSERT INTO `diet_category` (`id`, `name`) VALUES (8, 'Paleolithic');
INSERT INTO `diet_category` (`id`, `name`) VALUES (9, 'Pescatarian');
INSERT INTO `diet_category` (`id`, `name`) VALUES (10, 'None');

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `meal_plan` (`id`, `title`, `user_id`, `date_created`, `last_update`, `enabled`, `shared`, `description`) VALUES (1, 'Champ\'s Meal', 1, '2021-08-23 15:26:50', '2021-08-23 15:26:50', 1, 2, 'I want to eat like a champ.');

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


-- -----------------------------------------------------
-- Data for table `planned_meal`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `planned_meal` (`id`, `meal_plan_id`, `dish_id`, `meal_id`, `day_of_week`, `description`) VALUES (1, 1, 1, 2, '1', 'Gains incoming');
INSERT INTO `planned_meal` (`id`, `meal_plan_id`, `dish_id`, `meal_id`, `day_of_week`, `description`) VALUES (2, 1, 2, 2, '2', 'Gain outward');
INSERT INTO `planned_meal` (`id`, `meal_plan_id`, `dish_id`, `meal_id`, `day_of_week`, `description`) VALUES (3, 1, 3, 2, '3', 'Kindve Mexican');
INSERT INTO `planned_meal` (`id`, `meal_plan_id`, `dish_id`, `meal_id`, `day_of_week`, `description`) VALUES (4, 1, 4, 3, '4', 'Sweet and savory');
INSERT INTO `planned_meal` (`id`, `meal_plan_id`, `dish_id`, `meal_id`, `day_of_week`, `description`) VALUES (5, 1, 5, 1, '5', 'Like Crepes but better!');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cuisine`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `cuisine` (`id`, `name`) VALUES (1, 'Mexican');
INSERT INTO `cuisine` (`id`, `name`) VALUES (2, 'American');
INSERT INTO `cuisine` (`id`, `name`) VALUES (3, 'Italian');
INSERT INTO `cuisine` (`id`, `name`) VALUES (4, 'Mediterranean');
INSERT INTO `cuisine` (`id`, `name`) VALUES (5, 'Japanese');
INSERT INTO `cuisine` (`id`, `name`) VALUES (6, 'Korean');
INSERT INTO `cuisine` (`id`, `name`) VALUES (7, 'Greek');
INSERT INTO `cuisine` (`id`, `name`) VALUES (8, 'Indian');
INSERT INTO `cuisine` (`id`, `name`) VALUES (9, 'Carribean ');
INSERT INTO `cuisine` (`id`, `name`) VALUES (10, 'Scandinavian');
INSERT INTO `cuisine` (`id`, `name`) VALUES (11, 'Thai');
INSERT INTO `cuisine` (`id`, `name`) VALUES (12, 'Brazilian ');
INSERT INTO `cuisine` (`id`, `name`) VALUES (13, 'Chinese');
INSERT INTO `cuisine` (`id`, `name`) VALUES (14, 'Mongolian');
INSERT INTO `cuisine` (`id`, `name`) VALUES (15, 'Lebanese');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_dish`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `favorite_dish` (`user_id`, `dish_id`) VALUES (1, 1);
INSERT INTO `favorite_dish` (`user_id`, `dish_id`) VALUES (1, 2);
INSERT INTO `favorite_dish` (`user_id`, `dish_id`) VALUES (1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cuisine_has_dish`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (2, 1);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (3, 1);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (8, 1);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (12, 1);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (2, 2);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (13, 2);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (1, 3);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (2, 3);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (10, 4);
INSERT INTO `cuisine_has_dish` (`cuisine_id`, `dish_id`) VALUES (10, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dish_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `emporiumdb`;
INSERT INTO `dish_rating` (`user_id`, `dish_id`, `rating`, `remarks`, `date_created`, `last_update`) VALUES (1, 1, 4, 'Delicious but chef used too much butter', '2019-05-16 17:45:12', '2019-05-16 17:45:12');
INSERT INTO `dish_rating` (`user_id`, `dish_id`, `rating`, `remarks`, `date_created`, `last_update`) VALUES (1, 2, 5, 'Outstanding!', '2019-05-16 17:45:12', '2019-05-16 17:45:12');
INSERT INTO `dish_rating` (`user_id`, `dish_id`, `rating`, `remarks`, `date_created`, `last_update`) VALUES (1, 3, 3, 'Not mexican enough', '2019-05-16 17:45:12', '2019-05-16 17:45:12');
INSERT INTO `dish_rating` (`user_id`, `dish_id`, `rating`, `remarks`, `date_created`, `last_update`) VALUES (1, 4, 2, 'too much meat on those balls! ', '2019-05-16 17:45:12', '2019-05-16 17:45:12');
INSERT INTO `dish_rating` (`user_id`, `dish_id`, `rating`, `remarks`, `date_created`, `last_update`) VALUES (1, 5, 5, 'By far the best Dish ! Boogie Boogie', '2019-05-16 17:45:12', '2019-05-16 17:45:12');

COMMIT;

