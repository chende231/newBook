/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : newbook

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-06-07 15:05:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(255) DEFAULT NULL,
  `bookAuthor` varchar(255) DEFAULT NULL,
  `bookPage` int(11) DEFAULT NULL,
  `bookPrice` double DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '语言', '发发', '123', '1');
INSERT INTO `book` VALUES ('2', '测试', '22寸', '124', '2');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carId` int(11) NOT NULL AUTO_INCREMENT,
  `carBookId` int(11) NOT NULL,
  `carUserId` int(11) NOT NULL,
  `carNumber` int(11) NOT NULL,
  PRIMARY KEY (`carId`),
  KEY `FK17FD4ADAA728C` (`carBookId`),
  KEY `FK17FD4CE5323D0` (`carUserId`),
  CONSTRAINT `FK17FD4ADAA728C` FOREIGN KEY (`carBookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `FK17FD4CE5323D0` FOREIGN KEY (`carUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '2', '1', '1');
INSERT INTO `car` VALUES ('2', '1', '1', '1');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collectId` int(11) NOT NULL AUTO_INCREMENT,
  `collectBookId` int(11) NOT NULL,
  `collectUserId` int(11) NOT NULL,
  PRIMARY KEY (`collectId`),
  KEY `FK3897612AA2942CA6` (`collectUserId`),
  KEY `FK3897612A81EB7B62` (`collectBookId`),
  CONSTRAINT `FK3897612A81EB7B62` FOREIGN KEY (`collectBookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `FK3897612AA2942CA6` FOREIGN KEY (`collectUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for consignee
-- ----------------------------
DROP TABLE IF EXISTS `consignee`;
CREATE TABLE `consignee` (
  `consigneeId` int(11) NOT NULL AUTO_INCREMENT,
  `consigneeUserId` int(11) DEFAULT NULL,
  `consigneeZipcode` int(11) DEFAULT NULL,
  `consigneePhone` varchar(255) DEFAULT NULL,
  `consigneeAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`consigneeId`),
  KEY `FKE63C471F189006DB` (`consigneeUserId`),
  CONSTRAINT `FKE63C471F189006DB` FOREIGN KEY (`consigneeUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consignee
-- ----------------------------
INSERT INTO `consignee` VALUES ('1', '1', '1123', '123', '背景');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderConsigneeId` int(11) NOT NULL,
  `orderTotal` double NOT NULL,
  `orderBook` varchar(255) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKC3DF62E5EFD48560` (`orderConsigneeId`),
  CONSTRAINT `FKC3DF62E5EFD48560` FOREIGN KEY (`orderConsigneeId`) REFERENCES `consignee` (`consigneeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '3', '测试;语言;');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userPass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '11111', '222222');
