/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : miningtrade_us

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:27:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bos_account_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_account_statement`;
CREATE TABLE `bos_account_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `acc_type` char(1) DEFAULT NULL,
  `address` char(255) DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11960371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_balance_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_balance_statement`;
CREATE TABLE `bos_balance_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `rate` decimal(21,6) DEFAULT NULL,
  `market_value` decimal(21,6) DEFAULT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `net_amount` decimal(21,6) DEFAULT NULL,
  `unsettled_amt` decimal(21,6) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3030708 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_cash_flow_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_cash_flow_statement`;
CREATE TABLE `bos_cash_flow_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `remark` char(128) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1218617 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_ccy_ratio_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_ccy_ratio_statement`;
CREATE TABLE `bos_ccy_ratio_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `ccy` char(3) DEFAULT NULL,
  `rate` decimal(31,10) DEFAULT NULL,
  `base_ccy` char(1) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ccy_bussdate` (`ccy`,`buss_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3719 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_corp_action_charge_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_corp_action_charge_statement`;
CREATE TABLE `bos_corp_action_charge_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(15) DEFAULT NULL,
  `type` char(15) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `charge_id1` char(15) DEFAULT NULL,
  `charge1` decimal(31,10) DEFAULT NULL,
  `charge_id2` char(15) DEFAULT NULL,
  `charge2` decimal(31,10) DEFAULT NULL,
  `charge_id3` char(15) DEFAULT NULL,
  `charge3` decimal(31,10) DEFAULT NULL,
  `charge_id4` char(15) DEFAULT NULL,
  `charge4` decimal(31,10) DEFAULT NULL,
  `charge_id5` char(15) DEFAULT NULL,
  `charge5` decimal(31,10) DEFAULT NULL,
  `charge_id6` char(15) DEFAULT NULL,
  `charge6` decimal(31,10) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_corp_action_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_corp_action_statement`;
CREATE TABLE `bos_corp_action_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `type` char(16) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `settle_date` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `qty` decimal(21,6) DEFAULT NULL,
  `price` decimal(21,6) DEFAULT NULL,
  `dividend_amt` decimal(21,6) DEFAULT NULL,
  `dividend_qty` decimal(21,6) DEFAULT NULL,
  `charge` decimal(21,6) DEFAULT NULL,
  `digest` char(100) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6879 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_corp_type_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_corp_type_statement`;
CREATE TABLE `bos_corp_type_statement` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `corp_type` varchar(50) DEFAULT NULL COMMENT '????????????',
  `cn_value` varchar(50) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_currency_convert_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_currency_convert_statement`;
