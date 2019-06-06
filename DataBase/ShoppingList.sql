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
-- Table `shopping_list`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(128) NOT NULL,
  `household_id` INT NOT NULL,
  `create_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`));


-- -----------------------------------------------------
-- Table `shopping_list`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`));


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
-- Table `shopping_list`.`shopping_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`shopping_list` (
  `shopping_list_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `comment` VARCHAR(255) NULL,
  `household_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shopping_list_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping_list`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`purchase` (
  `purchase` INT NOT NULL AUTO_INCREMENT,
  `shopping_list_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  `in_cart` TINYINT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping_list`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping_list`.`article` (
  `article_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  `comment` VARCHAR(255) NULL,
  `category_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
