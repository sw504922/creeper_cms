/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : basicdata

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:13:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for margin_short_info
-- ----------------------------
DROP TABLE IF EXISTS `margin_short_info`;
CREATE TABLE `margin_short_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exchange` varchar(20) DEFAULT '' COMMENT '挂牌交易所',
  `symbol` varchar(10) NOT NULL DEFAULT '' COMMENT '股票代码',
  `name` varchar(200) DEFAULT '' COMMENT '股票名称',
  `margin_eligible` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可融资 1:是 0否',
  `margin_mortgage_rate` decimal(10,2) DEFAULT '0.00' COMMENT '融资抵押率，单位% ',
  `short_eligible` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可融券 1:是 0否',
  `short_mortgage_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '融券抵押率，单位% ',
  `locate_fee` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '融券时每股收取费用,单位:美元,港元,人民币元',
  `min_locate_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '融券时每笔最少收取费用,单位:美元,港元,人民币元',
  `borrow_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '融券时收取的年化利息 单位%',
  `country` varchar(10) DEFAULT '' COMMENT '市场 HKG:港股 USA:美股 CHN:A股',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98172 DEFAULT CHARSET=utf8mb4 COMMENT='可融资融券的码表，由香港同事管理';

-- ----------------------------
-- Table structure for zj_ipo_qty
-- ----------------------------
DROP TABLE IF EXISTS `zj_ipo_qty`;
CREATE TABLE `zj_ipo_qty` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '股票代码',
  `ipo_date` date NOT NULL COMMENT '上市日期',
  `qty` decimal(30,10) NOT NULL COMMENT '数量',
  `currency` varchar(10) DEFAULT NULL COMMENT '币种',
  `amount` decimal(30,10) NOT NULL DEFAULT '0.0000000000' COMMENT '金额',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入数据库的时间',
  PRIMARY KEY (`id`),
  KEY `Index 2` (`code`,`ipo_date`),
  KEY `idx1` (`code`,`ipo_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4257228 DEFAULT CHARSET=utf8mb4 COMMENT='数量金额梯度表，即一个新股的‘申购股数’，‘所需金额’的对应关系，主要用于港股，数据是从批露易上抓取\r\n通过 code,ipo_date字段和zj_shareipo表相关联\r\n\r\n';

