/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : report

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:28:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aarrr_meta_data
-- ----------------------------
DROP TABLE IF EXISTS `aarrr_meta_data`;
CREATE TABLE `aarrr_meta_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `behavior` varchar(255) DEFAULT NULL,
  `steps` varchar(255) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='漏斗模型定义';

-- ----------------------------
-- Table structure for access_ip_location
-- ----------------------------
DROP TABLE IF EXISTS `access_ip_location`;
CREATE TABLE `access_ip_location` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_count` int(11) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1592275 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for access_location
-- ----------------------------
DROP TABLE IF EXISTS `access_location`;
CREATE TABLE `access_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `stat_date` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL COMMENT '当前城市中心点经度',
  `y` varchar(255) DEFAULT NULL COMMENT '(当前城市中心点维度',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `country` (`country`) USING BTREE,
  KEY `regin` (`region`) USING BTREE,
  KEY `country_region` (`country`,`region`)
) ENGINE=InnoDB AUTO_INCREMENT=7227121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for accesscnt
-- ----------------------------
DROP TABLE IF EXISTS `accesscnt`;
CREATE TABLE `accesscnt` (
  `date` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `ocnt` int(11) DEFAULT NULL,
  `acnt` int(11) DEFAULT NULL,
  `scnt` int(11) DEFAULT NULL,
  KEY `date` (`date`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for accesstmp
-- ----------------------------
DROP TABLE IF EXISTS `accesstmp`;
CREATE TABLE `accesstmp` (
  `user_id` varchar(255) DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for accounttest
-- ----------------------------
DROP TABLE IF EXISTS `accounttest`;
CREATE TABLE `accounttest` (
  `account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for accounttest2
