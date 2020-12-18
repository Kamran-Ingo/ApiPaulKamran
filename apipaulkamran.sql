-- MySQL Script generated by MySQL Workbench
-- Fri Dec 18 16:19:40 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema apipaulkamran
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `apipaulkamran` ;

-- -----------------------------------------------------
-- Schema apipaulkamran
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `apipaulkamran` DEFAULT CHARACTER SET utf8 ;
USE `apipaulkamran` ;

-- -----------------------------------------------------
-- Table `apipaulkamran`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`User` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apipaulkamran`.`Asset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`Asset` (
  `id_asset` INT NOT NULL AUTO_INCREMENT,
  `nomasset` VARCHAR(45) NOT NULL,
  `link` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_asset`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apipaulkamran`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`group` (
  `idgroupe` INT NOT NULL AUTO_INCREMENT,
  `nomgroupe` VARCHAR(45) NOT NULL,
  `Asset_idAsset` INT NOT NULL,
  `Asset_Image_idImage` INT NOT NULL,
  `Asset_Video_idVideo` INT NOT NULL,
  `User_iduser` INT NOT NULL,
  PRIMARY KEY (`idgroupe`),
  INDEX `fk_groupe_Asset1_idx` (`Asset_idAsset` ASC, `Asset_Image_idImage` ASC, `Asset_Video_idVideo` ASC) VISIBLE,
  INDEX `fk_groupe_User1_idx` (`User_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_groupe_asset1`
    FOREIGN KEY (`Asset_idAsset`)
    REFERENCES `apipaulkamran`.`Asset` (`id_asset`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_groupe_user1`
    FOREIGN KEY (`User_iduser`)
    REFERENCES `apipaulkamran`.`User` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apipaulkamran`.`Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`Image` (
  `nomimage` VARCHAR(45) NOT NULL,
  `Resolution` VARCHAR(45) NOT NULL,
  `Asset_idAsset` INT NOT NULL,
  PRIMARY KEY (`Asset_idAsset`),
  CONSTRAINT `fk_Image_Asset1`
    FOREIGN KEY (`Asset_idAsset`)
    REFERENCES `apipaulkamran`.`Asset` (`id_asset`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apipaulkamran`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`Video` (
  `nomvideo` VARCHAR(45) NOT NULL,
  `qualite` VARCHAR(45) NOT NULL,
  `Asset_idAsset` INT NOT NULL,
  PRIMARY KEY (`Asset_idAsset`),
  CONSTRAINT `fk_Video_Asset1`
    FOREIGN KEY (`Asset_idAsset`)
    REFERENCES `apipaulkamran`.`Asset` (`id_asset`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apipaulkamran`.`Conversation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`Conversation` (
  `id_conversation` INT NOT NULL AUTO_INCREMENT,
  `User_receiver_id` INT NOT NULL,
  `User_sender_id` INT NOT NULL,
  INDEX `fk_Conversation_User1_idx` (`User_receiver_id` ASC) VISIBLE,
  INDEX `fk_Conversation_User2_idx` (`User_sender_id` ASC) VISIBLE,
  PRIMARY KEY (`id_conversation`),
  CONSTRAINT `fk_Conversation_User1`
    FOREIGN KEY (`User_receiver_id`)
    REFERENCES `apipaulkamran`.`User` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conversation_User2`
    FOREIGN KEY (`User_sender_id`)
    REFERENCES `apipaulkamran`.`User` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apipaulkamran`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`Member` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `id_groupe` INT NOT NULL,
  PRIMARY KEY (`id_user`, `id_groupe`),
  INDEX `fk_User_has_groupe_groupe1_idx` (`id_groupe` ASC) VISIBLE,
  INDEX `fk_User_has_groupe_User1_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_groupe_User1`
    FOREIGN KEY (`id_user`)
    REFERENCES `apipaulkamran`.`User` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_groupe_groupe1`
    FOREIGN KEY (`id_groupe`)
    REFERENCES `apipaulkamran`.`group` (`idgroupe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apipaulkamran`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apipaulkamran`.`Message` (
  `id_message` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `create_time` DATETIME NOT NULL,
  `Conversation_id_Conversation` INT NOT NULL,
  INDEX `fk_Message_Conversation1_idx` (`Conversation_id_Conversation` ASC) VISIBLE,
  PRIMARY KEY (`id_message`),
  CONSTRAINT `idconversation`
    FOREIGN KEY ()
    REFERENCES `apipaulkamran`.`Conversation` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Message_Conversation1`
    FOREIGN KEY (`Conversation_id_Conversation`)
    REFERENCES `apipaulkamran`.`Conversation` (`id_conversation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
