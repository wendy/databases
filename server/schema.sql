CREATE DATABASE chat;

USE chat;

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Messages'
--
-- ---

DROP TABLE IF EXISTS `Messages`;

CREATE TABLE `Messages` (
  `message` VARCHAR(140) NULL DEFAULT NULL,
  `time` TIMESTAMP NULL DEFAULT NULL,
  `userID` INTEGER NULL DEFAULT NULL,
  `roomID` INTEGER NULL DEFAULT NULL,
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Rooms'
--
-- ---

DROP TABLE IF EXISTS `Rooms`;

CREATE TABLE `Rooms` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Users'
--
-- ---

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Follow'
--
-- ---

DROP TABLE IF EXISTS `Follow`;

CREATE TABLE `Follow` (
  `userID` INTEGER NULL DEFAULT NULL,
  `followID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`userID`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Messages` ADD FOREIGN KEY (roomID) REFERENCES `Rooms` (`id`);
ALTER TABLE `Messages` ADD FOREIGN KEY (userID) REFERENCES `Users` (`id`);
ALTER TABLE `Follow` ADD FOREIGN KEY (userID) REFERENCES `Users` (`id`);
ALTER TABLE `Follow` ADD FOREIGN KEY (followID) REFERENCES `Users` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Follow` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Messages` (`id`,`roomID`,`message`,`time`,`userID`) VALUES
-- ('','','','','');
-- INSERT INTO `Rooms` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `Users` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `Follow` (`userID`,`followID`) VALUES
-- ('','');

