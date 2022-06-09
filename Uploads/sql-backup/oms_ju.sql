/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : oms_ju

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:28:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for trade_excution
-- ----------------------------
DROP TABLE IF EXISTS `trade_excution`;
CREATE TABLE `trade_excution` (
  `trade_excution_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL COMMENT '交易账户账号',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` varchar(20) DEFAULT NULL COMMENT '??',
  `code` varchar(20) DEFAULT NULL COMMENT '??',
  `input_channel` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` varchar(100) DEFAULT NULL COMMENT '????',
  `order_no` varchar(20) DEFAULT NULL,
  `cacc_order_id` varchar(30) DEFAULT NULL,
  `last_cr_user` text,
  `is_demo_acc` text,
  `order_channel` text,
  `create_time` datetime DEFAULT NULL,
  `routing_id` varchar(20) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `exch_order_info` text,
  PRIMARY KEY (`trade_excution_id`),
  KEY `queryforhistory` (`client_acc_id`,`create_time`),
  KEY `idx_input_channel` (`input_channel`)
) ENGINE=InnoDB AUTO_INCREMENT=704632 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_excution_01
-- ----------------------------
DROP TABLE IF EXISTS `trade_excution_01`;
CREATE TABLE `trade_excution_01` (
  `trade_excution_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL COMMENT '交易账户账号',
  `bs_flag` char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '买卖标志',
  `exchange` varchar(20) DEFAULT NULL COMMENT '??',
  `code` varchar(20) DEFAULT NULL COMMENT '??',
  `input_channel` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` varchar(100) DEFAULT NULL COMMENT '????',
  `order_no` varchar(20) DEFAULT NULL,
  `cacc_order_id` varchar(30) DEFAULT NULL,
  `last_cr_user` text,
  `is_demo_acc` text,
  `order_channel` text,
  `create_time` datetime DEFAULT NULL,
  `routing_id` varchar(20) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `exch_order_info` text CHARACTER SET utf8mb4,
  `trading_day` int(11) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `trade_date` int(11) DEFAULT NULL,
  `trade_time` int(11) DEFAULT NULL,
  `instrument_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`trade_excution_id`),
  KEY `queryforhistory` (`client_acc_id`,`create_time`),
  KEY `idx_input_channel` (`input_channel`),
  KEY `idx_trading_day` (`trading_day`),
  KEY `idx_exchange_code` (`exchange`,`code`),
  KEY `idx_account_tradeday` (`client_acc_id`,`qty`,`price`,`trading_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=698729 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order` (
  `order_inner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单内部id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL,
  `client_acc_name` varchar(100) DEFAULT NULL COMMENT '????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` varchar(20) DEFAULT NULL COMMENT '??',
  `code` varchar(20) DEFAULT NULL COMMENT '??',
  `product_name` varchar(300) DEFAULT NULL COMMENT '????',
  `input_channel` varchar(20) DEFAULT NULL,
  `exec_qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` varchar(50) DEFAULT NULL COMMENT '????',
  `order_no` varchar(20) DEFAULT NULL COMMENT '????',
  `order_type` varchar(20) DEFAULT NULL COMMENT '???? I ????? A ??? L ??? E ????? S ????? M ???',
  `order_status` varchar(20) DEFAULT NULL COMMENT '????',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reference` text,
  `reference1` text,
  `sett_ccy` text,
  `match_qty` int(11) DEFAULT NULL COMMENT '成交笔数',
  `avg_trade_price` double DEFAULT NULL COMMENT '成交均价',
  PRIMARY KEY (`order_inner_id`),
  KEY `historyQuery` (`client_acc_id`,`create_time`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=998951 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order_01
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_01`;
CREATE TABLE `trade_order_01` (
  `order_inner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单内部id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL,
  `client_acc_name` varchar(100) DEFAULT NULL COMMENT '????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` varchar(20) DEFAULT NULL COMMENT '??',
  `code` varchar(20) DEFAULT NULL COMMENT '??',
  `product_name` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '????',
  `input_channel` varchar(20) DEFAULT NULL,
  `exec_qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` varchar(50) DEFAULT NULL COMMENT '????',
  `order_no` varchar(20) DEFAULT NULL COMMENT '????',
  `order_type` varchar(20) DEFAULT NULL COMMENT '???? I ????? A ??? L ??? E ????? S ????? M ???',
  `order_status` varchar(20) DEFAULT NULL COMMENT '????',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reference` text,
  `reference1` text,
  `sett_ccy` text,
  `match_qty` int(11) DEFAULT NULL COMMENT '成交笔数',
  `avg_trade_price` double DEFAULT NULL COMMENT '成交均价',
  `trading_day` int(11) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `insert_date` int(11) DEFAULT NULL,
  `insert_time` int(11) DEFAULT NULL,
  `instrument_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`order_inner_id`),
  KEY `historyQuery` (`client_acc_id`,`create_time`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_exchange_code` (`exchange`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=989845 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
