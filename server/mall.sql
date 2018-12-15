/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-12-15 23:42:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'jgchen', '陈小光', 'jgchen');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `goodsId` bigint(20) NOT NULL,
  `goodsDetailId` bigint(20) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '2', '3', '4', '4', '这本书非常不错，很好看', '100', '2018-12-15 15:38:11');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `typeId` bigint(20) NOT NULL,
  `img` varchar(500) DEFAULT NULL,
  `desc` text,
  `updatetime` datetime NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '斗破苍穹', '1', 'http://img3m2.ddimg.cn/44/12/23924582-1_b_5.jpg', '谁说没有丹药就不能精进？谁说不会炼器就没有神兵？谁说挫于制符就没有战斗力？\n所谓一剑破万法，在于信心。。。当危险来临，你唯一的依靠只有剑，而不是其他。。。', '2018-12-15 17:08:56', '2018-12-15 17:08:59');
INSERT INTO `goods` VALUES ('2', '曼巴精神：科比自传（精装）', '2', 'http://img3m4.ddimg.cn/59/9/25351484-1_l_3.jpg', '乔丹、伯德、魔术师等巨星自述，传奇梦之队的集体传记；姚明、赖声川、张卫平、徐济成、张佳玮作序，于嘉翻译。邓超、苏群、杨毅、潘玮柏、大鹏、俞白眉、刘语熙等微博热荐。追踪采访20年，旷世奇书首次引进出版。', '2018-12-15 15:34:16', '2018-12-15 15:34:16');
INSERT INTO `goods` VALUES ('3', '蛮荒记', '1', 'http://img3m8.ddimg.cn/92/33/25268258-1_b_3.jpg', '神魔炼体 天人合一 人族少年横空出世！ 小千剑阵 翼蛇大战 燕山纪氏傲视乾坤！ 奇幻大神 我吃西红柿 王者归来 千万点击仙侠神作 百万 红盟 齐荐 起点各榜单第1名 在这里，与天地同斗，部落纷争、妖兽同行，仙魔隐现 历三灾九', '2018-12-15 15:36:23', '2018-12-15 15:36:23');

-- ----------------------------
-- Table structure for goodsdetails
-- ----------------------------
DROP TABLE IF EXISTS `goodsdetails`;
CREATE TABLE `goodsdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsId` bigint(20) NOT NULL,
  `specName` varchar(500) NOT NULL,
  `stockNum` int(11) NOT NULL DEFAULT '0',
  `unitPrice` float NOT NULL,
  `updatetime` datetime NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsdetails
-- ----------------------------
INSERT INTO `goodsdetails` VALUES ('1', '1', '500页', '1', '11', '2018-12-15 17:12:35', '2018-12-15 17:12:37');
INSERT INTO `goodsdetails` VALUES ('2', '2', '曼巴精神', '11', '93', '2018-12-15 15:34:16', '2018-12-15 15:34:16');
INSERT INTO `goodsdetails` VALUES ('3', '2', '梦之队', '10', '110', '2018-12-15 15:34:16', '2018-12-15 15:34:16');
INSERT INTO `goodsdetails` VALUES ('4', '3', '默认', '10', '111', '2018-12-15 15:36:23', '2018-12-15 15:36:23');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `goodsId` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('1', '2', '3', '整本书如何？', '1', '2018-12-15 15:38:50');
INSERT INTO `messages` VALUES ('2', '2', '3', '我想问下还有没没有', '0', '2018-12-15 15:39:26');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `goodsDetailId` bigint(20) NOT NULL,
  `goodsNum` int(11) NOT NULL,
  `amount` float NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `updatetime` datetime NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('3', '2', '1', '1', '11', '1', '2018-12-15 15:29:39', '2018-12-15 15:29:39');
INSERT INTO `orders` VALUES ('4', '2', '4', '1', '111', '3', '2018-12-15 15:37:10', '2018-12-15 15:37:10');

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `messageId` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replies
-- ----------------------------
INSERT INTO `replies` VALUES ('1', '1', '这本书非常不错', '2018-12-15 15:39:10');

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES ('1', '玄幻');
INSERT INTO `types` VALUES ('2', '传记');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `recipient` varchar(64) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `headimg` varchar(500) NOT NULL DEFAULT 'http://tvax4.sinaimg.cn/crop.0.0.480.480.180/768c39d5ly8fjje1d0teej20dc0dcq35.jpg',
  `updatetime` datetime NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '751357978@qq.com', '$2a$10$70AONOaG2M6MNgIacIJtleDCqaV9LAZMbDvXgkhMn/G.AxF4BgxBq', 'jgchen', '0', 'jgchen', 'jgchen', '13823506779', 'http://tvax4.sinaimg.cn/crop.0.0.480.480.180/768c39d5ly8fjje1d0teej20dc0dcq35.jpg', '2018-12-15 09:01:26', '2018-12-15 09:01:26');
INSERT INTO `users` VALUES ('2', 'jgchenu@foxmail.com', '$2a$10$70AONOaG2M6MNgIacIJtle9hKDAHs7mr1HbcBL1JGjPHABWCevus6', '陈建光', '0', '陈晓光', '广东省揭阳市', '13005416332', 'http://tvax4.sinaimg.cn/crop.0.0.480.480.180/768c39d5ly8fjje1d0teej20dc0dcq35.jpg', '2018-12-15 09:07:43', '2018-12-15 09:07:43');
