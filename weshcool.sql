/*
Navicat MySQL Data Transfer

Source Server         : qs
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : weshcool

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-07-16 10:40:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL auto_increment,
  `Admin_Username` varchar(20) default NULL,
  `Admin_Password` varchar(20) default NULL,
  `Admin_Name` varchar(20) default NULL,
  `Admin_Sex` varchar(10) default NULL,
  `Admin_Tel` varchar(20) default NULL,
  PRIMARY KEY  (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'java1234', '123', 'admin', '', null);

-- ----------------------------
-- Table structure for `building`
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `Building_ID` int(11) NOT NULL auto_increment,
  `Building_Name` varchar(50) default NULL,
  `Building_Introduction` varchar(1000) default NULL,
  `Building_TeacherID` int(11) default NULL,
  PRIMARY KEY  (`Building_ID`),
  KEY `tID` (`Building_TeacherID`),
  CONSTRAINT `tID` FOREIGN KEY (`Building_TeacherID`) REFERENCES `teacher` (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('1', '楼宇1', '这个楼宇1', null);
INSERT INTO `building` VALUES ('2', '楼宇2', '这个楼宇2', null);

-- ----------------------------
-- Table structure for `domitory`
-- ----------------------------
DROP TABLE IF EXISTS `domitory`;
CREATE TABLE `domitory` (
  `Domitory_ID` int(11) NOT NULL auto_increment,
  `Domitory_BuildingID` int(11) default NULL,
  `Domitory_Name` varchar(20) default NULL,
  `Domitory_Type` varchar(20) default NULL,
  `Domitory_Number` varchar(20) default NULL,
  `Domitory_Tel` varchar(20) default NULL,
  PRIMARY KEY  (`Domitory_ID`),
  KEY `bIDd` (`Domitory_BuildingID`),
  CONSTRAINT `bIDd` FOREIGN KEY (`Domitory_BuildingID`) REFERENCES `building` (`Building_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of domitory
-- ----------------------------
INSERT INTO `domitory` VALUES ('1', '1', '11', '11', '11', '11');
INSERT INTO `domitory` VALUES ('2', '2', '002', '哈哈', '12', '312');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `Log_ID` int(11) NOT NULL auto_increment,
  `Log_StudentID` int(11) default NULL,
  `Log_TeacherID` int(11) default NULL,
  `Log_Date` varchar(50) default NULL,
  `Log_Remark` varchar(1000) default NULL,
  PRIMARY KEY  (`Log_ID`),
  KEY `logstuID` (`Log_StudentID`),
  KEY `logTeaID` (`Log_TeacherID`),
  CONSTRAINT `logTeaID` FOREIGN KEY (`Log_TeacherID`) REFERENCES `teacher` (`Teacher_ID`),
  CONSTRAINT `logstuID` FOREIGN KEY (`Log_StudentID`) REFERENCES `student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '2', '1', '2013-04-10', 'we');

-- ----------------------------
-- Table structure for `out1`
-- ----------------------------
DROP TABLE IF EXISTS `out1`;
CREATE TABLE `out1` (
  `Out_ID` int(11) NOT NULL auto_increment,
  `Out_StudentID` int(11) default NULL,
  `Out_Date` varchar(50) default NULL,
  `Out_Remark` varchar(1000) default NULL,
  PRIMARY KEY  (`Out_ID`),
  KEY `outstuID` (`Out_StudentID`),
  CONSTRAINT `outstuID` FOREIGN KEY (`Out_StudentID`) REFERENCES `student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of out1
-- ----------------------------
INSERT INTO `out1` VALUES ('1', '2', '2013-4-28', '13');
INSERT INTO `out1` VALUES ('2', '1', '2013-4-28', '搜索');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL auto_increment,
  `Student_DomitoryID` int(11) default NULL,
  `Student_Username` varchar(20) default NULL,
  `Student_Password` varchar(20) default NULL,
  `Student_Name` varchar(20) default NULL,
  `Student_Sex` varchar(20) default NULL,
  `Student_Class` varchar(20) default NULL,
  `Student_State` varchar(20) default NULL,
  PRIMARY KEY  (`Student_ID`),
  KEY `dIDdd` (`Student_DomitoryID`),
  CONSTRAINT `dIDdd` FOREIGN KEY (`Student_DomitoryID`) REFERENCES `domitory` (`Domitory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '2', '001', '123', '学生一', '男', '08计本', '迁出');
INSERT INTO `student` VALUES ('2', '1', '002', '123', '发', '女', '范德萨', '入住');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Teacher_ID` int(11) NOT NULL auto_increment,
  `Teacher_Username` varchar(20) default NULL,
  `Teacher_Password` varchar(20) default NULL,
  `Teacher_Name` varchar(20) default NULL,
  `Teacher_Sex` varchar(10) default NULL,
  `Teacher_Tel` varchar(20) default NULL,
  PRIMARY KEY  (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'Teacher1', '123', '楼宇管理员1', '女', '123');
