-- MySQL Script generated by MySQL Workbench
-- Wed May 20 14:50:04 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ventas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ventas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ventas` DEFAULT CHARACTER SET utf8 ;
USE `ventas` ;

-- -----------------------------------------------------
-- Table `ventas`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`categoria` (
  `IDCategoria` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDCategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ventas`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`cliente` (
  `IDCliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido_Paterno` VARCHAR(45) NOT NULL,
  `Aplellido_Materno` VARCHAR(45) NOT NULL,
  `Direccion` TEXT NULL DEFAULT NULL,
  `Telefono` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`IDCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ventas`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`usuario` (
  `IDUsuario` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido Paterno` VARCHAR(45) NOT NULL,
  `Apellido Materno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ventas`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`venta` (
  `IDVenta` INT NOT NULL AUTO_INCREMENT,
  `Total` DECIMAL(5,2) NOT NULL,
  `Fecha` DATE NOT NULL,
  `IDUsuario` INT NOT NULL,
  `IDCliente` INT NOT NULL,
  PRIMARY KEY (`IDVenta`),
  INDEX `IDUsuarios_idx` (`IDUsuario` ASC) VISIBLE,
  INDEX `IDClientes_idx` (`IDCliente` ASC) VISIBLE,
  CONSTRAINT `IDClientes`
    FOREIGN KEY (`IDCliente`)
    REFERENCES `ventas`.`cliente` (`IDCliente`),
  CONSTRAINT `IDUsuarios`
    FOREIGN KEY (`IDUsuario`)
    REFERENCES `ventas`.`usuario` (`IDUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ventas`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`producto` (
  `IDProducto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `IDCategoria` INT NOT NULL,
  PRIMARY KEY (`IDProducto`),
  INDEX `IDCategorias_idx` (`IDCategoria` ASC) VISIBLE,
  CONSTRAINT `IDCategorias`
    FOREIGN KEY (`IDCategoria`)
    REFERENCES `ventas`.`categoria` (`IDCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ventas`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`detalle_venta` (
  `IDDetalle` INT NOT NULL AUTO_INCREMENT,
  `numFactura` VARCHAR(45) NOT NULL,
  `SubTotal` DECIMAL(5,2) NOT NULL,
  `Cantidad` INT NOT NULL,
  `IDVenta` INT NOT NULL,
  `IDProducto` INT NOT NULL,
  PRIMARY KEY (`IDDetalle`),
  INDEX `IDVentas_idx` (`IDVenta` ASC) VISIBLE,
  INDEX `IDProductos_idx` (`IDProducto` ASC) VISIBLE,
  CONSTRAINT `IDVentas`
    FOREIGN KEY (`IDVenta`)
    REFERENCES `ventas`.`venta` (`IDVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDProductos`
    FOREIGN KEY (`IDProducto`)
    REFERENCES `ventas`.`producto` (`IDProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;