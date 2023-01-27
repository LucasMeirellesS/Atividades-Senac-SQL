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
  `nome` VARCHAR(255) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `tipo_graduacao` ENUM('residente', 'especialista', 'generalista') NOT NULL,
  `CRM` VARCHAR(45) NOT NULL,
  `num_telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `CRM_UNIQUE` (`CRM` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Especialidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Descrição` ENUM('pediatria', 'clínica geral', 'gastroenterologia', 'dermatologia') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`convenio` (
  `id` INT NOT NULL,
  `nome_convenio` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
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
  `email` VARCHAR(45) NOT NULL,
  `id_convenio` INT NULL,
  `num_carteira_convenio` VARCHAR(45) NULL,
  `tempo_carencia` VARCHAR(10) NULL,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_Paciênte_Convênio1_idx` (`id_convenio` ASC) VISIBLE,
  UNIQUE INDEX `RG_UNIQUE` (`RG` ASC) VISIBLE,
  UNIQUE INDEX `num_carteira_convenio_UNIQUE` (`num_carteira_convenio` ASC) VISIBLE,
  CONSTRAINT `fk_Paciênte_Convênio1`
    FOREIGN KEY (`id_convenio`)
    REFERENCES `hospital`.`convenio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`medico_especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`medico_especialidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_medico` INT NOT NULL,
  `id_Especialidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Médico_has_Especialidade_Médico1_idx` (`id_medico` ASC) VISIBLE,
  INDEX `fk_medico_especialidade_Especialidade1_idx` (`id_Especialidade` ASC) VISIBLE,
  CONSTRAINT `fk_Médico_has_Especialidade_Médico1`
    FOREIGN KEY (`id_medico`)
    REFERENCES `hospital`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico_especialidade_Especialidade1`
    FOREIGN KEY (`id_Especialidade`)
    REFERENCES `hospital`.`Especialidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`consulta` (
  `id` INT NOT NULL,
  `DataHora` DATETIME NOT NULL,
  `valor` DECIMAL(9,2) NOT NULL,
  `id_paciente` INT NOT NULL,
  `id_convenio` INT NULL,
  `id_medicos_especilaidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Consulta_Paciênte1_idx` (`id_paciente` ASC) VISIBLE,
  INDEX `fk_Consulta_Convênio1_idx` (`id_convenio` ASC) VISIBLE,
  INDEX `fk_Consulta_Médico_Especialidade1_idx` (`id_medicos_especilaidade` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Paciênte1`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `hospital`.`paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Convênio1`
    FOREIGN KEY (`id_convenio`)
    REFERENCES `hospital`.`convenio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Médico_Especialidade1`
    FOREIGN KEY (`id_medicos_especilaidade`)
    REFERENCES `hospital`.`medico_especialidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Receita` (
  `id_consulta` INT NOT NULL,
  `Remédio` VARCHAR(255) NOT NULL,
  `Tratamento` LONGTEXT NOT NULL,
  INDEX `fk_Receita_consulta1_idx` (`id_consulta` ASC) VISIBLE,
  CONSTRAINT `fk_Receita_consulta1`
    FOREIGN KEY (`id_consulta`)
    REFERENCES `hospital`.`consulta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`enfermeiro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `cre` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `hospital`.`Tipo_quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Tipo_quarto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` LONGTEXT NOT NULL,
  `valor_diaria` DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `hospital`.`quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`quarto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_quarto` INT NOT NULL,
  `numero` INT NOT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipo_quarto` (`id_tipo_quarto` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_quarto`
    FOREIGN KEY (`id_tipo_quarto`)
    REFERENCES `hospital`.`Tipo_quarto` (`id`));


-- -----------------------------------------------------
-- Table `hospital`.`internacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`internacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_medico` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  `id_quarto` INT NOT NULL,
  `data_entrada` DATE NOT NULL,
  `data_prev_alta` DATE NOT NULL,
  `data_alta` DATE NOT NULL,
  `procedimento` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medico` (`id_medico` ASC) VISIBLE,
  INDEX `fk_paciente` (`id_paciente` ASC) VISIBLE,
  INDEX `fk_quarto` (`id_quarto` ASC) VISIBLE,
  CONSTRAINT `fk_medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `hospital`.`medico` (`id`),
  CONSTRAINT `fk_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `hospital`.`paciente` (`id`),
  CONSTRAINT `fk_quarto`
    FOREIGN KEY (`id_quarto`)
    REFERENCES `hospital`.`quarto` (`id`));


-- -----------------------------------------------------
-- Table `hospital`.`requer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`requer` (
  `id_enfermeiro` INT NOT NULL,
  `id_internacao` INT NOT NULL,
  INDEX `fk_internacao` (`id_internacao` ASC) VISIBLE,
  CONSTRAINT `fk_enfermeiro`
    FOREIGN KEY (`id_enfermeiro`)
    REFERENCES `hospital`.`enfermeiro` (`id`),
  CONSTRAINT `fk_internacao`
    FOREIGN KEY (`id_internacao`)
    REFERENCES `hospital`.`internacao` (`id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
