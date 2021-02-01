/*
Navicat MySQL Data Transfer

Source Server         : mysql 5.5.15
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : hpbbs

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2021-02-01 19:44:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `postinfo`
-- ----------------------------
DROP TABLE IF EXISTS `postinfo`;
CREATE TABLE `postinfo` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `postTime` datetime NOT NULL,
  `clickNum` int(100) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `topicId` int(4) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicId` (`topicId`),
  CONSTRAINT `postinfo_ibfk_1` FOREIGN KEY (`topicId`) REFERENCES `topic` (`topicId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postinfo
-- ----------------------------
INSERT INTO `postinfo` VALUES ('1', '恒大官宣穆里奇自由身回归 签半年有优先续约权', '2017-06-23 13:34:12', '35', '恒大官宣穆里奇自由身回归 签半年有优先续约权', '1', null);
INSERT INTO `postinfo` VALUES ('2', '曝曼联没兴趣抢切尔西猎物 穆帅看上另一悍将', '2017-07-12 17:38:02', '146', '曝曼联没兴趣抢切尔西猎物 穆帅看上另一悍将', '1', null);
INSERT INTO `postinfo` VALUES ('3', '俄潜艇冲入英海军基地监控潜艇 英军被迫求援', '2017-07-08 09:12:07', '4', '俄潜艇冲入英海军基地监控潜艇 英军被迫求援', '2', null);
INSERT INTO `postinfo` VALUES ('4', '曝曼联没兴趣抢切尔西猎物', '2021-01-24 14:18:38', '111', '曝曼联没兴趣抢切尔西猎物', '3', null);
INSERT INTO `postinfo` VALUES ('5', '穆帅看上另一悍将', '2021-01-24 16:19:04', '213', '穆帅看上另一悍将', '4', null);
INSERT INTO `postinfo` VALUES ('6', '俄潜艇冲入英海军基地监控潜艇', '2021-01-24 18:19:35', '333', '俄潜艇冲入英海军基地监控潜艇', '5', null);
INSERT INTO `postinfo` VALUES ('7', '英军被迫求援', '2021-01-24 20:20:07', '144', '英军被迫求援', '6', null);
INSERT INTO `postinfo` VALUES ('8', '穆里奇签半年有优先续约权', '2021-01-24 22:21:02', '77', '穆里奇签半年有优先续约权', '7', null);
INSERT INTO `postinfo` VALUES ('9', 'B11223', '2017-12-21 20:13:14', '1', null, '1', null);
INSERT INTO `postinfo` VALUES ('10', null, '2021-01-24 00:00:00', '1', 'B112233', '1', null);
INSERT INTO `postinfo` VALUES ('11', null, '2021-01-24 00:00:00', '1', '', '6', null);
INSERT INTO `postinfo` VALUES ('12', 'B112233', '2021-01-24 00:00:00', '1', 'B112233', '2', null);
INSERT INTO `postinfo` VALUES ('13', 'B12345', '2021-01-24 00:00:00', '1', 'B12345', '7', null);
INSERT INTO `postinfo` VALUES ('14', '小肥你明天不用再来了', '2021-01-25 00:00:00', '1', '小肥你明天不用再来了', '2', '');
INSERT INTO `postinfo` VALUES ('15', '带上它，你将得到力量', '2021-01-25 00:00:00', '1', '带上它，你将得到力量', '2', 'upload/QQ图片20201103084834123.jpg');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topicId` int(4) NOT NULL AUTO_INCREMENT,
  `topicName` varchar(50) NOT NULL,
  PRIMARY KEY (`topicId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '体育');
INSERT INTO `topic` VALUES ('2', '军事');
INSERT INTO `topic` VALUES ('3', '物理');
INSERT INTO `topic` VALUES ('4', '地理');
INSERT INTO `topic` VALUES ('5', '化学');
INSERT INTO `topic` VALUES ('6', '文学');
INSERT INTO `topic` VALUES ('7', '史学');
