/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50633
Source Host           : localhost:3306
Source Database       : shgsic_exam

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2018-05-10 17:00:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for contenttype
-- ----------------------------
DROP TABLE IF EXISTS `contenttype`;
CREATE TABLE `contenttype` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TypeName` (`TypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contenttype
-- ----------------------------
INSERT INTO `contenttype` VALUES ('1', '信息类型题目');
INSERT INTO `contenttype` VALUES ('2', '安全类型题目');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DepartmentName` (`DepartmentName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('13', '人力资源部');
INSERT INTO `department` VALUES ('12', '信息化建设部');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Role_ID` bigint(20) NOT NULL,
  `Dep_ID` bigint(20) NOT NULL,
  `Name` text NOT NULL,
  `Number` varchar(255) NOT NULL,
  `Sex` text NOT NULL,
  `Password` text NOT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Number` (`Number`),
  KEY `Role_ID` (`Role_ID`),
  KEY `Dep_ID` (`Dep_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Dep_ID`) REFERENCES `department` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', '12', '许立群', '01004626', '男', '579d9ec9d0c3d687aaa91289ac2854e4', '123');
INSERT INTO `employee` VALUES ('2', '3', '13', '测试注册', '01001111', '女', '1ea43fb826caa46ad21cfae15ad50f54', '757941');
INSERT INTO `employee` VALUES ('3', '3', '13', '怎么回事', '01001234', '男', '9d6ab84c2b77d5849c8129be370c8730', '645146');
INSERT INTO `employee` VALUES ('4', '3', '13', 'mmmmmm', '01002222', '男', 'ec63746590dc803f95e1505cbc780efe', '698658');

-- ----------------------------
-- Table structure for emp_score
-- ----------------------------
DROP TABLE IF EXISTS `emp_score`;
CREATE TABLE `emp_score` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Pap_Que_ID` bigint(20) DEFAULT NULL,
  `Emp_ID` bigint(20) DEFAULT NULL,
  `Score` int(11) NOT NULL,
  `Answer` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Pap_Que_ID` (`Pap_Que_ID`),
  CONSTRAINT `emp_score_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `emp_score_ibfk_2` FOREIGN KEY (`Pap_Que_ID`) REFERENCES `paper_question` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_score
-- ----------------------------

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExamName` varchar(255) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ExamName` (`ExamName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('2', '安全培训', '2017-08-09 00:00:00', '2017-08-12 00:00:00');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Exam_ID` bigint(20) DEFAULT NULL,
  `TotalScore` float NOT NULL,
  `SingleChoiceCount` int(11) NOT NULL,
  `MultiChoiceCount` int(11) NOT NULL,
  `BlankCount` int(11) NOT NULL,
  `JudgeCount` int(11) NOT NULL,
  `DescriptionCount` int(11) NOT NULL,
  `SingleChoiceValue` float NOT NULL,
  `MultiChoiceValue` float NOT NULL,
  `BlankValue` float NOT NULL,
  `JudgeValue` float NOT NULL,
  `DescriptionValue` float NOT NULL,
  `Name` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Exam_ID` (`Exam_ID`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`Exam_ID`) REFERENCES `exam` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------

