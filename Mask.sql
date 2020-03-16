# Host: localhost  (Version 5.7.25)
# Date: 2020-03-15 23:02:01
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "date"
#

DROP TABLE IF EXISTS `date`;
CREATE TABLE `date` (
  `date` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "date"
#

INSERT INTO `date` VALUES ('2020-03-13'),('2020-03-14'),('2020-03-15');

#
# Structure for table "getMaskList"
#

DROP TABLE IF EXISTS `getMaskList`;
CREATE TABLE `getMaskList` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `IDNum` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `MaskNum` int(11) DEFAULT '0',
  `Date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1111111001 DEFAULT CHARSET=utf8;

#
# Data for table "getMaskList"
#

INSERT INTO `getMaskList` VALUES (1,'张三','123456789123456789','13211111111',1,'2020-03-15'),(2,'李四','14',NULL,2,'2020-03-14'),(3,'','13','',1,NULL),(4,'','12','',1,'2020-03-15'),(5,'','11','',1,'2020-03-15'),(6,'','','',1,'2020-03-15'),(7,'','','',1,'2020-03-15'),(1111111000,'','1111111','',1,'2020-03-15');

#
# Structure for table "reservations"
#

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations` (
  `IDNum` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `MaskNum` varchar(255) DEFAULT '0',
  PRIMARY KEY (`IDNum`)
) ENGINE=InnoDB AUTO_INCREMENT=1111112 DEFAULT CHARSET=utf8;

#
# Data for table "reservations"
#

INSERT INTO `reservations` VALUES (1111111,'','','1');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `IDNum` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `MaskNum` int(11) DEFAULT '0',
  PRIMARY KEY (`IDNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "user"
#

