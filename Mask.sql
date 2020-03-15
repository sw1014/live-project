/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : mask

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-03-15 18:28:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `getmasklist`
-- ----------------------------
DROP TABLE IF EXISTS `getmasklist`;
CREATE TABLE `getmasklist` (
  `Id` varchar(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `IDNum` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `MaskNum` int(11) DEFAULT '0',
  `Date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of getmasklist
-- ----------------------------
INSERT INTO `getmasklist` VALUES ('1', '小二', '350600199901013030', '13055894566', '1', '2020-03-01');
INSERT INTO `getmasklist` VALUES ('2', '李四', '350600199901023030', '13055240680', '5', '2020-03-01');
INSERT INTO `getmasklist` VALUES ('3', '张三', '350600199901033030', '13055280690', '3', '2020-03-01');

-- ----------------------------
-- Table structure for `reservations`
-- ----------------------------
DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations` (
  `IDNum` varchar(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `MaskNum` int(11) DEFAULT '0',
  PRIMARY KEY (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservations
-- ----------------------------
INSERT INTO `reservations` VALUES ('350600199901013030', '小二', '13055894566', '1');
INSERT INTO `reservations` VALUES ('350600199901023030', '李四', '13055240680', '5');
INSERT INTO `reservations` VALUES ('350600199901033030', '张三', '13055280690', '3');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `IDNum` varchar(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `MaskNum` int(11) DEFAULT '0',
  PRIMARY KEY (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('350600199901013030', '小二', '13055894566', '1');
INSERT INTO `user` VALUES ('350600199901023030', '李四', '13055240680', '5');
INSERT INTO `user` VALUES ('350600199901033030', '张三', '13055280690', '3');
