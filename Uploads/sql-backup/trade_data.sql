/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : trade_data

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:29:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ambiguous
-- ----------------------------
DROP TABLE IF EXISTS `ambiguous`;
CREATE TABLE `ambiguous` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyword` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主体关键词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9738 DEFAULT CHARSET=utf8 COMMENT='金融词汇';

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(50) DEFAULT NULL COMMENT '博客分类（大盘，板块，个股）',
  `exchange` varchar(100) DEFAULT NULL COMMENT '交易所：SESH=>上交所；SESZ=>深交所；JUNIOR=>自定义',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  `weight` float NOT NULL DEFAULT '-1' COMMENT '标签权重',
  `blog_date` varchar(50) DEFAULT NULL COMMENT '博客创建日期',
  `blog_source` varchar(100) NOT NULL COMMENT '博客来源网站',
  `blog_url` varchar(200) DEFAULT NULL COMMENT '博客URL',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '博客创建时间',
  `reposts_count` int(11) DEFAULT '0' COMMENT '转发数',
  `comments_count` int(11) DEFAULT '0' COMMENT '评论数',
  `attitudes_count` int(11) DEFAULT '0' COMMENT '表态数',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `max_positive_score` float DEFAULT NULL COMMENT '最大正向得分',
  `min_negative_score` float DEFAULT NULL COMMENT '最小负向得分',
  `sentiment_score` float DEFAULT NULL COMMENT '情感得分',
  `sentiment_type` varchar(50) DEFAULT NULL COMMENT '情感类型：1=>正向; 0=>中性; -1=>负向',
  PRIMARY KEY (`id`,`created_at`),
  KEY `idx_code` (`code`),
  KEY `idx_created_at` (`created_at`),
  KEY `blog_url_exchange_code` (`blog_url`,`exchange`,`code`),
  KEY `idx_blog_date` (`blog_date`),
  KEY `update_time` (`update_time`),
  KEY `create_time` (`create_time`),
  KEY `name` (`name`),
  KEY `sentiment_score` (`sentiment_score`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='明星用户博客'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(created_at))
(PARTITION pless200601 VALUES LESS THAN (1136044800) ENGINE = InnoDB,
 PARTITION pless200701 VALUES LESS THAN (1167580800) ENGINE = InnoDB,
 PARTITION pless200801 VALUES LESS THAN (1199116800) ENGINE = InnoDB,
 PARTITION pless200901 VALUES LESS THAN (1230739200) ENGINE = InnoDB,
 PARTITION pless201001 VALUES LESS THAN (1262275200) ENGINE = InnoDB,
 PARTITION pless201101 VALUES LESS THAN (1293811200) ENGINE = InnoDB,
 PARTITION pless201201 VALUES LESS THAN (1325347200) ENGINE = InnoDB,
 PARTITION pless201301 VALUES LESS THAN (1356969600) ENGINE = InnoDB,
 PARTITION pless201401 VALUES LESS THAN (1388505600) ENGINE = InnoDB,
 PARTITION p201401 VALUES LESS THAN (1391184000) ENGINE = InnoDB,
 PARTITION p201402 VALUES LESS THAN (1393603200) ENGINE = InnoDB,
 PARTITION p201403 VALUES LESS THAN (1396281600) ENGINE = InnoDB,
 PARTITION p201404 VALUES LESS THAN (1398873600) ENGINE = InnoDB,
 PARTITION p201405 VALUES LESS THAN (1401552000) ENGINE = InnoDB,
 PARTITION p201406 VALUES LESS THAN (1404144000) ENGINE = InnoDB,
 PARTITION p201407 VALUES LESS THAN (1406822400) ENGINE = InnoDB,
 PARTITION p201408 VALUES LESS THAN (1409500800) ENGINE = InnoDB,
 PARTITION p201409 VALUES LESS THAN (1412092800) ENGINE = InnoDB,
 PARTITION p201410 VALUES LESS THAN (1414771200) ENGINE = InnoDB,
 PARTITION p201411 VALUES LESS THAN (1417363200) ENGINE = InnoDB,
 PARTITION p201412 VALUES LESS THAN (1420041600) ENGINE = InnoDB,
 PARTITION p201501 VALUES LESS THAN (1422720000) ENGINE = InnoDB,
 PARTITION p201502 VALUES LESS THAN (1425168000) ENGINE = InnoDB,
 PARTITION p201503 VALUES LESS THAN (1427846400) ENGINE = InnoDB,
 PARTITION p201504 VALUES LESS THAN (1430438400) ENGINE = InnoDB,
 PARTITION p201505 VALUES LESS THAN (1433116800) ENGINE = InnoDB,
 PARTITION p201506 VALUES LESS THAN (1435708800) ENGINE = InnoDB,
 PARTITION p201507 VALUES LESS THAN (1438387200) ENGINE = InnoDB,
 PARTITION p201508 VALUES LESS THAN (1441065600) ENGINE = InnoDB,
 PARTITION p201509 VALUES LESS THAN (1443657600) ENGINE = InnoDB,
 PARTITION p201510 VALUES LESS THAN (1446336000) ENGINE = InnoDB,
 PARTITION p201511 VALUES LESS THAN (1448928000) ENGINE = InnoDB,
 PARTITION p201512 VALUES LESS THAN (1451606400) ENGINE = InnoDB,
 PARTITION p201601 VALUES LESS THAN (1454284800) ENGINE = InnoDB,
 PARTITION p201602 VALUES LESS THAN (1456790400) ENGINE = InnoDB,
 PARTITION p201603 VALUES LESS THAN (1459440000) ENGINE = InnoDB,
 PARTITION p201604 VALUES LESS THAN (1462032000) ENGINE = InnoDB,
 PARTITION p201605 VALUES LESS THAN (1464710400) ENGINE = InnoDB,
 PARTITION p201606 VALUES LESS THAN (1467302400) ENGINE = InnoDB,
 PARTITION p201607 VALUES LESS THAN (1469980800) ENGINE = InnoDB,
 PARTITION p201608 VALUES LESS THAN (1472659200) ENGINE = InnoDB,
 PARTITION p201609 VALUES LESS THAN (1475251200) ENGINE = InnoDB,
 PARTITION p201610 VALUES LESS THAN (1477929600) ENGINE = InnoDB,
 PARTITION p201611 VALUES LESS THAN (1480521600) ENGINE = InnoDB,
 PARTITION p201612 VALUES LESS THAN (1483200000) ENGINE = InnoDB,
 PARTITION p201701 VALUES LESS THAN (1485878400) ENGINE = InnoDB,
 PARTITION p201702 VALUES LESS THAN (1488297600) ENGINE = InnoDB,
 PARTITION pMAX VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for blog_opinion
-- ----------------------------
DROP TABLE IF EXISTS `blog_opinion`;
CREATE TABLE `blog_opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange` varchar(100) DEFAULT NULL COMMENT '交易所：SESH=>上交所；SESZ=>深交所；JUNIOR=>自定义',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  `weight` float NOT NULL DEFAULT '-1' COMMENT '标签权重',
  `blog_date` varchar(50) DEFAULT NULL COMMENT '博客创建日期',
  `blog_source` varchar(100) NOT NULL COMMENT '博客来源网站',
  `blog_url` varchar(200) DEFAULT NULL COMMENT '博客URL',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '博客创建时间',
  `max_positive_score` float DEFAULT NULL COMMENT '最大正向得分',
  `min_negative_score` float DEFAULT NULL COMMENT '最小负向得分',
  `sentiment_score` float DEFAULT NULL COMMENT '情感得分',
  `sentiment_type` varchar(50) DEFAULT NULL COMMENT '情感类型：1=>正向; 0=>中性; -1=>负向',
  `title` varchar(100) DEFAULT NULL,
  `title_sentiment_score` float DEFAULT '0',
  `title_sentiment_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`created_at`),
  KEY `idx_code` (`code`),
  KEY `idx_created_at` (`created_at`),
  KEY `blog_url_exchange_code` (`blog_url`,`exchange`,`code`),
  KEY `idx_blog_date` (`blog_date`),
  KEY `update_time` (`update_time`),
  KEY `create_time` (`create_time`),
  KEY `name` (`name`),
  KEY `sentiment_score` (`sentiment_score`),
  KEY `title` (`title`),
  KEY `title_sentiment_score` (`title_sentiment_score`),
  KEY `title_sentiment_type` (`title_sentiment_type`),
  KEY `sentiment_type` (`sentiment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='明星用户博客'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(created_at))
(PARTITION pless200601 VALUES LESS THAN (1136044800) ENGINE = InnoDB,
 PARTITION pless200701 VALUES LESS THAN (1167580800) ENGINE = InnoDB,
 PARTITION pless200801 VALUES LESS THAN (1199116800) ENGINE = InnoDB,
 PARTITION pless200901 VALUES LESS THAN (1230739200) ENGINE = InnoDB,
 PARTITION pless201001 VALUES LESS THAN (1262275200) ENGINE = InnoDB,
 PARTITION pless201101 VALUES LESS THAN (1293811200) ENGINE = InnoDB,
 PARTITION pless201201 VALUES LESS THAN (1325347200) ENGINE = InnoDB,
 PARTITION pless201301 VALUES LESS THAN (1356969600) ENGINE = InnoDB,
 PARTITION pless201401 VALUES LESS THAN (1388505600) ENGINE = InnoDB,
 PARTITION p201401 VALUES LESS THAN (1391184000) ENGINE = InnoDB,
 PARTITION p201402 VALUES LESS THAN (1393603200) ENGINE = InnoDB,
 PARTITION p201403 VALUES LESS THAN (1396281600) ENGINE = InnoDB,
 PARTITION p201404 VALUES LESS THAN (1398873600) ENGINE = InnoDB,
 PARTITION p201405 VALUES LESS THAN (1401552000) ENGINE = InnoDB,
 PARTITION p201406 VALUES LESS THAN (1404144000) ENGINE = InnoDB,
 PARTITION p201407 VALUES LESS THAN (1406822400) ENGINE = InnoDB,
 PARTITION p201408 VALUES LESS THAN (1409500800) ENGINE = InnoDB,
 PARTITION p201409 VALUES LESS THAN (1412092800) ENGINE = InnoDB,
 PARTITION p201410 VALUES LESS THAN (1414771200) ENGINE = InnoDB,
 PARTITION p201411 VALUES LESS THAN (1417363200) ENGINE = InnoDB,
 PARTITION p201412 VALUES LESS THAN (1420041600) ENGINE = InnoDB,
 PARTITION p201501 VALUES LESS THAN (1422720000) ENGINE = InnoDB,
 PARTITION p201502 VALUES LESS THAN (1425168000) ENGINE = InnoDB,
 PARTITION p201503 VALUES LESS THAN (1427846400) ENGINE = InnoDB,
 PARTITION p201504 VALUES LESS THAN (1430438400) ENGINE = InnoDB,
 PARTITION p201505 VALUES LESS THAN (1433116800) ENGINE = InnoDB,
 PARTITION p201506 VALUES LESS THAN (1435708800) ENGINE = InnoDB,
 PARTITION p201507 VALUES LESS THAN (1438387200) ENGINE = InnoDB,
 PARTITION p201508 VALUES LESS THAN (1441065600) ENGINE = InnoDB,
 PARTITION p201509 VALUES LESS THAN (1443657600) ENGINE = InnoDB,
 PARTITION p201510 VALUES LESS THAN (1446336000) ENGINE = InnoDB,
 PARTITION p201511 VALUES LESS THAN (1448928000) ENGINE = InnoDB,
 PARTITION p201512 VALUES LESS THAN (1451606400) ENGINE = InnoDB,
 PARTITION p201601 VALUES LESS THAN (1454284800) ENGINE = InnoDB,
 PARTITION p201602 VALUES LESS THAN (1456790400) ENGINE = InnoDB,
 PARTITION p201603 VALUES LESS THAN (1459440000) ENGINE = InnoDB,
 PARTITION p201604 VALUES LESS THAN (1462032000) ENGINE = InnoDB,
 PARTITION p201605 VALUES LESS THAN (1464710400) ENGINE = InnoDB,
 PARTITION p201606 VALUES LESS THAN (1467302400) ENGINE = InnoDB,
 PARTITION p201607 VALUES LESS THAN (1469980800) ENGINE = InnoDB,
 PARTITION p201608 VALUES LESS THAN (1472659200) ENGINE = InnoDB,
 PARTITION p201609 VALUES LESS THAN (1475251200) ENGINE = InnoDB,
 PARTITION p201610 VALUES LESS THAN (1477929600) ENGINE = InnoDB,
 PARTITION p201611 VALUES LESS THAN (1480521600) ENGINE = InnoDB,
 PARTITION p201612 VALUES LESS THAN (1483200000) ENGINE = InnoDB,
 PARTITION p201701 VALUES LESS THAN (1485878400) ENGINE = InnoDB,
 PARTITION p201702 VALUES LESS THAN (1488297600) ENGINE = InnoDB,
 PARTITION pMAX VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for financial
-- ----------------------------
DROP TABLE IF EXISTS `financial`;
CREATE TABLE `financial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyword` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主体关键词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7512 DEFAULT CHARSET=utf8 COMMENT='金融词汇';

-- ----------------------------
-- Table structure for negative
-- ----------------------------
DROP TABLE IF EXISTS `negative`;
CREATE TABLE `negative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyword` varchar(100) NOT NULL COMMENT '负向关键词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8 COMMENT='主体词库';

-- ----------------------------
-- Table structure for positive
-- ----------------------------
DROP TABLE IF EXISTS `positive`;
CREATE TABLE `positive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyword` varchar(100) NOT NULL COMMENT '正向关键词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COMMENT='主体词库';

-- ----------------------------
-- Table structure for stop_words
-- ----------------------------
DROP TABLE IF EXISTS `stop_words`;
CREATE TABLE `stop_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyword` varchar(100) NOT NULL COMMENT '负向关键词',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='主体词库';

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyword` varchar(100) NOT NULL COMMENT '主体关键词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2641 DEFAULT CHARSET=utf8 COMMENT='主体词库';

-- ----------------------------
-- Table structure for synonyms
-- ----------------------------
DROP TABLE IF EXISTS `synonyms`;
CREATE TABLE `synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyword` varchar(100) NOT NULL COMMENT '主体关键词',
  `synonyms` varchar(200) NOT NULL COMMENT '同义词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='金融词汇';

-- ----------------------------
-- Table structure for weixin
-- ----------------------------
DROP TABLE IF EXISTS `weixin`;
CREATE TABLE `weixin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(50) DEFAULT NULL COMMENT '博客分类（大盘，板块，个股）',
  `exchange` varchar(100) DEFAULT NULL COMMENT '交易所：SESH=>上交所；SESZ=>深交所；JUNIOR=>自定义',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL,
  `weight` float DEFAULT NULL COMMENT '标签权重',
  `weixin_date` varchar(50) DEFAULT NULL COMMENT '微信创建日期',
  `weixin_name` varchar(100) DEFAULT NULL COMMENT '微信名称',
  `weixin_id` varchar(50) DEFAULT NULL COMMENT '微信ID',
  `weixin_url` varchar(200) DEFAULT NULL COMMENT '微信URL',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '微博创建时间',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `max_positive_score` float DEFAULT NULL COMMENT '最大正向得分',
  `min_negative_score` float DEFAULT NULL COMMENT '最小负向得分',
  `sentiment_score` float DEFAULT NULL COMMENT '情感得分',
  `sentiment_type` varchar(50) DEFAULT NULL COMMENT '情感类型：1=>正向; 0=>中性; -1=>负向',
  PRIMARY KEY (`id`,`created_at`),
  KEY `idx_code` (`code`),
  KEY `idx_created_at` (`created_at`),
  KEY `blog_url_exchange_code` (`weixin_url`,`exchange`,`code`),
  KEY `update_time` (`update_time`),
  KEY `create_time` (`create_time`),
  KEY `idx_weixin_date` (`weixin_date`),
  KEY `name` (`name`),
  KEY `sentiment_score` (`sentiment_score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(created_at))
