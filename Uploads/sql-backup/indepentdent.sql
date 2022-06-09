/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : indepentdent

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:14:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sh_mutual_market
-- ----------------------------
DROP TABLE IF EXISTS `sh_mutual_market`;
CREATE TABLE `sh_mutual_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '股份代码',
  `name` varchar(255) DEFAULT NULL COMMENT '股份名称',
  `volume` varchar(255) DEFAULT NULL COMMENT '持股量',
  `volumePCT` varchar(255) DEFAULT NULL COMMENT '持股百分比(%)',
  `tdate` date DEFAULT NULL COMMENT '持股日期',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1204294 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sz_mutual_market
-- ----------------------------
DROP TABLE IF EXISTS `sz_mutual_market`;
CREATE TABLE `sz_mutual_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '股份代码',
  `name` varchar(255) DEFAULT NULL COMMENT '股份名称',
  `volume` varchar(255) DEFAULT NULL COMMENT '持股量',
  `volumePCT` varchar(255) DEFAULT NULL COMMENT '持股百分比(%)',
  `tdate` date DEFAULT NULL COMMENT '持股日期',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1556274 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
