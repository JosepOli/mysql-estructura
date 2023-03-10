-- MySQL Script generated by MySQL Workbench
-- Sat Feb  4 23:27:43 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema S201N1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema S201N1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `S201N1` DEFAULT CHARACTER SET utf8 ;
USE `S201N1` ;

-- -----------------------------------------------------
-- Table `S201N1`.`adreça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201N1`.`adreça` (
  `idadreça` INT NOT NULL AUTO_INCREMENT,
  `adreça_carrer` VARCHAR(45) NOT NULL COMMENT 'Conté la part del carrer de la direcció',
  `adreça_num` VARCHAR(8) NOT NULL COMMENT 'Conté la part del número de la direcció',
  `adreça_pis` VARCHAR(8) NULL COMMENT 'Conté la part del pis de la direcció',
  `adreça_porta` VARCHAR(4) NULL COMMENT 'Conté la part de la porta de la direcció',
  `adreça_ciutat` VARCHAR(45) NOT NULL COMMENT 'Conté la ciutat de la direcció',
  `adreça_CP` INT(5) NOT NULL COMMENT 'Conté el codi postal de la direcció',
  `adreça_pais` VARCHAR(40) NOT NULL COMMENT 'Conté la part del pais de la direcció',
  PRIMARY KEY (`idadreça`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S201N1`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201N1`.`proveidor` (
  `idproveidor` INT NOT NULL AUTO_INCREMENT,
  `proveidor_nom` VARCHAR(45) NOT NULL COMMENT 'Conté el nom del proveidor',
  `proveidor_tel` INT(20) NULL COMMENT 'Conté el num de telèfon del proveidor',
  `proveidor_fax` INT(20) NULL COMMENT 'Conté el num de fax del proveidor',
  `proveidor_NIF` VARCHAR(9) NULL COMMENT 'Conté el num de NIF del proveidor.',
  `adreça_idadreça` INT NOT NULL,
  PRIMARY KEY (`idproveidor`),
  INDEX `fk_proveidor_adreça1_idx` (`adreça_idadreça` ASC) VISIBLE,
  CONSTRAINT `fk_proveidor_adreça1`
    FOREIGN KEY (`adreça_idadreça`)
    REFERENCES `S201N1`.`adreça` (`idadreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S201N1`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201N1`.`empleats` (
  `idempleats` INT NOT NULL,
  `empleats_nom` VARCHAR(45) NULL COMMENT 'Nom de l\'empleat que ha realitzat la venda de les ulleres.',
  PRIMARY KEY (`idempleats`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S201N1`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201N1`.`ulleres` (
  `idulleres` INT NOT NULL AUTO_INCREMENT,
  `ulleres_marca` VARCHAR(45) NOT NULL COMMENT 'Marca d\'ulleres',
  `ulleres_graduacio` VARCHAR(45) NOT NULL COMMENT 'Graduació dels vidres',
  `ulleres_montura` VARCHAR(10) NOT NULL COMMENT 'Tipus de montura. Flotant, pasta o metàl·lica.',
  `ulleres_color_montura` VARCHAR(20) NOT NULL COMMENT 'Color de la montura',
  `ulleres_color_vidre` VARCHAR(20) NOT NULL COMMENT 'Color dels vidres',
  `ulleres_preu` INT(10) NULL,
  `proveidor_idproveidor` INT NOT NULL,
  `empleats_idempleats` INT NOT NULL,
  PRIMARY KEY (`idulleres`),
  UNIQUE INDEX `ulleres_marca_UNIQUE` (`ulleres_marca` ASC) VISIBLE,
  INDEX `fk_ulleres_proveidor1_idx` (`proveidor_idproveidor` ASC) VISIBLE,
  INDEX `fk_ulleres_empleats1_idx` (`empleats_idempleats` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_proveidor1`
    FOREIGN KEY (`proveidor_idproveidor`)
    REFERENCES `S201N1`.`proveidor` (`idproveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_empleats1`
    FOREIGN KEY (`empleats_idempleats`)
    REFERENCES `S201N1`.`empleats` (`idempleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S201N1`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201N1`.`clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `clients_nom` VARCHAR(45) NULL COMMENT 'Nom del client',
  `clients_telefon` INT(15) NULL COMMENT 'Num de telefon del client',
  `clients_email` VARCHAR(255) NULL COMMENT 'Direcció de correu electrònic del client',
  `clients_data_registre` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de registre del client\n',
  `adreça_idadreça` INT NOT NULL,
  `client_referit` INT NULL,
  PRIMARY KEY (`idclients`),
  UNIQUE INDEX `clients_telefon_UNIQUE` (`clients_telefon` ASC) VISIBLE,
  INDEX `fk_clients_adreça1_idx` (`adreça_idadreça` ASC) VISIBLE,
  INDEX `fk_client_referit_idx` (`client_referit` ASC) VISIBLE,
  CONSTRAINT `fk_clients_adreça1`
    FOREIGN KEY (`adreça_idadreça`)
    REFERENCES `S201N1`.`adreça` (`idadreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_referit`
    FOREIGN KEY (`client_referit`)
    REFERENCES `S201N1`.`clients` (`idclients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