-- ----------------------------
-- Table structure for paper_question
-- ----------------------------
DROP TABLE IF EXISTS `paper_question`;
CREATE TABLE `paper_question` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Pap_ID` bigint(20) DEFAULT NULL,
  `Que_ID` bigint(20) DEFAULT NULL,
  `Value` float NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Pap_ID` (`Pap_ID`),
  KEY `Que_ID` (`Que_ID`),
  CONSTRAINT `paper_question_ibfk_1` FOREIGN KEY (`Pap_ID`) REFERENCES `paper` (`ID`),
  CONSTRAINT `paper_question_ibfk_2` FOREIGN KEY (`Que_ID`) REFERENCES `question` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_question
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ConType_ID` bigint(20) DEFAULT NULL,
  `QueType_ID` bigint(20) DEFAULT NULL,
  `QuestionContent` text NOT NULL,
  `ChoiceA` text NOT NULL,
  `ChoiceB` text NOT NULL,
  `ChoiceC` text NOT NULL,
  `ChoiceD` text NOT NULL,
  `StandardAnswer` text NOT NULL,
  `Orderly` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ConType_ID` (`ConType_ID`),
  KEY `QueType_ID` (`QueType_ID`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`ConType_ID`) REFERENCES `contenttype` (`ID`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`QueType_ID`) REFERENCES `questiontype` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('33', '1', '2', '这是一道信息化单选测试题目1的题干，题干长度未知，已知未知，求题干是什么？', '这是1选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('34', '1', '2', '这是一道信息化单选测试题目2的题干，题干长度未知，已知未知，求题干是什么？', '这是2选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('35', '1', '2', '这是一道信息化单选测试题目3的题干，题干长度未知，已知未知，求题干是什么？', '这是3选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('36', '1', '2', '这是一道信息化单选测试题目4的题干，题干长度未知，已知未知，求题干是什么？', '这是4选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('37', '1', '2', '这是一道信息化单选测试题目5的题干，题干长度未知，已知未知，求题干是什么？', '这是5选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('38', '1', '2', '这是一道信息化单选测试题目6的题干，题干长度未知，已知未知，求题干是什么？', '这是6选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('39', '1', '2', '这是一道信息化单选测试题目7的题干，题干长度未知，已知未知，求题干是什么？', '这是7选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('40', '1', '2', '这是一道信息化单选测试题目8的题干，题干长度未知，已知未知，求题干是什么？', '这是8选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('41', '1', '2', '这是一道信息化单选测试题目9的题干，题干长度未知，已知未知，求题干是什么？', '这是9选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('42', '1', '2', '这是一道信息化单选测试题目10的题干，题干长度未知，已知未知，求题干是什么？', '这是10选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('43', '1', '2', '这是一道信息化单选测试题目11的题干，题干长度未知，已知未知，求题干是什么？', '这是11选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('44', '1', '2', '这是一道信息化单选测试题目12的题干，题干长度未知，已知未知，求题干是什么？', '这是12选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('45', '1', '2', '这是一道信息化单选测试题目13的题干，题干长度未知，已知未知，求题干是什么？', '这是13选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('46', '1', '2', '这是一道信息化单选测试题目14的题干，题干长度未知，已知未知，求题干是什么？', '这是14选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('47', '2', '2', '这是一道安全类单选测试题目1的题干，题干长度未知，已知未知，求题干是什么？', '这是1选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('48', '2', '2', '这是一道安全类单选测试题目2的题干，题干长度未知，已知未知，求题干是什么？', '这是2选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('49', '2', '2', '这是一道安全类单选测试题目3的题干，题干长度未知，已知未知，求题干是什么？', '这是3选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('50', '2', '2', '这是一道安全类单选测试题目4的题干，题干长度未知，已知未知，求题干是什么？', '这是4选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('51', '2', '2', '这是一道安全类单选测试题目5的题干，题干长度未知，已知未知，求题干是什么？', '这是5选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('52', '2', '2', '这是一道安全类单选测试题目6的题干，题干长度未知，已知未知，求题干是什么？', '这是6选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('53', '2', '2', '这是一道安全类单选测试题目7的题干，题干长度未知，已知未知，求题干是什么？', '这是7选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('54', '2', '2', '这是一道安全类单选测试题目8的题干，题干长度未知，已知未知，求题干是什么？', '这是8选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('55', '2', '2', '这是一道安全类单选测试题目9的题干，题干长度未知，已知未知，求题干是什么？', '这是9选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('56', '2', '2', '这是一道安全类单选测试题目10的题干，题干长度未知，已知未知，求题干是什么？', '这是10选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('57', '2', '2', '这是一道安全类单选测试题目11的题干，题干长度未知，已知未知，求题干是什么？', '这是11选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('58', '2', '2', '这是一道安全类单选测试题目12的题干，题干长度未知，已知未知，求题干是什么？', '这是12选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('59', '2', '2', '这是一道安全类单选测试题目13的题干，题干长度未知，已知未知，求题干是什么？', '这是13选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('60', '2', '2', '这是一道安全类单选测试题目14的题干，题干长度未知，已知未知，求题干是什么？', '这是14选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('61', '1', '2', '这是一道信息化单选测试题目1的题干，题干长度未知，已知未知，求题干是什么666？', '这是1选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('62', '1', '3', '这是一道信息化判断测试题目2的题干，题干长度未知，已知未知，求题干是什么？', '这是2选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('63', '1', '3', '这是一道信息化判断测试题目3的题干，题干长度未知，已知未知，求题干是什么？', '这是3选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('64', '1', '3', '这是一道信息化判断测试题目4的题干，题干长度未知，已知未知，求题干是什么？', '这是4选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('65', '1', '3', '这是一道信息化判断测试题目5的题干，题干长度未知，已知未知，求题干是什么？', '这是5选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('66', '1', '3', '这是一道信息化判断测试题目6的题干，题干长度未知，已知未知，求题干是什么？', '这是6选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('67', '1', '3', '这是一道信息化判断测试题目7的题干，题干长度未知，已知未知，求题干是什么？', '这是7选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('68', '1', '3', '这是一道信息化判断测试题目8的题干，题干长度未知，已知未知，求题干是什么？', '这是8选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('69', '1', '3', '这是一道信息化判断测试题目9的题干，题干长度未知，已知未知，求题干是什么？', '这是9选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('70', '1', '3', '这是一道信息化判断测试题目10的题干，题干长度未知，已知未知，求题干是什么？', '这是10选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('71', '1', '3', '这是一道信息化判断测试题目11的题干，题干长度未知，已知未知，求题干是什么？', '这是11选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('72', '1', '3', '这是一道信息化判断测试题目12的题干，题干长度未知，已知未知，求题干是什么？', '这是12选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('73', '1', '3', '这是一道信息化判断测试题目13的题干，题干长度未知，已知未知，求题干是什么？', '这是13选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');
INSERT INTO `question` VALUES ('74', '1', '3', '这是一道信息化判断测试题目14的题干，题干长度未知，已知未知，求题干是什么？', '这是14选项A', '这是选项B', '这是选项C', '这是选项C', 'A', '0');

-- ----------------------------
-- Table structure for questiontype
-- ----------------------------
DROP TABLE IF EXISTS `questiontype`;
CREATE TABLE `questiontype` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TypeName` (`TypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questiontype
-- ----------------------------
INSERT INTO `questiontype` VALUES ('3', '判断题');
INSERT INTO `questiontype` VALUES ('2', '单项选择题');
INSERT INTO `questiontype` VALUES ('4', '填空题');
INSERT INTO `questiontype` VALUES ('1', '多项选择题');
INSERT INTO `questiontype` VALUES ('5', '简答题');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RoleName` (`RoleName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', '普通员工');
INSERT INTO `role` VALUES ('1', '系统管理员');

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `num` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_table
-- ----------------------------
INSERT INTO `test_table` VALUES ('101', 'alllll', '01001234');
