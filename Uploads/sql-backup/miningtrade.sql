/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : miningtrade

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:26:21
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
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `corp_type` varchar(50) DEFAULT NULL COMMENT '权益类别',
  `cn_value` varchar(50) DEFAULT NULL COMMENT '中文含义',
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
  `account_id` char(16) DEFAULT NULL COMMENT '资金账号',
  `market_id` char(10) DEFAULT NULL COMMENT '市场标识',
  `product_id` char(16) DEFAULT NULL COMMENT '股票代码',
  `financial_qty` int(10) DEFAULT NULL COMMENT '融资申购数',
  `cash_qty` int(10) DEFAULT NULL COMMENT '现金申购数',
  `qty` decimal(21,6) DEFAULT NULL COMMENT '申购股数',
  `name` char(16) DEFAULT NULL COMMENT '股票名称',
  `eIPO_fee` decimal(21,6) DEFAULT NULL,
  `match_date` int(10) DEFAULT NULL COMMENT '中签日',
  `jkamt` decimal(21,6) DEFAULT NULL COMMENT '缴款金额',
  `close_date` datetime DEFAULT NULL COMMENT '截止日',
  `buss_date` datetime DEFAULT NULL COMMENT '日结单日期',
  `apply_fee` decimal(21,6) DEFAULT NULL COMMENT '手续费',
  `order_date` int(10) DEFAULT NULL COMMENT '申购日期',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`,`buss_date`),
  KEY `idx_order_date` (`order_date`)
) ENGINE=InnoDB AUTO_INCREMENT=41935782 DEFAULT CHARSET=utf8;

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
  `trade_date` datetime DEFAULT NULL COMMENT '交易时间',
  `clean_time` datetime DEFAULT NULL COMMENT '清算时间',
  `clean_time_end` datetime DEFAULT NULL COMMENT '清算结束时间',
  `next_clean_time` datetime DEFAULT NULL COMMENT '下一个交易日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '????',
  `value` varchar(200) DEFAULT NULL COMMENT '????ֵ',
  `description` varchar(200) DEFAULT NULL COMMENT '????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for dark_pool_fee
-- ----------------------------
DROP TABLE IF EXISTS `dark_pool_fee`;
CREATE TABLE `dark_pool_fee` (
  `id` int(38) NOT NULL AUTO_INCREMENT,
  `account` varchar(38) NOT NULL COMMENT '资金账号',
  `fee` double NOT NULL COMMENT '费用',
  `time` varchar(28) NOT NULL,
  `insert_time` datetime NOT NULL COMMENT '数据插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66689 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mobile_verify_code
-- ----------------------------
DROP TABLE IF EXISTS `mobile_verify_code`;
CREATE TABLE `mobile_verify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `verify_code` varchar(10) DEFAULT NULL COMMENT '验证码',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93060 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for new_stock_order
-- ----------------------------
DROP TABLE IF EXISTS `new_stock_order`;
CREATE TABLE `new_stock_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
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
  `purchase_date` varchar(10) DEFAULT NULL COMMENT '申购日期',
  `publish_date` varchar(10) DEFAULT NULL COMMENT '中签公布日期',
  `is_hit` char(1) DEFAULT NULL COMMENT '是否中签',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for regist_account_log
-- ----------------------------
DROP TABLE IF EXISTS `regist_account_log`;
CREATE TABLE `regist_account_log` (
  `id` varchar(38) NOT NULL,
  `phone_number` varchar(30) NOT NULL DEFAULT '' COMMENT '手机号码',
  `market` varchar(30) NOT NULL COMMENT '开通市场',
  `id_code` varchar(18) NOT NULL COMMENT '身份证号',
  `email` varchar(50) DEFAULT NULL,
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `funds_pwd` varchar(300) NOT NULL,
  `trade_adapter` varchar(50) NOT NULL,
  `insert_time` datetime DEFAULT NULL,
  `uuid` varchar(38) DEFAULT NULL COMMENT '柜台返回的唯一uuid，用来查询是否生效',
  `response_code` int(10) DEFAULT NULL COMMENT '状态 0 已申报  1成功  2失败',
  `error_message` varchar(255) DEFAULT NULL,
  `is_effective` int(2) DEFAULT NULL COMMENT '是否生效  0 未生效  1 已成功  2 已失败',
  `effective_time` datetime DEFAULT NULL COMMENT '生效/未能成功生效 时间',
  `is_set_pwd` int(2) DEFAULT NULL COMMENT '是否初始化密码  0未设置  1 已设置',
  `is_rewrite` int(2) DEFAULT NULL COMMENT '设置密码成功后是否成功会写到account库中  0 未回写  1 已回写',
  `is_set_us` int(2) DEFAULT NULL COMMENT '是否成功设置美股市场信息',
  `is_rewrite_user` int(2) DEFAULT NULL COMMENT '设置密码成功后是否成功回写stock.user表中  0 未回写  1 已回写',
  `request_param` text NOT NULL COMMENT '发送给柜台请求的参数',
  `area_id` varchar(38) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `is_custom` int(2) NOT NULL DEFAULT '0',
  `account_type` int(2) DEFAULT NULL COMMENT '资金账号类型 1 现金账号  2 融资账户',
  `is_open_us` int(2) DEFAULT NULL COMMENT '是否开通美股  0未开通  1 开通',
  `app_usable` double(15,2) DEFAULT NULL COMMENT '开通美股传递的钱数',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `idx_phone_number` (`phone_number`),
  KEY `idx_insert_time` (`insert_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for secur_base
