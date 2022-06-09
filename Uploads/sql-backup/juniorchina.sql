/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : juniorchina

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:16:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about_juniorchina
-- ----------------------------
DROP TABLE IF EXISTS `about_juniorchina`;
CREATE TABLE `about_juniorchina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `channel` varchar(32) NOT NULL DEFAULT '' COMMENT '频道：公司简介，投资理念，成绩荣耀，合作伙伴',
  `content` text NOT NULL COMMENT '内容(html)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`),
  KEY `idx_channel` (`channel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='关于尊嘉';

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5密码',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Table structure for customer_service
-- ----------------------------
DROP TABLE IF EXISTS `customer_service`;
CREATE TABLE `customer_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `company_name_en` varchar(64) NOT NULL DEFAULT '' COMMENT '公司英文名称',
  `company_address` varchar(64) NOT NULL DEFAULT '' COMMENT '公司地址',
  `company_postcode` varchar(64) NOT NULL DEFAULT '' COMMENT '公司邮编',
  `company_address_en` varchar(99) NOT NULL DEFAULT '' COMMENT '公司英文地址',
  `company_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '电话',
  `company_fax` varchar(32) NOT NULL DEFAULT '' COMMENT '传真',
  `service_email` varchar(64) NOT NULL DEFAULT '' COMMENT '客服邮箱',
  `recruite_email` varchar(64) NOT NULL DEFAULT '' COMMENT '招聘邮箱',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户服务';

-- ----------------------------
-- Table structure for fund
-- ----------------------------
DROP TABLE IF EXISTS `fund`;
CREATE TABLE `fund` (
  `basic_info_two` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `fund_series_id` int(11) NOT NULL DEFAULT '0' COMMENT '基金产品系列id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '基金名字',
  `basic_info` text NOT NULL COMMENT '基本资料(html)',
  `online_booking_info` text NOT NULL COMMENT '网上预约提示(html)',
  `subscription_process` text NOT NULL COMMENT '认购流程(html)',
  `for_comparison` int(11) NOT NULL DEFAULT '0' COMMENT '是否用来比较净值的指数:0否,1是',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '显示排序值(数字越大，显示越靠前)',
  `show_in_home` int(11) NOT NULL DEFAULT '0' COMMENT '首页显示是否:0否,1是',
  `target` varchar(255) NOT NULL DEFAULT '' COMMENT '定位',
  `duration` varchar(255) NOT NULL DEFAULT '' COMMENT '存续期',
  `establishment_day` date NOT NULL,
  `policy_type` varchar(255) NOT NULL DEFAULT '' COMMENT '首页img',
  `fund_year` decimal(22,2) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  `openHouse` varchar(12) NOT NULL,
  `Mobilebasic` text NOT NULL,
  `Mobilebasictwo` text NOT NULL,
  `fundMoney` varchar(20) NOT NULL,
  `fundBeginValue` varchar(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_fund_series_id` (`fund_series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='基金产品';

-- ----------------------------
-- Table structure for fund_series
-- ----------------------------
DROP TABLE IF EXISTS `fund_series`;
CREATE TABLE `fund_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '基金名字',
  `desc` text NOT NULL COMMENT '描述(html)',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '显示排序值(数字越大，显示越靠前)',
  `show_in_home` int(11) NOT NULL DEFAULT '0' COMMENT '首页显示是否:0否,1是',
  `target` varchar(255) NOT NULL DEFAULT '' COMMENT '定位',
  `strategy` varchar(255) NOT NULL DEFAULT '' COMMENT '策略',
  `img_in_home` varchar(255) NOT NULL DEFAULT '' COMMENT '首页img',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='基金产品系列';

-- ----------------------------
-- Table structure for fund_value
-- ----------------------------
DROP TABLE IF EXISTS `fund_value`;
CREATE TABLE `fund_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `fund_id` int(11) NOT NULL DEFAULT '0' COMMENT '基金产品id',
  `value_time` date DEFAULT '0000-00-00' COMMENT '净值日期',
  `share_value` decimal(7,4) NOT NULL DEFAULT '0.0000' COMMENT '本周份额净值',
  `cumulative_value` decimal(7,4) NOT NULL DEFAULT '0.0000' COMMENT '本周累计净值',
  `cumulative_value_last_week` decimal(7,4) NOT NULL DEFAULT '0.0000' COMMENT '上周累计净值',
  `value_change` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '周涨跌%',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`),
  KEY `idx_fund_id` (`fund_id`),
  KEY `idx_value_time` (`value_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2413 DEFAULT CHARSET=utf8 COMMENT='产品净值';

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `news_type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型：公司公告,新闻报道,公司视点',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `news_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '公告日期',
  `author` varchar(64) NOT NULL DEFAULT '' COMMENT '作者',
  `content` longtext NOT NULL COMMENT '内容(html)',
  `show_in_home` int(11) DEFAULT '0' COMMENT '首页显示是否:0否,1是',
  `img_in_home` varchar(1000) NOT NULL DEFAULT '' COMMENT '首页img',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '显示排序值(数字越大，显示越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  `summary` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_news_time` (`news_time`),
  KEY `idx_rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

-- ----------------------------
-- Table structure for online_booking
-- ----------------------------
DROP TABLE IF EXISTS `online_booking`;
CREATE TABLE `online_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `fund_id` varchar(20) NOT NULL DEFAULT '0' COMMENT '基金产品id',
  `customer_name` varchar(64) NOT NULL DEFAULT '' COMMENT '客户姓名',
  `customer_type` varchar(32) NOT NULL DEFAULT '' COMMENT '客户类型:个人客户,机构客户',
  `customer_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '手机',
  `customer_fax` varchar(32) NOT NULL DEFAULT '' COMMENT '传真',
  `customer_email` varchar(64) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `customer_address` varchar(255) NOT NULL DEFAULT '' COMMENT '通讯地址',
  `booking_amount` varchar(255) NOT NULL DEFAULT '' COMMENT '预约金额',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`),
  KEY `idx_fund_id` (`fund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='网上预约记录';

-- ----------------------------
-- Table structure for online_message
-- ----------------------------
DROP TABLE IF EXISTS `online_message`;
CREATE TABLE `online_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `customer_name` varchar(64) NOT NULL DEFAULT '' COMMENT '客户姓名',
  `customer_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '手机',
  `customer_email` varchar(64) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线留言记录';

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `question_type` varchar(32) DEFAULT '' COMMENT '类型：TODO',
  `question` varchar(255) DEFAULT '' COMMENT '问题',
  `answer` text COMMENT '回答',
  `rank` int(11) DEFAULT '0' COMMENT '显示排序值(数字越大，显示越靠前)',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '0:正常 1:删除',
  PRIMARY KEY (`id`),
  KEY `idx_question_type` (`question_type`),
  KEY `idx_rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='常见问题';

-- ----------------------------
-- Table structure for recruite
-- ----------------------------
DROP TABLE IF EXISTS `recruite`;
CREATE TABLE `recruite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `job_type` varchar(32) NOT NULL DEFAULT '' COMMENT '职位类型TODO',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '职位名称',
  `job_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '公告日期',
  `job_desc` text NOT NULL COMMENT '职位描述(html)',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '显示排序值(数字越大，显示越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:正常 1:删除',
  `job_place` varchar(60) NOT NULL,
  `job_duty` text NOT NULL,
  `job_pay` varchar(11) NOT NULL,
  `job_education` varchar(20) NOT NULL,
  `show_in_home` int(2) NOT NULL,
  `job_exper` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job_type` (`job_type`),
  KEY `idx_job_time` (`job_time`),
  KEY `idx_rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='招贤纳士';

SET FOREIGN_KEY_CHECKS = 1;