CREATE TABLE `bos_currency_convert_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `rate` decimal(21,6) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `process_date` datetime DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  `remark` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_equity_interest_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_equity_interest_statement`;
CREATE TABLE `bos_equity_interest_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `type` char(16) DEFAULT NULL,
  `BC_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `qty` decimal(21,6) DEFAULT NULL,
  `digest` char(100) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_ipo_interest_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_ipo_interest_statement`;
CREATE TABLE `bos_ipo_interest_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `TD_interest` decimal(21,6) DEFAULT NULL,
  `monthly_interest` decimal(21,6) DEFAULT NULL,
  `ratio` decimal(21,6) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accountid_bussdate` (`account_id`,`buss_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1287373 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_ipo_request_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_ipo_request_statement`;
CREATE TABLE `bos_ipo_request_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL COMMENT '????????????',
  `market_id` char(10) DEFAULT NULL COMMENT '????????????',
  `product_id` char(16) DEFAULT NULL COMMENT '????????????',
  `financial_qty` int(10) DEFAULT NULL COMMENT '???????????????',
  `cash_qty` int(10) DEFAULT NULL COMMENT '???????????????',
  `qty` decimal(21,6) DEFAULT NULL COMMENT '????????????',
  `name` char(16) DEFAULT NULL COMMENT '????????????',
  `eIPO_fee` decimal(21,6) DEFAULT NULL,
  `match_date` int(10) DEFAULT NULL COMMENT '?????????',
  `jkamt` decimal(21,6) DEFAULT NULL COMMENT '????????????',
  `close_date` datetime DEFAULT NULL COMMENT '?????????',
  `buss_date` datetime DEFAULT NULL COMMENT '???????????????',
  `apply_fee` decimal(21,6) DEFAULT NULL COMMENT '?????????',
  `order_date` int(10) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`,`buss_date`),
  KEY `idx_order_date` (`order_date`)
) ENGINE=InnoDB AUTO_INCREMENT=21102302 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_momthly_interest_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_momthly_interest_statement`;
CREATE TABLE `bos_momthly_interest_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `ccy` char(26) DEFAULT NULL,
  `credit_interest` decimal(21,6) DEFAULT NULL,
  `debit_interest` decimal(21,6) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accountid_bussdate` (`account_id`,`buss_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3030023 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_other_porfoliefee_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_other_porfoliefee_statement`;
CREATE TABLE `bos_other_porfoliefee_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `amount` char(16) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_other_product_in_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_other_product_in_statement`;
CREATE TABLE `bos_other_product_in_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `qty` char(16) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_other_product_out_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_other_product_out_statement`;
CREATE TABLE `bos_other_product_out_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `qty` char(16) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_other_real_product_in_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_other_real_product_in_statement`;
CREATE TABLE `bos_other_real_product_in_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `qty` char(16) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_other_real_product_out_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_other_real_product_out_statement`;
CREATE TABLE `bos_other_real_product_out_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `qty` char(16) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_position_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_position_statement`;
CREATE TABLE `bos_position_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `cost_price` decimal(21,6) DEFAULT NULL,
  `price` decimal(21,6) DEFAULT NULL,
  `qty` decimal(21,6) DEFAULT NULL,
  `net_qty` decimal(21,6) DEFAULT NULL,
  `PL_ratio` decimal(21,6) DEFAULT NULL,
  `floating_PL` decimal(21,6) DEFAULT NULL,
  `daily_PL` decimal(21,6) DEFAULT NULL,
  `market_value` decimal(21,6) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`,`buss_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3400763 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_product_flow_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_product_flow_statement`;
CREATE TABLE `bos_product_flow_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `currency` char(16) DEFAULT NULL,
  `qty` decimal(21,6) DEFAULT NULL,
  `price` decimal(21,6) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_product_info_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_product_info_statement`;
CREATE TABLE `bos_product_info_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16152317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_td_interest_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_td_interest_statement`;
CREATE TABLE `bos_td_interest_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `ccy` char(26) DEFAULT NULL,
  `credit_interest` decimal(21,6) DEFAULT NULL,
  `credit_ratio` decimal(21,6) DEFAULT NULL,
  `debit_interest` decimal(21,6) DEFAULT NULL,
  `debit_ratio` decimal(21,6) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`buss_date`,`account_id`,`ccy`)
) ENGINE=InnoDB AUTO_INCREMENT=2996921 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_trade_detail_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_trade_detail_statement`;
CREATE TABLE `bos_trade_detail_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `trade_id` char(16) DEFAULT NULL,
  `price` decimal(21,6) DEFAULT NULL,
  `quantity` decimal(21,6) DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=745923 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_trade_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_trade_statement`;
CREATE TABLE `bos_trade_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `trade_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `side` char(1) DEFAULT NULL,
  `price` decimal(21,6) DEFAULT NULL,
  `quantity` decimal(21,6) DEFAULT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `input_channel` char(16) DEFAULT NULL,
  `commission` decimal(21,6) DEFAULT NULL,
  `charge_id` char(32) DEFAULT NULL,
  `charge` decimal(21,6) DEFAULT NULL,
  `trade_time` datetime DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `trade_time` (`trade_time`),
  KEY `idx_trade_id` (`trade_id`),
  KEY `idx_buss_date` (`buss_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2652721 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bos_unsettle_trade_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_unsettle_trade_statement`;
CREATE TABLE `bos_unsettle_trade_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` char(16) DEFAULT NULL,
  `trade_id` char(16) DEFAULT NULL,
  `market_id` char(3) DEFAULT NULL,
  `product_id` char(16) DEFAULT NULL,
  `side` char(1) DEFAULT NULL,
  `price` decimal(21,6) DEFAULT NULL,
  `qty` decimal(21,6) DEFAULT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `trade_date` date DEFAULT NULL,
  `settle_date` date DEFAULT NULL,
  `buss_date` datetime DEFAULT NULL,
  `input_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`,`buss_date`)
) ENGINE=InnoDB AUTO_INCREMENT=955136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clean_time
-- ----------------------------
DROP TABLE IF EXISTS `clean_time`;
CREATE TABLE `clean_time` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `trade_date` datetime DEFAULT NULL COMMENT '????????????',
  `clean_time` datetime DEFAULT NULL COMMENT '????????????',
  `clean_time_end` datetime DEFAULT NULL COMMENT '??????????????????',
  `next_clean_time` datetime DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '????????????',
  `value` varchar(200) DEFAULT NULL COMMENT '??????????????',
  `description` varchar(200) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for dark_pool_fee