-- ----------------------------
DROP TABLE IF EXISTS `secur_base`;
CREATE TABLE `secur_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `inner_code` int(11) DEFAULT NULL COMMENT '证券内部编码',
  `company_code` int(11) DEFAULT NULL COMMENT '公司代码',
  `secu_code` varchar(50) DEFAULT NULL COMMENT '证券代码',
  `chi_name` varchar(200) DEFAULT NULL COMMENT '中文名称',
  `chi_name_abbr` varchar(100) DEFAULT NULL COMMENT '中文名称缩写',
  `eng_name` varchar(200) DEFAULT NULL COMMENT '英文名称',
  `eng_name_abbr` varchar(100) DEFAULT NULL COMMENT '英文名称缩写',
  `secu_abbr` varchar(20) DEFAULT NULL COMMENT '证券简称',
  `chi_spelling` varchar(10) DEFAULT NULL COMMENT '拼音证券简称',
  `secu_market` int(11) DEFAULT NULL COMMENT '证券市场',
  `secu_category` int(11) DEFAULT NULL COMMENT '证券类别',
  `secu_appl` int(11) DEFAULT NULL COMMENT '使用类型0：接收;1：转入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='证券主表，保存证券公司基本信息';

-- ----------------------------
-- Table structure for stock_industry_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_industry_info`;
CREATE TABLE `stock_industry_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `exchange` varchar(20) DEFAULT NULL,
  `fit_industry` varchar(50) DEFAULT NULL COMMENT '一级市场',
  `sec_industry` varchar(50) DEFAULT NULL COMMENT '二级市场',
  `thd_industry` varchar(50) DEFAULT NULL COMMENT '三级市场',
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
  `user_id` int(11) NOT NULL COMMENT 'APP唯一的用户标识',
  `adapter` varchar(50) NOT NULL COMMENT '券商的标识',
  `account` varchar(50) NOT NULL COMMENT '用户（资金）账户',
  `is_buy_newstock` varchar(10) DEFAULT NULL COMMENT '当天是否购买过新股，发新股推送提醒使用。1：买过',
  `inset_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`adapter`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_cancel_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_cancel_log`;
CREATE TABLE `trade_cancel_log` (
  `cancel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id，系统生成唯一',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id，同user.userid',
  `adapter` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `dir` int(11) DEFAULT NULL COMMENT '买卖标志： 1买入 -1卖出 ',
  `order_seq` varchar(100) DEFAULT NULL COMMENT '撤单-委托编号',
  `cancel_status` int(11) DEFAULT NULL COMMENT '撤单提交结果',
  `cancel_time` bigint(20) DEFAULT NULL COMMENT '委托时间：格式（年月日时分秒）',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '客户端ip',
  `imei` varchar(50) DEFAULT NULL,
  `cancel_seq` varchar(200) DEFAULT NULL COMMENT '撤单编号:一键撤单使用',
  PRIMARY KEY (`cancel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136286 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_collateral_transfer
-- ----------------------------
DROP TABLE IF EXISTS `trade_collateral_transfer`;
CREATE TABLE `trade_collateral_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '交易柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `exchange` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '交易市场',
  `code` varchar(10) CHARACTER SET utf8 DEFAULT '' COMMENT '划转时间',
  `transfer_date` int(11) DEFAULT NULL,
  `transfer_amount` int(11) DEFAULT '0' COMMENT '划转数量',
  `transfer_money` double(15,2) DEFAULT '0.00' COMMENT '转划金额',
  `transfer_type` int(11) DEFAULT NULL COMMENT '划转类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_excess_profit
-- ----------------------------
DROP TABLE IF EXISTS `trade_excess_profit`;
CREATE TABLE `trade_excess_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '???׹?̨',
  `account` varchar(50) NOT NULL COMMENT '?ʽ??˺?',
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
  `trade_excution_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL COMMENT '交易账户账号',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` text COMMENT '市场',
  `code` text COMMENT '代码',
  `input_channel` text,
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` text COMMENT '订单编号',
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
  `trade_excution_id` int(11) NOT NULL DEFAULT '0' COMMENT '交易id，系统生成唯一',
  `client_acc_id` text COMMENT '交易账户账号',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` text COMMENT '市场',
  `code` text COMMENT '代码',
  `input_channel` text,
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` text COMMENT '订单编号',
  `order_no` text COMMENT '订单序号',
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
  `trade_excution_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL COMMENT '交易账户账号',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` text COMMENT '市场',
  `code` text COMMENT '代码',
  `input_channel` text,
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` text COMMENT '订单编号',
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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `imei` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户对应的imei',
  `account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `fingerprint_info` varchar(500) DEFAULT NULL COMMENT '用户指纹信息或者人脸识别码',
  `apply_time` datetime DEFAULT NULL COMMENT '录入时间',
  `last_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `state` varchar(20) DEFAULT NULL COMMENT '打开/关闭指纹信息 1打开  0关闭',
  PRIMARY KEY (`id`),
  KEY `createrIndex` (`user_id`,`imei`,`account`)
) ENGINE=InnoDB AUTO_INCREMENT=82035 DEFAULT CHARSET=utf8mb4 COMMENT='用户指纹或者人脸识别关联表';

-- ----------------------------
-- Table structure for trade_login_fail
-- ----------------------------
DROP TABLE IF EXISTS `trade_login_fail`;
CREATE TABLE `trade_login_fail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `adapter` varchar(50) NOT NULL COMMENT '交易柜台',
  `account` varchar(50) NOT NULL COMMENT '资金账号',
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `fail_count` int(11) DEFAULT NULL COMMENT '失败次数',
  `verify_code` varchar(4) DEFAULT NULL COMMENT '验证码',
  `check_account` tinyint(4) DEFAULT '1' COMMENT '1:身份未验证，2：已验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=404568 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_login_fail_detail
-- ----------------------------
DROP TABLE IF EXISTS `trade_login_fail_detail`;
CREATE TABLE `trade_login_fail_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '手机号',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `model` varchar(100) DEFAULT NULL COMMENT '手机型号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=681058 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_login_fail_trigger
-- ----------------------------
DROP TABLE IF EXISTS `trade_login_fail_trigger`;
CREATE TABLE `trade_login_fail_trigger` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(50) DEFAULT NULL COMMENT '账户名',
  `fail_count` int(10) DEFAULT NULL COMMENT '登录失败次数',
  `state` int(2) DEFAULT NULL COMMENT '数据有效标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_max_impawn_rate
-- ----------------------------
DROP TABLE IF EXISTS `trade_max_impawn_rate`;
CREATE TABLE `trade_max_impawn_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `impawn_rate` int(3) DEFAULT NULL COMMENT '可融资股票的最大抵押比例',
  `last_update_time` datetime DEFAULT NULL,
  `market` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order` (
  `order_inner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单内部id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL,
  `client_acc_name` text COMMENT '客户姓名',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` text COMMENT '市场',
  `code` text COMMENT '代码',
  `product_name` text COMMENT '股票名称',
  `input_channel` text,
  `exec_qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` text COMMENT '订单编号',
  `order_no` text COMMENT '订单序号',
  `order_type` text COMMENT '订单类型 I 现价竞价单 A 竞价单 L 限价单 E 增强限价单 S 特别限价单 M 市价单',
  `order_status` text COMMENT '订单状态',
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
) ENGINE=InnoDB AUTO_INCREMENT=1035800 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order_backup
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_backup`;
CREATE TABLE `trade_order_backup` (
  `order_inner_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单内部id，系统生成唯一',
  `client_acc_id` text COMMENT '交易账户',
  `client_acc_name` text COMMENT '客户姓名',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` text COMMENT '市场',
  `code` text COMMENT '代码',
  `product_name` text COMMENT '股票名称',
  `input_channel` text,
  `exec_qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` text COMMENT '订单编号',
  `order_no` text COMMENT '订单序号',
  `order_type` text COMMENT '订单类型',
  `order_status` text COMMENT '订单状态',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reference` text,
  `reference1` text,
  `sett_ccy` text,
  `match_qty` int(11) DEFAULT NULL COMMENT '成交笔数',
  `avg_trade_price` double DEFAULT NULL COMMENT '成交均价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order_bak
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_bak`;
CREATE TABLE `trade_order_bak` (
  `order_inner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单内部id，系统生成唯一',
  `client_acc_id` varchar(50) DEFAULT NULL,
  `client_acc_name` text COMMENT '客户姓名',
  `bs_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  `exchange` text COMMENT '市场',
  `code` text COMMENT '代码',
  `product_name` text COMMENT '股票名称',
  `input_channel` text,
  `exec_qty` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '价格',
  `order_id` text COMMENT '订单编号',
  `order_no` text COMMENT '订单序号',
  `order_type` text COMMENT '订单类型 I 现价竞价单 A 竞价单 L 限价单 E 增强限价单 S 特别限价单 M 市价单',
  `order_status` text COMMENT '订单状态',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reference` text,
  `reference1` text,
  `sett_ccy` text,
  `match_qty` int(11) DEFAULT NULL COMMENT '成交笔数',
  `avg_trade_price` double DEFAULT NULL COMMENT '成交均价',
  PRIMARY KEY (`order_inner_id`),
  KEY `historyQuery` (`client_acc_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=565490 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_order_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_log`;
CREATE TABLE `trade_order_log` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id，系统生成唯一',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id，同user.userid',
  `adapter` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `dir` int(11) DEFAULT NULL COMMENT '买卖标志： 1买入 -1卖出 ',
  `exchange` varchar(20) DEFAULT NULL COMMENT '交易市场',
  `code` varchar(20) DEFAULT NULL COMMENT '股票代码',
  `order_status` int(11) DEFAULT NULL COMMENT '订单提交结果',
  `order_time` bigint(20) DEFAULT NULL COMMENT '委托时间：格式（年月日时分秒）',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '客户端ip',
  `imei` varchar(50) DEFAULT NULL,
  `order_seq` varchar(100) DEFAULT NULL COMMENT '订单-委托编号',
  `order_price` double(14,4) DEFAULT NULL COMMENT '委托价格',
  `order_qty` int(11) DEFAULT NULL COMMENT '委托股数',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1204855 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_stock_transfer
-- ----------------------------
DROP TABLE IF EXISTS `trade_stock_transfer`;
CREATE TABLE `trade_stock_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '股票账户',
  `asset` double(15,0) DEFAULT NULL COMMENT '当天转仓总金额金额 正的为转入 负的为转出',
  `currency` varchar(11) DEFAULT NULL COMMENT '币种',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期,前的银证转入',
  `info_time` int(11) DEFAULT NULL COMMENT '银证转账时间',
  `ex` double NOT NULL COMMENT '汇率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=963 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_stock_transfer_item
-- ----------------------------
DROP TABLE IF EXISTS `trade_stock_transfer_item`;
CREATE TABLE `trade_stock_transfer_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '股票账户',
  `exchange` varchar(10) DEFAULT NULL COMMENT '股票市场',
  `code` varchar(20) DEFAULT NULL COMMENT '股票code',
  `name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `amount` int(11) DEFAULT NULL COMMENT '转仓股票数量',
  `price` double DEFAULT NULL COMMENT '收盘价格',
  `asset` double DEFAULT NULL COMMENT '金额 正的为转入 负的为转出',
  `currency` varchar(11) DEFAULT NULL COMMENT '币种',
  `ex` double DEFAULT NULL COMMENT '汇率',
  `insert_time` datetime DEFAULT NULL COMMENT '入表时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=665 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_transfer_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_transfer_log`;
CREATE TABLE `trade_transfer_log` (
  `id` varchar(38) NOT NULL COMMENT '流水id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id，同user.userid',
  `adapter` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `bank_tran_type` varchar(11) DEFAULT NULL COMMENT '1：银行转证券 2：证券转银行',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `currency` varchar(50) DEFAULT NULL COMMENT '转入币种',
  `tranamt` double DEFAULT NULL COMMENT '转帐金额',
  `insert_time` datetime DEFAULT NULL,
  `client_ip` varchar(20) DEFAULT NULL COMMENT '客户端ip',
  `imei` varchar(50) DEFAULT NULL,
  `response_code` int(10) DEFAULT NULL COMMENT '响应状态0 ok',
  `error_message` varchar(255) DEFAULT NULL COMMENT '错误描述',
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
  `tdate` int(11) DEFAULT NULL COMMENT '交易日期，年月日',
  `match_time` int(11) DEFAULT NULL COMMENT '交易时间，时分秒',
  `match_qty` int(11) DEFAULT NULL COMMENT '成交量',
  `match_price` double(7,2) DEFAULT NULL COMMENT '成交价',
  `matchamt` double(15,2) DEFAULT NULL COMMENT '成交金额',
  `dir` smallint(4) DEFAULT NULL COMMENT ' 1买 -1卖',
  `exchange` varchar(10) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL COMMENT '交易账户',
  `adapter` varchar(20) DEFAULT NULL COMMENT '柜台',
  PRIMARY KEY (`exchange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_device
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_device`;
CREATE TABLE `trade_user_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '交易柜台',
  `account` varchar(50) NOT NULL COMMENT '资金账号',
  `bind_date` datetime DEFAULT NULL COMMENT '绑定时间',
  `unbind_date` datetime DEFAULT NULL COMMENT '解绑定时间',
  `type` char(1) DEFAULT NULL COMMENT '绑定状态：1绑定 0解绑',
  `imei` varchar(128) DEFAULT NULL COMMENT '设备唯一标识',
  `model` varchar(64) DEFAULT NULL COMMENT '手机型号',
  PRIMARY KEY (`id`),
  KEY `trade_index` (`adapter`,`account`,`imei`)
) ENGINE=InnoDB AUTO_INCREMENT=29045 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_info
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_info`;
CREATE TABLE `trade_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '交易柜台',
  `account` varchar(50) NOT NULL COMMENT '资金账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码（加密后',
  `operway` varchar(100) DEFAULT NULL COMMENT '账户类型',
  `reg_date` datetime NOT NULL COMMENT '初次登陆时间',
  `type` int(11) DEFAULT '0' COMMENT '账号类型：0普通账号、1融资融券',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `pass_expire_date` datetime DEFAULT NULL COMMENT '密码失效提醒日期',
  PRIMARY KEY (`id`),
  KEY `index2` (`account`,`adapter`)
) ENGINE=InnoDB AUTO_INCREMENT=212907 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_info_backup
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_info_backup`;
CREATE TABLE `trade_user_info_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '交易柜台',
  `account` varchar(50) NOT NULL COMMENT '资金账号',
  `password` varchar(100) NOT NULL COMMENT '密码（加密后',
  `operway` varchar(100) DEFAULT NULL COMMENT '账户类型',
  `reg_date` datetime NOT NULL COMMENT '初次登陆时间',
  `type` int(11) DEFAULT '0' COMMENT '账号类型：0普通账号、1融资融券',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `pass_expire_date` datetime DEFAULT NULL COMMENT '密码失效提醒日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45503 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money`;
CREATE TABLE `trade_user_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '总资产',
  `usable` double(15,2) DEFAULT NULL COMMENT '可用',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '可取',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '总负债',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '净资产',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '可融资额度',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '可融券额度',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '融券利息',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '融资利息',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '港币资产',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '人民币资产',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '美元资产',
  `dark_fee` double(15,2) DEFAULT NULL COMMENT '暗盘交易费用',
  `ipo_frozen` double(15,2) DEFAULT NULL COMMENT 'ipo冻结',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `adapter_from` varchar(20) DEFAULT NULL COMMENT '数据柜台来源',
  `true_pure_assets` double(15,2) DEFAULT NULL COMMENT '真正净资产',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`),
  KEY `infodate_for_max` (`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=86232865 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money_2
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money_2`;
CREATE TABLE `trade_user_money_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '总资产',
  `usable` double(15,2) DEFAULT NULL COMMENT '可用',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '可取',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '总负债',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '净资产',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '可融资额度',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '可融券额度',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '融券利息',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '融资利息',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '港币资产',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '人民币资产',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '美元资产',
  `dark_fee` double(15,2) DEFAULT NULL COMMENT '暗盘交易费用',
  `ipo_frozen` double(15,2) DEFAULT NULL COMMENT 'ipo冻结',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6505656 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money_backup
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money_backup`;
CREATE TABLE `trade_user_money_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '总资产',
  `usable` double(15,2) DEFAULT NULL COMMENT '可用',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '可取',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '总负债',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '净资产',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '可融资额度',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '可融券额度',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '融券利息',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '融资利息',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '港币资产',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '人民币资产',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '美元资产',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3144582 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_money_backup_bak01
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_money_backup_bak01`;
CREATE TABLE `trade_user_money_backup_bak01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '总资产',
  `usable` double(15,2) DEFAULT NULL COMMENT '可用',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '可取',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `debt_assets` double(15,2) DEFAULT '0.00' COMMENT '总负债',
  `pure_assets` double(15,2) DEFAULT '0.00' COMMENT '净资产',
  `financing_assets` double(15,2) DEFAULT '0.00' COMMENT '可融资额度',
  `security_assets` double(15,2) DEFAULT '0.00' COMMENT '可融券额度',
  `security_interest` double(15,2) DEFAULT '0.00' COMMENT '融券利息',
  `financing_interest` double(15,2) DEFAULT '0.00' COMMENT '融资利息',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期',
  `daily_profit` double(15,2) DEFAULT '0.00',
  `hkd_assets` double(15,2) DEFAULT '0.00' COMMENT '港币资产',
  `cnh_assets` double(15,2) DEFAULT '0.00' COMMENT '人民币资产',
  `usd_assets` double(15,2) DEFAULT '0.00' COMMENT '美元资产',
  `dark_fee` double(15,2) DEFAULT NULL COMMENT '暗盘交易费用',
  `ipo_frozen` double(15,2) DEFAULT NULL COMMENT 'ipo冻结',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `adapter_from` varchar(20) DEFAULT NULL COMMENT '数据柜台来源',
  `true_pure_assets` double(15,2) DEFAULT NULL COMMENT '真正净资产',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`),
  KEY `infodate_for_max` (`info_date`),
  KEY `account_info_date` (`account`,`info_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24601885 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_phone
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_phone`;
CREATE TABLE `trade_user_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) NOT NULL COMMENT '交易柜台',
  `account` varchar(50) NOT NULL COMMENT '资金账号',
  `user_id` int(8) unsigned NOT NULL COMMENT 'app用户Id',
  `bind_date` datetime NOT NULL COMMENT '绑定时间',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`),
  KEY `idx_account` (`account`),
  KEY `idx_userid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23248 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_position
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_position`;
CREATE TABLE `trade_user_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '股票账户',
  `name` varchar(20) DEFAULT NULL COMMENT '股票名称',
  `code` varchar(20) DEFAULT NULL COMMENT '股票编码',
  `exchange` varchar(10) DEFAULT NULL COMMENT '交易市场',
  `last_price` double(7,2) DEFAULT NULL COMMENT '最新价',
  `cost_price` double(7,2) DEFAULT NULL COMMENT '成本价',
  `close_px` double(7,2) DEFAULT NULL COMMENT '收盘价',
  `pre_close_px` double(7,2) DEFAULT NULL COMMENT '上个交易日收盘价',
  `stkavl` int(11) DEFAULT NULL COMMENT '总股本',
  `stkbuy` int(11) DEFAULT NULL COMMENT '买入冻结',
  `stksale` int(11) DEFAULT NULL COMMENT '卖出冻结',
  `tasset` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `riseAndFallRate` varchar(20) DEFAULT NULL COMMENT '日盈亏比例',
  `riseAndFallValue` double(15,2) DEFAULT NULL COMMENT '日盈亏',
  `float_value` double(15,2) DEFAULT NULL COMMENT '浮动盈亏',
  `positions_rate` varchar(20) DEFAULT NULL COMMENT '仓位占比',
  `stock_id` int(11) DEFAULT NULL COMMENT '股票内部ID',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`id`),
  KEY `posi_identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_user_transfer
-- ----------------------------
DROP TABLE IF EXISTS `trade_user_transfer`;
CREATE TABLE `trade_user_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(50) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '股票账户',
  `asset` double(15,2) DEFAULT NULL COMMENT '金额 正的为转入 负的为转出',
  `currency` varchar(11) DEFAULT NULL COMMENT '币种',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期,前的银证转入',
  `info_time` int(11) DEFAULT NULL COMMENT '银证转账时间',
  `ex` double NOT NULL COMMENT '汇率',
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
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `fail_count` int(11) DEFAULT NULL COMMENT '失败次数',
  `verify_code` varchar(4) DEFAULT NULL COMMENT '验证码',
  PRIMARY KEY (`imei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