-- ----------------------------
-- Table structure for zj_shareipo
-- ----------------------------
DROP TABLE IF EXISTS `zj_shareipo`;
CREATE TABLE `zj_shareipo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '股票代码',
  `country` varchar(20) NOT NULL COMMENT '国家',
  `exchange` varchar(20) DEFAULT NULL COMMENT '挂牌交易所',
  `name` varchar(200) DEFAULT NULL COMMENT '股票名称',
  `name_en` varchar(200) DEFAULT NULL COMMENT '股票英文名',
  `company_engname` varchar(200) DEFAULT NULL COMMENT '公司英文名',
  `company_cnname` varchar(200) DEFAULT NULL COMMENT '公司中文名',
  `tshares` bigint(20) DEFAULT NULL COMMENT '总股本',
  `shares_offered` bigint(20) DEFAULT NULL COMMENT '流通股本或发行股本',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '总市值',
  `ipoprice_low` decimal(18,4) DEFAULT NULL COMMENT '每股最低价',
  `ipoprice_high` decimal(18,4) DEFAULT NULL COMMENT '每股最高价',
  `ipoprice` decimal(18,4) DEFAULT NULL COMMENT '发行价',
  `tradeunit` int(11) DEFAULT NULL COMMENT '买卖单位(股/手) (只有港股才录入)',
  `tradeunitpriceatceiling` decimal(18,4) DEFAULT NULL COMMENT '按最高价每手支付价格(只有港股才录入)',
  `ipo_date` date DEFAULT NULL COMMENT '上市日',
  `least_buy` int(11) DEFAULT NULL COMMENT '最小申购股数',
  `least_amount` decimal(18,4) DEFAULT NULL COMMENT '最低认购金额',
  `applystartdate` date DEFAULT NULL COMMENT '申购起始日',
  `issueenddate` datetime DEFAULT NULL COMMENT '申购截止日',
  `issueresultpubldate` date DEFAULT NULL COMMENT '中签公布日(只有美股才录入)',
  `bookrunner` varchar(1000) DEFAULT NULL COMMENT '承销商',
  `prospectus_url` varchar(1000) DEFAULT NULL COMMENT '招股书链接1',
  `url2` varchar(1000) DEFAULT NULL COMMENT '招股书链接2',
  `url3` varchar(1000) DEFAULT NULL COMMENT '招股书链接3',
  `url4` varchar(1000) DEFAULT NULL COMMENT '招股书链接4',
  `datetoaccount` date DEFAULT NULL COMMENT '股票发放日(港股用此字段判断暗盘日,美股不录入此字段)',
  `ipo_status` int(11) DEFAULT NULL COMMENT '聚源的进程状态(港股才有)',
  `is_apply` int(11) DEFAULT NULL COMMENT '是否配售 1 :是 0 不是',
  `issuetype` int(11) DEFAULT NULL COMMENT '发行类别  1 首发  3:增发',
  `marketcode` varchar(20) DEFAULT NULL COMMENT '市场代码 MAIN主板  GEM 创业板 ',
  `firstday_pchg` double(18,4) DEFAULT NULL COMMENT '首日涨跌幅',
  `dark_pchg` double(18,4) DEFAULT NULL COMMENT '暗盘日涨跌幅',
  `pubapplymultiple` decimal(18,8) DEFAULT NULL COMMENT '公众股认购倍数（聚源数据） (港股才有)',
  `pubapplyshares` decimal(30,8) DEFAULT NULL COMMENT '公众股认购股数(股)  (港股才有)',
  `pubapplyunit` decimal(18,2) DEFAULT NULL COMMENT '公众股认购有效申请份数(白/黄/电子) (港股才有)',
  `totalproceeds` decimal(18,2) DEFAULT NULL COMMENT '募资总额 (港股才有)',
  `totalsubshares` decimal(18,2) DEFAULT NULL COMMENT '实际认购股数(股) (港股才有)',
  `issue_status` int(11) DEFAULT NULL COMMENT '申购状态 1 成功 -1 失败',
  `allow_apply_flag` int(11) DEFAULT NULL COMMENT '是否允许申购  1 手工录入数据(可申购) 0:抓取的数据(不可申购)',
  `pin_yin` varchar(50) DEFAULT NULL COMMENT '拼音',
  `margin_start_time` date DEFAULT NULL COMMENT '融资开始时间',
  `margin_close_time` datetime DEFAULT NULL COMMENT '融资结束时间',
  `balance_frozen_start_time` date DEFAULT NULL COMMENT '资金冻结时间',
  `balance_frozen_close_time` datetime DEFAULT NULL COMMENT '资金解冻时间',
  `official_close_time` datetime DEFAULT NULL COMMENT '官方申购结束时间',
  `max_loan_ratio` decimal(30,10) DEFAULT NULL COMMENT '最高贷款比例',
  `min_apply_amount` decimal(30,10) DEFAULT NULL COMMENT '单笔最低融资',
  `max_apply_amount` decimal(30,10) DEFAULT NULL COMMENT '单笔最高融资',
  `trading_fee_rate` decimal(30,10) DEFAULT NULL COMMENT '交易费用比例',
  `currency` varchar(10) DEFAULT NULL COMMENT '币种 :''USD'',''HKD'',''CNY''',
  `max_loan_amount` decimal(30,10) DEFAULT NULL COMMENT '最高贷款额',
  `charge_rate` decimal(30,10) DEFAULT NULL COMMENT '续费比例',
  `charge` decimal(30,10) DEFAULT NULL COMMENT '手续费定额',
  `interest_rate` decimal(30,10) DEFAULT NULL COMMENT '利息率',
  `interest_day` int(11) DEFAULT NULL COMMENT '利息天数',
  `loan_charge_rate` decimal(30,10) DEFAULT NULL COMMENT '融资手续费比例',
  `split_qty` int(11) DEFAULT NULL COMMENT '分档股数',
  `loan_fee_more` decimal(30,10) DEFAULT NULL COMMENT '高档手续费定额',
  `interest_rate_more` decimal(30,10) DEFAULT NULL COMMENT '高档利息率',
  `loan_charge` decimal(30,10) DEFAULT NULL COMMENT '融资手续费定额',
  `trading_fee_standard` decimal(30,10) DEFAULT NULL COMMENT '配售交易费用定额',
  `pla_loan_ratio` decimal(30,10) DEFAULT NULL COMMENT '配售最高贷款额',
  `company_introduction` varchar(2000) DEFAULT NULL COMMENT '公司简介',
  `placing_min_qty` int(11) DEFAULT NULL COMMENT '最小配售股数',
  `margin_cancel_end_time` datetime DEFAULT NULL COMMENT '融资最晚撤单时间',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '通知内容',
  `notice_start_time` datetime DEFAULT NULL COMMENT '通知开始时间',
  `notice_end_time` datetime DEFAULT NULL COMMENT '通知截至时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '数据更新时间',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入mysql时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10537817 DEFAULT CHARSET=utf8mb4 COMMENT='美港股IPO信息,\r\n业务唯一性 code,ipo_date,\r\n通过 code,ipo_date字段和''数量金额梯度''表相关联';

SET FOREIGN_KEY_CHECKS = 1;
