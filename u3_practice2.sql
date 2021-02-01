/*
Navicat MySQL Data Transfer

Source Server         : mysql 5.5.15
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : u3_practice2

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2021-02-01 19:44:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `discription` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '杰尼亚', '亦庄亦谐的意大利男装品牌', 'www.zegna.cn', 'upload/Zegna.jpg', '1');
INSERT INTO `brand` VALUES ('2', '盖尔斯', '首次推出的「梦露式」紧身牛仔裤', 'http://www.guess.com/en/', 'upload/Guess.jpg', '1');
INSERT INTO `brand` VALUES ('3', '阿玛尼', '世界知名奢侈品牌', 'http://www.versace.cn/', 'upload/Armani.jpg', '0');
INSERT INTO `brand` VALUES ('4', '报喜鸟', '中国著名的男装品牌', 'http://www.baoxiniao.com.cn/', 'upload/SAINT ANGELO.png', '1');
INSERT INTO `brand` VALUES ('5', '杉杉', '多元化产业集群', 'http://www.shanshan.com/', 'upload/FIRS.jpg', '0');
INSERT INTO `brand` VALUES ('6', '才子', '起源于1983年中国莆田，是国内知名的男装品牌', 'http://www.cntries.com/', 'upload/TRIES.jpg', '1');
INSERT INTO `brand` VALUES ('7', '克洛伊', '一直保持着法兰西风格的色彩特征和优雅情调', 'https://www.chloe.com/us', 'upload/Chloe.jpg', '1');
INSERT INTO `brand` VALUES ('9', 'A123', '123', '1123', 'upload/TRIES.jpg', '1');
