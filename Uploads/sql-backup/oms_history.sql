/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : oms_history

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:27:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cond_orders
-- ----------------------------
DROP TABLE IF EXISTS `cond_orders`;
CREATE TABLE `cond_orders` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `begin_date` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `price_type` int(11) NOT NULL,
  `price_operator` int(11) NOT NULL,
  `target_price` decimal(18,5) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `trigger_date` int(11) NOT NULL,
  `trigger_time` int(11) NOT NULL,
  `order_ref_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `cancel_info` varchar(128) NOT NULL,
  `real_order_id` varchar(20) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `order_type` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `price_level` int(11) NOT NULL,
  `is_trailing` tinyint(1) NOT NULL DEFAULT '0',
  `offset_type` tinyint(1) NOT NULL DEFAULT '0',
  `offset_value` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `cond_order_type` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(63) NOT NULL DEFAULT '',
  `extend_enable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`insert_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cond_orders_2020
-- ----------------------------
DROP TABLE IF EXISTS `cond_orders_2020`;
CREATE TABLE `cond_orders_2020` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `begin_date` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `price_type` int(11) NOT NULL,
  `price_operator` int(11) NOT NULL,
  `target_price` decimal(18,5) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `trigger_date` int(11) NOT NULL,
  `trigger_time` int(11) NOT NULL,
  `order_ref_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `cancel_info` varchar(128) NOT NULL,
  `real_order_id` varchar(20) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `order_type` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `price_level` int(11) NOT NULL,
  `is_trailing` tinyint(1) NOT NULL DEFAULT '0',
  `offset_type` tinyint(1) NOT NULL DEFAULT '0',
  `offset_value` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `cond_order_type` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(63) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cond_orders_us
-- ----------------------------
DROP TABLE IF EXISTS `cond_orders_us`;
CREATE TABLE `cond_orders_us` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `begin_date` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `price_type` int(11) NOT NULL,
  `price_operator` int(11) NOT NULL,
  `target_price` decimal(18,5) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `trigger_date` int(11) NOT NULL,
  `trigger_time` int(11) NOT NULL,
  `order_ref_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `cancel_info` varchar(128) NOT NULL,
  `real_order_id` varchar(20) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `order_type` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `price_level` int(11) NOT NULL,
  `is_trailing` tinyint(1) NOT NULL DEFAULT '0',
  `offset_type` tinyint(1) NOT NULL DEFAULT '0',
  `offset_value` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `cond_order_type` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(63) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`,`insert_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cond_orders_us_2020
-- ----------------------------
DROP TABLE IF EXISTS `cond_orders_us_2020`;
CREATE TABLE `cond_orders_us_2020` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `begin_date` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `price_type` int(11) NOT NULL,
  `price_operator` int(11) NOT NULL,
  `target_price` decimal(18,5) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `trigger_date` int(11) NOT NULL,
  `trigger_time` int(11) NOT NULL,
  `order_ref_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `cancel_info` varchar(128) NOT NULL,
  `real_order_id` varchar(20) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `order_type` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `price_level` int(11) NOT NULL,
  `is_trailing` tinyint(1) NOT NULL DEFAULT '0',
  `offset_type` tinyint(1) NOT NULL DEFAULT '0',
  `offset_value` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `cond_order_type` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(63) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fund_transfer
