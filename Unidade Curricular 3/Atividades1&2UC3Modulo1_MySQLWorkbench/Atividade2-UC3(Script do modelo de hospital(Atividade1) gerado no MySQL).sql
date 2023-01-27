-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 ;
USE `hospital` ;

-- -----------------------------------------------------
-- Table `hospital`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`medico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `Tipo de Graduação` ENUM('residente', 'especialiusta') NOT NULL,
  `CRM` VARCHAR(45) NOT NULL,
  `Especialidade(s)` VARCHAR(45) NOT NULL,
  `num_telefone` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Especialidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Descrição` ENUM('clínica geral', 'gastroenterologia', 'dermatologia') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Convênio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Convênio` (
  `id` INT NOT NULL,
  `num_carteira` VARCHAR(45) NOT NULL,
  `nome_convênio` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `tempo_carência` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`paciente` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `id_convenio` INT NOT NULL,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_Paciênte_Convênio1_idx` (`id_convenio` ASC) VISIBLE,
  CONSTRAINT `fk_Paciênte_Convênio1`
    FOREIGN KEY (`id_convenio`)
    REFERENCES `hospital`.`Convênio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`medico_especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`medico_especialidade` (
  `idmedicos_especilaidase` INT NOT NULL AUTO_INCREMENT,
  `id_medico` INT NOT NULL,
  `Especialidade_id` INT NOT NULL,
  PRIMARY KEY (`idmedicos_especilaidase`),
  INDEX `fk_Médico_has_Especialidade_Médico1_idx` (`id_medico` ASC) VISIBLE,
  INDEX `fk_medico_especialidade_Especialidade1_idx` (`Especialidade_id` ASC) VISIBLE,
  CONSTRAINT `fk_Médico_has_Especialidade_Médico1`
    FOREIGN KEY (`id_medico`)
    REFERENCES `hospital`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico_especialidade_Especialidade1`
    FOREIGN KEY (`Especialidade_id`)
    REFERENCES `hospital`.`Especialidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`consulta` (
  `id` INT NOT NULL,
  `Data/Hora` DATETIME NOT NULL,
  `valor` DECIMAL(9,2) NOT NULL,
  `id_paciente` INT NOT NULL,
  `id_convenio` INT NOT NULL,
  `id_medico` INT NOT NULL,
  `id_medicos_especilaidase` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Consulta_Paciênte1_idx` (`id_paciente` ASC) VISIBLE,
  INDEX `fk_Consulta_Convênio1_idx` (`id_convenio` ASC) VISIBLE,
  INDEX `fk_Consulta_Médico1_idx` (`id_medico` ASC) VISIBLE,
  INDEX `fk_Consulta_Médico_Especialidade1_idx` (`id_medicos_especilaidase` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Paciênte1`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `hospital`.`paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Convênio1`
    FOREIGN KEY (`id_convenio`)
    REFERENCES `hospital`.`Convênio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Médico1`
    FOREIGN KEY (`id_medico`)
    REFERENCES `hospital`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Médico_Especialidade1`
    FOREIGN KEY (`id_medicos_especilaidase`)
    REFERENCES `hospital`.`medico_especialidade` (`idmedicos_especilaidase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Receita` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Remédio` VARCHAR(45) NOT NULL,
  `Tratamento` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
