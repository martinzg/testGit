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
  `UserID`    BIGINT(11)  NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(32) NOT NULL,
  `LastName`  VARCHAR(32) NOT NULL,
  `Email`     VARCHAR(32) NOT NULL,
  `Password`  VARCHAR(32) NOT NULL,
  PRIMARY KEY (`UserID`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table `Java2_test`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`roles` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`roles` (
  `RoleID`   BIGINT(11)  NOT NULL AUTO_INCREMENT,
  `RoleName` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`RoleID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;

INSERT INTO `java2_test`.`roles` VALUES (default, 'GamblingLogRole');

-- -----------------------------------------------------
-- Table `Java2_test`.`user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`user_roles` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`user_roles` (
  `ID`        BIGINT(11)  NOT NULL AUTO_INCREMENT,
  `UserID`    BIGINT(11)  NOT NULL,
  `Email`     VARCHAR(32) NOT NULL,
  `RoleID`    BIGINT(11)  NOT NULL,
  `RoleName`  VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT UserRolesFK1 FOREIGN KEY (`UserID`) REFERENCES users(`UserID`),
  CONSTRAINT UserRolesFK2 FOREIGN KEY (`RoleID`) REFERENCES roles(`RoleID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table `Java2_test`.`user_images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`user_images` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`user_images` (
  `ID`        BIGINT(11)  NOT NULL AUTO_INCREMENT,
  `UserID`    BIGINT(11)  NOT NULL,
  `ImageName` VARCHAR(255) NOT NULL,
  `Image`     LONGBLOB,
  PRIMARY KEY (`ID`),
  CONSTRAINT UserImagesFK FOREIGN KEY (`UserID`) REFERENCES users(`UserID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table `Java2_test`.`user_messages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`user_messages` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`user_messages` (
  `ID`        BIGINT(11)    NOT NULL AUTO_INCREMENT,
  `UserFrom`  VARCHAR(32)   NOT NULL,
  `UserTo`    VARCHAR(32)   NOT NULL,
  `Timestamp` DATETIME      NOT NULL,
  `Message`   VARCHAR(4000)  NOT NULL,
  `ReadState` BOOLEAN       NOT NULL,
  PRIMARY KEY (`ID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table `Java2_test`.`stakes`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `java2_test`.`stakes` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`stakes` (
  `StakeID`    BIGINT(11)                       NOT NULL AUTO_INCREMENT,
  `Date`        DATE                         NOT NULL,
  `URL`         VARCHAR(50)                   NOT NULL,
  `Event`       VARCHAR(50)                   NOT NULL,
  `BetType`    VARCHAR(50)                   NOT NULL,
  `BetAmount`  DOUBLE(10, 2)                  NOT NULL,
  `Coefficient` DOUBLE(8, 3)                   NOT NULL,
  `Result`      VARCHAR(50)                   NOT NULL,
  `Comment`     VARCHAR(255)                          NULL,
  `UserID` BIGINT(11) NOT NULL,
  PRIMARY KEY (`StakeID`),
  CONSTRAINT UserStakesFK FOREIGN KEY (`UserID`) REFERENCES users(`UserID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table `Java2_test`.`sites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`sites` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`sites` (
  `ID`          BIGINT(11)   NOT NULL AUTO_INCREMENT,
  `Name`        VARCHAR(50)  NOT NULL,
  `URL`         VARCHAR(255) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `UserID`      BIGINT(11)   NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT UserSitesFK FOREIGN KEY (`UserID`) REFERENCES users (`UserID`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table `Java2_test`.`reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`reviews` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`reviews` (
  `ID`           BIGINT(11)   NOT NULL AUTO_INCREMENT,
  `ReviewTitle`  VARCHAR(50)  NOT NULL,
  `ReviewText`   VARCHAR(255) NOT NULL,
  `ReviewRating` INT(255)     NOT NULL,
  `UserID`      BIGINT(11)    NOT NULL,
  `SiteID`		BIGINT(11)    NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT SiteReviewFK FOREIGN KEY (`SiteID`) REFERENCES sites (`ID`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Offline gaming event
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`offlineGamingEvent` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`offlineGamingEvent` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `UserID` BIGINT(11) NOT NULL,
  `Place` INT(11) NOT NULL,
  `Comment` CHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`UserID`) REFERENCES users(`UserID`),
  FOREIGN KEY (`Place`) REFERENCES offlineGamingEvent(`ID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;

-- -----------------------------------------------------
-- Table for land base casinos
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`landBasedCasino` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`landBasedCasino` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` CHAR(100) NOT NULL,
  `Description` CHAR(255) NOT NULL,
  PRIMARY KEY (`ID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;
-- ------
-- Lets add some records for testing purposes
-- ------
INSERT INTO `java2_test`.`landBasedCasino`
VALUES (NULL, "Voodoo casino", "Cool casino in Riga");

INSERT INTO `java2_test`.`landBasedCasino`
VALUES (NULL, "Another casino", "Beautiful dealers");


-- -----------------------------------------------------
-- Table for gambling types
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`gamblingType` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`gamblingType` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` CHAR(100) NOT NULL,
  PRIMARY KEY (`ID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;
-- ------
-- Lets add some records for testing purposes
-- ------
INSERT INTO `java2_test`.`gamblingType`
VALUES (NULL, "Blackjack");

INSERT INTO `java2_test`.`gamblingType`
VALUES (NULL, "Roulette");

INSERT INTO `java2_test`.`gamblingType`
VALUES (NULL, "Slots");

-- -----------------------------------------------------
-- Table for gambling types @ offline gambling events
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2_test`.`offlineGamingEventGamblingType` ;

CREATE TABLE IF NOT EXISTS `java2_test`.`offlineGamingEventGamblingType` (
  `GAMBLING_TYPE_ID` INT(11) NOT NULL,
  `GAMBLING_EVENT_ID` INT(11) NOT NULL,
  PRIMARY KEY (`GAMBLING_EVENT_ID`, `GAMBLING_TYPE_ID`),
  FOREIGN KEY (`GAMBLING_TYPE_ID`) REFERENCES gamblingType(`ID`),
  FOREIGN KEY (`GAMBLING_EVENT_ID`) REFERENCES offlineGamingEvent(`ID`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1002;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;