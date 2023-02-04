-- MySQL Script generated by MySQL Workbench
-- Sat Feb  4 23:19:51 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tipus_producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipus_producte` (
  `idtipus_producte` INT UNSIGNED NOT NULL,
  `tipus_producte` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipus_producte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productes` (
  `idproductes` INT UNSIGNED NOT NULL,
  `productes_nom` VARCHAR(45) NULL COMMENT 'Nom del producte.',
  `productes_descripcio` VARCHAR(255) NULL COMMENT 'Descripció del producte',
  `productes_imatge` BLOB NULL COMMENT 'Imatge del producte',
  `productes_preu` INT(5) NULL COMMENT 'Preu del producte',
  `tipus_producte_idtipus_producte` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idproductes`),
  INDEX `fk_productes_tipus_producte1_idx` (`tipus_producte_idtipus_producte` ASC) VISIBLE,
  CONSTRAINT `fk_productes_tipus_producte1`
    FOREIGN KEY (`tipus_producte_idtipus_producte`)
    REFERENCES `mydb`.`tipus_producte` (`idtipus_producte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productes_comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productes_comanda` (
  `idproductes_comanda` INT NOT NULL AUTO_INCREMENT,
  `productes_idproductes` INT NOT NULL,
  `productes_comanda_quantitat` INT NULL,
  PRIMARY KEY (`idproductes_comanda`),
  INDEX `fk_productes_comanda_productes1_idx` (`productes_idproductes` ASC) VISIBLE,
  CONSTRAINT `fk_productes_comanda_productes1`
    FOREIGN KEY (`productes_idproductes`)
    REFERENCES `mydb`.`productes` (`idproductes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `idclient` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_nom` VARCHAR(45) NULL COMMENT 'Conté el nom del client',
  `client_cognoms` VARCHAR(45) NULL COMMENT 'Conté els cognoms del client',
  `client_adreça` VARCHAR(60) NULL COMMENT 'Adreça del client (Carrer/Avinguda/etc. num. i pis si escau)',
  `client_CP` INT(5) NULL COMMENT 'Codi postal del client',
  `client_localitat` VARCHAR(25) NULL COMMENT 'Localitat del client',
  `client_provincia` VARCHAR(25) NULL COMMENT 'Provincia del client',
  `client_telefon` INT(20) NULL COMMENT 'Telefon del client.',
  PRIMARY KEY (`idclient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleat` (
  `idempleat` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `empleat_nom` VARCHAR(45) NULL,
  `empleat_cognom` VARCHAR(45) NULL,
  `empleatcol_NIF` VARCHAR(45) NULL,
  `empleat_telefon` INT(20) NULL,
  PRIMARY KEY (`idempleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`botiga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`botiga` (
  `id_botiga` INT UNSIGNED NOT NULL,
  `botiga_nom` VARCHAR(45) NULL,
  `empleat_idempleat` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_botiga`),
  INDEX `fk_botiga_empleat1_idx` (`empleat_idempleat` ASC) VISIBLE,
  CONSTRAINT `fk_botiga_empleat1`
    FOREIGN KEY (`empleat_idempleat`)
    REFERENCES `mydb`.`empleat` (`idempleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comanda` (
  `id_comanda` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comanda_data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Hora de creació de la comanda',
  `comanda_tipus` VARCHAR(8) NOT NULL COMMENT 'Tipus de comanda segons si es recull a botiga o s\'ha d\'enviar.\n\nOpcions:\n- Botiga (per a recollida a la botiga)\n- Domicili (per a enviament a domicili)',
  `productes_comanda_idproductes_comanda` INT NOT NULL,
  `client_idclient` INT UNSIGNED NOT NULL,
  `botiga_empleat_idempleat` INT NOT NULL COMMENT 'E',
  INDEX `fk_comanda_productes_comanda1_idx` (`productes_comanda_idproductes_comanda` ASC) VISIBLE,
  PRIMARY KEY (`id_comanda`),
  UNIQUE INDEX `id_comanda_UNIQUE` (`id_comanda` ASC) VISIBLE,
  INDEX `fk_comanda_client1_idx` (`client_idclient` ASC) VISIBLE,
  INDEX `fk_comanda_botiga1_idx` (`botiga_empleat_idempleat` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_productes_comanda1`
    FOREIGN KEY (`productes_comanda_idproductes_comanda`)
    REFERENCES `mydb`.`productes_comanda` (`idproductes_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_client1`
    FOREIGN KEY (`client_idclient`)
    REFERENCES `mydb`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_botiga1`
    FOREIGN KEY (`botiga_empleat_idempleat`)
    REFERENCES `mydb`.`botiga` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;