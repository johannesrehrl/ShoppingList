-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema shopping_list
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shopping_list
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shopping_list` DEFAULT CHARACTER SET utf8 ;
USE `shopping_list` ;

-- -----------------------------------------------------
-- Table `shopping_list`.`household`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`household` (
  `houshold_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`houshold_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping_list`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(128) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `household_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_household`
    FOREIGN KEY (`household_id`)
    REFERENCES `shopping_list`.`household` (`houshold_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- CREATE INDEX `user_household_idx` ON `shopping_list`.`user` (`household_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `shopping_list`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `shopping_list`.`shopping_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`shopping_list` (
  `shopping_list_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `comment` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `household_id` INT NOT NULL,
  PRIMARY KEY (`shopping_list_id`),
  CONSTRAINT `fk_shopping_list_household`
    FOREIGN KEY (`household_id`)
    REFERENCES `shopping_list`.`household` (`houshold_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- CREATE INDEX `fk_shopping_list_household_idx` ON `shopping_list`.`shopping_list` (`household_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `shopping_list`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`article` (
  `article_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  `comment` VARCHAR(255) NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`article_id`),
  CONSTRAINT `article_category_fk`
    FOREIGN KEY (`category_id`)
    REFERENCES `shopping_list`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- CREATE INDEX `article_category_fk_idx` ON `shopping_list`.`article` (`category_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `shopping_list`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`purchase` (
  `purchase` INT NOT NULL AUTO_INCREMENT,
  `shopping_list_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  `in_cart` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`purchase`),
  CONSTRAINT `purchase_shopping_list_fk`
    FOREIGN KEY (`shopping_list_id`)
    REFERENCES `shopping_list`.`shopping_list` (`shopping_list_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `purchase_article_fk`
    FOREIGN KEY (`article_id`)
    REFERENCES `shopping_list`.`article` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- CREATE INDEX `purchase_shopping_list_fk_idx` ON `shopping_list`.`purchase` (`shopping_list_id` ASC) VISIBLE;

-- CREATE INDEX `purchase_article_fk_idx` ON `shopping_list`.`purchase` (`article_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
