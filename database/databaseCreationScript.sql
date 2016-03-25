SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Java2_test` DEFAULT CHARACTER SET utf8 ;
USE `Java2_test` ;

-- -----------------------------------------------------
-- Table `Java2_test`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`users` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`users` (
  `UserID` INT(11) NOT NULL AUTO_INCREMENT,
  `FirstName` CHAR(32) NOT NULL,
  `LastName` CHAR(32) NOT NULL,
  `Email` CHAR(32) NOT NULL,
  `Password` CHAR(32) NOT NULL,
  PRIMARY KEY (`UserID`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table `Java2_test`.`sites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`sites` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`sites` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` CHAR(50) NOT NULL,
  `URL` CHAR(255) NOT NULL,
  `Description` CHAR(255) NOT NULL,
  PRIMARY KEY (`ID`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1002;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;