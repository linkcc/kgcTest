/*
Navicat MySQL Data Transfer

Source Server         : mysql 5.5.15
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : u3_practice1

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2021-02-01 19:44:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(255) NOT NULL,
  `good_price` double(11,0) NOT NULL,
  `good_num` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `goodType_id` int(11) NOT NULL,
  PRIMARY KEY (`good_id`),
  KEY `goodType_id` (`goodType_id`),
  CONSTRAINT `good_ibfk_1` FOREIGN KEY (`goodType_id`) REFERENCES `goodtype` (`goodType_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('101', '夏季短袖衬衣', '65', '120', '2019-06-01 00:00:00', '2');
INSERT INTO `good` VALUES ('102', '波司登羽绒服', '488', '110', '2019-06-06 00:00:00', '4');
INSERT INTO `good` VALUES ('103', '牛仔长裤', '128', '85', '2019-06-06 00:00:00', '3');
INSERT INTO `good` VALUES ('104', 's', '122', '77', '2019-06-06 00:00:00', '1');
INSERT INTO `good` VALUES ('105', 'x', '65', '58', '2019-06-06 00:00:00', '5');
INSERT INTO `good` VALUES ('106', '1123', '11', '11', '2021-01-06 00:00:00', '1');
INSERT INTO `good` VALUES ('109', 'A10086', '123', '123', '2021-01-06 00:00:00', '4');
INSERT INTO `good` VALUES ('110', 'A1234', '1234', '123', '2017-08-09 00:00:00', '2');
INSERT INTO `good` VALUES ('111', 'B123', '123', '123', '2021-01-31 00:00:00', '5');
INSERT INTO `good` VALUES ('112', 'ABC123', '1122', '321', '2021-01-31 00:00:00', '4');

-- ----------------------------
-- Table structure for `goodtype`
-- ----------------------------
DROP TABLE IF EXISTS `goodtype`;
CREATE TABLE `goodtype` (
  `goodType_id` int(11) NOT NULL,
  `goodType_name` varchar(255) NOT NULL,
  PRIMARY KEY (`goodType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodtype
-- ----------------------------
INSERT INTO `goodtype` VALUES ('1', '帽子');
INSERT INTO `goodtype` VALUES ('2', '上衣');
INSERT INTO `goodtype` VALUES ('3', '下装');
INSERT INTO `goodtype` VALUES ('4', '外套');
INSERT INTO `goodtype` VALUES ('5', '鞋子');