-- ----------------------------
DROP TABLE IF EXISTS `fund_transfer`;
CREATE TABLE `fund_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broker_id` varchar(12) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `transfer_id` varchar(32) NOT NULL,
  `ref_transfer_id` varchar(32) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `amount` decimal(18,5) NOT NULL,
  `transfer_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `remark` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5922 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipo_order
-- ----------------------------
DROP TABLE IF EXISTS `ipo_order`;
CREATE TABLE `ipo_order` (
  `id` int(11) NOT NULL,
  `user_id` varchar(31) NOT NULL,
  `user_order_id` varchar(31) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(31) NOT NULL,
  `account_id` varchar(15) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `loan_rate` decimal(18,5) NOT NULL,
  `status` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `trade_qty` int(11) NOT NULL,
  `trade_price` decimal(18,5) NOT NULL,
  `remark` varchar(63) NOT NULL,
  `interest_rate` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `loan_fee` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `exec_type` int(11) NOT NULL,
  `share` decimal(18,5) NOT NULL,
  `device_info` varchar(256) NOT NULL DEFAULT '',
  `trade_fee` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `allot_trading_day` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_trading_day` (`user_id`,`trading_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ipo_order_us
-- ----------------------------
DROP TABLE IF EXISTS `ipo_order_us`;
CREATE TABLE `ipo_order_us` (
  `id` int(11) NOT NULL,
  `user_id` varchar(31) NOT NULL,
  `user_order_id` varchar(31) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(31) NOT NULL,
  `account_id` varchar(15) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `loan_rate` decimal(18,5) NOT NULL,
  `status` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `trade_qty` int(11) NOT NULL,
  `trade_price` decimal(18,5) NOT NULL,
  `remark` varchar(63) NOT NULL,
  `interest_rate` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `loan_fee` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `exec_type` int(11) NOT NULL,
  `share` decimal(18,5) NOT NULL,
  `device_info` varchar(256) NOT NULL DEFAULT '',
  `trade_fee` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `allot_trading_day` int(11) NOT NULL DEFAULT '0',
  KEY `idx_user_id_trading_day` (`user_id`,`trading_day`),
  KEY `idx_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `trading_day` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `user_id` varchar(31) NOT NULL,
  `order_local_ref` varchar(31) NOT NULL,
  `router_user_id` varchar(8) NOT NULL,
  `order_local_id` int(11) NOT NULL,
  `new_order_local_id` int(11) NOT NULL,
  `router_account_id` int(11) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(31) NOT NULL,
  `investor_id` varchar(15) NOT NULL,
  `account_id` varchar(15) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `direction` int(11) NOT NULL,
  `order_restrictions` int(11) NOT NULL,
  `order_type` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `price_level` int(11) NOT NULL,
  `is_odd_lot` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `frozen_price` decimal(18,5) NOT NULL,
  `trade_volume` int(11) NOT NULL,
  `order_sys_id` varchar(63) NOT NULL,
  `status` int(11) NOT NULL,
  `status_info` varchar(127) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `exec_type` int(11) NOT NULL,
  `input_way` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `extra_type` int(11) NOT NULL,
  `market_id` int(11) NOT NULL DEFAULT '0',
  `bcan` varchar(15) NOT NULL,
  `user_clord_id` varchar(31) NOT NULL,
  `user_orig_clord_id` varchar(31) NOT NULL,
  `user_order_action_id` varchar(31) NOT NULL,
  `instrument_name` varchar(512) DEFAULT NULL,
  `route_id` int(11) NOT NULL DEFAULT '0',
  `sub_account` varchar(64) NOT NULL DEFAULT '',
  `device_info` varchar(256) NOT NULL DEFAULT '',
  `destination_id` int(11) NOT NULL DEFAULT '0',
  `big_volume` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `big_trade_volume` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `error_id` int(11) NOT NULL DEFAULT '0',
  `stop_price` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `exec_broker` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`trading_day`),
  KEY `index_instrument_id` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders_us
-- ----------------------------
DROP TABLE IF EXISTS `orders_us`;
CREATE TABLE `orders_us` (
  `trading_day` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `user_id` varchar(31) NOT NULL,
  `order_local_ref` varchar(31) NOT NULL,
  `router_user_id` varchar(8) NOT NULL,
  `order_local_id` int(11) NOT NULL,
  `new_order_local_id` int(11) NOT NULL,
  `router_account_id` int(11) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(31) NOT NULL,
  `investor_id` varchar(15) NOT NULL,
  `account_id` varchar(15) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `direction` int(11) NOT NULL,
  `order_restrictions` int(11) NOT NULL,
  `order_type` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `price_level` int(11) NOT NULL,
  `is_odd_lot` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `frozen_price` decimal(18,5) NOT NULL,
  `trade_volume` int(11) NOT NULL,
  `order_sys_id` varchar(63) NOT NULL,
  `status` int(11) NOT NULL,
  `status_info` varchar(127) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `exec_type` int(11) NOT NULL,
  `input_way` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `extra_type` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `big_volume` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `big_trade_volume` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `error_id` int(11) NOT NULL DEFAULT '0',
  `stop_price` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `bcan` varchar(15) NOT NULL,
  `user_clord_id` varchar(31) NOT NULL,
  `user_orig_clord_id` varchar(31) NOT NULL,
  `user_order_action_id` varchar(31) NOT NULL,
  `route_id` int(11) DEFAULT '0',
  `sub_account` varchar(64) NOT NULL DEFAULT '',
  `device_info` varchar(256) DEFAULT NULL,
  `instrument_name` varchar(512) DEFAULT NULL,
  `market_id` int(11) DEFAULT '0',
  `exec_broker` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`trading_day`),
  KEY `index_instrument_id` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for position_transfer