-- ----------------------------
DROP TABLE IF EXISTS `dark_pool_fee`;
CREATE TABLE `dark_pool_fee` (
  `id` int(38) NOT NULL AUTO_INCREMENT,
  `account` varchar(38) NOT NULL COMMENT '????????????',
  `fee` double NOT NULL COMMENT '??????',
  `time` varchar(28) NOT NULL,
  `insert_time` datetime NOT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66689 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mobile_verify_code
-- ----------------------------
DROP TABLE IF EXISTS `mobile_verify_code`;
CREATE TABLE `mobile_verify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '????????????',
  `verify_code` varchar(10) DEFAULT NULL COMMENT '?????????',
  `send_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60558 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for new_stock_order
-- ----------------------------
DROP TABLE IF EXISTS `new_stock_order`;
CREATE TABLE `new_stock_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `adapter` varchar(50) NOT NULL,
  `account` varchar(50) NOT NULL,
  `is_buy` varchar(10) DEFAULT NULL,
  `quota_sesh` bigint(8) DEFAULT NULL,
  `quota_sesz` bigint(8) DEFAULT NULL,
  `order_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for new_stock_purchase
-- ----------------------------
DROP TABLE IF EXISTS `new_stock_purchase`;
CREATE TABLE `new_stock_purchase` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL,
  `account` varchar(50) NOT NULL,
  `exchange` varchar(10) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `purchase_date` varchar(10) DEFAULT NULL COMMENT '????????????',
  `publish_date` varchar(10) DEFAULT NULL COMMENT '??????????????????',
  `is_hit` char(1) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for regist_account_log
-- ----------------------------
DROP TABLE IF EXISTS `regist_account_log`;
CREATE TABLE `regist_account_log` (
  `id` varchar(38) NOT NULL,
  `phone_number` varchar(30) NOT NULL DEFAULT '' COMMENT '????????????',
  `market` varchar(30) NOT NULL COMMENT '????????????',
  `id_code` varchar(18) NOT NULL COMMENT '????????????',
  `email` varchar(50) DEFAULT NULL,
  `funds_account` varchar(20) DEFAULT NULL COMMENT '????????????',
  `funds_pwd` varchar(300) NOT NULL,
  `trade_adapter` varchar(50) NOT NULL,
  `insert_time` datetime DEFAULT NULL,
  `uuid` varchar(38) DEFAULT NULL COMMENT '?????????????????????uuid???????????????????????????',
  `response_code` int(10) DEFAULT NULL COMMENT '?????? 0 ?????????  1??????  2??????',
  `error_message` varchar(255) DEFAULT NULL,
  `is_effective` int(2) DEFAULT NULL COMMENT '????????????  0 ?????????  1 ?????????  2 ?????????',
  `effective_time` datetime DEFAULT NULL COMMENT '??????/?????????????????? ??????',
  `is_set_pwd` int(2) DEFAULT NULL COMMENT '?????????????????????  0?????????  1 ?????????',
  `is_rewrite` int(2) DEFAULT NULL COMMENT '??????????????????????????????????????????account??????  0 ?????????  1 ?????????',
  `is_set_us` int(2) DEFAULT NULL COMMENT '????????????????????????????????????',
  `is_rewrite_user` int(2) DEFAULT NULL COMMENT '???????????????????????????????????????stock.user??????  0 ?????????  1 ?????????',
  `request_param` text NOT NULL COMMENT '??????????????????????????????',
  `area_id` varchar(38) DEFAULT NULL,
  `name` varchar(38) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `is_custom` int(2) NOT NULL DEFAULT '0',
  `account_type` int(2) DEFAULT NULL COMMENT '?????????????????? 1 ????????????  2 ????????????',
  `is_open_us` int(2) DEFAULT NULL COMMENT '??????????????????  0?????????  1 ??????',
  `app_usable` double(15,2) DEFAULT NULL COMMENT '???????????????????????????',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `idx_phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for secur_base
-- ----------------------------
DROP TABLE IF EXISTS `secur_base`;
CREATE TABLE `secur_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `inner_code` int(11) DEFAULT NULL COMMENT '??????????????????',
  `company_code` int(11) DEFAULT NULL COMMENT '????????????',
  `secu_code` varchar(50) DEFAULT NULL COMMENT '????????????',
  `chi_name` varchar(200) DEFAULT NULL COMMENT '????????????',
  `chi_name_abbr` varchar(100) DEFAULT NULL COMMENT '??????????????????',
  `eng_name` varchar(200) DEFAULT NULL COMMENT '????????????',
  `eng_name_abbr` varchar(100) DEFAULT NULL COMMENT '??????????????????',
  `secu_abbr` varchar(20) DEFAULT NULL COMMENT '????????????',
  `chi_spelling` varchar(10) DEFAULT NULL COMMENT '??????????????????',
  `secu_market` int(11) DEFAULT NULL COMMENT '????????????',
  `secu_category` int(11) DEFAULT NULL COMMENT '????????????',
  `secu_appl` int(11) DEFAULT NULL COMMENT '????????????0?????????;1?????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='?????????????????????????????????????????????';

-- ----------------------------
-- Table structure for stock_industry_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_industry_info`;
CREATE TABLE `stock_industry_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `exchange` varchar(20) DEFAULT NULL,
  `fit_industry` varchar(50) DEFAULT NULL COMMENT '????????????',
  `sec_industry` varchar(50) DEFAULT NULL COMMENT '????????????',
  `thd_industry` varchar(50) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`),
  KEY `code_exchange_indx_industry` (`code`,`exchange`)
) ENGINE=InnoDB AUTO_INCREMENT=2742 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t
-- ----------------------------
DROP TABLE IF EXISTS `t`;
CREATE TABLE `t` (
  `account_id` int(11) DEFAULT NULL,
  `phone_number` varchar(44) DEFAULT NULL,
  `phone_address` varchar(120) DEFAULT NULL,
  `card_number` varchar(120) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `funds_pwd` varchar(1200) DEFAULT NULL,
  `trans_pwd` varchar(1200) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `funds_account` varchar(80) DEFAULT NULL,
  `one_yard_pass` varchar(80) DEFAULT NULL,
  `shareholder_account` varchar(80) DEFAULT NULL,
  `imei` varchar(200) DEFAULT NULL,
  `platform` varchar(80) DEFAULT NULL,
  `market` varchar(80) DEFAULT NULL,
  `is_send_funds_account` int(11) DEFAULT NULL,
  `area_id` varchar(152) DEFAULT NULL,
  `source` int(3) DEFAULT NULL,
  `invite_code_id` int(20) DEFAULT NULL,
  `open_way` int(2) DEFAULT NULL,
  `is_ftp` int(2) DEFAULT NULL,
  `funds_account_valid` varchar(80) DEFAULT NULL,
  `crm_update_time` datetime DEFAULT NULL,
  `crm_status` int(2) DEFAULT NULL,
  `pass_expire_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT NULL,
  `asset` double(15,0) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `adapter` varchar(50) DEFAULT NULL,
  `currency` varchar(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `ex` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5591 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_appuser_info
-- ----------------------------
DROP TABLE IF EXISTS `trade_appuser_info`;
CREATE TABLE `trade_appuser_info` (
  `user_id` int(11) NOT NULL COMMENT 'APP?????????????????????',
  `adapter` varchar(50) NOT NULL COMMENT '???????????????',
  `account` varchar(50) NOT NULL COMMENT '????????????????????????',
  `is_buy_newstock` varchar(10) DEFAULT NULL COMMENT '????????????????????????????????????????????????????????????1?????????',
  `inset_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`adapter`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_cancel_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_cancel_log`;
CREATE TABLE `trade_cancel_log` (
  `cancel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id?????????????????????',
  `user_id` int(11) DEFAULT NULL COMMENT '??????id??????user.userid',
  `adapter` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `dir` int(11) DEFAULT NULL COMMENT '??????????????? 1?????? -1?????? ',
  `order_seq` varchar(100) DEFAULT NULL COMMENT '??????-????????????',
  `cancel_status` int(11) DEFAULT NULL COMMENT '??????????????????',
  `cancel_time` bigint(20) DEFAULT NULL COMMENT '?????????????????????????????????????????????',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '?????????ip',
  `imei` varchar(50) DEFAULT NULL,
  `cancel_seq` varchar(200) DEFAULT NULL COMMENT '????????????:??????????????????',
  PRIMARY KEY (`cancel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136286 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_collateral_transfer
-- ----------------------------
DROP TABLE IF EXISTS `trade_collateral_transfer`;
CREATE TABLE `trade_collateral_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '????????????',
  `account` varchar(50) DEFAULT NULL COMMENT '????????????',
  `exchange` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '????????????',
  `code` varchar(10) CHARACTER SET utf8 DEFAULT '' COMMENT '????????????',
  `transfer_date` int(11) DEFAULT NULL,
  `transfer_amount` int(11) DEFAULT '0' COMMENT '????????????',
  `transfer_money` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `transfer_type` int(11) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_excess_profit
-- ----------------------------
DROP TABLE IF EXISTS `trade_excess_profit`;
CREATE TABLE `trade_excess_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '????????????????',
  `account` varchar(50) NOT NULL COMMENT '????????????????',
  `select_stock_profit` double DEFAULT '0',
  `select_time_profit` double DEFAULT NULL,
  `info_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `info_date` (`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=12918891 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_excution
-- ----------------------------
DROP TABLE IF EXISTS `trade_excution`;
CREATE TABLE `trade_excution` (
  `trade_excution_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id?????????????????????',
  `client_acc_id` varchar(50) DEFAULT NULL COMMENT '??????????????????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '????????????',
  `exchange` text COMMENT '??????',
  `code` text COMMENT '??????',
  `input_channel` text,
  `qty` int(11) DEFAULT NULL COMMENT '??????',
  `price` double DEFAULT NULL COMMENT '??????',
  `order_id` text COMMENT '????????????',
  `order_no` text,
  `cacc_order_id` text,
  `last_cr_user` text,
  `is_demo_acc` text,
  `order_channel` text,
  `create_time` datetime DEFAULT NULL,
  `routing_id` text,
  `create_user` text,
  `exch_order_info` text,
  PRIMARY KEY (`trade_excution_id`),
  KEY `queryforhistory` (`client_acc_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=731039 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_excution_backup
-- ----------------------------
DROP TABLE IF EXISTS `trade_excution_backup`;
CREATE TABLE `trade_excution_backup` (
  `trade_excution_id` int(11) NOT NULL DEFAULT '0' COMMENT '??????id?????????????????????',
  `client_acc_id` text COMMENT '??????????????????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '????????????',
  `exchange` text COMMENT '??????',
  `code` text COMMENT '??????',
  `input_channel` text,
  `qty` int(11) DEFAULT NULL COMMENT '??????',
  `price` double DEFAULT NULL COMMENT '??????',
  `order_id` text COMMENT '????????????',
  `order_no` text COMMENT '????????????',
  `cacc_order_id` text,
  `last_cr_user` text,
  `is_demo_acc` text,
  `order_channel` text,
  `create_time` datetime DEFAULT NULL,
  `routing_id` text,
  `create_user` text,
  `exch_order_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_excution_bak
-- ----------------------------
DROP TABLE IF EXISTS `trade_excution_bak`;
CREATE TABLE `trade_excution_bak` (
  `trade_excution_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id?????????????????????',
  `client_acc_id` varchar(50) DEFAULT NULL COMMENT '??????????????????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '????????????',
  `exchange` text COMMENT '??????',
  `code` text COMMENT '??????',
  `input_channel` text,
  `qty` int(11) DEFAULT NULL COMMENT '??????',
  `price` double DEFAULT NULL COMMENT '??????',
  `order_id` text COMMENT '????????????',
  `order_no` text,
  `cacc_order_id` text,
  `last_cr_user` text,
  `is_demo_acc` text,
  `order_channel` text,
  `create_time` datetime DEFAULT NULL,
  `routing_id` text,
  `create_user` text,
  `exch_order_info` text,
  PRIMARY KEY (`trade_excution_id`),
  KEY `queryforhistory` (`client_acc_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=369097 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_fingerprint_info
-- ----------------------------
DROP TABLE IF EXISTS `trade_fingerprint_info`;
CREATE TABLE `trade_fingerprint_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `user_id` int(11) DEFAULT NULL COMMENT '??????id',
  `imei` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '???????????????imei',
  `account` varchar(20) DEFAULT NULL COMMENT '????????????',
  `fingerprint_info` varchar(500) DEFAULT NULL COMMENT '???????????????????????????????????????',
  `apply_time` datetime DEFAULT NULL COMMENT '????????????',
  `last_time` datetime DEFAULT NULL COMMENT '??????????????????',
  `state` varchar(20) DEFAULT NULL COMMENT '??????/?????????????????? 1??????  0??????',
  PRIMARY KEY (`id`),
  KEY `createrIndex` (`user_id`,`imei`,`account`)
) ENGINE=InnoDB AUTO_INCREMENT=28264 DEFAULT CHARSET=utf8mb4 COMMENT='???????????????????????????????????????';

-- ----------------------------
-- Table structure for trade_login_fail
-- ----------------------------
DROP TABLE IF EXISTS `trade_login_fail`;
CREATE TABLE `trade_login_fail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `adapter` varchar(50) NOT NULL COMMENT '????????????',
  `account` varchar(50) NOT NULL COMMENT '????????????',
  `last_logintime` datetime DEFAULT NULL COMMENT '??????????????????',
  `fail_count` int(11) DEFAULT NULL COMMENT '????????????',
  `verify_code` varchar(4) DEFAULT NULL COMMENT '?????????',
  `check_account` tinyint(4) DEFAULT '1' COMMENT '1:??????????????????2????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158606 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_login_fail_detail
-- ----------------------------
DROP TABLE IF EXISTS `trade_login_fail_detail`;
CREATE TABLE `trade_login_fail_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '????????????',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '????????????',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '?????????',
  `login_time` datetime DEFAULT NULL COMMENT '????????????',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP??????',
  `model` varchar(100) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297400 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_login_fail_trigger
-- ----------------------------
DROP TABLE IF EXISTS `trade_login_fail_trigger`;
CREATE TABLE `trade_login_fail_trigger` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(50) DEFAULT NULL COMMENT '?????????',
  `fail_count` int(10) DEFAULT NULL COMMENT '??????????????????',
  `state` int(2) DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1214 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_max_impawn_rate
-- ----------------------------
DROP TABLE IF EXISTS `trade_max_impawn_rate`;
CREATE TABLE `trade_max_impawn_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `impawn_rate` int(3) DEFAULT NULL COMMENT '????????????????????????????????????',
  `last_update_time` datetime DEFAULT NULL,
  `market` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order` (
  `order_inner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '????????????id?????????????????????',
  `client_acc_id` varchar(50) DEFAULT NULL,
  `client_acc_name` text COMMENT '????????????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '????????????',
  `exchange` text COMMENT '??????',
  `code` text COMMENT '??????',
  `product_name` text COMMENT '????????????',
  `input_channel` text,
  `exec_qty` int(11) DEFAULT NULL COMMENT '??????',
  `price` double DEFAULT NULL COMMENT '??????',
  `order_id` text COMMENT '????????????',
  `order_no` text COMMENT '????????????',
  `order_type` text COMMENT '???????????? I ??????????????? A ????????? L ????????? E ??????????????? S ??????????????? M ?????????',
  `order_status` text COMMENT '????????????',
  `updated_time` datetime DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `reference` text,
  `reference1` text,
  `sett_ccy` text,
  `match_qty` int(11) DEFAULT NULL COMMENT '????????????',
  `avg_trade_price` double DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`order_inner_id`),
  KEY `historyQuery` (`client_acc_id`,`create_time`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1035800 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order_backup
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_backup`;
CREATE TABLE `trade_order_backup` (
  `order_inner_id` int(11) NOT NULL DEFAULT '0' COMMENT '????????????id?????????????????????',
  `client_acc_id` text COMMENT '????????????',
  `client_acc_name` text COMMENT '????????????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '????????????',
  `exchange` text COMMENT '??????',
  `code` text COMMENT '??????',
  `product_name` text COMMENT '????????????',
  `input_channel` text,
  `exec_qty` int(11) DEFAULT NULL COMMENT '??????',
  `price` double DEFAULT NULL COMMENT '??????',
  `order_id` text COMMENT '????????????',
  `order_no` text COMMENT '????????????',
  `order_type` text COMMENT '????????????',
  `order_status` text COMMENT '????????????',
  `updated_time` datetime DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `reference` text,
  `reference1` text,
  `sett_ccy` text,
  `match_qty` int(11) DEFAULT NULL COMMENT '????????????',
  `avg_trade_price` double DEFAULT NULL COMMENT '????????????'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order_bak
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_bak`;
CREATE TABLE `trade_order_bak` (
  `order_inner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '????????????id?????????????????????',
  `client_acc_id` varchar(50) DEFAULT NULL,
  `client_acc_name` text COMMENT '????????????',
  `bs_flag` char(1) DEFAULT NULL COMMENT '????????????',
  `exchange` text COMMENT '??????',
  `code` text COMMENT '??????',
  `product_name` text COMMENT '????????????',
  `input_channel` text,
  `exec_qty` int(11) DEFAULT NULL COMMENT '??????',
  `price` double DEFAULT NULL COMMENT '??????',
  `order_id` text COMMENT '????????????',
  `order_no` text COMMENT '????????????',
  `order_type` text COMMENT '???????????? I ??????????????? A ????????? L ????????? E ??????????????? S ??????????????? M ?????????',
  `order_status` text COMMENT '????????????',
  `updated_time` datetime DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `reference` text,
  `reference1` text,
  `sett_ccy` text,
  `match_qty` int(11) DEFAULT NULL COMMENT '????????????',
  `avg_trade_price` double DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`order_inner_id`),
  KEY `historyQuery` (`client_acc_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=565490 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_log`;
CREATE TABLE `trade_order_log` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id?????????????????????',
  `user_id` int(11) DEFAULT NULL COMMENT '??????id??????user.userid',
  `adapter` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `dir` int(11) DEFAULT NULL COMMENT '??????????????? 1?????? -1?????? ',
  `exchange` varchar(20) DEFAULT NULL COMMENT '????????????',
  `code` varchar(20) DEFAULT NULL COMMENT '????????????',
  `order_status` int(11) DEFAULT NULL COMMENT '??????????????????',
  `order_time` bigint(20) DEFAULT NULL COMMENT '?????????????????????????????????????????????',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '?????????ip',
  `imei` varchar(50) DEFAULT NULL,
  `order_seq` varchar(100) DEFAULT NULL COMMENT '??????-????????????',
  `order_price` double(14,4) DEFAULT NULL COMMENT '????????????',
  `order_qty` int(11) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1204855 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_stock_transfer
-- ----------------------------
DROP TABLE IF EXISTS `trade_stock_transfer`;
CREATE TABLE `trade_stock_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '????????????',
  `asset` double(15,0) DEFAULT NULL COMMENT '??????????????????????????? ??????????????? ???????????????',
  `currency` varchar(11) DEFAULT NULL COMMENT '??????',
  `info_date` int(11) DEFAULT NULL COMMENT '????????????,??????????????????',
  `info_time` int(11) DEFAULT NULL COMMENT '??????????????????',
  `ex` double NOT NULL COMMENT '??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=963 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_stock_transfer_item
-- ----------------------------
DROP TABLE IF EXISTS `trade_stock_transfer_item`;
CREATE TABLE `trade_stock_transfer_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '????????????',
  `exchange` varchar(10) DEFAULT NULL COMMENT '????????????',
  `code` varchar(20) DEFAULT NULL COMMENT '??????code',
  `name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `amount` int(11) DEFAULT NULL COMMENT '??????????????????',
  `price` double DEFAULT NULL COMMENT '????????????',
  `asset` double DEFAULT NULL COMMENT '?????? ??????????????? ???????????????',
  `currency` varchar(11) DEFAULT NULL COMMENT '??????',
  `ex` double DEFAULT NULL COMMENT '??????',
  `insert_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=665 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_transfer_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_transfer_log`;
CREATE TABLE `trade_transfer_log` (
  `id` varchar(38) NOT NULL COMMENT '??????id',
  `user_id` int(11) DEFAULT NULL COMMENT '??????id??????user.userid',
  `adapter` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `bank_tran_type` varchar(11) DEFAULT NULL COMMENT '1?????????????????? 2??????????????????',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '????????????',
  `currency` varchar(50) DEFAULT NULL COMMENT '????????????',
  `tranamt` double DEFAULT NULL COMMENT '????????????',
  `insert_time` datetime DEFAULT NULL,
  `client_ip` varchar(20) DEFAULT NULL COMMENT '?????????ip',
  `imei` varchar(50) DEFAULT NULL,
  `response_code` int(10) DEFAULT NULL COMMENT '????????????0 ok',
  `error_message` varchar(255) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user
-- ----------------------------
DROP TABLE IF EXISTS `trade_user`;
CREATE TABLE `trade_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mobile_phone_number` varchar(20) NOT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `three_part_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_details
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_details`;
CREATE TABLE `trade_user_details` (
  `exchange_id` int(11) NOT NULL AUTO_INCREMENT,
  `tdate` int(11) DEFAULT NULL COMMENT '????????????????????????',
  `match_time` int(11) DEFAULT NULL COMMENT '????????????????????????',
  `match_qty` int(11) DEFAULT NULL COMMENT '?????????',
  `match_price` double(7,2) DEFAULT NULL COMMENT '?????????',
  `matchamt` double(15,2) DEFAULT NULL COMMENT '????????????',
  `dir` smallint(4) DEFAULT NULL COMMENT ' 1??? -1???',
  `exchange` varchar(10) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL COMMENT '????????????',
  `adapter` varchar(20) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`exchange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_device
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_device`;
CREATE TABLE `trade_user_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '????????????',
  `account` varchar(50) NOT NULL COMMENT '????????????',
  `bind_date` datetime DEFAULT NULL COMMENT '????????????',
  `unbind_date` datetime DEFAULT NULL COMMENT '???????????????',
  `type` char(1) DEFAULT NULL COMMENT '???????????????1?????? 0??????',
  `imei` varchar(128) DEFAULT NULL COMMENT '??????????????????',
  `model` varchar(64) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`),
  KEY `trade_index` (`adapter`,`account`,`imei`)
) ENGINE=InnoDB AUTO_INCREMENT=28665 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_info
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_info`;
CREATE TABLE `trade_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '????????????',
  `account` varchar(50) NOT NULL COMMENT '????????????',
  `password` varchar(100) DEFAULT NULL COMMENT '??????????????????',
  `operway` varchar(100) DEFAULT NULL COMMENT '????????????',
  `reg_date` datetime NOT NULL COMMENT '??????????????????',
  `type` int(11) DEFAULT '0' COMMENT '???????????????0???????????????1????????????',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '????????????',
  `pass_expire_date` datetime DEFAULT NULL COMMENT '????????????????????????',
  PRIMARY KEY (`id`),
  KEY `index2` (`account`,`adapter`)
) ENGINE=InnoDB AUTO_INCREMENT=152784 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_info_backup
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_info_backup`;
CREATE TABLE `trade_user_info_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '????????????',
  `account` varchar(50) NOT NULL COMMENT '????????????',
  `password` varchar(100) NOT NULL COMMENT '??????????????????',
  `operway` varchar(100) DEFAULT NULL COMMENT '????????????',
  `reg_date` datetime NOT NULL COMMENT '??????????????????',
  `type` int(11) DEFAULT '0' COMMENT '???????????????0???????????????1????????????',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '????????????',
  `pass_expire_date` datetime DEFAULT NULL COMMENT '????????????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45503 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money`;
CREATE TABLE `trade_user_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '??????',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '?????????',
  `usable` double(15,2) DEFAULT NULL COMMENT '??????',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '??????',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '????????????',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `info_date` int(11) DEFAULT NULL COMMENT '????????????',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `dark_fee` double(15,2) DEFAULT NULL COMMENT '??????????????????',
  `ipo_frozen` double(15,2) DEFAULT NULL COMMENT 'ipo??????',
  `insert_time` datetime DEFAULT NULL COMMENT '????????????',
  `adapter_from` varchar(20) DEFAULT NULL COMMENT '??????????????????',
  `true_pure_assets` double(15,2) DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`),
  KEY `account` (`account`,`info_date`),
  KEY `infodate_for_max` (`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=31668820 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money_2
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money_2`;
CREATE TABLE `trade_user_money_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '??????',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '?????????',
  `usable` double(15,2) DEFAULT NULL COMMENT '??????',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '??????',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '????????????',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `info_date` int(11) DEFAULT NULL COMMENT '????????????',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `dark_fee` double(15,2) DEFAULT NULL COMMENT '??????????????????',
  `ipo_frozen` double(15,2) DEFAULT NULL COMMENT 'ipo??????',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6505656 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money_backup
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money_backup`;
CREATE TABLE `trade_user_money_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '??????',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '?????????',
  `usable` double(15,2) DEFAULT NULL COMMENT '??????',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '??????',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '????????????',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `info_date` int(11) DEFAULT NULL COMMENT '????????????',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3144582 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money_backup_bak01
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money_backup_bak01`;
CREATE TABLE `trade_user_money_backup_bak01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '??????',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '?????????',
  `usable` double(15,2) DEFAULT NULL COMMENT '??????',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '??????',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '????????????',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '?????????',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `info_date` int(11) DEFAULT NULL COMMENT '????????????',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '???????????????',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '????????????',
  `dark_fee` double(15,2) DEFAULT NULL COMMENT '??????????????????',
  `ipo_frozen` double(15,2) DEFAULT NULL COMMENT 'ipo??????',
  `insert_time` datetime DEFAULT NULL COMMENT '????????????',
  `adapter_from` varchar(20) DEFAULT NULL COMMENT '??????????????????',
  `true_pure_assets` double(15,2) DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`),
  KEY `account` (`account`,`info_date`),
  KEY `infodate_for_max` (`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=24601885 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_phone
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_phone`;
CREATE TABLE `trade_user_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '????????????',
  `account` varchar(50) NOT NULL COMMENT '????????????',
  `user_id` int(8) unsigned NOT NULL COMMENT 'app??????Id',
  `bind_date` datetime NOT NULL COMMENT '????????????',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`),
  KEY `idx_account` (`account`),
  KEY `idx_userid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23200 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_position
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_position`;
CREATE TABLE `trade_user_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '????????????',
  `name` varchar(20) DEFAULT NULL COMMENT '????????????',
  `code` varchar(20) DEFAULT NULL COMMENT '????????????',
  `exchange` varchar(10) DEFAULT NULL COMMENT '????????????',
  `last_price` double(7,2) DEFAULT NULL COMMENT '?????????',
  `cost_price` double(7,2) DEFAULT NULL COMMENT '?????????',
  `close_px` double(7,2) DEFAULT NULL COMMENT '?????????',
  `pre_close_px` double(7,2) DEFAULT NULL COMMENT '????????????????????????',
  `stkavl` int(11) DEFAULT NULL COMMENT '?????????',
  `stkbuy` int(11) DEFAULT NULL COMMENT '????????????',
  `stksale` int(11) DEFAULT NULL COMMENT '????????????',
  `tasset` double(15,2) DEFAULT NULL COMMENT '????????????',
  `riseAndFallRate` varchar(20) DEFAULT NULL COMMENT '???????????????',
  `riseAndFallValue` double(15,2) DEFAULT NULL COMMENT '?????????',
  `float_value` double(15,2) DEFAULT NULL COMMENT '????????????',
  `positions_rate` varchar(20) DEFAULT NULL COMMENT '????????????',
  `stock_id` int(11) DEFAULT NULL COMMENT '????????????ID',
  `info_date` int(11) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`),
  KEY `posi_identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_transfer
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_transfer`;
CREATE TABLE `trade_user_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '??????',
  `account` varchar(50) DEFAULT NULL COMMENT '????????????',
  `asset` double(15,2) DEFAULT NULL COMMENT '?????? ??????????????? ???????????????',
  `currency` varchar(11) DEFAULT NULL COMMENT '??????',
  `info_date` int(11) DEFAULT NULL COMMENT '????????????,??????????????????',
  `info_time` int(11) DEFAULT NULL COMMENT '??????????????????',
  `ex` double NOT NULL COMMENT '??????',
  PRIMARY KEY (`id`),
  KEY `posi_identity_by_infodate` (`adapter`,`account`,`info_date`),
  KEY `info_date` (`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=35310 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_login_fail
-- ----------------------------
DROP TABLE IF EXISTS `user_login_fail`;
CREATE TABLE `user_login_fail` (
  `imei` varchar(50) NOT NULL COMMENT 'imei',
  `last_logintime` datetime DEFAULT NULL COMMENT '??????????????????',
  `fail_count` int(11) DEFAULT NULL COMMENT '????????????',
  `verify_code` varchar(4) DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`imei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