(PARTITION pless201401 VALUES LESS THAN (1388505600) ENGINE = InnoDB,
 PARTITION p201401 VALUES LESS THAN (1391184000) ENGINE = InnoDB,
 PARTITION p201402 VALUES LESS THAN (1393603200) ENGINE = InnoDB,
 PARTITION p201403 VALUES LESS THAN (1396281600) ENGINE = InnoDB,
 PARTITION p201404 VALUES LESS THAN (1398873600) ENGINE = InnoDB,
 PARTITION p201405 VALUES LESS THAN (1401552000) ENGINE = InnoDB,
 PARTITION p201406 VALUES LESS THAN (1404144000) ENGINE = InnoDB,
 PARTITION p201407 VALUES LESS THAN (1406822400) ENGINE = InnoDB,
 PARTITION p201408 VALUES LESS THAN (1409500800) ENGINE = InnoDB,
 PARTITION p201409 VALUES LESS THAN (1412092800) ENGINE = InnoDB,
 PARTITION p201410 VALUES LESS THAN (1414771200) ENGINE = InnoDB,
 PARTITION p201411 VALUES LESS THAN (1417363200) ENGINE = InnoDB,
 PARTITION p201412 VALUES LESS THAN (1420041600) ENGINE = InnoDB,
 PARTITION p201501 VALUES LESS THAN (1422720000) ENGINE = InnoDB,
 PARTITION p201502 VALUES LESS THAN (1425168000) ENGINE = InnoDB,
 PARTITION p201503 VALUES LESS THAN (1427846400) ENGINE = InnoDB,
 PARTITION p201504 VALUES LESS THAN (1430438400) ENGINE = InnoDB,
 PARTITION p201505 VALUES LESS THAN (1433116800) ENGINE = InnoDB,
 PARTITION p201506 VALUES LESS THAN (1435708800) ENGINE = InnoDB,
 PARTITION p201507 VALUES LESS THAN (1438387200) ENGINE = InnoDB,
 PARTITION p201508 VALUES LESS THAN (1441065600) ENGINE = InnoDB,
 PARTITION p201509 VALUES LESS THAN (1443657600) ENGINE = InnoDB,
 PARTITION p201510 VALUES LESS THAN (1446336000) ENGINE = InnoDB,
 PARTITION p201511 VALUES LESS THAN (1448928000) ENGINE = InnoDB,
 PARTITION p201512 VALUES LESS THAN (1451606400) ENGINE = InnoDB,
 PARTITION p201601 VALUES LESS THAN (1454284800) ENGINE = InnoDB,
 PARTITION p201602 VALUES LESS THAN (1456790400) ENGINE = InnoDB,
 PARTITION p201603 VALUES LESS THAN (1459440000) ENGINE = InnoDB,
 PARTITION p201604 VALUES LESS THAN (1462032000) ENGINE = InnoDB,
 PARTITION p201605 VALUES LESS THAN (1464710400) ENGINE = InnoDB,
 PARTITION p201606 VALUES LESS THAN (1467302400) ENGINE = InnoDB,
 PARTITION p201607 VALUES LESS THAN (1469980800) ENGINE = InnoDB,
 PARTITION p201608 VALUES LESS THAN (1472659200) ENGINE = InnoDB,
 PARTITION p201609 VALUES LESS THAN (1475251200) ENGINE = InnoDB,
 PARTITION p201610 VALUES LESS THAN (1477929600) ENGINE = InnoDB,
 PARTITION p201611 VALUES LESS THAN (1480521600) ENGINE = InnoDB,
 PARTITION p201612 VALUES LESS THAN (1483200000) ENGINE = InnoDB,
 PARTITION p201701 VALUES LESS THAN (1485878400) ENGINE = InnoDB,
 PARTITION p201702 VALUES LESS THAN (1488297600) ENGINE = InnoDB,
 PARTITION pMAX VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for weixin_opinion
-- ----------------------------
DROP TABLE IF EXISTS `weixin_opinion`;
CREATE TABLE `weixin_opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange` varchar(100) DEFAULT NULL COMMENT '交易所：SESH=>上交所；SESZ=>深交所；JUNIOR=>自定义',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL,
  `weight` float DEFAULT NULL COMMENT '标签权重',
  `weixin_date` varchar(50) DEFAULT NULL COMMENT '微信创建日期',
  `weixin_name` varchar(100) DEFAULT NULL COMMENT '微信名称',
  `weixin_id` varchar(50) DEFAULT NULL COMMENT '微信ID',
  `weixin_url` varchar(200) DEFAULT NULL COMMENT '微信URL',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '微博创建时间',
  `max_positive_score` float DEFAULT NULL COMMENT '最大正向得分',
  `min_negative_score` float DEFAULT NULL COMMENT '最小负向得分',
  `sentiment_score` float DEFAULT NULL COMMENT '情感得分',
  `sentiment_type` varchar(50) DEFAULT NULL COMMENT '情感类型：1=>正向; 0=>中性; -1=>负向',
  `title` varchar(100) DEFAULT NULL,
  `title_sentiment_score` float DEFAULT '0',
  `title_sentiment_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`created_at`),
  KEY `idx_code` (`code`),
  KEY `idx_created_at` (`created_at`),
  KEY `blog_url_exchange_code` (`weixin_url`,`exchange`,`code`),
  KEY `update_time` (`update_time`),
  KEY `create_time` (`create_time`),
  KEY `idx_weixin_date` (`weixin_date`),
  KEY `name` (`name`),
  KEY `sentiment_score` (`sentiment_score`),
  KEY `title` (`title`,`title_sentiment_score`,`title_sentiment_type`),
  KEY `sentiment_type` (`sentiment_type`),
  KEY `title_sentiment_score` (`title_sentiment_score`),
  KEY `title_sentiment_type` (`title_sentiment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信'
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(created_at))
(PARTITION pless201401 VALUES LESS THAN (1388505600) ENGINE = InnoDB,
 PARTITION p201401 VALUES LESS THAN (1391184000) ENGINE = InnoDB,
 PARTITION p201402 VALUES LESS THAN (1393603200) ENGINE = InnoDB,
 PARTITION p201403 VALUES LESS THAN (1396281600) ENGINE = InnoDB,
 PARTITION p201404 VALUES LESS THAN (1398873600) ENGINE = InnoDB,
 PARTITION p201405 VALUES LESS THAN (1401552000) ENGINE = InnoDB,
 PARTITION p201406 VALUES LESS THAN (1404144000) ENGINE = InnoDB,
 PARTITION p201407 VALUES LESS THAN (1406822400) ENGINE = InnoDB,
 PARTITION p201408 VALUES LESS THAN (1409500800) ENGINE = InnoDB,
 PARTITION p201409 VALUES LESS THAN (1412092800) ENGINE = InnoDB,
 PARTITION p201410 VALUES LESS THAN (1414771200) ENGINE = InnoDB,
 PARTITION p201411 VALUES LESS THAN (1417363200) ENGINE = InnoDB,
 PARTITION p201412 VALUES LESS THAN (1420041600) ENGINE = InnoDB,
 PARTITION p201501 VALUES LESS THAN (1422720000) ENGINE = InnoDB,
 PARTITION p201502 VALUES LESS THAN (1425168000) ENGINE = InnoDB,
 PARTITION p201503 VALUES LESS THAN (1427846400) ENGINE = InnoDB,
 PARTITION p201504 VALUES LESS THAN (1430438400) ENGINE = InnoDB,
 PARTITION p201505 VALUES LESS THAN (1433116800) ENGINE = InnoDB,
 PARTITION p201506 VALUES LESS THAN (1435708800) ENGINE = InnoDB,
 PARTITION p201507 VALUES LESS THAN (1438387200) ENGINE = InnoDB,
 PARTITION p201508 VALUES LESS THAN (1441065600) ENGINE = InnoDB,
 PARTITION p201509 VALUES LESS THAN (1443657600) ENGINE = InnoDB,
 PARTITION p201510 VALUES LESS THAN (1446336000) ENGINE = InnoDB,
 PARTITION p201511 VALUES LESS THAN (1448928000) ENGINE = InnoDB,
 PARTITION p201512 VALUES LESS THAN (1451606400) ENGINE = InnoDB,
 PARTITION p201601 VALUES LESS THAN (1454284800) ENGINE = InnoDB,
 PARTITION p201602 VALUES LESS THAN (1456790400) ENGINE = InnoDB,
 PARTITION p201603 VALUES LESS THAN (1459440000) ENGINE = InnoDB,
 PARTITION p201604 VALUES LESS THAN (1462032000) ENGINE = InnoDB,
 PARTITION p201605 VALUES LESS THAN (1464710400) ENGINE = InnoDB,
 PARTITION p201606 VALUES LESS THAN (1467302400) ENGINE = InnoDB,
 PARTITION p201607 VALUES LESS THAN (1469980800) ENGINE = InnoDB,
 PARTITION p201608 VALUES LESS THAN (1472659200) ENGINE = InnoDB,
 PARTITION p201609 VALUES LESS THAN (1475251200) ENGINE = InnoDB,
 PARTITION p201610 VALUES LESS THAN (1477929600) ENGINE = InnoDB,
 PARTITION p201611 VALUES LESS THAN (1480521600) ENGINE = InnoDB,
 PARTITION p201612 VALUES LESS THAN (1483200000) ENGINE = InnoDB,
 PARTITION p201701 VALUES LESS THAN (1485878400) ENGINE = InnoDB,
 PARTITION p201702 VALUES LESS THAN (1488297600) ENGINE = InnoDB,
 PARTITION pMAX VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

SET FOREIGN_KEY_CHECKS = 1;
