/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : report_us

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:29:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_user_access
-- ----------------------------
DROP TABLE IF EXISTS `app_user_access`;
CREATE TABLE `app_user_access` (
  `request_time` timestamp NULL DEFAULT NULL,
  `code_happen` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `client_time` timestamp NULL DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `manu` varchar(255) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `screen_w` varchar(255) DEFAULT NULL,
  `screen_h` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
