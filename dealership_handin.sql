# Host: localhost  (Version 5.7.17-log)
# Date: 2017-04-10 22:35:03
# Generator: MySQL-Front 6.0  (Build 1.117)


#
# Structure for table "branch_office"
#

DROP TABLE IF EXISTS `branch_office`;
CREATE TABLE `branch_office` (
  `BranchID` int(11) NOT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `dname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BranchID`),
  UNIQUE KEY `BranchID_UNIQUE` (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "branch_office"
#

INSERT INTO `branch_office` VALUES (1000,'Calgary',2147483647,'Harrison'),(1001,'Vancouver',2147483647,'Harrision'),(1002,'Calgary',2147483647,'COCKRAM'),(1004,'Toronto',2147483647,'COCKRAM');

#
# Structure for table "customer"
#

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Sin` int(11) NOT NULL,
  `CName` varchar(45) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sin`),
  UNIQUE KEY `Sin_UNIQUE` (`Sin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "customer"
#

INSERT INTO `customer` VALUES (900000000,'Joyce Kwan',1,NULL),(900000001,'Samuel Chan',2,NULL),(900000003,'Kelly Luu',3,NULL),(900000004,'Andrew Lata',4,2147483647),(900000005,'Lori Fichtel',5,NULL),(900000006,'Emily German',6,NULL),(900000007,'Tony Hoey',7,NULL),(900000008,'Allen Zhang',8,NULL),(900000009,'Kim Hundal',2,NULL),(900000010,'Troy Italia',4,NULL);

#
# Structure for table "contracts"
#

DROP TABLE IF EXISTS `contracts`;
CREATE TABLE `contracts` (
  `DESCRIPTION` int(11) NOT NULL AUTO_INCREMENT,
  `CSIN` int(11) NOT NULL DEFAULT '0',
  `WARRANTY` text,
  `LEASE` int(11) DEFAULT NULL,
  `FINANCE` int(11) DEFAULT NULL,
  UNIQUE KEY `Discription` (`DESCRIPTION`),
  UNIQUE KEY `csin_unique` (`CSIN`),
  CONSTRAINT `custsin` FOREIGN KEY (`CSIN`) REFERENCES `customer` (`Sin`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8;

#
# Data for table "contracts"
#

INSERT INTO `contracts` VALUES (10001,900000000,'10001',2,30000),(10002,900000001,'10002',4,15000),(10003,900000003,'10003',3,40000),(10004,900000004,'10004',7,17000),(10005,900000005,'10005',10,40000),(10006,900000006,'10006',5,50000),(10007,900000007,'10007',2,35000),(10008,900000008,'10008',1,30000),(10009,900000009,'10009',NULL,40000),(10010,900000010,'10010',NULL,35000);

#
# Structure for table "dealership"
#

DROP TABLE IF EXISTS `dealership`;
CREATE TABLE `dealership` (
  `dName` varchar(45) NOT NULL,
  `dLocation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dName`),
  UNIQUE KEY `dName_UNIQUE` (`dName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "dealership"
#

INSERT INTO `dealership` VALUES ('COCKRAM','Vancouver'),('Harrison','Calgary');

#
# Structure for table "employee"
#

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `EMPid` int(11) NOT NULL,
  `sin` int(9) NOT NULL,
  `Ename` varchar(30) DEFAULT NULL,
  `supperID` int(11) DEFAULT NULL,
  `Bid` int(11) DEFAULT NULL,
  `dname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EMPid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "employee"
#

INSERT INTO `employee` VALUES (1,123456780,'Jack Ali',2,1000,'Harrison'),(2,123456781,'Mary Aral',2,1000,'Harrison'),(3,123456782,'Kevin Berlak',5,1001,'Harrison'),(4,123456783,'Paul Delima',5,1001,'Harrison'),(5,123456784,'Jason Comfort',5,1001,'Harrison'),(6,123456785,'Linda Farah',8,1004,'COCKRAM'),(7,123456786,'Devid Geist',8,1004,'COCKRAM'),(8,123456787,'Daniel',8,1004,'COCKRAM'),(9,123456788,'Mark Federl',9,1010,'Manqun'),(10,123456789,'Anna Clark',9,1008,'Manqun'),(11,987123654,'Ronald Jones',3,1003,'Sunridge'),(12,987123655,'Polly Pocket',2,1001,'Country Hills'),(13,987123888,'Lisa Scott',1,1001,'Country Hills');

#
# Structure for table "purchase"
#

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `CSIN` int(11) NOT NULL,
  `VIN` int(11) NOT NULL,
  `TRANSID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CSIN`,`VIN`),
  UNIQUE KEY `CSIN_UNIQUE` (`CSIN`),
  UNIQUE KEY `VIN_UNIQUE` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "purchase"
#

INSERT INTO `purchase` VALUES (777777777,10009,12389),(888888888,10010,12388),(900000001,10001,12340),(900000002,10002,12341),(900000003,10003,12342),(900000004,10004,12343),(900000005,10005,12344),(900000006,10006,12345),(900000007,10007,12346),(900000008,10008,12347);

#
# Structure for table "sell"
#

DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `eid` int(11) NOT NULL,
  `vin` int(11) NOT NULL,
  PRIMARY KEY (`vin`),
  UNIQUE KEY `vin_UNIQUE` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sell"
#

INSERT INTO `sell` VALUES (1,10001),(2,10002),(3,10003),(4,10004),(5,10005),(6,10006),(7,10007),(8,10008),(12,10009),(13,10010);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passcode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'administration','adminpass'),(2,'customer','customerpass'),(3,'employee','emppass');

#
# Structure for table "vehicles"
#

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `VIN` int(11) NOT NULL DEFAULT '0',
  `MAKE` text,
  `COLOUR` text,
  `YEAR` year(4) DEFAULT NULL,
  `MODEL` text,
  `DOOR NO.` int(1) DEFAULT NULL,
  `PRICE` int(8) DEFAULT NULL,
  PRIMARY KEY (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The eitity "Vehicles"';

#
# Data for table "vehicles"
#

INSERT INTO `vehicles` VALUES (10001,'TOYOTA','White',2016,'Camry CE\n',4,25690),(10002,'TOYOTA','Black',2015,'Camry CE',4,22680),(10003,'TOYOTA','Red',2015,'Camry CE',4,22680),(10004,'TOYOTA','White',2016,'Camry CE',4,27680),(10005,'TOYOTA','Red',2016,'Camry CE',2,27680),(10006,'TOYOTA','White',2014,'Camry LE\n',2,22680),(10007,'TOYOTA','White',2014,'Camry LE',4,22680),(10008,'TOYOTA','White',2017,'Camry LE',4,26780),(10009,'TOYOTA','Black',2016,'Camry CE',4,23570),(10010,'TOYOTA','Black',2015,'Camry CE',4,20150);

#
# Structure for table "truck"
#

DROP TABLE IF EXISTS `truck`;
CREATE TABLE `truck` (
  `TVIN` int(11) NOT NULL AUTO_INCREMENT,
  `TRUCKBEDSIZE` int(9) DEFAULT NULL,
  PRIMARY KEY (`TVIN`),
  CONSTRAINT `TVIN` FOREIGN KEY (`TVIN`) REFERENCES `vehicles` (`VIN`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

#
# Data for table "truck"
#

INSERT INTO `truck` VALUES (10002,5),(10004,6),(10006,5);

#
# Structure for table "suv"
#

DROP TABLE IF EXISTS `suv`;
CREATE TABLE `suv` (
  `VIN` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`VIN`),
  CONSTRAINT `SVIN` FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8;

#
# Data for table "suv"
#

INSERT INTO `suv` VALUES (10001),(10003),(10005);

#
# Structure for table "sedan"
#

DROP TABLE IF EXISTS `sedan`;
CREATE TABLE `sedan` (
  `SEVIN` int(11) NOT NULL AUTO_INCREMENT,
  `HATCHBACK` text,
  PRIMARY KEY (`SEVIN`),
  CONSTRAINT `SEVIN` FOREIGN KEY (`SEVIN`) REFERENCES `vehicles` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sedan"
#