-- ----------------------------
DROP TABLE IF EXISTS `position_transfer`;
CREATE TABLE `position_transfer` (
  `transfer_id` int(11) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `account_id` varchar(15) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(31) NOT NULL,
  `qty` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `open_price` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `route_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_orders
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_orders`;
CREATE TABLE `stockloan_orders` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `cl_ord_id` varchar(32) NOT NULL,
  `new_cl_ord_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_cl_ord_id` varchar(32) NOT NULL,
  `sys_new_cl_ord_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `trade_volume` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `exec_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `status_info` varchar(128) NOT NULL,
  `sub_account` varchar(64) NOT NULL,
  PRIMARY KEY (`trading_day`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_orders_2020
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_orders_2020`;
CREATE TABLE `stockloan_orders_2020` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `cl_ord_id` varchar(32) NOT NULL,
  `new_cl_ord_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_cl_ord_id` varchar(32) NOT NULL,
  `sys_new_cl_ord_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `trade_volume` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `exec_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `status_info` varchar(128) NOT NULL,
  `sub_account` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_orders_us
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_orders_us`;
CREATE TABLE `stockloan_orders_us` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `cl_ord_id` varchar(32) NOT NULL,
  `new_cl_ord_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_cl_ord_id` varchar(32) NOT NULL,
  `sys_new_cl_ord_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `trade_volume` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `exec_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `status_info` varchar(128) NOT NULL,
  `sub_account` varchar(64) NOT NULL,
  PRIMARY KEY (`trading_day`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_orders_us_2020
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_orders_us_2020`;
CREATE TABLE `stockloan_orders_us_2020` (
  `id` int(11) NOT NULL,
  `broker_id` varchar(12) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `cl_ord_id` varchar(32) NOT NULL,
  `new_cl_ord_id` varchar(32) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_cl_ord_id` varchar(32) NOT NULL,
  `sys_new_cl_ord_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `trade_volume` int(11) NOT NULL,
  `time_in_force` int(11) NOT NULL,
  `exec_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  `insert_time` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `status_info` varchar(128) NOT NULL,
  `sub_account` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_trades
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_trades`;
CREATE TABLE `stockloan_trades` (
  `id` int(11) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `trade_id` varchar(20) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_trade_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `interest_rate` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `trade_date` int(11) NOT NULL,
  `trade_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  PRIMARY KEY (`trading_day`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_trades_2020
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_trades_2020`;
CREATE TABLE `stockloan_trades_2020` (
  `id` int(11) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `trade_id` varchar(20) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_trade_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `interest_rate` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `trade_date` int(11) NOT NULL,
  `trade_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_trades_us
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_trades_us`;
CREATE TABLE `stockloan_trades_us` (
  `id` int(11) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `trade_id` varchar(20) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_trade_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `interest_rate` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `trade_date` int(11) NOT NULL,
  `trade_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  PRIMARY KEY (`trading_day`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockloan_trades_us_2020
-- ----------------------------
DROP TABLE IF EXISTS `stockloan_trades_us_2020`;
CREATE TABLE `stockloan_trades_us_2020` (
  `id` int(11) NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(32) NOT NULL,
  `trade_id` varchar(20) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `sys_trade_id` varchar(32) NOT NULL,
  `sys_order_id` varchar(32) NOT NULL,
  `volume` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `fee_per_share` decimal(18,5) NOT NULL,
  `interest_rate` decimal(18,5) NOT NULL,
  `trading_day` int(11) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `trade_date` int(11) NOT NULL,
  `trade_time` int(11) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `trading_day` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `is_cancel_trade` int(11) NOT NULL,
  `exch_trade_id` varchar(63) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` varchar(31) NOT NULL,
  `user_order_id` varchar(31) NOT NULL,
  `trade_date` int(11) NOT NULL,
  `trade_time` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `ref_exch_trade_id` varchar(63) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(31) NOT NULL,
  `account_id` varchar(15) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `counterparty_broker_id` varchar(15) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `router_account_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `instrument_name` varchar(512) DEFAULT NULL,
  `big_volume` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `route_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`trading_day`),
  KEY `index_instrument_id` (`instrument_id`),
  KEY `trade_sreach` (`trading_day`,`is_cancel_trade`,`account_id`) USING BTREE,
  KEY `trade_query` (`account_id`,`exchange_id`,`direction`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trade_us
-- ----------------------------
DROP TABLE IF EXISTS `trade_us`;
CREATE TABLE `trade_us` (
  `trading_day` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `is_cancel_trade` int(11) NOT NULL,
  `exch_trade_id` varchar(63) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` varchar(31) NOT NULL,
  `user_order_id` varchar(31) NOT NULL,
  `trade_date` int(11) NOT NULL,
  `trade_time` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `open_close_flag` int(11) NOT NULL,
  `ref_exch_trade_id` varchar(63) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `instrument_id` varchar(31) NOT NULL,
  `account_id` varchar(15) NOT NULL,
  `volume` int(11) NOT NULL,
  `price` decimal(18,5) NOT NULL,
  `counterparty_broker_id` varchar(15) NOT NULL,
  `exch_trading_day` int(11) NOT NULL,
  `router_account_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `big_volume` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `route_id` int(11) DEFAULT '0',
  `instrument_name` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`,`trading_day`),
  KEY `index_instrument_id` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