-- ----------------------------
DROP TABLE IF EXISTS `accounttest2`;
CREATE TABLE `accounttest2` (
  `account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acnt
-- ----------------------------
DROP TABLE IF EXISTS `acnt`;
CREATE TABLE `acnt` (
  `date` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  KEY `date` (`date`) USING BTREE,
  KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activation
-- ----------------------------
DROP TABLE IF EXISTS `activation`;
CREATE TABLE `activation` (
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `imei` varchar(255) DEFAULT NULL COMMENT 'imei号',
  `channel` varchar(255) DEFAULT NULL COMMENT '渠道来源',
  `os` varchar(255) DEFAULT NULL COMMENT '操作系统',
  `manu` varchar(255) DEFAULT NULL COMMENT '型号',
  `app_version` varchar(255) DEFAULT NULL COMMENT 'app版本',
  `platform` varchar(255) DEFAULT NULL,
  `stat_time_hour` varchar(255) DEFAULT NULL,
  `stat_time` varchar(255) DEFAULT NULL,
  `stat_time_day` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `stat` (`stat_time_day`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `imei` (`imei`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='激活数据表';

-- ----------------------------
-- Table structure for active_pvuv
-- ----------------------------
DROP TABLE IF EXISTS `active_pvuv`;
CREATE TABLE `active_pvuv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `active_uuid` varchar(255) DEFAULT NULL COMMENT '活动唯一标识',
  `active_time` varchar(255) DEFAULT NULL COMMENT '活动日期',
  `active_pv` int(11) DEFAULT NULL COMMENT '活动pv',
  `active_uv` int(11) DEFAULT NULL COMMENT '活动uv',
  `active_ip` int(11) DEFAULT NULL COMMENT '活动ip数',
  `active_bounce_ratio` double DEFAULT NULL COMMENT '活动跳出率',
  `active_avg_visit_time` int(11) DEFAULT NULL COMMENT '活动平均访问时长',
  `is_on_line` int(11) DEFAULT NULL COMMENT '是否在线；0 在线 ；1 不在线',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据库更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132645 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activity_trade
-- ----------------------------
DROP TABLE IF EXISTS `activity_trade`;
CREATE TABLE `activity_trade` (
  `account_id` varchar(15) NOT NULL,
  `hk_buy` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `hk_sell` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `us_buy` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `us_sell` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  KEY `QUERY_INDEX` (`account_id`,`us_buy`) USING BTREE,
  KEY `idx_us_buy` (`us_buy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for actual_balance
-- ----------------------------
DROP TABLE IF EXISTS `actual_balance`;
CREATE TABLE `actual_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_code` int(255) DEFAULT NULL COMMENT '银行编码',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `balance` varchar(255) DEFAULT NULL COMMENT '实际余额',
  `stat_time_day` varchar(255) DEFAULT NULL COMMENT '日期',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实际结余';

-- ----------------------------
-- Table structure for allocation
-- ----------------------------
DROP TABLE IF EXISTS `allocation`;
CREATE TABLE `allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(255) DEFAULT NULL COMMENT '分配方式',
  `status` int(255) DEFAULT '1' COMMENT '状态，0为启用中，1为暂停',
  `coversion_name` varchar(255) DEFAULT NULL COMMENT '按注册时间分配方式',
  `coversion_rate` varchar(255) DEFAULT NULL COMMENT '按注册时间分配方式百分比',
  `method` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='ODCRM系统用户分配机制';

-- ----------------------------
-- Table structure for an
-- ----------------------------
DROP TABLE IF EXISTS `an`;
CREATE TABLE `an` (
  `account` int(255) DEFAULT NULL,
  `net_assets` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for android_data
-- ----------------------------
DROP TABLE IF EXISTS `android_data`;
CREATE TABLE `android_data` (
  `user_id` varchar(255) DEFAULT NULL,
  `funds_account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_user
-- ----------------------------
DROP TABLE IF EXISTS `api_user`;
CREATE TABLE `api_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(30) DEFAULT NULL,
  `insert_date` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='API用户表';

-- ----------------------------
-- Table structure for app_factor
-- ----------------------------
DROP TABLE IF EXISTS `app_factor`;
CREATE TABLE `app_factor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(50) DEFAULT NULL COMMENT '应用(mining_e)',
  `os` varchar(50) DEFAULT NULL COMMENT '系统(ios.android)',
  `app_version` varchar(50) DEFAULT NULL COMMENT '版本号(1.6.1)',
  `channel` varchar(100) DEFAULT NULL COMMENT '渠道(应用宝)',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1299505 DEFAULT CHARSET=utf8 COMMENT='app事实表，包含平台，操作系统，app版本号，渠道';

-- ----------------------------
-- Table structure for app_service_data_export
-- ----------------------------
DROP TABLE IF EXISTS `app_service_data_export`;
CREATE TABLE `app_service_data_export` (
  `funds_account` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于app服务端手动导出指定数据中间表的使用';

-- ----------------------------
-- Table structure for app_start
-- ----------------------------
DROP TABLE IF EXISTS `app_start`;
CREATE TABLE `app_start` (
  `date` varchar(255) DEFAULT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `cnt` bigint(20) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  KEY `date` (`date`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for app_ui_click
-- ----------------------------
DROP TABLE IF EXISTS `app_ui_click`;
CREATE TABLE `app_ui_click` (
  `user_id` int(11) DEFAULT NULL,
  `client_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_name` varchar(25) DEFAULT NULL,
  `menu_name` varchar(25) DEFAULT NULL,
  `button_name` varchar(25) DEFAULT NULL,
  `os` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for app_user_firststart
-- ----------------------------
DROP TABLE IF EXISTS `app_user_firststart`;
CREATE TABLE `app_user_firststart` (
  `request_time` varchar(255) DEFAULT NULL,
  `code_happen` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `manu` varchar(255) DEFAULT NULL,
  `other_info` varchar(255) DEFAULT NULL,
  `screen_w` varchar(255) DEFAULT NULL,
  `screen_h` varchar(255) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `client_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `platform` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for app_user_register
-- ----------------------------
DROP TABLE IF EXISTS `app_user_register`;
CREATE TABLE `app_user_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) DEFAULT NULL,
  `client_time` timestamp NULL DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `request_time` timestamp NULL DEFAULT NULL,
  `source` int(11) NOT NULL,
  `os` varchar(255) DEFAULT NULL,
  `manu` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242508048 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `type` int(255) DEFAULT '0' COMMENT '0经分，1运营',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='经分系统与运营系统部门管理权限表';

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` int(8) NOT NULL,
  `group_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经分系统与运行系统用户权限';

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(2) NOT NULL DEFAULT '1',
  `status` int(2) NOT NULL DEFAULT '1',
  `level` int(255) NOT NULL DEFAULT '1',
  `condition` varchar(255) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `od_type` int(255) DEFAULT '0' COMMENT '0:经分，1运营系统',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='经分系统与运营系统的权限管理';

-- ----------------------------
-- Table structure for c_login_user_type_day
-- ----------------------------
DROP TABLE IF EXISTS `c_login_user_type_day`;
CREATE TABLE `c_login_user_type_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `trade_if` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日登陆用户类型分析中间表';

-- ----------------------------
-- Table structure for c_stock_report_day
-- ----------------------------
DROP TABLE IF EXISTS `c_stock_report_day`;
CREATE TABLE `c_stock_report_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `exchange_code` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7459735 DEFAULT CHARSET=utf8 COMMENT='Tag类型的日志表';

-- ----------------------------
-- Table structure for c_tag_report_day
-- ----------------------------
DROP TABLE IF EXISTS `c_tag_report_day`;
CREATE TABLE `c_tag_report_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `tag_key` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46520 DEFAULT CHARSET=utf8 COMMENT='Tag类型的日志表';

-- ----------------------------
-- Table structure for c_trade_usercount_day
-- ----------------------------
DROP TABLE IF EXISTS `c_trade_usercount_day`;
CREATE TABLE `c_trade_usercount_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `total_count` int(11) DEFAULT NULL,
  `register_count` int(11) DEFAULT NULL,
  `weibo_count` int(11) DEFAULT NULL,
  `weixin_count` int(11) DEFAULT NULL,
  `qq_count` int(11) DEFAULT NULL,
  `three_total_count` int(11) DEFAULT NULL,
  `total_trade_count` int(11) DEFAULT NULL,
  `register_trade_count` int(11) DEFAULT NULL,
  `weibo_trade_count` int(11) DEFAULT NULL,
  `weixin_trade_count` int(11) DEFAULT NULL,
  `qq_trade_count` int(11) DEFAULT NULL,
  `three_trade_count` int(11) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='每日登陆用户类型分析临时中间表';

-- ----------------------------
-- Table structure for c_ui_pv
-- ----------------------------
DROP TABLE IF EXISTS `c_ui_pv`;
CREATE TABLE `c_ui_pv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NULL DEFAULT NULL,
  `stat_time_hour` varchar(45) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `button` varchar(100) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `stat_time_day` varchar(45) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_c_ui_pv` (`stat_time`,`user_id`),
  KEY `idx_c_ui_pv02` (`stat_time`,`user_id`,`page`,`menu`,`button`,`platform`,`channel`,`os`,`manu`,`os_version`,`app_version`,`language`,`screen_w`,`screen_h`)
) ENGINE=InnoDB AUTO_INCREMENT=24795280 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for channel_analysis
-- ----------------------------
DROP TABLE IF EXISTS `channel_analysis`;
CREATE TABLE `channel_analysis` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stat_time_day` varchar(20) DEFAULT '' COMMENT '日期',
  `channel` varchar(50) DEFAULT '' COMMENT '渠道编码',
  `channel_name` varchar(30) DEFAULT NULL COMMENT '渠道中文名称',
  `always_started` varchar(30) DEFAULT '0' COMMENT '总启动',
  `register` varchar(20) DEFAULT '0' COMMENT '当天注册数（不区分新老）',
  `activation` varchar(20) DEFAULT '0' COMMENT '激活数(不区分新老)',
  `same_day_register` varchar(20) DEFAULT '0' COMMENT '日新增注册',
  `same_day_active` varchar(20) DEFAULT '0' COMMENT '日新增活跃',
  `active` varchar(20) DEFAULT '0' COMMENT '活跃用户',
  `long_interval` varchar(20) DEFAULT '0' COMMENT '停留时长',
  `two_active` varchar(10) DEFAULT '0' COMMENT '2日活跃',
  `seven_active` varchar(10) DEFAULT '0' COMMENT '七日活跃',
  `thirty_active` varchar(10) DEFAULT '0' COMMENT '三十日活跃',
  `account_user` varchar(10) DEFAULT '0' COMMENT '开户用户',
  `account_end_channel` varchar(10) DEFAULT '0' COMMENT '开户用户最后开户渠道',
  `into_gold_user` varchar(10) DEFAULT '0' COMMENT '首次入金按最终渠道计算',
  `gold_register_user` varchar(255) DEFAULT '0' COMMENT '首次入金用户按注册渠道计算',
  `daily_golden` varchar(10) DEFAULT '0' COMMENT '每天入金人数',
  `all_trade_money` varchar(255) DEFAULT '0' COMMENT '总共入金金额',
  `daily_deposit_amount` varchar(255) DEFAULT '0' COMMENT '每天入金金额',
  `trade_money` varchar(255) DEFAULT '0' COMMENT '首次入金金额',
  `valid_num` int(10) DEFAULT '0' COMMENT '渠道有效户',
  `clearing_status_channel` int(2) DEFAULT '2' COMMENT '结算标识:0老数据，1代表已结算，2代表未结算',
  `clearing_money` varchar(20) DEFAULT '0' COMMENT '有效用户平均结算钱',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stat_time_day` (`stat_time_day`) USING BTREE,
  KEY `channel` (`channel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1793477 DEFAULT CHARSET=utf8mb4 COMMENT='渠道分析表';

-- ----------------------------
-- Table structure for channel_ananlysis_name
-- ----------------------------
DROP TABLE IF EXISTS `channel_ananlysis_name`;
CREATE TABLE `channel_ananlysis_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL COMMENT '填写新的渠道需全部内容大写',
  `channel_name` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `channel_type` varchar(255) DEFAULT NULL COMMENT '渠道类型',
  `is_deleted` int(11) DEFAULT '0',
  `status` int(255) DEFAULT '0' COMMENT '显示状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=utf8mb4 COMMENT='渠道码对应表';

-- ----------------------------
-- Table structure for channel_info
-- ----------------------------
DROP TABLE IF EXISTS `channel_info`;
CREATE TABLE `channel_info` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '渠道ID',
  `full_name` varchar(200) DEFAULT NULL COMMENT '渠道名称',
  `short_name` varchar(50) DEFAULT NULL COMMENT '渠道简称',
  `ch_code` varchar(20) NOT NULL COMMENT '渠道码',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `id_number` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `payment_mode` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `recv_bank` varchar(50) DEFAULT NULL COMMENT '收款银行',
  `recv_account_code` varchar(20) DEFAULT NULL COMMENT '收款账号',
  `recv_account_name` varchar(20) DEFAULT NULL COMMENT '收款名称',
  `reward_detail` varchar(1000) DEFAULT NULL COMMENT '奖励条件',
  `reward_plan` varchar(200) DEFAULT NULL COMMENT '奖励方案（图片）',
  `manager` varchar(50) DEFAULT NULL COMMENT '商务（负责人）',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qr_code` varchar(200) DEFAULT NULL COMMENT '二维码（图片）',
  `qr_link` varchar(200) DEFAULT NULL COMMENT '二维码（外网连接）',
  `conversion_name` varchar(255) DEFAULT NULL COMMENT '转化人',
  `parent_id` int(11) DEFAULT NULL COMMENT '推荐人（父类）',
  `distribution` int(255) DEFAULT '1' COMMENT '0转化人已分配,1转化人未分配',
  `conversion` varchar(255) DEFAULT NULL COMMENT '转化比列',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `channel_distribution` int(255) DEFAULT '0',
  `reward_way` int(255) DEFAULT '0' COMMENT '最新奖励方式',
  PRIMARY KEY (`channel_id`),
  KEY `ch_code` (`ch_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8mb4 COMMENT='渠道信息详细表';

-- ----------------------------
-- Table structure for channel_news_bak
-- ----------------------------
DROP TABLE IF EXISTS `channel_news_bak`;
CREATE TABLE `channel_news_bak` (
  `stat_time` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `pv` varchar(255) DEFAULT NULL,
  `uv` varchar(255) DEFAULT NULL,
  `bai` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for channel_user_ipo_free
-- ----------------------------
DROP TABLE IF EXISTS `channel_user_ipo_free`;
CREATE TABLE `channel_user_ipo_free` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `ipo_time` varchar(255) DEFAULT NULL,
  `profit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `s` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=327676 DEFAULT CHARSET=utf8mb4 COMMENT='IPO打新利润表';

-- ----------------------------
-- Table structure for cholders
-- ----------------------------
DROP TABLE IF EXISTS `cholders`;
CREATE TABLE `cholders` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `lastcode` varchar(255) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `holding` double(20,2) DEFAULT NULL,
  `value` double(20,2) DEFAULT NULL,
  `stake` double(20,2) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ccassId` varchar(255) DEFAULT NULL,
  `ccassname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cholders_01` (`create_time`,`ccassId`,`ccassname`)
) ENGINE=InnoDB AUTO_INCREMENT=569960377 DEFAULT CHARSET=utf8 COMMENT='港交所券商托管市值详细信息';

-- ----------------------------
-- Table structure for cholders_01
-- ----------------------------
DROP TABLE IF EXISTS `cholders_01`;
CREATE TABLE `cholders_01` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `lastcode` varchar(255) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `holding` double(20,2) DEFAULT NULL,
  `value` double(20,2) DEFAULT NULL,
  `stake` double(20,2) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ccassId` varchar(255) DEFAULT NULL,
  `ccassname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24789239 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cholders_sum
-- ----------------------------
DROP TABLE IF EXISTS `cholders_sum`;
CREATE TABLE `cholders_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `sum` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1425 DEFAULT CHARSET=utf8 COMMENT='券商托管总市值(天)';

-- ----------------------------
-- Table structure for click
-- ----------------------------
DROP TABLE IF EXISTS `click`;
CREATE TABLE `click` (
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for click_copy
-- ----------------------------
DROP TABLE IF EXISTS `click_copy`;
CREATE TABLE `click_copy` (
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for click_copy_copy
-- ----------------------------
DROP TABLE IF EXISTS `click_copy_copy`;
CREATE TABLE `click_copy_copy` (
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cparticipants
-- ----------------------------
DROP TABLE IF EXISTS `cparticipants`;
CREATE TABLE `cparticipants` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `ccassid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013381 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_payment
-- ----------------------------
DROP TABLE IF EXISTS `customer_payment`;
CREATE TABLE `customer_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `funds_account` varchar(255) DEFAULT NULL,
  `process_date` varchar(255) DEFAULT '' COMMENT '成功入/出金日期(交易日)',
  `stat_time_day` varchar(255) DEFAULT NULL COMMENT '提交入/出金申请的日期(自然日)',
  `stat_time` varchar(255) DEFAULT NULL COMMENT '提交入/出金申请的日期(自然日)',
  `amount` double(255,4) DEFAULT '0.0000',
  `purpose` varchar(255) DEFAULT NULL COMMENT '状态 1入金2出金',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种1CNY,2HKD,4USD',
  `rate` varchar(255) DEFAULT NULL COMMENT '币种汇率(对HKD的)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=467286 DEFAULT CHARSET=utf8 COMMENT='用户出入金明细表(从BMS计算而来)';

-- ----------------------------
-- Table structure for data_sql
-- ----------------------------
DROP TABLE IF EXISTS `data_sql`;
CREATE TABLE `data_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(255) NOT NULL DEFAULT '',
  `statement` longtext,
  `desc` longtext COMMENT '描述',
  `show` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='历史查询SQL语句';

-- ----------------------------
-- Table structure for drak_buy_data
-- ----------------------------
DROP TABLE IF EXISTS `drak_buy_data`;
CREATE TABLE `drak_buy_data` (
  `funds_account` varchar(11) NOT NULL DEFAULT '',
  `stat_time_day` varchar(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `code` (`code`) USING BTREE,
  KEY `funds` (`funds_account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暗盘交易数据';

-- ----------------------------
-- Table structure for fail
-- ----------------------------
DROP TABLE IF EXISTS `fail`;
CREATE TABLE `fail` (
  `account_id` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fundsaccount_tmp
-- ----------------------------
DROP TABLE IF EXISTS `fundsaccount_tmp`;
CREATE TABLE `fundsaccount_tmp` (
  `fundsaccount` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for funnel_model
-- ----------------------------
DROP TABLE IF EXISTS `funnel_model`;
CREATE TABLE `funnel_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NULL DEFAULT NULL,
  `stat_time_hour` varchar(45) DEFAULT NULL,
  `stat_time_day` varchar(45) DEFAULT NULL,
  `funnel_id` int(11) NOT NULL,
  `funnel_name` varchar(50) NOT NULL,
  `num` varchar(50) NOT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(100) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rep_fund_02` (`stat_time_day`,`stat_time_hour`,`funnel_id`,`platform`,`channel`,`os`,`app_version`)
) ENGINE=InnoDB AUTO_INCREMENT=6125016 DEFAULT CHARSET=utf8 COMMENT='漏斗模型结果表';

-- ----------------------------
-- Table structure for google_ads_access
-- ----------------------------
DROP TABLE IF EXISTS `google_ads_access`;
CREATE TABLE `google_ads_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_time` varchar(255) DEFAULT NULL,
  `code_happen` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `client_time` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `manu` varchar(255) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `screen_w` varchar(255) DEFAULT NULL,
  `screen_h` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `dt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3656 DEFAULT CHARSET=utf8 COMMENT='google推广用户点击app数据';

-- ----------------------------
-- Table structure for h5_track_result
-- ----------------------------
DROP TABLE IF EXISTS `h5_track_result`;
CREATE TABLE `h5_track_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time_day` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `uaccount` varchar(255) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `uv` int(11) DEFAULT NULL,
  `firststart_num` int(11) DEFAULT NULL,
  `register_num` int(11) DEFAULT NULL,
  `account_num` int(11) DEFAULT NULL,
  `money_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15035 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hkbill_email
-- ----------------------------
DROP TABLE IF EXISTS `hkbill_email`;
CREATE TABLE `hkbill_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(16) NOT NULL DEFAULT '' COMMENT '资金账号',
  `user_name` varchar(256) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `bill_date` varchar(32) NOT NULL DEFAULT '' COMMENT '结单日期',
  `status` varchar(16) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_date_ix` (`account_id`,`bill_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5620394 DEFAULT CHARSET=utf8 COMMENT='日结单邮件发送失败表';

-- ----------------------------
-- Table structure for import_data_table
-- ----------------------------
DROP TABLE IF EXISTS `import_data_table`;
CREATE TABLE `import_data_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for institutional_user
-- ----------------------------
DROP TABLE IF EXISTS `institutional_user`;
CREATE TABLE `institutional_user` (
  `client_acc_id` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `acc_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ip2
-- ----------------------------
DROP TABLE IF EXISTS `ip2`;
CREATE TABLE `ip2` (
  `request_time` timestamp NULL DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ipanalysis
-- ----------------------------
DROP TABLE IF EXISTS `ipanalysis`;
CREATE TABLE `ipanalysis` (
  `id` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `timestatmp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for landpage
-- ----------------------------
DROP TABLE IF EXISTS `landpage`;
CREATE TABLE `landpage` (
  `time` timestamp NULL DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `hmsr` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for landpage2
-- ----------------------------
DROP TABLE IF EXISTS `landpage2`;
CREATE TABLE `landpage2` (
  `time` timestamp NULL DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `hmsr` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for level2user
-- ----------------------------
DROP TABLE IF EXISTS `level2user`;
CREATE TABLE `level2user` (
  `phone_number` char(20) DEFAULT NULL,
  `status_31` varchar(255) DEFAULT NULL,
  `level_to` varchar(255) DEFAULT NULL,
  `level_type` varchar(255) DEFAULT NULL,
  `status_39` varchar(255) DEFAULT NULL,
  `endtime_32` timestamp NULL DEFAULT NULL,
  `endtime_39` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for level2usertime
-- ----------------------------
DROP TABLE IF EXISTS `level2usertime`;
CREATE TABLE `level2usertime` (
  `user_id` varchar(255) DEFAULT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `status_31` varchar(255) DEFAULT NULL,
  `level_to` varchar(255) DEFAULT NULL,
  `level_type` varchar(255) DEFAULT NULL,
  `status_39` varchar(255) DEFAULT NULL,
  `endtime_32` timestamp NULL DEFAULT NULL,
  `endtime_39` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for login_user_type_day
-- ----------------------------
DROP TABLE IF EXISTS `login_user_type_day`;
CREATE TABLE `login_user_type_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `trade_if` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12803 DEFAULT CHARSET=utf8 COMMENT='每日登陆用户类型分析';

-- ----------------------------
-- Table structure for mytest
-- ----------------------------
DROP TABLE IF EXISTS `mytest`;
CREATE TABLE `mytest` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `t1` varchar(255) NOT NULL,
  `t2` varchar(255) DEFAULT NULL,
  `t3` varchar(255) DEFAULT NULL,
  `t4` varchar(255) DEFAULT NULL,
  `t5` varchar(255) DEFAULT NULL,
  `t6` varchar(255) DEFAULT NULL,
  `t7` varchar(255) DEFAULT NULL,
  `t8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t1` (`t2`) USING BTREE,
  KEY `t2` (`t2`) USING BTREE,
  KEY `t3` (`t3`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10191 DEFAULT CHARSET=utf8 COMMENT='导入xlxs数据进行查询表';

-- ----------------------------
-- Table structure for net_asseets_bigger_than_30k
-- ----------------------------
DROP TABLE IF EXISTS `net_asseets_bigger_than_30k`;
CREATE TABLE `net_asseets_bigger_than_30k` (
  `user_id` varchar(255) DEFAULT NULL,
  `funds_account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for net_assets_firstweek
-- ----------------------------
DROP TABLE IF EXISTS `net_assets_firstweek`;
CREATE TABLE `net_assets_firstweek` (
  `user_id` varchar(255) DEFAULT NULL,
  `funds_account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for net_assets_secondweek
-- ----------------------------
DROP TABLE IF EXISTS `net_assets_secondweek`;
CREATE TABLE `net_assets_secondweek` (
  `funds_account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_read_time
-- ----------------------------
DROP TABLE IF EXISTS `news_read_time`;
CREATE TABLE `news_read_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `read_day` varchar(255) DEFAULT NULL COMMENT '阅读时间',
  `read_hour` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户',
  `news_type` varchar(255) DEFAULT NULL COMMENT '新闻类型',
  `news_id` varchar(255) DEFAULT NULL COMMENT '新闻id',
  `news_channel` varchar(255) DEFAULT NULL COMMENT '新闻渠道',
  `start_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `stop_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `read_time` int(11) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL COMMENT '平台',
  `channel` varchar(255) DEFAULT NULL COMMENT '渠道',
  `read_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dt` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60050332 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_read_time_copy
-- ----------------------------
DROP TABLE IF EXISTS `news_read_time_copy`;
CREATE TABLE `news_read_time_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `read_day` varchar(255) DEFAULT NULL,
  `read_hour` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `news_type` varchar(255) DEFAULT NULL,
  `news_id` varchar(255) DEFAULT NULL,
  `news_channel` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `stop_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `read_time` int(11) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `read_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dt` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4505606 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_read_time_result
-- ----------------------------
DROP TABLE IF EXISTS `news_read_time_result`;
CREATE TABLE `news_read_time_result` (
  `user_id` int(11) DEFAULT NULL,
  `row_key` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `inv` bigint(255) DEFAULT NULL,
  `news_channel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_report_hour
-- ----------------------------
DROP TABLE IF EXISTS `news_report_hour`;
CREATE TABLE `news_report_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `news_channel` int(11) DEFAULT NULL COMMENT '新闻频道',
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_type` (`log_type`) USING BTREE,
  KEY `stat_time` (`stat_time`) USING BTREE,
  KEY `new_channel` (`news_channel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38397229 DEFAULT CHARSET=utf8 COMMENT='资讯类型的日志表';

-- ----------------------------
-- Table structure for news_topn_report_hour
-- ----------------------------
DROP TABLE IF EXISTS `news_topn_report_hour`;
CREATE TABLE `news_topn_report_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `row_key` varchar(100) NOT NULL,
  `news_channel` int(11) DEFAULT NULL COMMENT '新闻频道',
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73884343 DEFAULT CHARSET=utf8 COMMENT='资讯类型的日志表';

-- ----------------------------
-- Table structure for news_week_read
-- ----------------------------
DROP TABLE IF EXISTS `news_week_read`;
CREATE TABLE `news_week_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `stat_time` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pv` varchar(255) DEFAULT NULL,
  `uv` varchar(255) DEFAULT NULL,
  `num_three` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 COMMENT='每周汇报的新闻数据';

-- ----------------------------
-- Table structure for newstockcnt
-- ----------------------------
DROP TABLE IF EXISTS `newstockcnt`;
CREATE TABLE `newstockcnt` (
  `date` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for od_user_process
-- ----------------------------
DROP TABLE IF EXISTS `od_user_process`;
CREATE TABLE `od_user_process` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `old_process` int(255) DEFAULT NULL,
  `new_process` int(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `coversion` varchar(255) DEFAULT NULL COMMENT '转化人',
  `type` int(255) DEFAULT NULL COMMENT '0客户管理，1出入金管理'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户进度纪录表';

-- ----------------------------
-- Table structure for online_time
-- ----------------------------
DROP TABLE IF EXISTS `online_time`;
CREATE TABLE `online_time` (
  `date` varchar(255) DEFAULT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `intv` bigint(20) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  KEY `dateindex` (`date`) USING BTREE,
  KEY `idx` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for online_time2
-- ----------------------------
DROP TABLE IF EXISTS `online_time2`;
CREATE TABLE `online_time2` (
  `date` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `stocktime` bigint(20) DEFAULT NULL,
  `optionaltime` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for online_time3
-- ----------------------------
DROP TABLE IF EXISTS `online_time3`;
CREATE TABLE `online_time3` (
  `date` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `intv` bigint(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  KEY `idx` (`user_id`) USING BTREE,
  KEY `dateidx` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for online_time4
-- ----------------------------
DROP TABLE IF EXISTS `online_time4`;
CREATE TABLE `online_time4` (
  `date` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `stocktime` bigint(255) DEFAULT NULL,
  `optionaltime` bigint(255) DEFAULT NULL,
  KEY `idx` (`user_id`) USING BTREE,
  KEY `dateidx` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for opt_active
-- ----------------------------
DROP TABLE IF EXISTS `opt_active`;
CREATE TABLE `opt_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active_domain` varchar(255) DEFAULT NULL COMMENT '域名',
  `active_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `site_id` varchar(255) DEFAULT NULL COMMENT '站点id',
  `active_uuid` varchar(255) DEFAULT NULL COMMENT '活动唯一id',
  `type` int(11) DEFAULT NULL COMMENT '活动类型：1 邀请活动;2 入金/转仓活动',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for optional_stock_all_day
-- ----------------------------
DROP TABLE IF EXISTS `optional_stock_all_day`;
CREATE TABLE `optional_stock_all_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `exchange_code` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48578 DEFAULT CHARSET=utf8 COMMENT='Tag类型的日志表';

-- ----------------------------
-- Table structure for personal_stock_report_day
-- ----------------------------
DROP TABLE IF EXISTS `personal_stock_report_day`;
CREATE TABLE `personal_stock_report_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `exchange_code` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '持仓总人数',
  `stkavl` int(11) DEFAULT NULL,
  `tasset` double DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42017 DEFAULT CHARSET=utf8 COMMENT='用户持仓统计';

-- ----------------------------
-- Table structure for product_ipo
-- ----------------------------
DROP TABLE IF EXISTS `product_ipo`;
CREATE TABLE `product_ipo` (
  `ID` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` varchar(255) DEFAULT NULL COMMENT '新股股票代码及市场',
  `NAME` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `START_TIME` varchar(255) DEFAULT NULL COMMENT '开始认购时间',
  `CLOSE_TIME` varchar(255) DEFAULT NULL COMMENT '结束认购时间',
  `MARGIN_CLOSE_TIME` varchar(255) DEFAULT NULL,
  `ALLOT_DATE` varchar(255) DEFAULT NULL,
  `ALLOT_PRICE` varchar(255) DEFAULT NULL,
  `INTEREST_RATE` varchar(255) DEFAULT NULL,
  `INTEREST_DAY` varchar(255) DEFAULT NULL,
  `MAX_MARGIN_RATIO` varchar(255) DEFAULT NULL,
  `EIPO` varchar(255) DEFAULT NULL,
  `APP_POSTED` varchar(255) DEFAULT NULL,
  `RESULT_POSTED` varchar(255) DEFAULT NULL,
  `REFUND_POSTED` varchar(255) DEFAULT NULL,
  `CHECK_FUND_START_TIME` varchar(255) DEFAULT NULL,
  `HOLD_FUND_START_TIME` varchar(255) DEFAULT NULL,
  `MAX_LOAN_AMT` varchar(255) DEFAULT NULL,
  `MIN_LOAN_AMT_PER_APP` varchar(255) DEFAULT NULL,
  `HOLD_FUND_END_TIME` varchar(255) DEFAULT NULL,
  `CCY` varchar(255) DEFAULT NULL,
  `CHARGE` varchar(255) DEFAULT NULL,
  `LOAN_CHARGE` varchar(255) DEFAULT NULL,
  `INFO_URL` varchar(255) DEFAULT NULL,
  `IPO_TYPE` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `CREATE_USER` varchar(255) DEFAULT NULL,
  `CREATE_TIME` varchar(255) DEFAULT NULL,
  `ISSUED_SHARES` varchar(255) DEFAULT NULL,
  `ISSUE_PRICE_RANGE` varchar(255) DEFAULT NULL,
  `NO_SUCCESS_NO_FEE` varchar(255) DEFAULT NULL,
  `REBATE_RATIO` varchar(255) DEFAULT NULL,
  `REBATE_EFFECTIVE_DATE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史新股';

-- ----------------------------
-- Table structure for product_ipo_app
-- ----------------------------
DROP TABLE IF EXISTS `product_ipo_app`;
CREATE TABLE `product_ipo_app` (
  `ID` varchar(255) DEFAULT NULL,
  `CLIENT_ACC_ID` varchar(255) DEFAULT NULL COMMENT '资金账号',
  `QTY` varchar(255) DEFAULT NULL COMMENT '申请数量',
  `AMOUNT` varchar(255) DEFAULT NULL COMMENT '申请金额',
  `LOAN_RATIO` varchar(255) DEFAULT NULL COMMENT '融资比例',
  `LOAN_AMT` varchar(255) DEFAULT NULL COMMENT '融资金额',
  `INTEREST_RATE` varchar(255) DEFAULT NULL,
  `INTEREST` varchar(255) DEFAULT NULL,
  `CHARGE` varchar(255) DEFAULT NULL,
  `ACTUAL_QTY` varchar(255) DEFAULT NULL,
  `REFUND_AMT` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `CREATE_TIME` varchar(255) DEFAULT NULL,
  `CREATE_USER` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `INPUT_CHANNEL` varchar(255) DEFAULT NULL,
  KEY `account_id` (`CLIENT_ACC_ID`),
  KEY `ix_id_account_amount` (`ID`,`CLIENT_ACC_ID`,`AMOUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bos系统用户打新详细信息-历史数据';

-- ----------------------------
-- Table structure for recurrency
-- ----------------------------
DROP TABLE IF EXISTS `recurrency`;
CREATE TABLE `recurrency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(16) DEFAULT NULL COMMENT '用户账号',
  `funds_account` varchar(16) DEFAULT NULL COMMENT '资金账号',
  `phone_number` varchar(32) DEFAULT NULL COMMENT '手机号',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `activation_time` datetime DEFAULT NULL COMMENT '开户时间',
  `channel` varchar(128) DEFAULT NULL COMMENT '渠道',
  `channel_source` varchar(128) DEFAULT NULL COMMENT '渠道',
  `first_cashin_date` date DEFAULT NULL COMMENT '首次入金时间',
  `first_trade_date` date DEFAULT NULL COMMENT '首次交易时',
  `time_delta` int(11) DEFAULT NULL COMMENT '首次入金和首次交易的时间差',
  `trade_times` int(11) DEFAULT '0' COMMENT '交易次数',
  `ipo_times` int(11) DEFAULT '0' COMMENT 'ipo次数',
  `net_cash_in` varchar(32) DEFAULT NULL COMMENT '净入金',
  `net_product_in` varchar(32) DEFAULT NULL COMMENT '净转入股票价值',
  `net_in` varchar(32) DEFAULT NULL COMMENT '净入金包括转股',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1返现，0不返现',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `clearing_status` int(2) DEFAULT '2' COMMENT '结算标识:0老数据，1代表已结算，2代表未结算',
  PRIMARY KEY (`id`),
  KEY `funds_account` (`funds_account`) USING BTREE,
  KEY `channel` (`channel_source`,`status`,`clearing_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43189 DEFAULT CHARSET=utf8 COMMENT='首次入金返现表';

-- ----------------------------
-- Table structure for sheet
-- ----------------------------
DROP TABLE IF EXISTS `sheet`;
CREATE TABLE `sheet` (
  `funds_account` varchar(255) DEFAULT NULL,
  `tax_state` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_area
-- ----------------------------
DROP TABLE IF EXISTS `shop_area`;
CREATE TABLE `shop_area` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `areaname` varchar(50) NOT NULL COMMENT '栏目名',
  `parentid` int(10) NOT NULL COMMENT '父栏目',
  `shortname` varchar(50) DEFAULT NULL,
  `areacode` int(6) DEFAULT NULL,
  `zipcode` int(10) DEFAULT NULL,
  `pinyin` varchar(100) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `level` tinyint(1) NOT NULL,
  `position` varchar(255) NOT NULL,
  `sort` tinyint(3) unsigned DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国内经纬度表';

-- ----------------------------
-- Table structure for shop_area_global
-- ----------------------------
DROP TABLE IF EXISTS `shop_area_global`;
CREATE TABLE `shop_area_global` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `chname` varchar(255) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `political_level` int(11) DEFAULT NULL,
  `level_1` varchar(255) DEFAULT NULL,
  `level_2` varchar(255) DEFAULT NULL,
  `level_3` varchar(255) DEFAULT NULL,
  `level_4` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5623 DEFAULT CHARSET=utf8 COMMENT='全球经纬度表';

-- ----------------------------
-- Table structure for shop_area_refine
-- ----------------------------
DROP TABLE IF EXISTS `shop_area_refine`;
CREATE TABLE `shop_area_refine` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `areaname` varchar(50) NOT NULL COMMENT '栏目名',
  `parentid` int(10) NOT NULL COMMENT '父栏目',
  `shortname` varchar(50) DEFAULT NULL,
  `areacode` int(6) DEFAULT NULL,
  `zipcode` int(10) DEFAULT NULL,
  `pinyin` varchar(100) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `level` tinyint(1) NOT NULL,
  `position` varchar(255) NOT NULL,
  `sort` tinyint(3) unsigned DEFAULT '50' COMMENT '排序',
  `province_id` varchar(255) NOT NULL DEFAULT '',
  `province_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_title` varchar(255) NOT NULL,
  `sms_content` text NOT NULL,
  `sms_count` varchar(255) DEFAULT '0',
  `update_user` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `send_user` varchar(255) DEFAULT '',
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='运营系统短信模板';

-- ----------------------------
-- Table structure for stock_info_hk
-- ----------------------------
DROP TABLE IF EXISTS `stock_info_hk`;
CREATE TABLE `stock_info_hk` (
  `stock_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `exchange` varchar(10) NOT NULL COMMENT '交易市场',
  `code` varchar(10) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `synonyms` varchar(50) DEFAULT '',
  `tshares` float(15,2) DEFAULT NULL COMMENT '总股本',
  `mshares` float(15,2) DEFAULT NULL COMMENT '流通股本',
  `is_suspend` char(1) DEFAULT NULL COMMENT '停牌 0 否 1是',
  `is_st` char(1) DEFAULT NULL COMMENT '0 不是st 1 是',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '净资产',
  `type` char(20) DEFAULT NULL COMMENT '3 H股，4 大盘，51 港股， 53 红筹股，55 优先股',
  `is_delist` char(1) DEFAULT NULL COMMENT '是否退市 0否 1是 3暂停 9 其他',
  `listed_time` date DEFAULT NULL COMMENT '上市时间',
  `delist_time` date DEFAULT NULL COMMENT '退市时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `te_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`stock_id`),
  KEY `stock_identity_index` (`exchange`,`code`),
  KEY `idx_exchange_code` (`exchange`,`code`),
  KEY `idx_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=570898 DEFAULT CHARSET=utf8 COMMENT='港股股票信息';

-- ----------------------------
-- Table structure for stock_report_day
-- ----------------------------
DROP TABLE IF EXISTS `stock_report_day`;
CREATE TABLE `stock_report_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `stat_time_hour` varchar(50) DEFAULT '0',
  `exchange_code` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_click` (`stat_time`,`num`,`log_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14180403 DEFAULT CHARSET=utf8 COMMENT='Tag类型的日志表';

-- ----------------------------
-- Table structure for stock_report_day_copy
-- ----------------------------
DROP TABLE IF EXISTS `stock_report_day_copy`;
CREATE TABLE `stock_report_day_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `stat_time_hour` varchar(50) DEFAULT '0',
  `exchange_code` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83139 DEFAULT CHARSET=utf8 COMMENT='Tag类型的日志表';

-- ----------------------------
-- Table structure for stock_transfer
-- ----------------------------
DROP TABLE IF EXISTS `stock_transfer`;
CREATE TABLE `stock_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `funds_account` varchar(255) DEFAULT NULL,
  `stat_time_day` varchar(255) DEFAULT NULL,
  `market` varchar(255) DEFAULT NULL COMMENT '股票类型1股票,2基金,4债券,8期货,16期权,32涡轮,64牛熊证',
  `code` varchar(255) DEFAULT NULL COMMENT '股票代码',
  `volume` varchar(255) DEFAULT NULL COMMENT '数量',
  `avg_price` varchar(10) DEFAULT NULL COMMENT '转入价格(转出需要closing_price)',
  `purpose` varchar(255) DEFAULT NULL COMMENT '状态 1转入2转出',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种1CNY,2HKD,4USD',
  `rate` varchar(255) DEFAULT NULL COMMENT '币种汇率(对HKD的)',
  `closing_price` varchar(10) DEFAULT NULL COMMENT '收盘价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50119 DEFAULT CHARSET=utf8 COMMENT='转仓明细表(从BMS计算而来)';

-- ----------------------------
-- Table structure for tag_report_day
-- ----------------------------
DROP TABLE IF EXISTS `tag_report_day`;
CREATE TABLE `tag_report_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `stat_time_hour` varchar(50) DEFAULT '0',
  `tag_key` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124273 DEFAULT CHARSET=utf8 COMMENT='Tag类型的日志表';

-- ----------------------------
-- Table structure for tmp
-- ----------------------------
DROP TABLE IF EXISTS `tmp`;
CREATE TABLE `tmp` (
  `user_id` varchar(255) DEFAULT NULL,
  `funds_account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tmp1
-- ----------------------------
DROP TABLE IF EXISTS `tmp1`;
CREATE TABLE `tmp1` (
  `funds_account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tmp_latest_os
-- ----------------------------
DROP TABLE IF EXISTS `tmp_latest_os`;
CREATE TABLE `tmp_latest_os` (
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `os` varchar(50) DEFAULT NULL COMMENT '使用系统'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tmp_ui_pv
-- ----------------------------
DROP TABLE IF EXISTS `tmp_ui_pv`;
CREATE TABLE `tmp_ui_pv` (
  `id` int(11) NOT NULL DEFAULT '0',
  `stat_time` timestamp NULL DEFAULT NULL,
  `stat_time_hour` varchar(45) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `button` varchar(100) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `stat_time_day` date DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  KEY `idx_tmp_ui_pv03` (`stat_time`,`user_id`,`page`,`menu`,`button`,`platform`,`channel`,`os`,`manu`,`os_version`,`app_version`,`language`,`screen_w`,`screen_h`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tmp_user_active_day
-- ----------------------------
DROP TABLE IF EXISTS `tmp_user_active_day`;
CREATE TABLE `tmp_user_active_day` (
  `id` int(11) NOT NULL DEFAULT '0',
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `imei` varchar(100) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `screen_w` varchar(45) DEFAULT NULL,
  `screen_h` varchar(45) DEFAULT NULL,
  `os_version` varchar(100) DEFAULT NULL,
  `app_version` varchar(45) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `stat_time_day` date DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idx_user_active_02` (`stat_time_day`,`os`),
  KEY `idx_tmp_user_active_001` (`os`,`stat_time_day`),
  KEY `idx_tmp_user_active_002` (`os`),
  KEY `idx_tmp_user_active_003` (`stat_time_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trade_tmp
-- ----------------------------
DROP TABLE IF EXISTS `trade_tmp`;
CREATE TABLE `trade_tmp` (
  `account_id` varchar(15) NOT NULL,
  `hk_buy` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `hk_sell` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `us_buy` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `us_sell` varchar(21) CHARACTER SET utf8mb4 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trading_experience
-- ----------------------------
DROP TABLE IF EXISTS `trading_experience`;
CREATE TABLE `trading_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `sex_time` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '证券投资经验',
  `funds_time` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '基金投资经验',
  `bonds_time` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '外汇投资经验',
  `private_time` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '期货/期权/衍生品投资经验',
  `warrant_time` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '固定收益产品（债券）',
  `that_time` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '其他',
  `income` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '家庭年收入',
  `worth` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '家庭净资产',
  `knowledge` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '风险承受能力',
  `objective` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '投资目标',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `accout` (`account_id`) USING BTREE,
  KEY `incor` (`income`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='开户用户投资经验表';

-- ----------------------------
-- Table structure for uf2
-- ----------------------------
DROP TABLE IF EXISTS `uf2`;
CREATE TABLE `uf2` (
  `user_id` varchar(255) DEFAULT NULL,
  `funds_account` varchar(255) DEFAULT NULL,
  KEY `idx` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ui_pv
-- ----------------------------
DROP TABLE IF EXISTS `ui_pv`;
CREATE TABLE `ui_pv` (
  `id` int(11) NOT NULL,
  `stat_time` timestamp NULL DEFAULT NULL COMMENT '浏览时间',
  `stat_time_hour` varchar(45) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `page` varchar(100) DEFAULT NULL COMMENT '页面',
  `menu` varchar(100) DEFAULT NULL COMMENT '菜单',
  `button` varchar(100) DEFAULT NULL COMMENT '按钮',
  `pv` int(11) DEFAULT NULL COMMENT '浏览次数',
  `stat_time_day` varchar(45) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL COMMENT 'APP平台',
  `channel` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `os` varchar(50) DEFAULT NULL COMMENT '手机系统',
  `manu` varchar(50) DEFAULT NULL COMMENT '手机型号',
  `os_version` varchar(50) DEFAULT NULL COMMENT 'APP系统',
  `app_version` varchar(50) DEFAULT NULL COMMENT 'APP版本',
  `language` varchar(50) DEFAULT NULL COMMENT '语言',
  `screen_w` varchar(50) DEFAULT NULL COMMENT '手机屏幕宽',
  `screen_h` varchar(50) DEFAULT NULL COMMENT '手机屏幕高',
  PRIMARY KEY (`id`),
  KEY `idx_ui_pv` (`stat_time`,`user_id`),
  KEY `idx_ui_pv01` (`stat_time_day`),
  KEY `page` (`page`,`menu`,`button`),
  KEY `idx_ui_pv02` (`stat_time`,`stat_time_hour`,`user_id`,`stat_time_day`,`platform`,`channel`,`os`,`manu`,`os_version`,`app_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ui_pv_01
-- ----------------------------
DROP TABLE IF EXISTS `ui_pv_01`;
CREATE TABLE `ui_pv_01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NULL DEFAULT NULL COMMENT '浏览时间',
  `stat_time_hour` varchar(45) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `page` varchar(100) DEFAULT NULL COMMENT '页面',
  `menu` varchar(100) DEFAULT NULL COMMENT '菜单',
  `button` varchar(100) DEFAULT NULL COMMENT '按钮',
  `pv` int(11) DEFAULT NULL COMMENT '浏览次数',
  `stat_time_day` varchar(45) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL COMMENT 'APP平台',
  `channel` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `os` varchar(50) DEFAULT NULL COMMENT '手机系统',
  `manu` varchar(50) DEFAULT NULL COMMENT '手机型号',
  `os_version` varchar(50) DEFAULT NULL COMMENT 'APP系统',
  `app_version` varchar(50) DEFAULT NULL COMMENT 'APP版本',
  `language` varchar(50) DEFAULT NULL COMMENT '语言',
  `screen_w` varchar(50) DEFAULT NULL COMMENT '手机屏幕宽',
  `screen_h` varchar(50) DEFAULT NULL COMMENT '手机屏幕高',
  PRIMARY KEY (`id`),
  KEY `idx_ui_pv` (`stat_time`,`user_id`),
  KEY `idx_ui_pv01` (`stat_time_day`),
  KEY `page` (`page`,`menu`,`button`),
  KEY `idx_ui_pv02` (`stat_time`,`stat_time_hour`,`user_id`,`stat_time_day`,`platform`,`channel`,`os`,`manu`,`os_version`,`app_version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27320356 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ui_pv_bak01
-- ----------------------------
DROP TABLE IF EXISTS `ui_pv_bak01`;
CREATE TABLE `ui_pv_bak01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NULL DEFAULT NULL,
  `stat_time_hour` varchar(45) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `button` varchar(100) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `stat_time_day` varchar(45) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ui_pv` (`stat_time`,`user_id`),
  KEY `idx_ui_pv01` (`stat_time_day`),
  KEY `idx_ui_pv02` (`stat_time`,`stat_time_hour`,`user_id`,`page`,`menu`,`button`,`stat_time_day`,`platform`,`channel`,`os`,`manu`,`os_version`,`app_version`,`language`,`screen_w`,`screen_h`)
) ENGINE=InnoDB AUTO_INCREMENT=6106990 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ui_pv_old
-- ----------------------------
DROP TABLE IF EXISTS `ui_pv_old`;
CREATE TABLE `ui_pv_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NULL DEFAULT NULL,
  `stat_time_hour` varchar(45) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `button` varchar(100) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `stat_time_day` varchar(45) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ui_pv` (`stat_time`,`user_id`),
  KEY `idx_ui_pv01` (`stat_time_day`),
  KEY `idx_ui_pv02` (`stat_time`,`stat_time_hour`,`user_id`,`page`,`menu`,`button`,`stat_time_day`,`platform`,`channel`,`os`,`manu`,`os_version`,`app_version`,`language`,`screen_w`,`screen_h`)
) ENGINE=InnoDB AUTO_INCREMENT=3200070 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for unauthorized_boc_ipo
-- ----------------------------
DROP TABLE IF EXISTS `unauthorized_boc_ipo`;
CREATE TABLE `unauthorized_boc_ipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '股票代码',
  `name` varchar(255) DEFAULT NULL COMMENT '股票名称',
  `application_no` varchar(120) DEFAULT NULL,
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `no_of_share` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `allotted` varchar(255) DEFAULT NULL,
  `refund_amount` varchar(255) DEFAULT NULL,
  `alloted_amont` varchar(255) DEFAULT NULL,
  `loan_amont` varchar(255) DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL COMMENT '融资手续费',
  `handing_free` varchar(255) DEFAULT NULL COMMENT '认购手续费',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `funds_account` (`funds_account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1816 DEFAULT CHARSET=utf8 COMMENT='中银飞单';

-- ----------------------------
-- Table structure for unauthorized_funderstone_ipo
-- ----------------------------
DROP TABLE IF EXISTS `unauthorized_funderstone_ipo`;
CREATE TABLE `unauthorized_funderstone_ipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '股票代码',
  `name` varchar(255) DEFAULT NULL COMMENT '股票名称',
  `user_name` varchar(120) DEFAULT NULL,
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `subscription_shares` varchar(255) DEFAULT NULL,
  `subscription_amount` varchar(255) DEFAULT NULL,
  `financing` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `allotment_shares` varchar(255) DEFAULT NULL,
  `allotment_cost` varchar(255) DEFAULT NULL,
  `refund_amount` varchar(255) DEFAULT NULL,
  `brokerage_refund` varchar(255) DEFAULT NULL COMMENT 'BROKERAGE REFUND (1%)',
  `interest` varchar(255) DEFAULT NULL COMMENT '融资手续费',
  `handing_free` varchar(255) DEFAULT NULL COMMENT '认购手续费',
  `day` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL COMMENT '单位%',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `funds_account` (`funds_account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=196071 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for unauthorized_huili_ipo
-- ----------------------------
DROP TABLE IF EXISTS `unauthorized_huili_ipo`;
CREATE TABLE `unauthorized_huili_ipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(255) DEFAULT NULL COMMENT '股票代码',
  `name` varchar(255) DEFAULT NULL COMMENT '股票名称',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `handing_free` varchar(255) DEFAULT NULL COMMENT '认购手续费',
  `apply` varchar(255) DEFAULT NULL,
  `amt_payable` varchar(255) DEFAULT NULL COMMENT '申请金额',
  `interest_rate` varchar(255) DEFAULT NULL COMMENT '融资手续费汇率%',
  `margin_ratio` varchar(255) DEFAULT NULL COMMENT '融资额度%',
  `deposit_amount` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `max_price` varchar(10) DEFAULT NULL,
  `brokerage` varchar(255) DEFAULT NULL COMMENT '%',
  `transaction` varchar(255) DEFAULT NULL COMMENT '%',
  `trading_fee` varchar(255) DEFAULT NULL COMMENT '%',
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `funds_account` (`funds_account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69926 DEFAULT CHARSET=utf8 COMMENT='辉立飞单\r\n\r\n融资利息计算公式：ROUND((amt_payable*(margin_ratio/100)*(interest_rate/100)*day/365),4) ';

-- ----------------------------
-- Table structure for unauthorized_ipo
-- ----------------------------
DROP TABLE IF EXISTS `unauthorized_ipo`;
CREATE TABLE `unauthorized_ipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `funds_account` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `interest` decimal(10,4) DEFAULT NULL COMMENT '融资手续费',
  `handing_free` decimal(10,4) DEFAULT NULL COMMENT '认购手续费',
  `brokerage` decimal(10,4) DEFAULT NULL COMMENT '港交所反还手续费比列 boc/funder为0.01，辉立为0.005',
  `type` varchar(10) DEFAULT NULL COMMENT '上手飞单证券',
  PRIMARY KEY (`id`),
  KEY `accound_id` (`funds_account`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=333818 DEFAULT CHARSET=utf8 COMMENT='飞单总数据';

-- ----------------------------
-- Table structure for upgrade
-- ----------------------------
DROP TABLE IF EXISTS `upgrade`;
CREATE TABLE `upgrade` (
  `min` varchar(255) DEFAULT NULL,
  `b7` varchar(255) DEFAULT NULL,
  `a7` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `funds_account` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `account` (`funds_account`) USING BTREE,
  KEY `min` (`min`) USING BTREE,
  KEY `a7` (`a7`) USING BTREE,
  KEY `b7` (`b7`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usbill_email
-- ----------------------------
DROP TABLE IF EXISTS `usbill_email`;
CREATE TABLE `usbill_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(16) NOT NULL DEFAULT '' COMMENT '资金账号',
  `user_name` varchar(256) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `bill_date` varchar(32) NOT NULL DEFAULT '' COMMENT '结单日期',
  `status` varchar(16) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_date_ix` (`account_id`,`bill_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=809634 DEFAULT CHARSET=utf8 COMMENT='velox日结单邮件发送失败表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(20) NOT NULL,
  `login` varchar(55) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(2) DEFAULT '0',
  `type` int(255) DEFAULT '0' COMMENT '0 经分系统；1 运营系统',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='经分系统与运行系统用户管理';

-- ----------------------------
-- Table structure for user_access_count_day
-- ----------------------------
DROP TABLE IF EXISTS `user_access_count_day`;
CREATE TABLE `user_access_count_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `long_interval` int(11) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `manu` (`manu`,`os_version`,`channel`),
  KEY `idx_rep_fund_02` (`stat_time`,`stat_time_hour`),
  KEY `stat` (`stat_time_day`)
) ENGINE=InnoDB AUTO_INCREMENT=61186023 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_access_count_day_01
-- ----------------------------
DROP TABLE IF EXISTS `user_access_count_day_01`;
CREATE TABLE `user_access_count_day_01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `long_interval` int(11) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`) USING BTREE,
  KEY `manu` (`manu`,`os_version`,`channel`) USING BTREE,
  KEY `idx_rep_fund_02` (`stat_time`,`stat_time_hour`) USING BTREE,
  KEY `stat` (`stat_time_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64375777 DEFAULT CHARSET=utf8 COMMENT='每日用户的访问情况';

-- ----------------------------
-- Table structure for user_access_day
-- ----------------------------
DROP TABLE IF EXISTS `user_access_day`;
CREATE TABLE `user_access_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户每天最后一次活跃时间',
  `stat_time_hour` varchar(50) DEFAULT NULL COMMENT '活跃时间精确到小时',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `imei` varchar(255) DEFAULT NULL COMMENT '手机的imei号',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户打开APP时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户结束APP时间',
  `long_interval` int(11) DEFAULT NULL COMMENT '使用时长(秒)',
  `os` varchar(50) DEFAULT NULL COMMENT '使用系统',
  `manu` varchar(50) DEFAULT NULL COMMENT '手机型号',
  `os_version` varchar(50) DEFAULT NULL COMMENT '手机版本',
  `app_version` varchar(50) DEFAULT NULL COMMENT 'APP版本',
  `platform` varchar(50) DEFAULT NULL COMMENT 'APP平台',
  `channel` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `screen_w` varchar(50) DEFAULT NULL COMMENT '手机宽度',
  `screen_h` varchar(50) DEFAULT NULL COMMENT '手机高度',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '活跃时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `idx_rep_fund_02` (`stat_time_day`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `start` (`start_time`) USING BTREE,
  KEY `imei` (`imei`) USING BTREE,
  KEY `QUERY_INDEX1` (`stat_time`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20352282 DEFAULT CHARSET=utf8 COMMENT='每日用户的访问总时长';

-- ----------------------------
-- Table structure for user_access_day_ip
-- ----------------------------
DROP TABLE IF EXISTS `user_access_day_ip`;
CREATE TABLE `user_access_day_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户每天最后一次活跃时间',
  `stat_time_hour` varchar(50) DEFAULT NULL COMMENT '活跃时间精确到小时',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `imei` varchar(255) DEFAULT NULL COMMENT '手机的imei号',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户打开APP时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户结束APP时间',
  `long_interval` int(11) DEFAULT NULL COMMENT '使用时长(秒)',
  `os` varchar(50) DEFAULT NULL COMMENT '使用系统',
  `manu` varchar(50) DEFAULT NULL COMMENT '手机型号',
  `os_version` varchar(50) DEFAULT NULL COMMENT '手机版本',
  `app_version` varchar(50) DEFAULT NULL COMMENT 'APP版本',
  `platform` varchar(50) DEFAULT NULL COMMENT 'APP平台',
  `channel` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `screen_w` varchar(50) DEFAULT NULL COMMENT '手机宽度',
  `screen_h` varchar(50) DEFAULT NULL COMMENT '手机高度',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '活跃时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `idx_rep_fund_02` (`stat_time_day`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `start` (`start_time`) USING BTREE,
  KEY `imei` (`imei`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40165189 DEFAULT CHARSET=utf8 COMMENT='每日用户的访问总时长';

-- ----------------------------
-- Table structure for user_account_info
-- ----------------------------
DROP TABLE IF EXISTS `user_account_info`;
CREATE TABLE `user_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开户时间精确到秒',
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `phone_number` varchar(50) DEFAULT NULL COMMENT '手机号',
  `uuid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `market` varchar(50) DEFAULT NULL COMMENT '开通市场',
  `platform` varchar(50) DEFAULT NULL COMMENT 'APP平台',
  `channel` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `insert_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '账户生效时间',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '开户时间精确到天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间',
  `is_institution` int(2) DEFAULT NULL COMMENT '1代表机构用户，0代表普通用户',
  PRIMARY KEY (`id`),
  KEY `stat_time` (`stat_time`) USING BTREE,
  KEY `fund_account` (`funds_account`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `phone` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61700871 DEFAULT CHARSET=utf8 COMMENT='用户开户成功信息';

-- ----------------------------
-- Table structure for user_active_day
-- ----------------------------
DROP TABLE IF EXISTS `user_active_day`;
CREATE TABLE `user_active_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `imei` varchar(100) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `screen_w` varchar(45) DEFAULT NULL,
  `screen_h` varchar(45) DEFAULT NULL,
  `os_version` varchar(100) DEFAULT NULL,
  `app_version` varchar(45) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_active` (`stat_time_day`),
  KEY `idx_user_active_02` (`stat_time_day`,`os`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123541403 DEFAULT CHARSET=utf8 COMMENT='每日活跃用户统计';

-- ----------------------------
-- Table structure for user_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(20) NOT NULL DEFAULT '' COMMENT '用户id',
  `area` varchar(255) DEFAULT '',
  `mobile_phone_number` varchar(15) DEFAULT '' COMMENT '手机号',
  `channel_source` varchar(30) DEFAULT '' COMMENT '渠道码',
  `channel_name` varchar(50) DEFAULT '' COMMENT '渠道中文名称',
  `channel_type` varchar(20) DEFAULT '' COMMENT '渠道类型',
  `funds_account` varchar(10) DEFAULT '' COMMENT '资金账号',
  `name` varchar(10) DEFAULT '' COMMENT '用户姓名',
  `register_time` varchar(20) DEFAULT '' COMMENT '注册时间',
  `account_time` varchar(20) DEFAULT '' COMMENT '开户时间',
  `gold_time` varchar(20) DEFAULT '' COMMENT '入金时间',
  `trade_time` varchar(20) DEFAULT '' COMMENT '首次交易时间',
  `withdraw_date` varchar(20) DEFAULT '' COMMENT '最后一次出金时间',
  `net_asset` varchar(20) DEFAULT '' COMMENT '持有·资产',
  `reg_imei` varchar(255) DEFAULT '' COMMENT '注册时候IMEI(H5注册的为假的IMEI)',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `time` (`register_time`,`account_time`,`gold_time`) USING BTREE,
  KEY `funds_account` (`funds_account`) USING BTREE,
  KEY `channel` (`channel_source`,`channel_name`) USING BTREE,
  KEY `imei` (`reg_imei`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163066751 DEFAULT CHARSET=utf8 COMMENT='用户注册基础信息表';

-- ----------------------------
-- Table structure for user_cf_all
-- ----------------------------
DROP TABLE IF EXISTS `user_cf_all`;
CREATE TABLE `user_cf_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户名1',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户名2',
  `distance` float NOT NULL DEFAULT '0' COMMENT 'rowkey in hbase',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_ix` (`from_user_id`,`to_user_id`) USING BTREE,
  KEY `from_user_id_ix` (`from_user_id`) USING BTREE,
  KEY `to_user_id_ix` (`to_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1389200491 DEFAULT CHARSET=utf8 COMMENT='用户协同过滤存量表';

-- ----------------------------
-- Table structure for user_cf_all_test
-- ----------------------------
DROP TABLE IF EXISTS `user_cf_all_test`;
CREATE TABLE `user_cf_all_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户名1',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户名2',
  `distance` float NOT NULL DEFAULT '0' COMMENT '用户距离',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_ix` (`from_user_id`,`to_user_id`) USING BTREE,
  KEY `from_user_id_ix` (`from_user_id`) USING BTREE,
  KEY `to_user_id_ix` (`to_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户协同过滤存量表';

-- ----------------------------
-- Table structure for user_cf_temp1
-- ----------------------------
DROP TABLE IF EXISTS `user_cf_temp1`;
CREATE TABLE `user_cf_temp1` (
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户名1',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户名2',
  `distance` float NOT NULL DEFAULT '0' COMMENT 'rowkey in hbase',
  PRIMARY KEY (`from_user_id`,`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户协同过滤增量表';

-- ----------------------------
-- Table structure for user_daily_assets
-- ----------------------------
DROP TABLE IF EXISTS `user_daily_assets`;
CREATE TABLE `user_daily_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(20) DEFAULT NULL,
  `stat_time_day` varchar(255) DEFAULT NULL COMMENT '持有资产日期',
  `net_asset` varchar(255) DEFAULT NULL COMMENT '总资产',
  `trade_balance` varchar(255) DEFAULT NULL COMMENT '持有现金',
  `stock_val` varchar(255) DEFAULT NULL COMMENT '持有股票市值',
  `ipo_frozen` varchar(255) DEFAULT NULL COMMENT 'IPO冻结',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fund_account` (`funds_account`,`stat_time_day`) USING BTREE,
  KEY `net` (`net_asset`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32804595 DEFAULT CHARSET=utf8 COMMENT='用户每天资产(2019-07-01之后数据)';

-- ----------------------------
-- Table structure for user_first_start
-- ----------------------------
DROP TABLE IF EXISTS `user_first_start`;
CREATE TABLE `user_first_start` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `imei` varchar(100) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `screen_w` varchar(45) DEFAULT NULL,
  `screen_h` varchar(45) DEFAULT NULL,
  `os_version` varchar(100) DEFAULT NULL,
  `app_version` varchar(45) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户第一次启动统计';

-- ----------------------------
-- Table structure for user_first_start_copy
-- ----------------------------
DROP TABLE IF EXISTS `user_first_start_copy`;
CREATE TABLE `user_first_start_copy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `imei` varchar(100) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `screen_w` varchar(45) DEFAULT NULL,
  `screen_h` varchar(45) DEFAULT NULL,
  `os_version` varchar(100) DEFAULT NULL,
  `app_version` varchar(45) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41280003 DEFAULT CHARSET=utf8 COMMENT='用户第一次启动统计';

-- ----------------------------
-- Table structure for user_first_start_old
-- ----------------------------
DROP TABLE IF EXISTS `user_first_start_old`;
CREATE TABLE `user_first_start_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `imei` varchar(100) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `screen_w` varchar(45) DEFAULT NULL,
  `screen_h` varchar(45) DEFAULT NULL,
  `os_version` varchar(100) DEFAULT NULL,
  `app_version` varchar(45) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户第一次启动统计';

-- ----------------------------
-- Table structure for user_fund_account_desc
-- ----------------------------
DROP TABLE IF EXISTS `user_fund_account_desc`;
CREATE TABLE `user_fund_account_desc` (
  `user_id` varchar(50) NOT NULL,
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `channel` varchar(255) DEFAULT NULL COMMENT '渠道码',
  `user_name` varchar(255) DEFAULT NULL,
  `phone_mobile` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信号',
  `process` int(2) DEFAULT '0' COMMENT '0:空白,1:接听,2:挂断,3:待跟进',
  `conversion_name` varchar(255) DEFAULT NULL COMMENT '转化人员',
  `manager` varchar(255) DEFAULT '' COMMENT '商务人员',
  `register_time` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `account_time` varchar(255) DEFAULT NULL COMMENT '开户时间',
  `trade_time` varchar(255) DEFAULT NULL COMMENT '入金时间',
  `channel_type` varchar(255) DEFAULT NULL COMMENT '渠道类型',
  `channel_name` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `area_country_code` varchar(255) DEFAULT NULL COMMENT '区号',
  `desc` longtext COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `process_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务进度时间',
  `glod_process_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出金服务进度时间',
  `glod_process` int(2) DEFAULT '0' COMMENT '0:空白,1:接听,2:挂断,3:待跟进',
  `trade_status` int(2) DEFAULT '0' COMMENT '0:分配,1:未分配',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `fund_account` (`funds_account`,`register_time`,`user_id`,`account_time`,`trade_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营用户分配表';

-- ----------------------------
-- Table structure for user_golden_info
-- ----------------------------
DROP TABLE IF EXISTS `user_golden_info`;
CREATE TABLE `user_golden_info` (
  `user_id` varchar(20) DEFAULT '',
  `funds_account` varchar(20) NOT NULL DEFAULT '',
  `channel_register` varchar(255) DEFAULT '' COMMENT '入金用户按注册渠道',
  `stat_time_day` varchar(255) DEFAULT NULL COMMENT '入金/转仓第一次时间',
  `stat_time` varchar(255) DEFAULT NULL COMMENT '入金时间',
  `type` int(2) NOT NULL COMMENT '入金方式：0入金,1转入',
  `trade_num` int(11) DEFAULT '0' COMMENT '入金次数(BMS)',
  `withdraw_type` int(2) DEFAULT '0' COMMENT '出金方式：0出金,1转出',
  `withdraw` int(2) DEFAULT '0' COMMENT '0未出过金，1出过金，2全部出金',
  `withdraw_num` int(11) DEFAULT '0' COMMENT '出金笔数(BMS)',
  `order_status` int(2) DEFAULT '0' COMMENT '0未交易过，1交易过',
  `order_num` int(11) DEFAULT '0' COMMENT '交易次数',
  `min_trade_day` varchar(255) DEFAULT '' COMMENT '第一次交易时间',
  `first_trade_money` varchar(255) DEFAULT '0' COMMENT '第一次入金金额',
  `max_trade_day` varchar(255) DEFAULT '' COMMENT '最后一次交易时间',
  `withdraw_date` varchar(255) DEFAULT '' COMMENT '最后一次出金时间',
  `last_withdraw_money` varchar(50) DEFAULT '0' COMMENT '最后一次出金金额',
  `last_stat_time` varchar(20) DEFAULT '' COMMENT '最后一次入金时间',
  `last_trade_money` varchar(50) DEFAULT '0' COMMENT '最后一次入金金额',
  `withdraw_money` double(50,0) DEFAULT '0' COMMENT '出金金额(BMS所有出金金额)',
  `trade_money` double(50,0) DEFAULT '0' COMMENT '入金金额(BMS所有入金金额)',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`funds_account`),
  KEY `funds_account` (`funds_account`) USING BTREE,
  KEY `ix_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户入金与转仓表';

-- ----------------------------
-- Table structure for user_id
-- ----------------------------
DROP TABLE IF EXISTS `user_id`;
CREATE TABLE `user_id` (
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_increa_day
-- ----------------------------
DROP TABLE IF EXISTS `user_increa_day`;
CREATE TABLE `user_increa_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=711291 DEFAULT CHARSET=utf8 COMMENT='每日新增用户统计';

-- ----------------------------
-- Table structure for user_increa_detail_day
-- ----------------------------
DROP TABLE IF EXISTS `user_increa_detail_day`;
CREATE TABLE `user_increa_detail_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `screen_w` int(11) DEFAULT NULL,
  `screen_h` int(11) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=241394758 DEFAULT CHARSET=utf8 COMMENT='每日新增用户详情统计,包含所有新增用户的最初信息';

-- ----------------------------
-- Table structure for user_latest_detail_day
-- ----------------------------
DROP TABLE IF EXISTS `user_latest_detail_day`;
CREATE TABLE `user_latest_detail_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `screen_w` int(11) DEFAULT NULL,
  `screen_h` int(11) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_rep_fund_02` (`stat_time_day`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=558364969 DEFAULT CHARSET=utf8 COMMENT='用户最新的事实维度表';

-- ----------------------------
-- Table structure for user_md5
-- ----------------------------
DROP TABLE IF EXISTS `user_md5`;
CREATE TABLE `user_md5` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `md5_id` varchar(255) NOT NULL COMMENT '16位MD5用户id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  KEY `md5_index` (`md5_id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_model
-- ----------------------------
DROP TABLE IF EXISTS `user_model`;
CREATE TABLE `user_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `level_1` varchar(50) DEFAULT NULL,
  `level_2` varchar(50) DEFAULT NULL,
  `level_3` varchar(50) DEFAULT NULL,
  `level_4` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=408513 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_register_change
-- ----------------------------
DROP TABLE IF EXISTS `user_register_change`;
CREATE TABLE `user_register_change` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NULL DEFAULT NULL COMMENT '注册时间精确到秒',
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `imei` varchar(50) DEFAULT NULL COMMENT '手机imei',
  `user_type` varchar(11) DEFAULT NULL COMMENT '用户类型 6、-6代表游客 其他代表注册',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台',
  `original_channel` varchar(255) DEFAULT NULL COMMENT 'mapping渠道',
  `channel` varchar(50) DEFAULT NULL COMMENT '下载渠道',
  `channel_source` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `log_type` varchar(50) DEFAULT NULL COMMENT '用户类型 log代表激活 reg注册',
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stat_time` (`stat_time_day`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `user_type` (`user_type`) USING BTREE,
  KEY `channel_source` (`channel_source`) USING BTREE,
  KEY `log_type` (`log_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=634690638 DEFAULT CHARSET=utf8 COMMENT='用户注册状态变更信息';

-- ----------------------------
-- Table structure for user_subscribe_tag_all_day
-- ----------------------------
DROP TABLE IF EXISTS `user_subscribe_tag_all_day`;
CREATE TABLE `user_subscribe_tag_all_day` (
  `id` int(11) NOT NULL DEFAULT '0',
  `log_type` varchar(70) DEFAULT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `tag_key` varchar(70) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '统计数字',
  `stat_time_day` varchar(50) DEFAULT NULL COMMENT '统计天',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_trade_avg_data_history
-- ----------------------------
DROP TABLE IF EXISTS `user_trade_avg_data_history`;
CREATE TABLE `user_trade_avg_data_history` (
  `funds_account` varchar(11),
  `stat_time_day` varchar(255) DEFAULT NULL,
  `withdraw` varchar(255) DEFAULT NULL,
  `withdraw_date` varchar(255) DEFAULT NULL,
  `ipo_subscription` int(11) DEFAULT NULL COMMENT '新股申购笔数',
  `ipo_cash` int(11) DEFAULT NULL COMMENT '现金认购笔数',
  `ipo_financing` int(11) DEFAULT NULL COMMENT '融资认购笔数',
  `ipo_rate` int(11) DEFAULT NULL COMMENT '新股中签笔数',
  `stock_num` int(11) DEFAULT NULL COMMENT '交易港股股票',
  `us_stock_num` int(10) DEFAULT NULL COMMENT '交易美股股票',
  `drak_num` int(11) DEFAULT NULL COMMENT '暗盘交易',
  `hk_stock_cp_num` int(11) DEFAULT NULL COMMENT '港股牛熊证笔数',
  `net_asset` int(255) DEFAULT NULL COMMENT '当前资产',
  `money` varchar(255) DEFAULT NULL COMMENT '持有现金',
  `create_time` timestamp NULL DEFAULT NULL,
  `min_trade_day` varchar(10) DEFAULT NULL,
  `days` decimal(12,0) DEFAULT NULL,
  `weeks` decimal(13,0) DEFAULT NULL,
  `avg_stock_num` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '交易频率',
  `avg_hk_stock_num` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '港股交易频率',
  `avg_us_stock_num` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '美股交易频率',
  `avg_hk_stock_cp_num` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '港股牛熊证交易频率',
  `avg_drak_num` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '港股暗盘交易频率',
  `avg_hk_underlying_stock_num` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '港股正股交易频率',
  KEY `REAL_INDEX` (`funds_account`,`stock_num`,`us_stock_num`,`drak_num`,`hk_stock_cp_num`,`create_time`) USING BTREE COMMENT '计算实时交易频率需要',
  KEY `SEARCH_INDEX` (`funds_account`,`create_time`,`avg_stock_num`,`avg_hk_stock_num`,`avg_us_stock_num`,`avg_hk_stock_cp_num`,`avg_drak_num`,`avg_hk_underlying_stock_num`) USING BTREE COMMENT '查询历史交易频率需要',
  KEY `QUERY_INDEX` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户交易频率历史表\r\n统计时：0：代表没有交易;\r\n            (0,1/5]:低频;\r\n            (1/5,1]:中频;\r\n            (1, ∞):高频';

-- ----------------------------
-- Table structure for user_trade_data
-- ----------------------------
DROP TABLE IF EXISTS `user_trade_data`;
CREATE TABLE `user_trade_data` (
  `funds_account` varchar(11) NOT NULL,
  `stat_time_day` varchar(255) DEFAULT NULL COMMENT '首次入金时间',
  `withdraw` varchar(255) DEFAULT NULL COMMENT '是否全部出金',
  `withdraw_date` varchar(255) DEFAULT NULL COMMENT '最后出金时间',
  `ipo_subscription` int(11) DEFAULT '0' COMMENT '新股申购笔数',
  `ipo_cash` int(11) DEFAULT '0' COMMENT '现金认购笔数',
  `ipo_financing` int(11) DEFAULT '0' COMMENT '融资认购笔数',
  `ipo_rate` int(11) DEFAULT '0' COMMENT '新股中签笔数',
  `stock_num` int(11) DEFAULT '0' COMMENT '交易港股股票',
  `us_stock_num` int(10) DEFAULT '0' COMMENT '交易美股股票',
  `drak_num` int(11) DEFAULT '0' COMMENT '暗盘交易',
  `hk_stock_cp_num` int(11) DEFAULT '0' COMMENT '港股牛熊证笔数',
  `options_num` int(11) DEFAULT '0' COMMENT '交易美股期权笔数',
  `net_asset` int(255) DEFAULT '0' COMMENT '当前资产',
  `money` varchar(255) DEFAULT NULL COMMENT '持有现金',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`funds_account`),
  KEY `funds` (`funds_account`) USING BTREE,
  KEY `ipo` (`ipo_subscription`,`ipo_rate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户交易分析数据';

-- ----------------------------
-- Table structure for user_trade_transfer_info
-- ----------------------------
DROP TABLE IF EXISTS `user_trade_transfer_info`;
CREATE TABLE `user_trade_transfer_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL COMMENT '股票账户',
  `adapter` varchar(50) DEFAULT NULL COMMENT '柜台',
  `asset` double(15,2) DEFAULT NULL COMMENT '金额 正的为转入 负的为转出',
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL COMMENT '银证转账时间',
  `currency` varchar(11) DEFAULT NULL COMMENT '币种',
  `ex` double NOT NULL COMMENT '汇率',
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=717804644 DEFAULT CHARSET=utf8 COMMENT='港股用户入金记录';

-- ----------------------------
-- Table structure for user_trade_week_data
-- ----------------------------
DROP TABLE IF EXISTS `user_trade_week_data`;
CREATE TABLE `user_trade_week_data` (
  `funds_account` varchar(11),
  `avg_collect` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '本周平均交易频率',
  `avg_stock_num` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '本周港股平均交易频率',
  `avg_us_stock_num` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '本周美股平均交易频率',
  `avg_drak_num` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '本周暗盘平均交易频率',
  `avg_hk_stock_cp_num` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '本周港股牛熊证平均交易频率',
  `avg_underlying_stock_num` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '本周港股正股平均交易频率',
  `create_time` varchar(10) DEFAULT NULL COMMENT '日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='该表用于记录上周五至本周五用户各标的的平均交易频率，根据user_trade_avg_data_history计算得出';

-- ----------------------------
-- Table structure for user_visit_day
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_day`;
CREATE TABLE `user_visit_day` (
  `id` int(11) NOT NULL,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `long_interval` int(11) DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `manu` (`manu`,`os_version`),
  KEY `idx_rep_fund_02` (`stat_time_day`,`end_time`),
  KEY `user` (`user_id`,`page_count`),
  KEY `start_time` (`start_time`,`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_visit_day_01
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_day_01`;
CREATE TABLE `user_visit_day_01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_time_hour` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `long_interval` int(11) DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `manu` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `screen_w` varchar(50) DEFAULT NULL,
  `screen_h` varchar(50) DEFAULT NULL,
  `stat_time_day` varchar(50) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `manu` (`manu`,`os_version`) USING BTREE,
  KEY `idx_rep_fund_02` (`stat_time_day`,`end_time`) USING BTREE,
  KEY `user` (`user_id`,`page_count`) USING BTREE,
  KEY `start_time` (`start_time`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=28075872 DEFAULT CHARSET=utf8 COMMENT='每日用户的访问情况';

-- ----------------------------
-- Table structure for user_withdraw_data
-- ----------------------------
DROP TABLE IF EXISTS `user_withdraw_data`;
CREATE TABLE `user_withdraw_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `funds_account` varchar(255) DEFAULT '',
  `process_date` varchar(255) DEFAULT NULL COMMENT '交易日日期',
  `stat_time_day` varchar(255) DEFAULT '' COMMENT '入金日期',
  `net_assets` decimal(20,4) DEFAULT '0.0000' COMMENT '入金金额',
  `prev_trade_day` varchar(255) DEFAULT '' COMMENT '上一交易日资金日期',
  `prev_trade_assets` decimal(20,4) DEFAULT '0.0000' COMMENT '上一交易日资金金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17984 DEFAULT CHARSET=utf8 COMMENT='用户召回数据表(全部出金用户第二天重新入金)';

-- ----------------------------
-- Table structure for v_hk_share_ipo
-- ----------------------------
DROP TABLE IF EXISTS `v_hk_share_ipo`;
CREATE TABLE `v_hk_share_ipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(11) DEFAULT NULL,
  `name` varchar(11) DEFAULT NULL,
  `proposedlistdate` varchar(20) DEFAULT NULL COMMENT '上市日',
  `datetoaccount` varchar(20) DEFAULT NULL COMMENT '暗盘日',
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `date` (`proposedlistdate`,`datetoaccount`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=938 DEFAULT CHARSET=utf8 COMMENT='18年起新股列表';

-- ----------------------------
-- Table structure for withdraw_account
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_account`;
CREATE TABLE `withdraw_account` (
  `account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for withdraw_history
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_history`;
CREATE TABLE `withdraw_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `funds_account` varchar(255) DEFAULT '',
  `withdraw_date` varchar(255) DEFAULT '',
  `withdraw_money` varchar(255) DEFAULT '' COMMENT '出金金额',
  `net_asset` varchar(255) DEFAULT '' COMMENT '出金剩余资产',
  PRIMARY KEY (`id`),
  KEY `funds` (`funds_account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51914 DEFAULT CHARSET=utf8 COMMENT='全部出金用户详情(19年07月01日开始计算)';

-- ----------------------------
-- Table structure for work_order
-- ----------------------------
DROP TABLE IF EXISTS `work_order`;
CREATE TABLE `work_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT '' COMMENT '用户姓名',
  `mobile_number` varchar(11) DEFAULT NULL COMMENT '用户手机号',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `question_type` varchar(255) DEFAULT '' COMMENT '问题类型',
  `question_source` varchar(255) DEFAULT '' COMMENT '问题来源',
  `user_desc` longtext COMMENT '用户反馈问题备注',
  `service_desc` longtext COMMENT '客服处理备注',
  `status` int(2) DEFAULT '0' COMMENT '0未解决，1已解决',
  `conversion_name` varchar(255) DEFAULT '' COMMENT '处理人',
  `update_conversion_name` varchar(255) DEFAULT '' COMMENT '最后操作的处理人',
  `file_path` longtext COMMENT '附件地址，图片名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈日期',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28611 DEFAULT CHARSET=utf8 COMMENT='客服工单表';

-- ----------------------------
-- Table structure for zinvestip
-- ----------------------------
DROP TABLE IF EXISTS `zinvestip`;
CREATE TABLE `zinvestip` (
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- View structure for account_view
-- ----------------------------
DROP VIEW IF EXISTS `account_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `account_view` AS select `user_account_info`.`user_id` AS `account_user_id`,`user_account_info`.`name` AS `name`,`user_account_info`.`stat_time` AS `account_time`,`user_account_info`.`funds_account` AS `funds_account` from `user_account_info` group by `user_account_info`.`user_id`,`user_account_info`.`funds_account`;

-- ----------------------------
-- View structure for active_account
-- ----------------------------
DROP VIEW IF EXISTS `active_account`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_account` AS select `user_account_info`.`user_id` AS `user_id`,`user_account_info`.`funds_account` AS `funds_account`,`user_account_info`.`phone_number` AS `phone_number`,`user_account_info`.`stat_time` AS `stat_time` from `user_account_info`;

-- ----------------------------
-- View structure for active_channel
-- ----------------------------
DROP VIEW IF EXISTS `active_channel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_channel` AS select `channel_ananlysis_name`.`channel` AS `channel`,`channel_ananlysis_name`.`channel_name` AS `channel_name` from `channel_ananlysis_name`;

-- ----------------------------
-- View structure for active_data
-- ----------------------------
DROP VIEW IF EXISTS `active_data`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_data` AS select `miningstock`.`opt_invite_account`.`user_id` AS `uid`,`miningstock`.`opt_invite_account`.`invite_mobile` AS `uphone`,`miningstock`.`opt_invite_account`.`invite_date` AS `invite_date`,`miningstock`.`opt_invite_account`.`channel_code` AS `channel_code`,`miningstock`.`opt_invite_account`.`activity_name` AS `activity_name`,`miningstock`.`opt_invite_account`.`activity_id` AS `activity_id` from `miningstock`.`opt_invite_account` where isnull(`miningstock`.`opt_invite_account`.`invited_user_id`);

-- ----------------------------
-- View structure for active_final
-- ----------------------------
DROP VIEW IF EXISTS `active_final`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_final` AS select `active_data`.`uid` AS `uid`,`active_data`.`uphone` AS `uphone`,`active_data`.`invite_date` AS `invite_date`,`active_data`.`activity_id` AS `activity_id`,`active_data`.`activity_name` AS `activity_name`,`active_data`.`channel_code` AS `channel_code`,`active_info`.`activity_type` AS `activity_type`,`active_info`.`activity_sdate` AS `activity_sdate`,`active_info`.`activity_edate` AS `activity_edate`,`register_all_info`.`funds_account` AS `funds_account`,`register_all_info`.`register_time` AS `register_time`,`register_all_info`.`account_time` AS `account_time`,`register_all_info`.`trade_time` AS `trade_time`,`active_pvuv_view`.`active_time` AS `active_time`,`active_pvuv_view`.`active_pv` AS `active_pv`,`active_pvuv_view`.`active_uv` AS `active_uv` from (((`report`.`active_data` left join `report`.`active_info` on((`active_info`.`uuid` = `active_data`.`activity_id`))) left join `report`.`register_all_info` on((`active_data`.`uid` = `register_all_info`.`user_id`))) left join `report`.`active_pvuv_view` on((`active_info`.`uuid` = convert(`active_pvuv_view`.`active_uuid` using utf8mb4))));

-- ----------------------------
-- View structure for active_info
-- ----------------------------
DROP VIEW IF EXISTS `active_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_info` AS select `miningstock`.`opt_activity`.`activity_name` AS `activity_name`,`miningstock`.`opt_activity`.`uuid` AS `uuid`,date_format(`miningstock`.`opt_activity`.`activity_sdate`,'%Y-%m-%d') AS `activity_sdate`,date_format(`miningstock`.`opt_activity`.`activity_edate`,'%Y-%m-%d') AS `activity_edate`,`miningstock`.`opt_activity`.`activity_type` AS `activity_type` from `miningstock`.`opt_activity` where ((`miningstock`.`opt_activity`.`trader` = 'mining_p') and (`miningstock`.`opt_activity`.`activity_sdate` >= '20180416190300') and (`miningstock`.`opt_activity`.`uuid` <> '8af90b6d-53b7-49e2-8af2-f2e960466b18') and (`miningstock`.`opt_activity`.`activity_type` is not null)) order by date_format(`miningstock`.`opt_activity`.`activity_sdate`,'%Y-%m-%d') desc;

-- ----------------------------
-- View structure for active_pvuv_view
-- ----------------------------
DROP VIEW IF EXISTS `active_pvuv_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_pvuv_view` AS select `active_pvuv`.`active_uuid` AS `active_uuid`,`active_pvuv`.`active_time` AS `active_time`,`active_pvuv`.`active_pv` AS `active_pv`,`active_pvuv`.`active_uv` AS `active_uv` from `active_pvuv`;

-- ----------------------------
-- View structure for active_register
-- ----------------------------
DROP VIEW IF EXISTS `active_register`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_register` AS select distinct `miningstock`.`user`.`user_id` AS `user_id`,`miningstock`.`user`.`nickname` AS `nickname`,`miningstock`.`user`.`mobile_phone_number` AS `mobile_phone_number`,`miningstock`.`user`.`register_time` AS `register_time` from `miningstock`.`user`;

-- ----------------------------
-- View structure for active_reward
-- ----------------------------
DROP VIEW IF EXISTS `active_reward`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_reward` AS select `miningstock`.`opt_invite_reward`.`user_id` AS `user_id`,`miningstock`.`opt_invite_reward`.`reward_uuid` AS `reward_uuid`,`miningstock`.`opt_invite_reward`.`reward_type` AS `reward_type`,`miningstock`.`opt_invite_reward`.`reward_amount` AS `reward_amount`,`miningstock`.`opt_invite_reward`.`activity_id` AS `activity_id`,`miningstock`.`opt_invite_reward`.`win_status` AS `win_status`,`miningstock`.`opt_invite_reward`.`win_reward_date` AS `win_reward_date` from `miningstock`.`opt_invite_reward`;

-- ----------------------------
-- View structure for active_trade
-- ----------------------------
DROP VIEW IF EXISTS `active_trade`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_trade` AS select `miningtrade`.`trade_user_transfer`.`account` AS `account`,`miningtrade`.`trade_user_transfer`.`asset` AS `asset`,`miningtrade`.`trade_user_transfer`.`currency` AS `currency`,`miningtrade`.`trade_user_transfer`.`info_date` AS `info_date`,`miningtrade`.`trade_user_transfer`.`info_time` AS `info_time`,`miningtrade`.`trade_user_transfer`.`ex` AS `ex` from `miningtrade`.`trade_user_transfer` where (`miningtrade`.`trade_user_transfer`.`adapter` = 'Ayers1');

-- ----------------------------
-- View structure for channel_all_info
-- ----------------------------
DROP VIEW IF EXISTS `channel_all_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `channel_all_info` AS select `a`.`channel` AS `ch_channel`,`a`.`channel_name` AS `channel_name`,`a`.`channel_type` AS `channel_type`,`a`.`is_deleted` AS `is_deleted`,`b`.`channel_id` AS `channel_id`,`b`.`full_name` AS `full_name`,`b`.`short_name` AS `short_name`,`b`.`ch_code` AS `ch_code`,`b`.`contact` AS `contact`,`b`.`phone_number` AS `phone_number`,`b`.`id_number` AS `id_number`,`b`.`payment_mode` AS `payment_mode`,`b`.`recv_bank` AS `recv_bank`,`b`.`recv_account_code` AS `recv_account_code`,`b`.`recv_account_name` AS `recv_account_name`,`b`.`reward_detail` AS `reward_detail`,`b`.`reward_plan` AS `reward_plan`,`b`.`manager` AS `manager`,`b`.`create_user` AS `create_user`,`b`.`create_time` AS `create_time`,`b`.`qr_code` AS `qr_code`,`b`.`qr_link` AS `qr_link`,`b`.`conversion_name` AS `conversion_name`,`b`.`parent_id` AS `parent_id`,`b`.`distribution` AS `distribution`,`b`.`conversion` AS `conversion`,`b`.`update_time` AS `update_time`,`b`.`channel_distribution` AS `channel_distribution`,`b`.`reward_way` AS `reward_way` from (`channel_ananlysis_name` `a` left join `channel_info` `b` on((convert(`a`.`channel` using utf8mb4) = `b`.`ch_code`)));

-- ----------------------------
-- View structure for imei_activation
-- ----------------------------
DROP VIEW IF EXISTS `imei_activation`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `imei_activation` AS select `user_access_day`.`imei` AS `imei`,min(`user_access_day`.`start_time`) AS `imei_time`,`user_access_day`.`user_id` AS `user_id` from `user_access_day` where (`user_access_day`.`manu` <> 'Simulator') group by `user_access_day`.`imei`;

-- ----------------------------
-- View structure for miningaccount_user_view
-- ----------------------------
DROP VIEW IF EXISTS `miningaccount_user_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `miningaccount_user_view` AS select `miningstock`.`user`.`mobile_phone_number` AS `phone_number`,`miningstock`.`user`.`user_id` AS `uid` from `miningstock`.`user` where ((`miningstock`.`user`.`user_type` <> 6) and (`miningstock`.`user`.`user_type` <> -(6)));

-- ----------------------------
-- View structure for mining_account_detail
-- ----------------------------
DROP VIEW IF EXISTS `mining_account_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `mining_account_detail` AS select `miningaccount`.`account_info`.`account_id` AS `account_id`,`miningaccount`.`account_info`.`phone_number` AS `phone_number`,`miningaccount`.`account_info`.`funds_account` AS `funds_account`,`miningaccount`.`id_info`.`name` AS `name`,`miningaccount`.`id_info`.`tax_number` AS `tax_number`,`miningaccount`.`id_info`.`national` AS `national`,`miningaccount`.`id_info`.`addr` AS `addr`,`miningaccount`.`id_info`.`birth` AS `birth`,`miningaccount`.`id_info`.`email` AS `email`,`miningaccount`.`id_info`.`company_name` AS `company_name`,`miningaccount`.`id_info`.`job` AS `job`,`miningaccount`.`id_info`.`bank_name` AS `bank_name` from (`miningaccount`.`account_info` left join `miningaccount`.`id_info` on((`miningaccount`.`id_info`.`account_id` = `miningaccount`.`account_info`.`account_id`))) where (`miningaccount`.`account_info`.`funds_account_valid` = 2);

-- ----------------------------
-- View structure for register_all_info
-- ----------------------------
DROP VIEW IF EXISTS `register_all_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `register_all_info` AS select `a`.`user_id` AS `user_id`,`a`.`channel_source` AS `channel_source`,ifnull(`b`.`channel_name`,convert(`a`.`channel_source` using utf8mb4)) AS `channel_name`,`c`.`phone_number` AS `phone_number`,`e`.`name` AS `name`,`a`.`register_time` AS `register_time`,`e`.`funds_account` AS `funds_account`,`e`.`account_time` AS `account_time`,`f`.`trade_time` AS `trade_time` from ((((((select `report`.`user_register_change`.`user_id` AS `user_id`,`report`.`user_register_change`.`channel_source` AS `channel_source`,min(`report`.`user_register_change`.`stat_time`) AS `register_time` from `report`.`user_register_change` where ((`report`.`user_register_change`.`log_type` = 'reg') and (`report`.`user_register_change`.`user_type` <> -(6)) and (`report`.`user_register_change`.`user_type` <> 6)) group by `report`.`user_register_change`.`user_id`)) `a` left join (select `report`.`channel_ananlysis_name`.`channel` AS `channel`,`report`.`channel_ananlysis_name`.`channel_name` AS `channel_name` from `report`.`channel_ananlysis_name`) `b` on((convert(`a`.`channel_source` using utf8mb4) = `b`.`channel`))) left join (select `miningstock`.`user`.`user_id` AS `user_ids`,`miningstock`.`user`.`mobile_phone_number` AS `phone_number` from `miningstock`.`user` group by `miningstock`.`user`.`user_id`) `c` on((`a`.`user_id` = `c`.`user_ids`))) left join (select min(`report`.`user_account_info`.`user_id`) AS `user_ide`,`report`.`user_account_info`.`funds_account` AS `funds_account`,`report`.`user_account_info`.`name` AS `name`,`report`.`user_account_info`.`stat_time` AS `account_time` from `report`.`user_account_info` group by `report`.`user_account_info`.`funds_account`) `e` on((`a`.`user_id` = `e`.`user_ide`))) left join (select `report`.`user_golden_info`.`funds_account` AS `funds_accounts`,`report`.`user_golden_info`.`stat_time` AS `trade_time` from `report`.`user_golden_info`) `f` on((`e`.`funds_account` = `f`.`funds_accounts`)));

-- ----------------------------
-- View structure for register_position
-- ----------------------------
DROP VIEW IF EXISTS `register_position`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `register_position` AS select distinct `b`.`user_id` AS `user_id`,`b`.`phone_number` AS `phone_number`,`b`.`register_time` AS `register_time`,`a`.`country` AS `country`,`a`.`region` AS `province`,`a`.`city` AS `city` from (`report`.`access_location` `a` join `report`.`register_all_info` `b` on((`a`.`user_id` = `b`.`user_id`)));

-- ----------------------------
-- View structure for register_view
-- ----------------------------
DROP VIEW IF EXISTS `register_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `register_view` AS select `a`.`user_id` AS `user_id`,max(`a`.`stat_time`) AS `register_time`,`a`.`channel_source` AS `channel_source`,ifnull(`b`.`channel_name`,convert(`a`.`channel_source` using utf8mb4)) AS `channel_name` from (`user_register_change` `a` left join `channel_ananlysis_name` `b` on((convert(`a`.`channel_source` using utf8mb4) = `b`.`channel`))) where ((`a`.`user_type` <> 6) and (`a`.`user_type` <> -(6)) and (`a`.`log_type` = 'reg') and (`a`.`user_id` is not null)) group by `a`.`user_id`;

-- ----------------------------
-- View structure for trade_user_money
-- ----------------------------
DROP VIEW IF EXISTS `trade_user_money`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `trade_user_money` AS select `a`.`account_id` AS `funds_account`,`a`.`process_date` AS `process_date`,round(sum((`a`.`asset` * `d`.`exchange_rate`)),2) AS `net_asset`,round(sum((`a`.`trade_balance` * `d`.`exchange_rate`)),2) AS `trade_balance`,round(sum((`a`.`market_value` * `d`.`exchange_rate`)),2) AS `stock_val`,round(sum((`a`.`ipo_frozen_before_close` * `d`.`exchange_rate`)),2) AS `ipo_frozen` from (((select `jcbms`.`account_balance`.`account_id` AS `account_id`,`jcbms`.`account_balance`.`process_date` AS `process_date`,((`jcbms`.`account_balance`.`market_value` + `jcbms`.`account_balance`.`trade_balance`) + `jcbms`.`account_balance`.`ipo_frozen_before_close`) AS `asset`,`jcbms`.`account_balance`.`trade_balance` AS `trade_balance`,`jcbms`.`account_balance`.`market_value` AS `market_value`,`jcbms`.`account_balance`.`currency` AS `currency`,`jcbms`.`account_balance`.`ipo_frozen_before_close` AS `ipo_frozen_before_close` from `jcbms`.`account_balance` where (`jcbms`.`account_balance`.`process_date` = (select max(`jcbms`.`currency_history`.`process_date`) from `jcbms`.`currency_history`)))) `a` left join (select left(`jcbms`.`currency_history`.`process_date`,10) AS `process_date`,`jcbms`.`currency_history`.`currency` AS `currency`,`jcbms`.`currency_history`.`exchange_rate` AS `exchange_rate` from `jcbms`.`currency_history` where (`jcbms`.`currency_history`.`process_date` = (select max(`jcbms`.`currency_history`.`process_date`) from `jcbms`.`currency_history`))) `d` on(((`a`.`process_date` = `d`.`process_date`) and (`a`.`currency` = `d`.`currency`)))) group by `a`.`account_id`;

-- ----------------------------
-- View structure for user_real_account_info
-- ----------------------------
DROP VIEW IF EXISTS `user_real_account_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_real_account_info` AS select `a`.`funds_account` AS `funds_account`,`c`.`account_id` AS `account_id`,`c`.`channel_code` AS `channel`,`c`.`stat_time_day` AS `stat_time_day` from ((((select `report`.`user_account_info`.`funds_account` AS `funds_account` from `report`.`user_account_info` where (`report`.`user_account_info`.`funds_account` is not null))) `a` left join (select `miningaccount`.`account_info`.`funds_account` AS `funds_account`,`miningaccount`.`account_info`.`account_id` AS `account_id` from `miningaccount`.`account_info` where (`miningaccount`.`account_info`.`funds_account_valid` = 2)) `b` on((convert(`a`.`funds_account` using utf8mb4) = `b`.`funds_account`))) left join (select `miningaccount`.`open_account_apply`.`account_id` AS `account_id`,`miningaccount`.`open_account_apply`.`channel_code` AS `channel_code`,max(`miningaccount`.`open_account_apply`.`insert_date`) AS `stat_time_day` from `miningaccount`.`open_account_apply` where (`miningaccount`.`open_account_apply`.`sub_step_id` = 2) group by `miningaccount`.`open_account_apply`.`account_id`) `c` on((`b`.`account_id` = `c`.`account_id`)));

-- ----------------------------
-- View structure for user_trade_avg_data
-- ----------------------------
DROP VIEW IF EXISTS `user_trade_avg_data`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_trade_avg_data` AS select `b`.`funds_account` AS `funds_account`,`b`.`stat_time_day` AS `stat_time_day`,`b`.`withdraw` AS `withdraw`,`b`.`withdraw_date` AS `withdraw_date`,`b`.`ipo_subscription` AS `ipo_subscription`,`b`.`ipo_cash` AS `ipo_cash`,`b`.`ipo_financing` AS `ipo_financing`,`b`.`ipo_rate` AS `ipo_rate`,`b`.`stock_num` AS `stock_num`,`b`.`us_stock_num` AS `us_stock_num`,`b`.`drak_num` AS `drak_num`,`b`.`hk_stock_cp_num` AS `hk_stock_cp_num`,`b`.`net_asset` AS `net_asset`,`b`.`money` AS `money`,`b`.`create_time` AS `create_time`,`a`.`min_trade_day` AS `min_trade_day`,`a`.`days` AS `days`,round((`a`.`days` / 7),0) AS `weeks`,ifnull(((`b`.`stock_num` + `b`.`us_stock_num`) / (`a`.`days` - (round((`a`.`days` / 7),0) * 2))),0) AS `avg_stock_num`,ifnull((`b`.`stock_num` / (`a`.`days` - (round((`a`.`days` / 7),0) * 2))),0) AS `avg_hk_stock_num`,ifnull((`b`.`us_stock_num` / (`a`.`days` - (round((`a`.`days` / 7),0) * 2))),0) AS `avg_us_stock_num`,ifnull((`b`.`hk_stock_cp_num` / (`a`.`days` - (round((`a`.`days` / 7),0) * 2))),0) AS `avg_hk_stock_cp_num`,ifnull((`b`.`drak_num` / (`a`.`days` - (round((`a`.`days` / 7),0) * 2))),0) AS `avg_drak_num`,ifnull((((`b`.`stock_num` - `b`.`drak_num`) - `b`.`hk_stock_cp_num`) / (`a`.`days` - (round((`a`.`days` / 7),0) * 2))),0) AS `avg_hk_underlying_stock_num` from (((select `report`.`user_golden_info`.`funds_account` AS `funds_account`,date_format(`report`.`user_golden_info`.`min_trade_day`,'%Y-%m-%d') AS `min_trade_day`,round((((unix_timestamp(now()) - unix_timestamp(`report`.`user_golden_info`.`min_trade_day`)) / 24) / 3600),0) AS `days` from `report`.`user_golden_info` where ((`report`.`user_golden_info`.`min_trade_day` <> '') and (`report`.`user_golden_info`.`funds_account` not in (88881188,61805102,60817828,63886388,25886158,69834018,69837578,62075158,71188888,90788888,55528888,27388888,32136888,60788888,62988888,72788888,76188888,64412238,55788888,66091588,66091628,72788881,19588888,29088888,93860180,78288888,47888888,54788888,54628688,98488888,63039030,83624888,29688888,29688881,90788881,80388888,43188888,67012828,20171101,33333333,61800000,88888881,88888888))))) `a` left join (select `report`.`user_trade_data`.`funds_account` AS `funds_account`,`report`.`user_trade_data`.`stat_time_day` AS `stat_time_day`,`report`.`user_trade_data`.`withdraw` AS `withdraw`,`report`.`user_trade_data`.`withdraw_date` AS `withdraw_date`,`report`.`user_trade_data`.`ipo_subscription` AS `ipo_subscription`,`report`.`user_trade_data`.`ipo_cash` AS `ipo_cash`,`report`.`user_trade_data`.`ipo_financing` AS `ipo_financing`,`report`.`user_trade_data`.`ipo_rate` AS `ipo_rate`,`report`.`user_trade_data`.`stock_num` AS `stock_num`,`report`.`user_trade_data`.`us_stock_num` AS `us_stock_num`,`report`.`user_trade_data`.`drak_num` AS `drak_num`,`report`.`user_trade_data`.`hk_stock_cp_num` AS `hk_stock_cp_num`,`report`.`user_trade_data`.`net_asset` AS `net_asset`,`report`.`user_trade_data`.`money` AS `money`,`report`.`user_trade_data`.`create_time` AS `create_time` from `report`.`user_trade_data`) `b` on((`a`.`funds_account` = `b`.`funds_account`))) order by ifnull(((`b`.`stock_num` + `b`.`us_stock_num`) / (`a`.`days` - (round((`a`.`days` / 7),0) * 2))),0);

-- ----------------------------
-- View structure for withdraw_serving_charge
-- ----------------------------
DROP VIEW IF EXISTS `withdraw_serving_charge`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `withdraw_serving_charge` AS select count(`miningaccount`.`transfer_money_apply`.`id`) AS `cnt`,date_format(`miningaccount`.`transfer_money_apply`.`audit_time`,'%Y-%m-%d') AS `times` from `miningaccount`.`transfer_money_apply` where ((`miningaccount`.`transfer_money_apply`.`transfer_method_id` = 6) and (`miningaccount`.`transfer_money_apply`.`audit_time` >= '2019-02-01') and (`miningaccount`.`transfer_money_apply`.`status` = '3001') and ((`miningaccount`.`transfer_money_apply`.`deposit_step` < 1) or isnull(`miningaccount`.`transfer_money_apply`.`deposit_step`))) group by `times`;

-- ----------------------------
-- Procedure structure for procedure_login_user_type_report_day
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_login_user_type_report_day`;
delimiter ;;
CREATE PROCEDURE `procedure_login_user_type_report_day`()
BEGIN
    declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
    start transaction;

create temporary table t_login_user_type as 
SELECT
    clu.stat_time,clu.stat_time_hour,clu.user_id,clu.source,case when (lu.trade_if='1' OR clu.trade_if='1') then '1' else '0' end as trade_if,clu.stat_time_day
FROM
    c_login_user_type_day clu
        LEFT JOIN
    (SELECT 
        stat_time, stat_time_hour,user_id,source,trade_if, stat_time_day
    FROM
		login_user_type_day
    WHERE
        stat_time_day > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY stat_time, stat_time_hour,user_id,source,trade_if,stat_time_day) lu ON clu.stat_time = lu.stat_time
        AND clu.user_id = lu.user_id;
 
DELETE lu FROM login_user_type_day lu
        INNER JOIN
    t_login_user_type tlu ON tlu.stat_time = lu.stat_time AND tlu.user_id = lu.user_id;
 
 insert into login_user_type_day(stat_time,stat_time_hour,user_id,source,trade_if,stat_time_day) select stat_time,stat_time_hour,user_id,source,trade_if,stat_time_day from t_login_user_type where stat_time_day is not null;
 
         if err = 1 then
			rollback;
		else
			commit;
		end if;
        
        drop temporary table t_login_user_type;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_stock_report_day
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_stock_report_day`;
delimiter ;;
CREATE PROCEDURE `procedure_stock_report_day`()
BEGIN
    declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
    start transaction;

create temporary table t_stock_report_day as 
SELECT
    ctrd.log_type,ctrd.stat_time,ctrd.exchange_code,case when trd.num is null  then ctrd.num else ctrd.num + trd.num end as num,ctrd.stat_time_day,
ctrd.platform,ctrd.channel,ctrd.os,ctrd.manu,ctrd.os_version,ctrd.app_version,ctrd.`language`,ctrd.screen_w,ctrd.screen_h
FROM
    c_stock_report_day ctrd
        LEFT JOIN
    (SELECT 
        log_type, stat_time, exchange_code, SUM(num) AS num, stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h
    FROM
		stock_report_day
    WHERE
        stat_time_day > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY log_type , stat_time , exchange_code , stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h) trd ON ctrd.stat_time = trd.stat_time
        AND ctrd.exchange_code = trd.exchange_code And ctrd.log_type = trd.log_type AND ctrd.platform=trd.platform AND ctrd.channel=trd.channel AND ctrd.os=trd.os
        AND ctrd.manu=trd.manu AND ctrd.os_version=trd.os_version AND ctrd.app_version=trd.app_version AND ctrd.`language`=trd.`language` 
        AND ctrd.screen_w=trd.screen_w AND ctrd.screen_h=trd.screen_h;
 
DELETE trd FROM stock_report_day trd
        INNER JOIN
    t_stock_report_day ttrd ON trd.log_type = ttrd.log_type
        AND trd.stat_time = ttrd.stat_time
        AND trd.exchange_code = ttrd.exchange_code AND trd.platform=ttrd.platform AND trd.channel=ttrd.channel AND trd.os=ttrd.os AND trd.manu=ttrd.manu
        AND trd.os_version=ttrd.os_version AND trd.app_version=ttrd.app_version AND trd.`language`=ttrd.`language` AND trd.screen_w=ttrd.screen_w AND trd.screen_h=ttrd.screen_h;
 
 insert into stock_report_day(log_type,stat_time,exchange_code,num,stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h) select log_type,stat_time,exchange_code,num,stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h from t_stock_report_day where stat_time_day is not null;
 
         if err = 1 then
			rollback;
		else
			commit;
		end if;
        
        drop temporary table t_stock_report_day;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_tag_report_day
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_tag_report_day`;
delimiter ;;
CREATE PROCEDURE `procedure_tag_report_day`()
BEGIN
    declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
    start transaction;

create temporary table t_tag_report_day as 
SELECT
    ctrd.log_type,ctrd.stat_time,ctrd.tag_key,case when trd.num is null  then ctrd.num else ctrd.num + trd.num end as num,ctrd.stat_time_day,
ctrd.platform,ctrd.channel,ctrd.os,ctrd.manu,ctrd.os_version,ctrd.app_version,ctrd.`language`,ctrd.screen_w,ctrd.screen_h
FROM
    c_tag_report_day ctrd
        LEFT JOIN
    (SELECT 
        log_type, stat_time, tag_key, SUM(num) AS num, stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h
    FROM
		tag_report_day
    WHERE
        stat_time_day > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY log_type , stat_time , tag_key , stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h) trd ON ctrd.stat_time = trd.stat_time
        AND ctrd.tag_key = trd.tag_key And ctrd.log_type = trd.log_type AND ctrd.platform=trd.platform AND ctrd.channel=trd.channel AND ctrd.os=trd.os AND ctrd.manu=trd.manu
        AND ctrd.os_version=trd.os_version AND ctrd.app_version=trd.app_version AND ctrd.`language`=trd.`language` AND ctrd.screen_w=trd.screen_w AND ctrd.screen_h=trd.screen_h;
 
DELETE trd FROM tag_report_day trd
        INNER JOIN
    t_tag_report_day ttrd ON trd.log_type = ttrd.log_type
        AND trd.stat_time = ttrd.stat_time
        AND trd.tag_key = ttrd.tag_key AND trd.platform=ttrd.platform AND trd.channel=ttrd.channel AND trd.os=ttrd.os AND trd.manu=ttrd.manu 
        AND trd.os_version=ttrd.os_version AND trd.app_version=ttrd.app_version AND trd.`language`=ttrd.`language` and trd.screen_w=ttrd.screen_w AND trd.screen_h=ttrd.screen_h;
 
 insert into tag_report_day(log_type,stat_time,tag_key,num,stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h) select log_type,stat_time,tag_key,num,stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h from t_tag_report_day where stat_time_day is not null;
 
         if err = 1 then
			rollback;
		else
			commit;
		end if;
        
        drop temporary table t_tag_report_day;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_trade_usercount_report_day
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_trade_usercount_report_day`;
delimiter ;;
CREATE PROCEDURE `procedure_trade_usercount_report_day`()
BEGIN
    declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
    start transaction;

create temporary table t_trade_usercount as
SELECT
    ctu.stat_time,
ctu.stat_time_hour,case when tu.total_count is null  then ctu.total_count else ctu.total_count + tu.total_count end as total_count,case when tu.register_count is null  then ctu.register_count else ctu.register_count + tu.register_count end as register_count,case when tu.weibo_count is null  then ctu.weibo_count else ctu.weibo_count + tu.weibo_count end as weibo_count,case when tu.weixin_count is null  then ctu.weixin_count else ctu.weixin_count + tu.weixin_count end as weixin_count,case when tu.qq_count is null  then ctu.qq_count else ctu.qq_count + tu.qq_count end as qq_count,case when tu.three_total_count is null  then ctu.three_total_count else ctu.three_total_count + tu.three_total_count end as three_total_count,case when tu.total_trade_count is null  then ctu.total_trade_count else ctu.total_trade_count + tu.total_trade_count end as total_trade_count,case when tu.register_trade_count is null  then ctu.register_trade_count else ctu.register_trade_count + tu.register_trade_count end as register_trade_count,case when tu.weibo_trade_count is null  then ctu.weibo_trade_count else ctu.weibo_trade_count + tu.weibo_trade_count end as weibo_trade_count,case when tu.weixin_trade_count is null  then ctu.weixin_trade_count else ctu.weixin_trade_count + tu.weixin_trade_count end as weixin_trade_count,case when tu.qq_trade_count is null  then ctu.qq_trade_count else ctu.qq_trade_count + tu.qq_trade_count end as qq_trade_count,case when tu.three_trade_count is null  then ctu.three_trade_count else ctu.three_trade_count + tu.three_trade_count end as three_trade_count,ctu.stat_time_day
FROM
    c_trade_usercount_day ctu
        LEFT JOIN
    (SELECT 
        stat_time, stat_time_hour,total_count,register_count,weibo_count,weixin_count,qq_count,three_total_count,total_trade_count,register_trade_count,weibo_trade_count,weixin_trade_count,qq_trade_count,three_trade_count, stat_time_day
    FROM
		trade_usercount_day
    WHERE
        stat_time_day > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY stat_time, stat_time_hour,stat_time_day) tu ON ctu.stat_time = tu.stat_time;

DELETE tu FROM trade_usercount_day tu
        INNER JOIN
    t_trade_usercount ttu ON ttu.stat_time = tu.stat_time;

 insert into trade_usercount_day(stat_time,stat_time_hour,total_count,register_count,weibo_count,weixin_count,qq_count,three_total_count,total_trade_count,register_trade_count,weibo_trade_count,weixin_trade_count,qq_trade_count,three_trade_count,stat_time_day) select stat_time,stat_time_hour,total_count,register_count,weibo_count,weixin_count,qq_count,three_total_count,total_trade_count,register_trade_count,weibo_trade_count,weixin_trade_count,qq_trade_count,three_trade_count,stat_time_day from t_trade_usercount where stat_time_day is not null;

         if err = 1 then
			rollback;
		else
			commit;
		end if;
        
        drop temporary table t_trade_usercount;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ui_pv_report_day
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ui_pv_report_day`;
delimiter ;;
CREATE PROCEDURE `procedure_ui_pv_report_day`()
BEGIN
    declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
    start transaction;

create temporary table t_ui_pv as 
SELECT
    cup.stat_time,cup.stat_time_hour,cup.user_id,cup.page,cup.menu,cup.button,case when up.pv is null  then cup.pv else cup.pv + up.pv end as pv,cup.stat_time_day,
    cup.platform,cup.channel,cup.os,cup.manu,cup.os_version,cup.app_version,cup.`language`,cup.screen_w,cup.screen_h
FROM
    (select 
				stat_time, stat_time_hour,user_id,page,menu,button,SUM(pv) AS pv, stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h 
		from c_ui_pv GROUP BY user_id,page,menu,button,stat_time_day,platform,channel,os,app_version )cup
        LEFT JOIN
    (SELECT 
        stat_time, stat_time_hour,user_id,page,menu,button,SUM(pv) AS pv, stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h
    FROM
		ui_pv
    WHERE
        stat_time_day > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY user_id,page,menu,button,stat_time_day,platform,channel,os,app_version) up ON cup.stat_time_day = up.stat_time_day
        AND cup.user_id = up.user_id AND cup.page = up.page AND cup.menu =up.menu and cup.button = up.button and cup.platform = up.platform AND cup.channel = up.channel 
        and cup.os = up.os and cup.app_version = up.app_version;
 
DELETE up FROM ui_pv up
        INNER JOIN
    t_ui_pv tup ON tup.stat_time_day = up.stat_time_day AND tup.user_id = up.user_id AND tup.page = up.page AND tup.menu =up.menu and tup.button = up.button 
        and tup.platform = up.platform AND tup.channel = up.channel and tup.os = up.os and tup.app_version = up.app_version;
 
 insert into ui_pv(stat_time,stat_time_hour,user_id,page,menu,button,pv,stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h) select stat_time,stat_time_hour,user_id,page,menu,button,pv,stat_time_day,platform,channel,os,manu,os_version,app_version,`language`,screen_w,screen_h from t_ui_pv where stat_time_day is not null;
 
         if err = 1 then
			rollback;
		else
			commit;
		end if;
        
        drop temporary table t_ui_pv;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_user_basic_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_user_basic_info`;
delimiter ;;
CREATE PROCEDURE `procedure_user_basic_info`()
BEGIN
		declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
    start transaction;


	
	DELETE  FROM user_basic_info;
	
	insert into report.user_basic_info(user_id,mobile_phone_number,channel_source , channel_name,channel_type,area,register_time,reg_imei)
    select  a.user_id as user_id,mobile_phone_number,channel_source , IFNULL(channel_name,channel_source) as channel_name,channel_type,area,register_time,reg_imei from 
    (select user_id,stat_time as register_time,channel_source from  report.user_register_change where log_type="reg" and user_type!=6 and user_type!=-6 ) as a
    left join
    (select channel,channel_name,channel_type from  report.channel_ananlysis_name) as h on a.channel_source=h.channel
    left join
    (select user_id,mobile_phone_number,area_country_code as area,imei as reg_imei from miningstock.user) as b on a.user_id=b.user_id;
		
		UPDATE report.user_basic_info a INNER JOIN (
      select user_id,funds_account,name,stat_time as account_time from report.user_account_info
      ) b ON a.user_id = b.user_id
      SET a.funds_account = b.funds_account ,a.name=b.name,a.account_time=b.account_time;
			
		UPDATE report.user_basic_info a INNER JOIN (
    select funds_account,stat_time as gold_time,min_trade_day as trade_time,withdraw_date from report.user_golden_info
      ) b ON a.funds_account = b.funds_account
      SET a.trade_time = b.trade_time ,a.withdraw_date=b.withdraw_date,a.gold_time=b.gold_time;
			
		UPDATE report.user_basic_info a INNER JOIN (
      select funds_account ,net_asset from  report.trade_user_money
      ) b ON a.funds_account = b.funds_account
      SET a.net_asset = b.net_asset ;
			
		UPDATE report.user_basic_info a INNER JOIN (
		select c.user_id,imei from (SELECT user_id,reg_imei FROM `user_basic_info` where reg_imei like "%-%") as c
		left join (select user_id,imei from activation) as d on c.user_id=d.user_id HAVING imei is not null
		) b ON a.user_id = b.user_id SET a.reg_imei=b.imei;
	 if err = 1 then
			rollback;
		else
			commit;
		end if;
			

END
;;
delimiter ;

-- ----------------------------
-- Event structure for event_user_basic_info
-- ----------------------------
DROP EVENT IF EXISTS `event_user_basic_info`;
delimiter ;;
CREATE EVENT `event_user_basic_info`
ON SCHEDULE
EVERY '1' DAY STARTS '2020-08-20 07:30:43'
ON COMPLETION PRESERVE
DO call procedure_user_basic_info()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
