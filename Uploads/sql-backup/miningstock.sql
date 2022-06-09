/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : miningstock

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:21:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for abroadcard_apply
-- ----------------------------
DROP TABLE IF EXISTS `abroadcard_apply`;
CREATE TABLE `abroadcard_apply` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `city` varchar(50) DEFAULT NULL COMMENT '所在城市',
  `bank` varchar(50) DEFAULT NULL COMMENT '办理银行',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `phonenumber` varchar(50) DEFAULT NULL COMMENT '手机号',
  `channel_open` varchar(50) DEFAULT NULL COMMENT '渠道号',
  `capital_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `followup` int(20) DEFAULT '0' COMMENT '0是待跟进，1是已处理',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for abroadcard_city
-- ----------------------------
DROP TABLE IF EXISTS `abroadcard_city`;
CREATE TABLE `abroadcard_city` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `city` varchar(50) DEFAULT NULL COMMENT '城市名字',
  `sort` int(20) DEFAULT NULL,
  `choice` int(20) DEFAULT '0' COMMENT '0是未选中，1是选中',
  `sharea_id` int(20) DEFAULT NULL COMMENT '关联sh_area表的主键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for abroadcard_message
-- ----------------------------
DROP TABLE IF EXISTS `abroadcard_message`;
CREATE TABLE `abroadcard_message` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank` varchar(50) DEFAULT NULL COMMENT '银行',
  `point_adress` varchar(50) DEFAULT NULL COMMENT '开卡网点',
  `capital` varchar(50) DEFAULT NULL COMMENT '资金门槛',
  `data` varchar(50) DEFAULT NULL COMMENT '所需材料',
  `cycle` varchar(50) DEFAULT NULL COMMENT '办理周期',
  `advantage` varchar(50) DEFAULT NULL COMMENT '优势',
  `city_id` int(20) DEFAULT NULL COMMENT '城市外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for abroadcard_register
-- ----------------------------
DROP TABLE IF EXISTS `abroadcard_register`;
CREATE TABLE `abroadcard_register` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `city` varchar(50) DEFAULT NULL COMMENT '预约城市',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名字',
  `phonenumber` varchar(50) DEFAULT NULL COMMENT '手机号',
  `channel_open` varchar(50) DEFAULT NULL COMMENT '渠道号',
  `capital_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `followup` int(20) DEFAULT '0' COMMENT '0是待跟进，1是已处理',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=790 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for access_record
-- ----------------------------
DROP TABLE IF EXISTS `access_record`;
CREATE TABLE `access_record` (
  `access_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) DEFAULT NULL,
  `access_ip` char(50) DEFAULT NULL,
  `acess_imei` char(50) DEFAULT NULL,
  `acess_time` bigint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`access_id`),
  UNIQUE KEY `access_id_UNIQUE` (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activity_list
-- ----------------------------
DROP TABLE IF EXISTS `activity_list`;
CREATE TABLE `activity_list` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `des` varchar(512) DEFAULT NULL COMMENT '活动描述',
  `type` int(4) DEFAULT NULL COMMENT '活动类型 1为每月中奖活动',
  `insert_time` int(11) DEFAULT NULL COMMENT '20150921',
  `flag` int(2) DEFAULT NULL COMMENT '1有效，0无效',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ad_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `ad_dictionaries`;
CREATE TABLE `ad_dictionaries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ad_notice
-- ----------------------------
DROP TABLE IF EXISTS `ad_notice`;
CREATE TABLE `ad_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `publisher` varchar(50) DEFAULT NULL COMMENT '发布者',
  `status` tinyint(4) DEFAULT NULL COMMENT '发布状态 0：无效 1：有效',
  `type` tinyint(4) DEFAULT NULL COMMENT '公告类型',
  `validity_start` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `validity_end` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `date` date DEFAULT NULL COMMENT '发布日期',
  `content` varchar(500) DEFAULT NULL COMMENT '公告内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告内容列表';

-- ----------------------------
-- Table structure for ad_sense
-- ----------------------------
DROP TABLE IF EXISTS `ad_sense`;
CREATE TABLE `ad_sense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(100) DEFAULT NULL COMMENT '广告位名称',
  `ad_type` varchar(11) DEFAULT NULL COMMENT '广告类型，singlePicAd代表单图广告，multiPicAd代表多图广告，textAd代表文字广告',
  `ad_position_identification` varchar(50) DEFAULT NULL COMMENT '广告位标识',
  `random_flag` int(2) DEFAULT NULL COMMENT '是否随机展示，1是，0否',
  `display_flag` int(2) DEFAULT NULL COMMENT '是否有展示时间，1有，0没有',
  `interval_flag` int(2) DEFAULT NULL COMMENT '是否有两次广告之间的间隔时间，1有，0没有',
  `carousel_flag` int(2) DEFAULT NULL COMMENT '是否有轮播间隔时间，1有，0没有',
  `carousel_time` int(11) DEFAULT NULL COMMENT '轮播间隔周期，单位为秒',
  `ad_effective_time_flag` int(2) DEFAULT NULL COMMENT '是否有广告开始和结束时间，0没有，1有',
  `is_title` int(2) DEFAULT '1' COMMENT '0，不存在标题；1存在标题',
  `ad_width` int(11) DEFAULT NULL COMMENT '广告图片显示宽度',
  `ad_height` int(11) DEFAULT NULL COMMENT '广告图片显示高度',
  `upload_user` varchar(40) DEFAULT NULL COMMENT '添加广告位人员',
  `upload_time` datetime DEFAULT NULL COMMENT '添加广告位时间',
  `effective` int(2) DEFAULT '1' COMMENT '0表示广告位无效，1表示广告位有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_position_identification` (`ad_position_identification`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ad_target
-- ----------------------------
DROP TABLE IF EXISTS `ad_target`;
CREATE TABLE `ad_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_name` varchar(100) DEFAULT NULL COMMENT '广告投放目标名称',
  `target_class` varchar(100) DEFAULT NULL COMMENT '广告投放目标实现类',
  `reference` varchar(255) DEFAULT NULL COMMENT '实现类引用',
  `upload_user` varchar(40) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_class` (`target_class`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for ad_target_20211029
-- ----------------------------
DROP TABLE IF EXISTS `ad_target_20211029`;
CREATE TABLE `ad_target_20211029` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_name` varchar(100) DEFAULT NULL COMMENT '广告投放目标名称',
  `target_class` varchar(100) DEFAULT NULL COMMENT '广告投放目标实现类',
  `reference` varchar(255) DEFAULT NULL COMMENT '实现类引用',
  `upload_user` varchar(40) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_class` (`target_class`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for advertisement
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(200) DEFAULT NULL COMMENT '轮播图片的连接',
  `cdn_url` varchar(200) DEFAULT NULL COMMENT '图片cdn链接',
  `md5` varchar(200) DEFAULT NULL COMMENT '图片Md5校验（32位）',
  `new_pic_url` varchar(200) DEFAULT NULL,
  `new_cdn_url` varchar(200) DEFAULT NULL,
  `new_md5` varchar(200) DEFAULT NULL,
  `href` varchar(200) DEFAULT NULL COMMENT '点击图片对应的后续地址',
  `type` varchar(5) DEFAULT NULL COMMENT '”01”是http，”02”为activity，”03”为无跳转',
  `content` varchar(1024) DEFAULT NULL COMMENT '传给href对应的页面或者界面的内容',
  `page` varchar(100) DEFAULT NULL COMMENT '返回客户端的page类型：如page=1001: 指数详情页',
  `aid` varchar(50) DEFAULT NULL,
  `sdate` bigint(20) DEFAULT NULL COMMENT '广告开始时间',
  `edate` bigint(20) DEFAULT NULL COMMENT '广告结束时间',
  `sequence` int(5) DEFAULT NULL COMMENT '多图广告的顺序序号',
  `ad_position_identification` varchar(50) DEFAULT NULL COMMENT '广告位标识',
  `display_time` int(11) DEFAULT NULL COMMENT '展示周期，单位为秒',
  `interval_time` int(11) DEFAULT NULL COMMENT '间隔周期，单位为天',
  `trader` varchar(100) DEFAULT NULL COMMENT '券商类型',
  `title` varchar(100) DEFAULT NULL COMMENT '文字标题',
  `upload_user` varchar(40) DEFAULT NULL COMMENT '添加广告人员',
  `upload_time` datetime DEFAULT NULL COMMENT '添加广告时间',
  `effective` int(2) DEFAULT '1' COMMENT '0无效 1有效，删除操作',
  `ad_target` varchar(200) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `ad_frequency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ad_pos` (`ad_position_identification`),
  KEY `idx_sdate` (`sdate`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for app_manager_notice
-- ----------------------------
DROP TABLE IF EXISTS `app_manager_notice`;
CREATE TABLE `app_manager_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` tinyint(4) DEFAULT NULL COMMENT '渠道（1:尊嘉金融 2：掌上国都）',
  `notice_content` text COMMENT '通知内容',
  `sms_content` tinytext COMMENT '短信内容',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sms_time` datetime DEFAULT NULL,
  `sms_status` tinyint(4) DEFAULT NULL COMMENT '短信发送状态  0:未发送；1：已发送 null:不需要发送短信',
  `position` int(11) DEFAULT NULL COMMENT '消息 通知位置，默认为自选股列表页面， 1-自选股列表   2-新股认购列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8mb4 COMMENT='通知';

-- ----------------------------
-- Table structure for app_manager_right
-- ----------------------------
DROP TABLE IF EXISTS `app_manager_right`;
CREATE TABLE `app_manager_right` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `right_code` varchar(60) NOT NULL COMMENT '权限编码',
  `right_parent_code` varchar(60) DEFAULT NULL COMMENT '父权限编码',
  `right_name` varchar(60) DEFAULT NULL COMMENT '权限名称',
  `right_url` varchar(100) DEFAULT NULL COMMENT 'code对应的url地址',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图标的链接地址',
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for app_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `app_manager_role`;
CREATE TABLE `app_manager_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(60) DEFAULT NULL COMMENT '角色描述',
  `role_flag` int(11) DEFAULT NULL COMMENT '角色是否有效，1有效，0无效',
  `trader` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for app_manager_role_right
-- ----------------------------
DROP TABLE IF EXISTS `app_manager_role_right`;
CREATE TABLE `app_manager_role_right` (
  `rf_id` int(11) NOT NULL AUTO_INCREMENT,
  `rf_role_id` int(11) DEFAULT NULL,
  `rf_right_code` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for app_manager_user
-- ----------------------------
DROP TABLE IF EXISTS `app_manager_user`;
CREATE TABLE `app_manager_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(128) DEFAULT NULL COMMENT '用户密码',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COMMENT='后台管理人员';

-- ----------------------------
-- Table structure for app_manager_user_role
-- ----------------------------
DROP TABLE IF EXISTS `app_manager_user_role`;
CREATE TABLE `app_manager_user_role` (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`ur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='后台管理角色关系表';

-- ----------------------------
-- Table structure for app_user_config
-- ----------------------------
DROP TABLE IF EXISTS `app_user_config`;
CREATE TABLE `app_user_config` (
  `user_id` bigint(19) NOT NULL,
  `param_type` varchar(50) NOT NULL COMMENT '参数类型',
  `param_key` varchar(50) NOT NULL COMMENT '具体参数',
  `param_value` varchar(100) NOT NULL COMMENT '具体参数值',
  `set_date` int(8) NOT NULL COMMENT '设定时间20180111',
  `config_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`config_id`),
  KEY `app_config_query_idx` (`user_id`,`param_type`,`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=128019 DEFAULT CHARSET=utf8mb4 COMMENT='推送配置表';

-- ----------------------------
-- Table structure for area_info
-- ----------------------------
DROP TABLE IF EXISTS `area_info`;
CREATE TABLE `area_info` (
  `area_id` varchar(38) NOT NULL,
  `area_name` varchar(50) DEFAULT NULL COMMENT '账户地区名称',
  `area_name_us` varchar(50) DEFAULT NULL COMMENT '账户地区名称 英文',
  `tax_name` varchar(50) DEFAULT NULL COMMENT '税务地区名称',
  `tax_name_us` varchar(50) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  `area_country_code` varchar(8) DEFAULT NULL COMMENT '国家区号',
  `mobile_length` int(11) DEFAULT NULL COMMENT '各个区域手机号长度',
  PRIMARY KEY (`area_id`),
  KEY `country_code` (`area_country_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for area_info_20200908
-- ----------------------------
DROP TABLE IF EXISTS `area_info_20200908`;
CREATE TABLE `area_info_20200908` (
  `area_id` varchar(38) NOT NULL,
  `area_name` varchar(50) DEFAULT NULL COMMENT '账户地区名称',
  `area_name_us` varchar(50) DEFAULT NULL COMMENT '账户地区名称 英文',
  `tax_name` varchar(50) DEFAULT NULL COMMENT '税务地区名称',
  `tax_name_us` varchar(50) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  `area_country_code` varchar(8) DEFAULT NULL COMMENT '国家区号',
  `mobile_length` int(11) DEFAULT NULL COMMENT '各个区域手机号长度',
  PRIMARY KEY (`area_id`),
  KEY `country_code` (`area_country_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for award_list
-- ----------------------------
DROP TABLE IF EXISTS `award_list`;
CREATE TABLE `award_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '获奖名单id',
  `activity_id` int(11) NOT NULL COMMENT '活动id',
  `user_id` int(11) NOT NULL COMMENT '获奖者id',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '名次，如果为0，则排名不分先后，升序排列',
  `award_name` tinytext COMMENT '奖品的名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for bos_everyday_trade_statement
-- ----------------------------
DROP TABLE IF EXISTS `bos_everyday_trade_statement`;
CREATE TABLE `bos_everyday_trade_statement` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(100) DEFAULT NULL COMMENT '用户id',
  `trade_id` bigint(20) DEFAULT NULL COMMENT '交易流水id',
  `account` varchar(100) DEFAULT NULL COMMENT '资金账号',
  `user_phone` varchar(50) DEFAULT NULL COMMENT '用户手机号',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `trade_type` int(10) DEFAULT NULL COMMENT '交易类型  0：普通交易   1：IPO申购',
  `exchange` varchar(10) DEFAULT NULL COMMENT '股票市场',
  `code` varchar(100) DEFAULT NULL COMMENT '股票名称',
  `orderqty` varchar(10) DEFAULT NULL COMMENT '委托股数',
  `curr_exec_qty` int(11) DEFAULT '0',
  `exec_qty` varchar(10) DEFAULT NULL COMMENT '该笔委托一共成交股数',
  `cancel_qty` int(11) DEFAULT '0' COMMENT '取消股数',
  `bs_flag` varchar(20) DEFAULT NULL COMMENT '买卖标记',
  `price` varchar(20) DEFAULT NULL COMMENT '成交价格',
  `exec_currency` varchar(20) DEFAULT NULL COMMENT '成交币种',
  `order_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `turnover_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `matchcode` varchar(50) DEFAULT NULL COMMENT '每笔交易单号',
  `order_seq` varchar(50) DEFAULT NULL COMMENT '委托单号',
  PRIMARY KEY (`id`),
  KEY `idx_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=2424588 DEFAULT CHARSET=utf8mb4 COMMENT='记录每天有交易行为用户';

-- ----------------------------
-- Table structure for cancel_follow
-- ----------------------------
DROP TABLE IF EXISTS `cancel_follow`;
CREATE TABLE `cancel_follow` (
  `cancel_follow_id` int(8) NOT NULL AUTO_INCREMENT,
  `follow_user_id` int(8) NOT NULL,
  `followed_user_id` int(8) NOT NULL,
  `cancel_time` bigint(8) NOT NULL DEFAULT '0',
  `follow_time` bigint(8) DEFAULT NULL,
  PRIMARY KEY (`cancel_follow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3750 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for censor_words
-- ----------------------------
DROP TABLE IF EXISTS `censor_words`;
CREATE TABLE `censor_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_words` (`word`(191))
) ENGINE=InnoDB AUTO_INCREMENT=8577 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for channels_and_settlement
-- ----------------------------
DROP TABLE IF EXISTS `channels_and_settlement`;
CREATE TABLE `channels_and_settlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `fund_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `market` varchar(10) DEFAULT NULL COMMENT '股票市场',
  `code` varchar(50) DEFAULT NULL COMMENT '股票代码',
  `amount` int(5) DEFAULT NULL COMMENT '股票数量',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `result` varchar(10) DEFAULT NULL COMMENT '结果',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COMMENT='运营渠道结算股票发放记录表';

-- ----------------------------
-- Table structure for client_exception_report
-- ----------------------------
DROP TABLE IF EXISTS `client_exception_report`;
CREATE TABLE `client_exception_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(50) NOT NULL COMMENT '上报账户',
  `user_type` int(3) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL COMMENT '系统',
  `os_version` varchar(10) DEFAULT NULL COMMENT '系统版本',
  `insert_time` datetime DEFAULT NULL,
  `report_time` datetime DEFAULT NULL COMMENT '上报时间',
  `content` varchar(255) DEFAULT NULL COMMENT '上报内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1811 DEFAULT CHARSET=utf8mb4 COMMENT='客户端异常上报记录';

-- ----------------------------
-- Table structure for client_version_info
-- ----------------------------
DROP TABLE IF EXISTS `client_version_info`;
CREATE TABLE `client_version_info` (
  `version_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '版本ID',
  `platform` smallint(1) NOT NULL DEFAULT '1' COMMENT '使用平台',
  `verion_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '版本名称',
  `internal_version` int(8) NOT NULL DEFAULT '1' COMMENT '内部版本',
  `update_version_type` int(8) NOT NULL DEFAULT '1' COMMENT '升级类型:1 正常升级 2强制升级',
  `download_url` varchar(200) NOT NULL COMMENT '下载地址',
  `apk_md5` varchar(100) DEFAULT NULL COMMENT 'md5摘要',
  `inform_update_time` date DEFAULT NULL COMMENT '通知用户升级版本时间',
  `force_update_leastversion` varchar(50) DEFAULT NULL COMMENT '强制升级版本',
  `force_update_symbol` smallint(1) DEFAULT NULL COMMENT '强制升级版本符合：1 < , 2 <=,  3 =',
  `upgrade_cycle` int(8) DEFAULT NULL,
  `upgrade_documents` varchar(1000) DEFAULT NULL,
  `trader` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `version_id_UNIQUE` (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for company_financials
-- ----------------------------
DROP TABLE IF EXISTS `company_financials`;
CREATE TABLE `company_financials` (
  `country` varchar(10) NOT NULL DEFAULT '',
  `exchange` varchar(20) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `period` varchar(50) NOT NULL DEFAULT '',
  `eps_actual` double DEFAULT NULL COMMENT '实际EPS',
  `eps_forecast` double DEFAULT NULL COMMENT '预期EPS',
  `report_type` varchar(30) NOT NULL DEFAULT '' COMMENT '报告类别 quarter:季报　semiannual:半年报　annual年报　unkown未知　',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exchange`,`code`,`period`,`report_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for company_profile
-- ----------------------------
DROP TABLE IF EXISTS `company_profile`;
CREATE TABLE `company_profile` (
  `country` varchar(10) DEFAULT NULL COMMENT '国家：　CN|HK|US',
  `exchange` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `ceo` varchar(100) DEFAULT NULL COMMENT 'CEO',
  `establishment_date` varchar(100) DEFAULT NULL COMMENT '成立日期',
  `address` varchar(500) DEFAULT NULL COMMENT '地址',
  `address_eng` varchar(500) DEFAULT NULL COMMENT '地址（英文）',
  `employees` varchar(20) DEFAULT NULL COMMENT '员工数量',
  `website` varchar(500) DEFAULT NULL COMMENT '网址',
  `introduce` text COMMENT '公司简介',
  `introduce_eng` text COMMENT '公司简介（英文）',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exchange`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for device_info
-- ----------------------------
DROP TABLE IF EXISTS `device_info`;
CREATE TABLE `device_info` (
  `device_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `vender` char(100) NOT NULL DEFAULT '',
  `model` char(100) DEFAULT 'Unknown',
  `os` int(8) NOT NULL DEFAULT '1',
  `os_version` char(20) NOT NULL DEFAULT '',
  `imei` char(50) NOT NULL DEFAULT '',
  `imsi` char(15) DEFAULT NULL,
  `screen_density` int(8) DEFAULT NULL,
  `screen_width` int(8) DEFAULT NULL,
  `screen_height` int(8) DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  UNIQUE KEY `imei` (`imei`)
) ENGINE=InnoDB AUTO_INCREMENT=386976 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for display_ad
-- ----------------------------
DROP TABLE IF EXISTS `display_ad`;
CREATE TABLE `display_ad` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(200) NOT NULL COMMENT '?ֲ?ͼƬ??????',
  `href` varchar(200) NOT NULL COMMENT '?????ֲ?ͼƬ??Ӧ?ĺ?????ַ',
  `type` varchar(5) NOT NULL COMMENT '??01????http????02??Ϊactivity????03??Ϊ????ת',
  `content` varchar(1024) NOT NULL COMMENT '????href??Ӧ??ҳ?????߽?????????',
  `flag` int(2) NOT NULL COMMENT '0??Ч 1??Ч??ɾ??????',
  `trader` varchar(100) DEFAULT NULL COMMENT 'ȯ??',
  `whole_flag` varchar(100) DEFAULT NULL COMMENT '????ȫ??ȯ?̣?????ӵ?У?',
  `effective` int(2) DEFAULT NULL COMMENT 'ͼƬ?Ƿ???Ч??0???ã?1????',
  `sdate` varchar(100) DEFAULT NULL COMMENT '???߿?ʼʱ??',
  `edate` varchar(100) DEFAULT NULL COMMENT '???߽???ʱ??',
  `display_time` int(11) DEFAULT NULL COMMENT 'չʾ???ڣ???λΪ??',
  `sequence` int(11) DEFAULT NULL COMMENT '????ȯ?̵?????',
  `page` varchar(100) DEFAULT NULL COMMENT '???ؿͻ??˵?page???ͣ???page=1001: ָ??????ҳ',
  `md5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for efunds_daily
-- ----------------------------
DROP TABLE IF EXISTS `efunds_daily`;
CREATE TABLE `efunds_daily` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trading_day` date DEFAULT NULL COMMENT '交易日期',
  `code` varchar(20) DEFAULT NULL COMMENT '代码',
  `isin` varchar(20) DEFAULT NULL COMMENT '基金的ISIN代码',
  `name` varchar(50) DEFAULT NULL COMMENT '基金的名称',
  `net_asset` double DEFAULT NULL COMMENT '当天的资产净值',
  `seven_day_annualized` decimal(10,6) DEFAULT NULL COMMENT '7日年化收益',
  `hub_time` timestamp NULL DEFAULT NULL COMMENT '抓取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3538 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for employee_level2
-- ----------------------------
DROP TABLE IF EXISTS `employee_level2`;
CREATE TABLE `employee_level2` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `modification_time` date DEFAULT NULL COMMENT '手机号',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `mobile_phone_number` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `del` int(11) DEFAULT '0' COMMENT '删除标记：0未删除  1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COMMENT='员工使用L2表';

-- ----------------------------
-- Table structure for excess_earning_problems
-- ----------------------------
DROP TABLE IF EXISTS `excess_earning_problems`;
CREATE TABLE `excess_earning_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(300) DEFAULT NULL COMMENT '????',
  `answer` varchar(300) DEFAULT NULL COMMENT '????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for exchange_user_details
-- ----------------------------
DROP TABLE IF EXISTS `exchange_user_details`;
CREATE TABLE `exchange_user_details` (
  `exchange_id` int(11) NOT NULL AUTO_INCREMENT,
  `tdate` int(11) DEFAULT NULL COMMENT '交易日期，年月日',
  `match_time` int(11) DEFAULT NULL COMMENT '交易时间，时分秒',
  `match_qty` int(11) DEFAULT NULL COMMENT '成交量',
  `match_price` double(7,2) DEFAULT NULL COMMENT '成交价',
  `matchamt` double(15,2) DEFAULT NULL COMMENT '成交金额',
  `dir` smallint(4) DEFAULT NULL COMMENT ' 1买 -1卖',
  `exchange` varchar(10) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `account` varchar(50) DEFAULT NULL COMMENT '交易账户',
  `adapter` varchar(20) DEFAULT NULL COMMENT '柜台',
  PRIMARY KEY (`exchange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for exchange_user_info
-- ----------------------------
DROP TABLE IF EXISTS `exchange_user_info`;
CREATE TABLE `exchange_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL COMMENT 'user.id',
  `adapter` varchar(50) NOT NULL COMMENT '交易柜台',
  `account` varchar(50) NOT NULL COMMENT '资金账号',
  `password` varchar(100) NOT NULL COMMENT '密码（加密后',
  `operway` varchar(10) DEFAULT NULL COMMENT '账户类型',
  `reg_date` datetime NOT NULL COMMENT '初次登陆时间',
  `type` int(11) DEFAULT '0',
  `refresh_type` tinyint(1) DEFAULT '0' COMMENT '默认0 自动刷新 1为手动刷新，港股后续要按照手动刷新次数计费',
  `optional_sync` tinyint(4) DEFAULT '2' COMMENT '自选股同步1:同步，2：没同步',
  PRIMARY KEY (`id`),
  KEY `userId` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=412661 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for exchange_user_money
-- ----------------------------
DROP TABLE IF EXISTS `exchange_user_money`;
CREATE TABLE `exchange_user_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adapter` varchar(20) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `user_id` int(11) NOT NULL COMMENT '交易用户id user.id',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '总资产',
  `usable` double(15,2) DEFAULT NULL COMMENT '可用',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '可取',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`id`),
  KEY `identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for exchange_user_position
-- ----------------------------
DROP TABLE IF EXISTS `exchange_user_position`;
CREATE TABLE `exchange_user_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'id',
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
-- Table structure for exchange_user_transfer
-- ----------------------------
DROP TABLE IF EXISTS `exchange_user_transfer`;
CREATE TABLE `exchange_user_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'id',
  `adapter` varchar(50) DEFAULT NULL COMMENT '柜台',
  `account` varchar(50) DEFAULT NULL COMMENT '股票账户',
  `asset` double(15,2) DEFAULT NULL COMMENT '金额 正的为转入 负的为转出',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期,前的银证转入',
  `info_time` int(11) DEFAULT NULL COMMENT '??֤ת??ʱ??',
  PRIMARY KEY (`id`),
  KEY `posi_identity_by_infodate` (`adapter`,`account`,`info_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for feedback_info
-- ----------------------------
DROP TABLE IF EXISTS `feedback_info`;
CREATE TABLE `feedback_info` (
  `feedback_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `post_problemid` int(8) DEFAULT NULL COMMENT 'problemfeedback.problemId',
  `content_type` int(8) DEFAULT NULL COMMENT '???????ͣ? 1 ???? 2  ͼƬ 3 ????',
  `content` mediumtext CHARACTER SET utf8mb4,
  `customerservice_id` int(11) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `feedback_type` int(8) DEFAULT '2' COMMENT '???????ͣ?1 ????(?û?)  2  ?ظ?(?ͷ?) ',
  `status` int(8) DEFAULT NULL COMMENT '0 未读取1已读取',
  `user_id` int(8) unsigned NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `FK8BC59D289845196E` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for global_stock_index_info
-- ----------------------------
DROP TABLE IF EXISTS `global_stock_index_info`;
CREATE TABLE `global_stock_index_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `exchange` char(10) DEFAULT NULL COMMENT '指数exchange',
  `code` varchar(10) DEFAULT NULL COMMENT '指数code',
  `name` varchar(50) DEFAULT NULL COMMENT '股票的名称',
  `item` int(11) DEFAULT NULL COMMENT '类型分组：1、常用；2、亚洲指数',
  `item_name` varchar(100) DEFAULT NULL COMMENT '分组名称：1、常用；2、亚洲指数',
  `sequence` int(11) DEFAULT '0' COMMENT '展示顺序',
  `effective` int(11) DEFAULT '1' COMMENT '0表示无效，1表示有效',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图片链接地址',
  `english_name` varchar(150) DEFAULT NULL COMMENT '股票英文名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for gold_account_buycycle
-- ----------------------------
DROP TABLE IF EXISTS `gold_account_buycycle`;
CREATE TABLE `gold_account_buycycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_type` int(11) NOT NULL DEFAULT '0' COMMENT '周期类型',
  `cycle_desc` varchar(100) DEFAULT '0' COMMENT '周期描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='月季年';

-- ----------------------------
-- Table structure for gold_account_buytype
-- ----------------------------
DROP TABLE IF EXISTS `gold_account_buytype`;
CREATE TABLE `gold_account_buytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_type` int(11) NOT NULL COMMENT '支付类型 1资产净值 2支付宝 3微信 4 免费领取 ',
  `buy_desc` varchar(100) DEFAULT NULL COMMENT '购买描述',
  `buy_unit` varchar(100) DEFAULT NULL COMMENT '购买单位',
  `status` int(11) DEFAULT '1' COMMENT '0代表无效；1代表有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='金账户扣费周期月季年';

-- ----------------------------
-- Table structure for gold_account_fee
-- ----------------------------
DROP TABLE IF EXISTS `gold_account_fee`;
CREATE TABLE `gold_account_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_type` int(11) DEFAULT NULL COMMENT '购买方式：1净资产扣款, 2第三方支付',
  `cycle_type` int(11) DEFAULT '0' COMMENT '0 - 月、1 -季、2 -年',
  `buy_fee` double(11,2) DEFAULT NULL COMMENT '费用',
  `deduction_currency` varchar(2) DEFAULT NULL COMMENT '扣款币种 1美金 2 人民币 3港币',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='金账户付款金额';

-- ----------------------------
-- Table structure for gold_account_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `gold_account_info_detail`;
CREATE TABLE `gold_account_info_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `funds_account` varchar(16) DEFAULT '0' COMMENT '资金账号',
  `fee_type` int(11) NOT NULL COMMENT '支付类型 1资产净值 2支付宝 3微信 4 免费领取   暂时只支持资产净值扣款与赠送两种，其他情况暂时未开通',
  `insert_date` datetime DEFAULT NULL COMMENT '订单生成时间，到秒',
  `fee_date` datetime DEFAULT NULL COMMENT '支付完成时间',
  `buy_fee` double(10,2) DEFAULT NULL COMMENT '支付金额',
  `cycle_type` int(11) DEFAULT NULL COMMENT '购买周期 1月2季3年',
  `status` varchar(2) DEFAULT '0' COMMENT '扣款状态  0 扣款失败 1 扣款成功',
  `effective_sdate` date DEFAULT NULL COMMENT '有效开始时间',
  `effective_edate` date DEFAULT NULL COMMENT '有效结束时间',
  `trade_status` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deduction_currency` varchar(2) DEFAULT NULL COMMENT '扣款币种  0港币  1.美元  2人民币',
  PRIMARY KEY (`id`),
  KEY `insert_date` (`insert_date`),
  KEY `funds_account` (`funds_account`)
) ENGINE=InnoDB AUTO_INCREMENT=14053 DEFAULT CHARSET=utf8mb4 COMMENT='金账户用户订阅记录';

-- ----------------------------
-- Table structure for goldcoin_qa
-- ----------------------------
DROP TABLE IF EXISTS `goldcoin_qa`;
CREATE TABLE `goldcoin_qa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL COMMENT '提问',
  `answer` text,
  `flag` int(11) DEFAULT '1' COMMENT '是否有效：0无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for hk_shareipo
-- ----------------------------
DROP TABLE IF EXISTS `hk_shareipo`;
CREATE TABLE `hk_shareipo` (
  `name` varchar(400) DEFAULT NULL COMMENT '股票名称',
  `code` varchar(10) DEFAULT NULL COMMENT '股票代码',
  `issuevolplanned` decimal(18,2) DEFAULT NULL COMMENT '计划发行总股数',
  `publicnewshareplanned` decimal(18,2) DEFAULT NULL COMMENT '公开发售新股股数',
  `issuepriceceiling` decimal(18,8) DEFAULT NULL COMMENT '每股最低价',
  `issuepricefloor` decimal(18,8) DEFAULT NULL COMMENT '每股最高价',
  `tradeunitpriceatceiling` decimal(19,4) DEFAULT NULL COMMENT '按最高价每手支付价格',
  `exchange` varchar(10) NOT NULL COMMENT '交易所',
  `issuetype` int(11) DEFAULT NULL COMMENT '发行类别 具体描述：1-首发，3-增发，9-股东转让配售，10-基金营销',
  `applystartdate` date DEFAULT NULL COMMENT '申购起始日',
  `issueenddate` datetime DEFAULT NULL COMMENT '发行截止日',
  `proposedlistdate` date DEFAULT NULL COMMENT '预计上市日',
  `datetoaccount` date DEFAULT NULL COMMENT '股票发放日',
  `tradeunit` int(11) DEFAULT NULL COMMENT '买卖单位',
  `marketcode` varchar(10) DEFAULT NULL COMMENT '市场代码',
  `issueprice` decimal(18,8) DEFAULT NULL COMMENT '发行价',
  `pin_yin` varchar(20) DEFAULT NULL COMMENT '拼音首字母',
  `source` varchar(2) DEFAULT NULL COMMENT '来源 具体描述：ZJ－尊嘉 JY－聚源  ',
  `updatetime` datetime NOT NULL COMMENT '数据更新时间',
  `createtime` datetime NOT NULL COMMENT '入库时间',
  `jy_id` bigint(20) DEFAULT '0' COMMENT '聚源数据ID，更新数据时定位用',
  `issueresultpubldate` date DEFAULT NULL COMMENT '发行结果公告日',
  `totalsubshares` decimal(18,2) DEFAULT NULL COMMENT '实际认购股数',
  `totalproceeds` decimal(19,4) DEFAULT NULL COMMENT '募资总额',
  `firstday_pchg` decimal(19,4) DEFAULT NULL COMMENT '首日涨跌幅',
  `pubapplyunit` decimal(18,2) DEFAULT NULL COMMENT '公众股认购有效申请份数(白/黄/电子)',
  `pubapplyshares` decimal(18,2) DEFAULT NULL COMMENT '公众股认购股数(股)',
  `pubapplymultiple` decimal(18,8) DEFAULT NULL COMMENT '公众股认购倍数',
  `ipo_status` int(11) DEFAULT '0' COMMENT '1000-意向，1001-预案，1004-决案，1007-否决，1010-申请，1013-批准，1016-未实施终止，1019-实施中，1022-实施完成，1025-解除，1028-到期，1041-续签，1043-部分续签，1051-涉诉，1053-可能涉诉，1303-收到，1305-部分收到，2001-逾期，2003-还款，2005-延期，2007-展期，2501-诉前，2504-诉中，2507-诉后，3001-提前回收，3002-提前部分回收，3003-到期后协议延期，3004-到期回收，3005-到期待回收，3006-到期部分待回收，3007-到期无法回收，3008-到期部分无法回收，3101-改革意向，3103-股改动议取消，3105-董事会改革方案，3108-沟通确认方案，3111-上级部门批准，3115-上级部门驳回，3120-董事会否决，3121-股东大会通过，3125-股东大会否决，3126-有效期内未实施，3131-方案实施，3201-证监会审核通过，3202-证监会审核否决，3212-方案部分实施，3301-已注册未发行，3302-已发行有额度，3303-已发行无额度，3304-提前终止，3305-放弃',
  `agentname` varchar(5000) DEFAULT NULL COMMENT '承销商等',
  `is_apply` int(11) DEFAULT '0' COMMENT '是否配售 1:是 0:否',
  KEY `index1` (`exchange`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for index_composition
-- ----------------------------
DROP TABLE IF EXISTS `index_composition`;
CREATE TABLE `index_composition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exchange` char(4) DEFAULT NULL COMMENT '指数exchange',
  `code` varchar(10) DEFAULT NULL COMMENT '指数code',
  `stock_exchange` char(4) DEFAULT NULL COMMENT '成分股的exchange',
  `stock_code` varchar(10) DEFAULT NULL COMMENT '成分股的code\r',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for index_prediction
-- ----------------------------
DROP TABLE IF EXISTS `index_prediction`;
CREATE TABLE `index_prediction` (
  `prediction_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(8) unsigned NOT NULL,
  `choice_id` smallint(2) NOT NULL,
  `prediction_day` bigint(8) NOT NULL,
  `prediction_time` bigint(8) NOT NULL,
  `prediction_correct` smallint(1) DEFAULT NULL COMMENT 'If the prediction is correct, the value is 1.\nOtherwise the value is 0.',
  `bet_gold_coin` int(8) DEFAULT NULL,
  `summarized` int(4) DEFAULT NULL COMMENT '是否已经被汇总，被汇总置为1，0或者NULL表示没有汇总',
  `change_percent` float(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`prediction_id`),
  KEY `user_id_index` (`user_id`),
  CONSTRAINT `user_index_prediction_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11043 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for installation_package
-- ----------------------------
DROP TABLE IF EXISTS `installation_package`;
CREATE TABLE `installation_package` (
  `package_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '??װ??ID',
  `platform` smallint(1) NOT NULL DEFAULT '1' COMMENT 'ʹ??ƽ̨',
  `trader` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT 'ȯ??????',
  `verion_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '?汾????',
  `internal_version` bigint(8) NOT NULL DEFAULT '1' COMMENT '?ڲ??汾',
  `download_url` varchar(200) DEFAULT NULL COMMENT '???ص?ַ',
  `apk_md5` varchar(100) DEFAULT NULL COMMENT 'md5ժҪ',
  `upgrade_documents` varchar(1000) DEFAULT NULL COMMENT '????˵??',
  `uploading_time` datetime DEFAULT NULL COMMENT '?ϴ?ʱ??',
  `uploader` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '?ϴ???',
  PRIMARY KEY (`package_id`),
  UNIQUE KEY `version_id_UNIQUE` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for investgation_info
-- ----------------------------
DROP TABLE IF EXISTS `investgation_info`;
CREATE TABLE `investgation_info` (
  `invest_id` int(11) NOT NULL AUTO_INCREMENT,
  `invest_name` varchar(100) NOT NULL COMMENT '调查名称',
  `encourage` varchar(100) NOT NULL COMMENT '激励描述',
  `task_describe` varchar(100) NOT NULL COMMENT '调查描述',
  `result_describe` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL COMMENT '调查状态',
  `create_time` date NOT NULL COMMENT '创建时间',
  `flag` int(2) NOT NULL COMMENT '0无效 1有效',
  PRIMARY KEY (`invest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2521 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for investgation_option
-- ----------------------------
DROP TABLE IF EXISTS `investgation_option`;
CREATE TABLE `investgation_option` (
  `invest_id` int(8) NOT NULL,
  `option_key` int(2) NOT NULL,
  `option_value` varchar(100) DEFAULT NULL,
  `result` int(8) DEFAULT NULL COMMENT '调查项的投票总和',
  PRIMARY KEY (`invest_id`,`option_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for investgation_user_option
-- ----------------------------
DROP TABLE IF EXISTS `investgation_user_option`;
CREATE TABLE `investgation_user_option` (
  `user_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'APP用户id',
  `invest_id` int(11) NOT NULL COMMENT '调查ID',
  `option_key` int(2) NOT NULL COMMENT '选项编号',
  `opt_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`user_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11909 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for keep_news
-- ----------------------------
DROP TABLE IF EXISTS `keep_news`;
CREATE TABLE `keep_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `rowkey` varchar(64) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details_url` varchar(300) DEFAULT NULL,
  `thumbnail_url` varchar(300) DEFAULT NULL,
  `summary` text CHARACTER SET utf8mb4,
  `news_time` bigint(8) DEFAULT NULL,
  `keep_time` bigint(8) DEFAULT NULL,
  `user_id` int(8) NOT NULL COMMENT '评论的用户ID',
  `info_type` int(8) DEFAULT NULL COMMENT '消息类型',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15933 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for level2_buycycle
-- ----------------------------
DROP TABLE IF EXISTS `level2_buycycle`;
CREATE TABLE `level2_buycycle` (
  `cycle_type` int(11) NOT NULL DEFAULT '0' COMMENT '周期类型',
  `cycle_desc` varchar(100) DEFAULT '0' COMMENT '周期描述',
  PRIMARY KEY (`cycle_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for level2_buytype
-- ----------------------------
DROP TABLE IF EXISTS `level2_buytype`;
CREATE TABLE `level2_buytype` (
  `buy_type` int(11) NOT NULL,
  `buy_desc` varchar(100) DEFAULT NULL COMMENT '购买描述',
  `buy_unit` varchar(100) DEFAULT NULL COMMENT '购买单位',
  `status` int(11) DEFAULT '1' COMMENT '0??????Ч??1??????Ч',
  PRIMARY KEY (`buy_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for level2_fee
-- ----------------------------
DROP TABLE IF EXISTS `level2_fee`;
CREATE TABLE `level2_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_type` int(11) DEFAULT NULL COMMENT '购买方式：1金币兑换, 2第三方支付',
  `cycle_type` int(11) DEFAULT '0' COMMENT '月费用',
  `buy_fee` double(11,2) DEFAULT NULL COMMENT '季费用',
  `market` varchar(20) DEFAULT 'A' COMMENT '市场，A表示沪深，HK表示香港',
  `market_type` int(11) DEFAULT NULL,
  `afterfee` varchar(50) DEFAULT NULL COMMENT '省的金额',
  `product_id` varchar(50) DEFAULT NULL COMMENT '产品id（苹果商店）',
  `gold_buy_fee` double(11,2) DEFAULT NULL COMMENT '金账户购买费用',
  `gold_product_id` varchar(50) DEFAULT NULL COMMENT '金账户产品id（苹果商店）',
  `pro_type` varchar(100) DEFAULT NULL COMMENT '行情产品标记，为运营类行情产品查找方便',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '产品状态（用于区分产品过滤使用） 0普通商品  1活动临时产品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for line_active
-- ----------------------------
DROP TABLE IF EXISTS `line_active`;
CREATE TABLE `line_active` (
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `area_code` varchar(50) DEFAULT NULL COMMENT '手机区域号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `phone_md5` varchar(42) DEFAULT NULL COMMENT '手机号md5 MD5(mining+areacode+phone_mobile)',
  `win_status` tinyint(4) DEFAULT NULL COMMENT '领取状态 1:已领 0:未领',
  `created_date` datetime DEFAULT NULL COMMENT '录入时间',
  `win_date` datetime DEFAULT NULL COMMENT '领取时间',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `activity_name` varchar(100) DEFAULT NULL COMMENT '活动名称',
  `verify_code` varchar(11) DEFAULT NULL COMMENT '验证码',
  `apply_name` varchar(50) DEFAULT NULL COMMENT '申请姓名',
  `verify_date` datetime DEFAULT NULL COMMENT '验证码验证时间',
  `verify_result` int(11) DEFAULT NULL COMMENT '验证码是否正确 1:正确 0:不正确',
  `verify_send_count` int(11) DEFAULT NULL COMMENT '验证码发送次数',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `md5` (`phone_md5`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COMMENT='线下活动用户';

-- ----------------------------
-- Table structure for live_streaming
-- ----------------------------
DROP TABLE IF EXISTS `live_streaming`;
CREATE TABLE `live_streaming` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `compere` varchar(30) DEFAULT NULL COMMENT '主讲人',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 0-已删除；1-未开始；2-直播中；3-已结束；',
  `top_flag` tinyint(2) DEFAULT NULL COMMENT '是否置顶 1-是；0-否；同一时间只能有一个置顶',
  `addr` varchar(255) DEFAULT NULL COMMENT '直播地址',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `pic_name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `create_staff` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_staff` varchar(30) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for login_record
-- ----------------------------
DROP TABLE IF EXISTS `login_record`;
CREATE TABLE `login_record` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '资金账号',
  `adress` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '登录地区',
  `model` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '手机型号',
  `login_time` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '登录时间',
  `insert_time` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '插入时间',
  `imei` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '设备唯一标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19713 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- ----------------------------
-- Table structure for lv2_daily
-- ----------------------------
DROP TABLE IF EXISTS `lv2_daily`;
CREATE TABLE `lv2_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` date DEFAULT NULL COMMENT '日报时间',
  `universal` int(11) DEFAULT NULL COMMENT '当日普及版客户数',
  `universal1` int(11) DEFAULT NULL,
  `universal2` int(11) DEFAULT NULL,
  `free` int(11) DEFAULT NULL COMMENT '当日免费客户数',
  `free1` int(11) DEFAULT NULL,
  `free2` int(11) DEFAULT NULL,
  `newly_opened` int(11) DEFAULT NULL COMMENT '当日新开通客户数',
  `newly_opened1` int(11) DEFAULT NULL,
  `newly_opened2` int(11) DEFAULT NULL,
  `cancellation` int(11) DEFAULT NULL COMMENT '当日注销客户数',
  `cancellation1` int(11) DEFAULT NULL,
  `cancellation2` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL COMMENT '当日总数',
  `market` char(50) DEFAULT NULL COMMENT 'A_a股  US_美股 HK_港股',
  `staff_num` int(11) DEFAULT NULL COMMENT '员工数量',
  `use_num` int(11) DEFAULT NULL COMMENT 'L2使用人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5412 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for lv2_employee
-- ----------------------------
DROP TABLE IF EXISTS `lv2_employee`;
CREATE TABLE `lv2_employee` (
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='这个表不再使用（20180731，王哲）\r\n公司员工\r\n使用L2是免费的\r\n';

-- ----------------------------
-- Table structure for lv2_invalid_user
-- ----------------------------
DROP TABLE IF EXISTS `lv2_invalid_user`;
CREATE TABLE `lv2_invalid_user` (
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(30) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for lv2_market_detail
-- ----------------------------
DROP TABLE IF EXISTS `lv2_market_detail`;
CREATE TABLE `lv2_market_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `market_tab` varchar(50) DEFAULT NULL,
  `market_string` varchar(20) DEFAULT NULL,
  `market_describe` varchar(20) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `lv2_market_type` int(5) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  `address_type` varchar(5) DEFAULT NULL,
  `market_string_en` varchar(200) DEFAULT NULL,
  `market_describe_en` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for lv2_monthly
-- ----------------------------
DROP TABLE IF EXISTS `lv2_monthly`;
CREATE TABLE `lv2_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` date DEFAULT NULL COMMENT '日报时间',
  `universal` int(11) DEFAULT NULL COMMENT '当月普及版客户数',
  `universal1` int(11) DEFAULT NULL,
  `universal2` int(11) DEFAULT NULL,
  `free` int(11) DEFAULT NULL COMMENT '当月免费客户数',
  `free1` int(11) DEFAULT NULL,
  `free2` int(11) DEFAULT NULL,
  `newly_opened` int(11) DEFAULT NULL COMMENT 'newlyOpened',
  `newly_opened1` int(11) DEFAULT NULL,
  `newly_opened2` int(11) DEFAULT NULL,
  `cancellation` int(11) DEFAULT NULL COMMENT '当月注销客户数',
  `cancellation1` int(11) DEFAULT NULL,
  `cancellation2` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL COMMENT '当月总数',
  `cost` float DEFAULT NULL COMMENT '当月应缴纳费用',
  `market` char(5) DEFAULT NULL COMMENT 'A_a股  US_美股 HK_港股',
  `staff_num` int(11) DEFAULT NULL COMMENT '员工数量',
  `use_num` int(11) DEFAULT NULL COMMENT 'L2使用人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for lv2_monthly_used
-- ----------------------------
DROP TABLE IF EXISTS `lv2_monthly_used`;
CREATE TABLE `lv2_monthly_used` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `count_time` date DEFAULT NULL COMMENT '使用时间',
  `market` char(5) DEFAULT NULL COMMENT 'A_a股  US_美股 HK_港股',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405483 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for lv2_user_information
-- ----------------------------
DROP TABLE IF EXISTS `lv2_user_information`;
CREATE TABLE `lv2_user_information` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT NULL COMMENT '用户id',
  `user_type` int(10) DEFAULT NULL COMMENT '用户状态1已开户2是未开户',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名字',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `occupation` varchar(50) DEFAULT NULL COMMENT '职业',
  `job_name` varchar(50) DEFAULT NULL COMMENT '工作单位名称',
  `job_address` varchar(50) DEFAULT NULL COMMENT '工作单位地址',
  `zipcode` varchar(50) DEFAULT NULL COMMENT '邮编',
  `create_date` datetime DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18589 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for main_page_pic
-- ----------------------------
DROP TABLE IF EXISTS `main_page_pic`;
CREATE TABLE `main_page_pic` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(200) NOT NULL COMMENT '轮播图片的连接',
  `href` varchar(200) NOT NULL COMMENT '点击轮播图片对应的后续地址',
  `type` varchar(5) NOT NULL COMMENT '”01”是http，”02”为activity',
  `content` varchar(1024) NOT NULL COMMENT '传给href对应的页面或者界面的内容',
  `sequence` int(2) NOT NULL COMMENT '图片顺序，按照升序排列',
  `flag` int(2) NOT NULL COMMENT '0无效 1有效',
  `trader` varchar(100) DEFAULT NULL COMMENT 'ȯ??',
  `whole_flag` varchar(100) DEFAULT NULL COMMENT '????ȫ??ȯ?̣?????ӵ?У?',
  `md5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2247 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for market_index
-- ----------------------------
DROP TABLE IF EXISTS `market_index`;
CREATE TABLE `market_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `market` varchar(20) DEFAULT NULL COMMENT '市场,A（沪深），HK(港股)，US（美股）',
  `exchange` varchar(30) DEFAULT NULL COMMENT '指数exchange',
  `code` varchar(30) DEFAULT NULL COMMENT '指数code',
  `name` varchar(100) DEFAULT NULL COMMENT '指数名称',
  `effectice` int(11) DEFAULT '1' COMMENT '指数是否有效，1有效，0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for message_classify
-- ----------------------------
DROP TABLE IF EXISTS `message_classify`;
CREATE TABLE `message_classify` (
  `id` tinyint(4) NOT NULL COMMENT '主键',
  `name` varchar(10) NOT NULL COMMENT '类型名称',
  `icon` varchar(100) NOT NULL COMMENT '图标',
  `l_code` varchar(50) DEFAULT NULL COMMENT '语种代码标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息分类。\r\n提醒消息，新闻消息，活动消息，系统消息';

-- ----------------------------
-- Table structure for mm_ablitymanager_log
-- ----------------------------
DROP TABLE IF EXISTS `mm_ablitymanager_log`;
CREATE TABLE `mm_ablitymanager_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL COMMENT '请求时间',
  `optype` tinyint(3) DEFAULT NULL COMMENT '0：新增 1：修改 2：删除',
  `managetype` tinyint(3) DEFAULT NULL COMMENT '业务管理类型 1：能力试用申请通知 2：能力商用申请通知',
  `abilityid` varchar(30) DEFAULT NULL,
  `developerid` char(10) DEFAULT NULL COMMENT '能力集市开发者ID',
  `tryid` char(10) DEFAULT '' COMMENT '能力试用ID',
  `trykey` char(10) DEFAULT '' COMMENT '能力试用安全密钥',
  `appid` char(20) DEFAULT '' COMMENT '能力应用唯一标识ID',
  `appkey` varchar(255) DEFAULT NULL,
  `apptype` tinyint(3) DEFAULT NULL COMMENT '0：终端; 1：WEB应用; 2：PC应用;  3：其他',
  `mobileostype` tinyint(3) DEFAULT NULL COMMENT '1：S60,2：Windows Mobile,3：OPhone OS,4：Kjava,5：LINUX,9：Android,10：BlackBerry OS,15：VRE',
  `appenname` char(50) DEFAULT NULL COMMENT '应用英文简称',
  `appchname` char(50) DEFAULT NULL COMMENT '应用中文简称',
  `appdesc` char(200) DEFAULT NULL,
  `logoimg` char(255) DEFAULT NULL COMMENT 'logo URL',
  `appimg1` char(255) DEFAULT NULL COMMENT '备用图标1',
  `appimg2` char(255) DEFAULT NULL COMMENT '备用图标2',
  `visiturl` char(255) DEFAULT NULL COMMENT 'web入口',
  `abilitytryreq` char(255) DEFAULT NULL COMMENT '能力试用的业务配置参数，如配置试用手机号码等，具体参数由能力服务平台指定',
  `response_time` datetime DEFAULT NULL COMMENT '回复时间',
  `response_returncode` tinyint(3) DEFAULT NULL COMMENT '0：成功，业务可正常使用 , <>0：失败，不能使用',
  `response_managetype` tinyint(3) DEFAULT '1' COMMENT '业务管理类型 1：能力试用申请通知 2：能力商用申请通知',
  `response_returntype` tinyint(3) DEFAULT '3' COMMENT '0：采用能力集市平台的能力试用ID、能力试用KEY 1：由能力服务平台返回能力试用ID、能力试用KEY；2：采用能力集市平台的能力应用的App ID、App KEY；3：由能力服务平台生成并返回能力应用的App ID、App KEY；',
  `response_tyrid` char(255) DEFAULT NULL COMMENT '能力服务平台产生的能力试用ID',
  `response_trykey` char(255) DEFAULT NULL COMMENT '能力服务平台产生的能力试用密钥',
  `response_appid` char(255) DEFAULT NULL COMMENT '能力服务平台产生的能力应用ID',
  `response_appkey` char(255) DEFAULT NULL COMMENT '能力服务平台产生的能力应用安全密钥',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MM能力应用注册接口日志';

-- ----------------------------
-- Table structure for mock_account_info
-- ----------------------------
DROP TABLE IF EXISTS `mock_account_info`;
CREATE TABLE `mock_account_info` (
  `user_id` int(11) NOT NULL COMMENT '交易用户id user.id\n基本规则： 普通账户的user_id>0, 融资融券的账户user_id<0， 取绝对值和用户表的user_id对应',
  `net_assets` double(15,2) DEFAULT NULL COMMENT '总资产',
  `usable` double(15,2) DEFAULT NULL COMMENT '可用',
  `withdraw` double(15,2) DEFAULT NULL COMMENT '可取',
  `stock_assets` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `debt_assets` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '除融资持仓股票以外的融资负债之和',
  `pure_assets` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '净资产',
  `financing_assets` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '可融资额度',
  `security_assets` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '可融券额度',
  `financing_interest` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '融资利息',
  `security_interest` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '融券利息',
  `reg_date` datetime DEFAULT NULL COMMENT '同用户注册日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mock_debt_interest
-- ----------------------------
DROP TABLE IF EXISTS `mock_debt_interest`;
CREATE TABLE `mock_debt_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `debt_date` datetime DEFAULT NULL COMMENT '负债日期',
  `debt_assets` double(15,2) DEFAULT NULL COMMENT '负债额度',
  `interest` double(15,2) DEFAULT NULL COMMENT '利息',
  `debt_type` int(11) DEFAULT NULL COMMENT '负债类型：1融资负债 2融券负债',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1645 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mock_exchange
-- ----------------------------
DROP TABLE IF EXISTS `mock_exchange`;
CREATE TABLE `mock_exchange` (
  `order_seq` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tdate` int(11) DEFAULT NULL COMMENT '交易日期 20150824',
  `match_time` int(11) DEFAULT NULL COMMENT '交易时间 95555',
  `match_qty` int(11) DEFAULT NULL COMMENT '成交量',
  `match_price` double(10,4) DEFAULT NULL COMMENT '成交价',
  `matchamt` double(15,2) DEFAULT NULL COMMENT '成交金额',
  `dir` int(11) DEFAULT NULL COMMENT '买卖标志： 1普通交易买入 -1普通交易卖出  2担保品买入 3 融资买入4买券还券  5担保品卖出 6卖券还款 7融券卖出 8现券还券 9担保品划入 10 划出 11新股申购',
  `exchange` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `matchtype` varchar(1) DEFAULT NULL COMMENT '''0''普通成交 ''1''撤单成交 ''2''废单 ''3''内部撤单 ''4''撤单废单',
  PRIMARY KEY (`order_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mock_financing_discount
-- ----------------------------
DROP TABLE IF EXISTS `mock_financing_discount`;
CREATE TABLE `mock_financing_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exchange` varchar(10) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `discount` double(15,2) DEFAULT '0.00' COMMENT '折算率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mock_order
-- ----------------------------
DROP TABLE IF EXISTS `mock_order`;
CREATE TABLE `mock_order` (
  `order_seq` varchar(32) NOT NULL COMMENT '订单id，系统生成唯一',
  `user_id` int(11) NOT NULL COMMENT '用户id，同user.userid',
  `exchange` varchar(20) NOT NULL COMMENT '交易市场',
  `code` varchar(20) NOT NULL COMMENT '股票代码',
  `name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `tdate` int(11) NOT NULL COMMENT '订单日期 20150901',
  `opertime` int(11) NOT NULL COMMENT '订单时间 100505',
  `matchqty` int(11) DEFAULT NULL COMMENT '成交数量',
  `orderqty` int(11) DEFAULT NULL COMMENT '委托数量',
  `cancelqty` int(11) DEFAULT NULL COMMENT '取消数量',
  `orderprice` double(10,4) DEFAULT NULL COMMENT '委托价格',
  `matchamt` double(15,2) DEFAULT NULL COMMENT '成交金额',
  `orderstatus` varchar(2) NOT NULL COMMENT '订单状态',
  `dir` int(11) NOT NULL COMMENT '买卖标志： 1普通交易买入 -1普通交易卖出  2担保品买入 3 融资买入4买券还券  5担保品卖出 6卖券还款 7融券卖出 8现券还券 9担保品划入 10 划出 11新股申购',
  `orderamount` double(14,4) DEFAULT NULL,
  PRIMARY KEY (`order_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mock_position
-- ----------------------------
DROP TABLE IF EXISTS `mock_position`;
CREATE TABLE `mock_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(20) DEFAULT NULL COMMENT '股票名称',
  `code` varchar(20) DEFAULT NULL COMMENT '股票编码',
  `exchange` varchar(10) DEFAULT NULL COMMENT '交易市场',
  `cost_price` double(16,8) DEFAULT NULL COMMENT '成本价',
  `stkqty` int(11) DEFAULT NULL COMMENT '总股本，如果为负表示融券，如果为正表示持股',
  `stkavl` int(11) DEFAULT NULL COMMENT '可用股本',
  `stkbuy` int(11) DEFAULT NULL COMMENT '买入冻结',
  `stksale` int(11) DEFAULT NULL COMMENT '卖出冻结',
  `tasset` double(15,2) DEFAULT NULL COMMENT '股票市值',
  `riseAndFallRate` varchar(20) DEFAULT NULL COMMENT '盈亏比例',
  `riseAndFallValue` double(15,2) DEFAULT NULL COMMENT '浮动盈亏',
  `stock_debt` double(15,2) DEFAULT '0.00' COMMENT '股票负债金额，融资时该值为小于0，融券时为0',
  `positions_type` int(11) DEFAULT '0' COMMENT '持仓类型：0 普通持仓 1担保品持仓2 融资持仓3 融券持仓',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1482 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mock_user_transfer
-- ----------------------------
DROP TABLE IF EXISTS `mock_user_transfer`;
CREATE TABLE `mock_user_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `asset` double(15,2) DEFAULT NULL COMMENT '金额 正的为转入 负的为转出',
  `info_date` int(11) DEFAULT NULL COMMENT '记录日期,前的银证转入',
  `info_time` int(11) DEFAULT NULL COMMENT '银证转账时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for my_message
-- ----------------------------
DROP TABLE IF EXISTS `my_message`;
CREATE TABLE `my_message` (
  `msg_id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `content` mediumtext CHARACTER SET utf8mb4 COMMENT '消息的内容',
  `url` varchar(200) DEFAULT NULL COMMENT '链接url',
  `subject` varchar(200) DEFAULT NULL COMMENT '消息主题',
  `msg_classify` int(8) DEFAULT NULL COMMENT '消息分类',
  `type` varchar(2) DEFAULT NULL COMMENT '点击消息类型，”01”是http，”02”为activity 03是 sys',
  `page` varchar(50) DEFAULT NULL,
  `aid` varchar(50) DEFAULT NULL,
  `msg_time` bigint(20) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `msg_url` varchar(255) DEFAULT NULL,
  `push` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for my_message_us
-- ----------------------------
DROP TABLE IF EXISTS `my_message_us`;
CREATE TABLE `my_message_us` (
  `msg_id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '消息标题，保存在我的消息中',
  `content` mediumtext CHARACTER SET utf8mb4 COMMENT '消息内容，保存在我的消息中',
  `push` varchar(200) DEFAULT NULL COMMENT 'push内容，推送给app',
  `url` varchar(200) DEFAULT NULL COMMENT '链接url',
  `msg_classify` int(8) DEFAULT NULL COMMENT '消息分类',
  `type` varchar(2) DEFAULT NULL COMMENT '点击消息类型，”01”是http，”02”为activity 03是 sys',
  `page` varchar(50) DEFAULT NULL,
  `aid` varchar(50) DEFAULT NULL COMMENT 'exchange_code',
  `msg_time` bigint(20) DEFAULT NULL COMMENT '任务接收时间',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间;消息发送时间',
  `msg_url` varchar(255) DEFAULT NULL COMMENT '暂时没有数据',
  `subject` varchar(255) DEFAULT NULL,
  `hbase_rowkey` varchar(100) DEFAULT NULL COMMENT '对应hbase中的rowKey',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '消息状态：0未读 1已读',
  `hbase_msgid` int(11) DEFAULT '0' COMMENT '对应hbase中的msgid',
  PRIMARY KEY (`msg_id`),
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='2020年4月9日创建，由于美国服务不包含hbase,所以美国地区使用MySQL替代';

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `row_key` varchar(64) NOT NULL COMMENT '资讯ID',
  `comment_content` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `comment_time` bigint(8) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '评论的用户ID',
  PRIMARY KEY (`comment_id`),
  KEY `comment_news_id` (`row_key`),
  KEY `comment_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_read
-- ----------------------------
DROP TABLE IF EXISTS `news_read`;
CREATE TABLE `news_read` (
  `read_id` int(11) NOT NULL AUTO_INCREMENT,
  `row_key` varchar(64) NOT NULL,
  `read_count` int(11) NOT NULL,
  PRIMARY KEY (`read_id`),
  KEY `idx_row_key` (`row_key`)
) ENGINE=InnoDB AUTO_INCREMENT=660438 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for news_user_point
-- ----------------------------
DROP TABLE IF EXISTS `news_user_point`;
CREATE TABLE `news_user_point` (
  `point_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '0 利空、1 利多',
  `user_id` int(11) NOT NULL,
  `point_time` bigint(8) DEFAULT NULL,
  `row_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`point_id`),
  KEY `news_point_userid` (`user_id`),
  KEY `news_point_newsid` (`row_key`)
) ENGINE=InnoDB AUTO_INCREMENT=34268 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notified_close_review
-- ----------------------------
DROP TABLE IF EXISTS `notified_close_review`;
CREATE TABLE `notified_close_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账户',
  `mobile_number` varchar(11) DEFAULT NULL COMMENT '手机号',
  `state` int(4) DEFAULT NULL COMMENT '审核状态 1005通过 1006不通过 1008审核中',
  `review_fail_reason` varchar(100) DEFAULT NULL COMMENT '失败原因',
  `review_user` varchar(20) DEFAULT NULL COMMENT '审核人',
  `review_date` datetime DEFAULT NULL COMMENT '审核日期',
  `ip` varchar(20) DEFAULT NULL COMMENT '审核人ip',
  `images` varchar(100) DEFAULT NULL COMMENT '签名',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for notified_type
-- ----------------------------
DROP TABLE IF EXISTS `notified_type`;
CREATE TABLE `notified_type` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `del_notified_state` int(4) DEFAULT NULL COMMENT '成交回报开启状态  1001成交回报通知开启 1002成交回报通知关闭',
  `notified_type` int(4) DEFAULT NULL COMMENT '成交回报方式	       1003通知方式微信  1004通知方式邮件',
  `login_notified_type` int(4) DEFAULT NULL COMMENT '登录通知方式',
  `outmoney_notified_type` int(4) DEFAULT NULL COMMENT '出金通知方式',
  `change_account_notified_type` int(4) DEFAULT NULL COMMENT '更改账号资料通知方式',
  `resetpassword_notified_type` int(4) DEFAULT NULL COMMENT '重设密码通知方式',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile_number` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='notified_id                       	主键\n\nmobile_number			手机号\n\ndel_notified_state    		成交回报开启状态  1001成交回报通知开启 1002成交回报通知关闭\n\nnotified_type				成交回报方式	       1003通知方式微信  1004通知方式邮件\n\nlogin_notified_type			登录通知方式\n\noutMoney_notified_type		出金通知方式\n\nchange_account_notified_type	更改账号资料通知方式\n\nresetpassword_notified_type	重设密码通知方式\n\nimages				上传签名图片';

-- ----------------------------
-- Table structure for notified_type_bak01
-- ----------------------------
DROP TABLE IF EXISTS `notified_type_bak01`;
CREATE TABLE `notified_type_bak01` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `del_notified_state` int(4) DEFAULT NULL COMMENT '成交回报开启状态  1001成交回报通知开启 1002成交回报通知关闭',
  `notified_type` int(4) DEFAULT NULL COMMENT '成交回报方式	       1003通知方式微信  1004通知方式邮件',
  `login_notified_type` int(4) DEFAULT NULL COMMENT '登录通知方式',
  `outmoney_notified_type` int(4) DEFAULT NULL COMMENT '出金通知方式',
  `change_account_notified_type` int(4) DEFAULT NULL COMMENT '更改账号资料通知方式',
  `resetpassword_notified_type` int(4) DEFAULT NULL COMMENT '重设密码通知方式',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile_number` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='notified_id                       	主键\n\nmobile_number			手机号\n\ndel_notified_state    		成交回报开启状态  1001成交回报通知开启 1002成交回报通知关闭\n\nnotified_type				成交回报方式	       1003通知方式微信  1004通知方式邮件\n\nlogin_notified_type			登录通知方式\n\noutMoney_notified_type		出金通知方式\n\nchange_account_notified_type	更改账号资料通知方式\n\nresetpassword_notified_type	重设密码通知方式\n\nimages				上传签名图片';

-- ----------------------------
-- Table structure for opt_activity
-- ----------------------------
DROP TABLE IF EXISTS `opt_activity`;
CREATE TABLE `opt_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(30) DEFAULT NULL,
  `activity_sdate` bigint(20) DEFAULT NULL COMMENT '活动开始时间',
  `activity_edate` bigint(20) DEFAULT NULL COMMENT '活动结束时间',
  `activity_status` int(2) DEFAULT NULL COMMENT '活动状态 1有效0无效',
  `activity_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动描述',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商类型',
  `uuid` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL COMMENT '活动类型  1注册类，2开户类，3入金类，4邀请类，5品牌类，6综合类，7其他类',
  PRIMARY KEY (`activity_id`),
  UNIQUE KEY `uuid` (`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_activity_interest_rate
-- ----------------------------
DROP TABLE IF EXISTS `opt_activity_interest_rate`;
CREATE TABLE `opt_activity_interest_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID，唯一',
  `phone_number` varchar(30) DEFAULT NULL COMMENT '手机号码',
  `activity_id` varchar(60) DEFAULT NULL COMMENT '活动id',
  `insert_time` datetime DEFAULT NULL COMMENT '入表时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COMMENT='4.99融资利率，老用户';

-- ----------------------------
-- Table structure for opt_activity_pic
-- ----------------------------
DROP TABLE IF EXISTS `opt_activity_pic`;
CREATE TABLE `opt_activity_pic` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `sequence` int(5) DEFAULT NULL COMMENT '展示顺序',
  `activity_name` varchar(200) DEFAULT NULL COMMENT '活动名称',
  `language` varchar(20) DEFAULT NULL COMMENT '语言',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图片的连接',
  `cdn_url` varchar(200) DEFAULT NULL COMMENT '图片cdn链接',
  `md5` varchar(200) DEFAULT NULL COMMENT '图片Md5校验（32位）',
  `href` varchar(200) DEFAULT NULL COMMENT '点击图片对应的后续地址',
  `upload_user` varchar(40) DEFAULT NULL COMMENT '添加广告人员',
  `upload_time` datetime DEFAULT NULL COMMENT '添加广告时间',
  PRIMARY KEY (`id`),
  KEY `idx_sequence` (`sequence`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_activity_type
-- ----------------------------
DROP TABLE IF EXISTS `opt_activity_type`;
CREATE TABLE `opt_activity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `number` int(11) NOT NULL COMMENT '类型编号',
  `type_name` varchar(50) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='活动类型字典表';

-- ----------------------------
-- Table structure for opt_coupon_consume_rec
-- ----------------------------
DROP TABLE IF EXISTS `opt_coupon_consume_rec`;
CREATE TABLE `opt_coupon_consume_rec` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `business_type` varchar(50) DEFAULT NULL COMMENT '业务类型（该条消费所属业务标识）',
  `cou_product_id` int(11) DEFAULT NULL COMMENT '卡券对应的卡券产品id',
  `coupon_id` int(11) DEFAULT NULL COMMENT '我的卡券id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `use_time` datetime DEFAULT NULL COMMENT '卡券消费使用时间',
  `roll_back_time` datetime DEFAULT NULL COMMENT '卡券撤销使用时间',
  `is_roll_back` int(1) DEFAULT '0' COMMENT '卡券使用状态：0 正常使用（默认）1回退撤销使用',
  `stock_code` varchar(30) DEFAULT NULL COMMENT '股票代码',
  `order_seq` varchar(100) DEFAULT NULL COMMENT '交易订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7376 DEFAULT CHARSET=utf8mb4 COMMENT='卡券消费记录';

-- ----------------------------
-- Table structure for opt_coupon_product
-- ----------------------------
DROP TABLE IF EXISTS `opt_coupon_product`;
CREATE TABLE `opt_coupon_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `subheading` varchar(100) DEFAULT NULL COMMENT '副标题',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述或简介',
  `classify` int(3) DEFAULT NULL COMMENT '产品分类 1交易减免费',
  `number` int(11) DEFAULT NULL COMMENT '数量与单位搭配使用',
  `unit` varchar(10) DEFAULT NULL COMMENT '数量单位',
  `status` int(1) DEFAULT '0' COMMENT '产品状态 0有效 1无效',
  `market` varchar(20) DEFAULT NULL COMMENT '执行范围市场',
  `activity` varchar(50) DEFAULT NULL COMMENT '产品所关联的活动',
  `stock_code` varchar(30) DEFAULT NULL COMMENT '定向股票代码',
  `name_en` varchar(50) DEFAULT NULL COMMENT '活动英文名称',
  `subheading_en` varchar(255) DEFAULT NULL COMMENT '副标题英文',
  `describe_en` varchar(255) DEFAULT NULL COMMENT '描述或简介英文',
  `unit_en` varchar(10) DEFAULT NULL COMMENT '数量单位英文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='我的卡券产品列表';

-- ----------------------------
-- Table structure for opt_coupon_transaction
-- ----------------------------
DROP TABLE IF EXISTS `opt_coupon_transaction`;
CREATE TABLE `opt_coupon_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `user_id` int(11) DEFAULT NULL,
  `fund_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `exchange` varchar(10) DEFAULT NULL COMMENT '股票市场',
  `stock_code` varchar(30) DEFAULT NULL COMMENT '股票代码',
  `stock_name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `order_qty` varchar(20) DEFAULT NULL COMMENT '委托股数',
  `curr_exec_qty` int(11) DEFAULT NULL COMMENT '本次成交股数',
  `exec_qty` varchar(20) DEFAULT NULL COMMENT '该笔委托一共成交股数',
  `cancel_qty` int(11) DEFAULT NULL COMMENT '取消股数',
  `bs_flag` varchar(10) DEFAULT NULL COMMENT '买卖标记',
  `price` varchar(20) DEFAULT NULL COMMENT '成交价格',
  `exec_currency` varchar(10) DEFAULT NULL COMMENT '成交币种',
  `order_date_time` datetime DEFAULT NULL COMMENT '委托时间',
  `bargain_date_time` datetime DEFAULT NULL COMMENT '成交时间',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `order_reff` varchar(30) DEFAULT NULL COMMENT '入金请求数据序列id',
  `bms_response_code` int(10) DEFAULT NULL COMMENT 'bms入金响应码',
  `matchcode` varchar(50) DEFAULT NULL COMMENT '每笔交易单号',
  `order_seq` varchar(50) DEFAULT NULL COMMENT '委托单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133375 DEFAULT CHARSET=utf8mb4 COMMENT='卡券活动交易行为明细';

-- ----------------------------
-- Table structure for opt_goldcoin_detail
-- ----------------------------
DROP TABLE IF EXISTS `opt_goldcoin_detail`;
CREATE TABLE `opt_goldcoin_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `opt_date` datetime DEFAULT NULL COMMENT '日期',
  `goldcoin_count` int(11) DEFAULT '0' COMMENT '金币数量',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商版本',
  `opt_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动类型',
  `overplus_goldcoin` int(11) DEFAULT NULL COMMENT '剩余金币',
  `operator` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_opt_date` (`opt_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1980400 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_goldcoin_rule
-- ----------------------------
DROP TABLE IF EXISTS `opt_goldcoin_rule`;
CREATE TABLE `opt_goldcoin_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '则规ID',
  `rule_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '规则名称',
  `rule_desc` varchar(300) DEFAULT NULL COMMENT '则规说明',
  `goldcoin_count` int(11) DEFAULT '0' COMMENT '金币数量',
  `limit_count` int(11) DEFAULT '-1' COMMENT '限制次数',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商版本',
  `opt_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动类型',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_goldcoin_validity
-- ----------------------------
DROP TABLE IF EXISTS `opt_goldcoin_validity`;
CREATE TABLE `opt_goldcoin_validity` (
  `id` int(11) unsigned NOT NULL COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `year` int(11) NOT NULL COMMENT '年份：格式yyyy',
  `goldcoin_count` int(11) DEFAULT '0' COMMENT '该年份持有金币数量：每年结算一次',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `opt_goods_info`;
CREATE TABLE `opt_goods_info` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `card_no` varchar(100) DEFAULT NULL COMMENT '商品卡号',
  `card_pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品卡-密码',
  `goods_status` int(100) DEFAULT '0' COMMENT '商品状态: 0 未兑换 1 已兑换 2 无效',
  `goods_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品描述',
  `pid` int(11) DEFAULT NULL COMMENT '库存表id',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商版本',
  `insert_time` datetime DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `opt_goods_order`;
CREATE TABLE `opt_goods_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `mobile_phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号码',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `exchange_time` datetime DEFAULT NULL COMMENT '兑换时间',
  `send_time` datetime DEFAULT NULL COMMENT '发放时间',
  `auditor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核人',
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态，0代表兑换中，1代表兑换成功，-1代表兑换失败',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商版本',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因：如刷单',
  `consumed` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99980357 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_greeting_card
-- ----------------------------
DROP TABLE IF EXISTS `opt_greeting_card`;
CREATE TABLE `opt_greeting_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `openid` varchar(100) DEFAULT NULL COMMENT '制作者微信openid',
  `user_id` int(11) DEFAULT NULL COMMENT '制作者系统内的id',
  `user_phone` varchar(50) DEFAULT NULL COMMENT '用户手机号',
  `card_code` varchar(100) NOT NULL COMMENT '贺卡编号',
  `photo_url` varchar(100) DEFAULT NULL COMMENT '照片地址',
  `greeting_content` varchar(255) DEFAULT NULL COMMENT '祝福语留言',
  `sign` varchar(50) DEFAULT NULL COMMENT '署名',
  `insert_time` datetime DEFAULT NULL COMMENT '新增时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `activity` varchar(100) DEFAULT NULL COMMENT '相关活动',
  `channel_code` varchar(50) DEFAULT NULL COMMENT '渠道号',
  `is_old_user` int(2) DEFAULT '0' COMMENT '该用户是否为老用户  0：新用户  1老用户',
  `share_number` int(11) DEFAULT '0' COMMENT '分享次数',
  `ispopout_phone` int(2) DEFAULT '0' COMMENT '是否提示手机号弹框 0:是  1：否',
  PRIMARY KEY (`id`,`card_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3361 DEFAULT CHARSET=utf8mb4 COMMENT='2019新春贺卡活动表';

-- ----------------------------
-- Table structure for opt_index_predition
-- ----------------------------
DROP TABLE IF EXISTS `opt_index_predition`;
CREATE TABLE `opt_index_predition` (
  `prediction_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `option_id` int(8) NOT NULL COMMENT '选项编号，1代表涨，0代表跌',
  `prediction_day` bigint(20) DEFAULT NULL COMMENT '预测的日期',
  `prediction_time` bigint(20) DEFAULT NULL COMMENT '预测的时间（毫秒）',
  `prediction_correct` int(8) DEFAULT NULL COMMENT '预测结果（1代表对，0代表错）',
  `bet_gold_coin` int(8) DEFAULT NULL COMMENT '预测压注金币',
  `summarized` int(8) DEFAULT NULL COMMENT '是否已经被汇总，被汇总置为1，0或者NULL表示没有汇总',
  `insert_time` datetime DEFAULT NULL COMMENT '入表时间',
  `win_gold_coin` int(8) DEFAULT NULL COMMENT '压注收益',
  `index_result` int(8) DEFAULT NULL COMMENT '大盘涨跌，1代表涨，0代表跌',
  `trader` varchar(100) DEFAULT NULL COMMENT '券商类型',
  `change_percent` float(4,2) DEFAULT '0.00' COMMENT '大盘涨跌幅',
  PRIMARY KEY (`prediction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1615 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_invite_account
-- ----------------------------
DROP TABLE IF EXISTS `opt_invite_account`;
CREATE TABLE `opt_invite_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '邀请用户id',
  `invited_user_id` int(11) DEFAULT NULL COMMENT '被邀请人用户id，如果邀请用户id等于被邀请用户id说明是主动入金的',
  `invite_mobile` varchar(20) DEFAULT NULL COMMENT '被邀请手机号',
  `invite_date` datetime DEFAULT NULL COMMENT '邀请时间',
  `invite_stage` tinyint(4) DEFAULT NULL COMMENT '邀请阶段 0：未注册；1：未开户；2：未入金',
  `invited_reg_date` datetime DEFAULT NULL COMMENT '被邀请人注册时间',
  `channel_code` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `reg_activity_id` varchar(50) DEFAULT NULL COMMENT '注册的活动id',
  `reg_activity_name` varchar(50) DEFAULT NULL COMMENT '注册的活动名称',
  `reg_activity_end_date` datetime DEFAULT NULL COMMENT '注册的活动截止时间',
  `account_name` varchar(20) DEFAULT NULL COMMENT '开户人名称',
  `funds_account` varchar(30) DEFAULT NULL COMMENT '资金账号',
  `invited_account_date` datetime DEFAULT NULL COMMENT '被邀请人开户时间',
  `channel_open` varchar(50) DEFAULT NULL COMMENT '开户渠道',
  `deposit_amount` double DEFAULT NULL COMMENT '入金金额',
  `invited_deposit_date` datetime DEFAULT NULL COMMENT '被邀请人入金时间',
  `invite_platform` varchar(50) DEFAULT NULL COMMENT '邀请分享平台',
  `activity_name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `activity_end_date` datetime DEFAULT NULL COMMENT '活动截止时间',
  `first_login_date` datetime DEFAULT NULL COMMENT '用户第一次登录相关活动的时间记录',
  `login_activity_id` varchar(50) DEFAULT NULL COMMENT '第一次登录活动的id记录',
  `login_channel_code` varchar(50) DEFAULT NULL COMMENT '第一次通过活动页面登录的渠道号',
  `is_share` varchar(50) DEFAULT NULL COMMENT '标记时候是通过分享页面注册的用户  null不是',
  PRIMARY KEY (`id`),
  KEY `invite_mobile` (`invite_mobile`),
  KEY `activity_id` (`activity_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=256938 DEFAULT CHARSET=utf8mb4 COMMENT='邀请开户';

-- ----------------------------
-- Table structure for opt_invite_account_bak_20220125
-- ----------------------------
DROP TABLE IF EXISTS `opt_invite_account_bak_20220125`;
CREATE TABLE `opt_invite_account_bak_20220125` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '邀请用户id',
  `invited_user_id` int(11) DEFAULT NULL COMMENT '被邀请人用户id，如果邀请用户id等于被邀请用户id说明是主动入金的',
  `invite_mobile` varchar(20) DEFAULT NULL COMMENT '被邀请手机号',
  `invite_date` datetime DEFAULT NULL COMMENT '邀请时间',
  `invite_stage` tinyint(4) DEFAULT NULL COMMENT '邀请阶段 0：未注册；1：未开户；2：未入金',
  `invited_reg_date` datetime DEFAULT NULL COMMENT '被邀请人注册时间',
  `channel_code` varchar(50) DEFAULT NULL COMMENT '注册渠道',
  `reg_activity_id` varchar(50) DEFAULT NULL COMMENT '注册的活动id',
  `reg_activity_name` varchar(50) DEFAULT NULL COMMENT '注册的活动名称',
  `reg_activity_end_date` datetime DEFAULT NULL COMMENT '注册的活动截止时间',
  `account_name` varchar(20) DEFAULT NULL COMMENT '开户人名称',
  `funds_account` varchar(30) DEFAULT NULL COMMENT '资金账号',
  `invited_account_date` datetime DEFAULT NULL COMMENT '被邀请人开户时间',
  `channel_open` varchar(50) DEFAULT NULL COMMENT '开户渠道',
  `deposit_amount` double DEFAULT NULL COMMENT '入金金额',
  `invited_deposit_date` datetime DEFAULT NULL COMMENT '被邀请人入金时间',
  `invite_platform` varchar(50) DEFAULT NULL COMMENT '邀请分享平台',
  `activity_name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `activity_end_date` datetime DEFAULT NULL COMMENT '活动截止时间',
  `first_login_date` datetime DEFAULT NULL COMMENT '用户第一次登录相关活动的时间记录',
  `login_activity_id` varchar(50) DEFAULT NULL COMMENT '第一次登录活动的id记录',
  `login_channel_code` varchar(50) DEFAULT NULL COMMENT '第一次通过活动页面登录的渠道号',
  `is_share` varchar(50) DEFAULT NULL COMMENT '标记时候是通过分享页面注册的用户  null不是',
  PRIMARY KEY (`id`),
  KEY `invite_mobile` (`invite_mobile`),
  KEY `activity_id` (`activity_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=433948 DEFAULT CHARSET=utf8mb4 COMMENT='邀请开户';

-- ----------------------------
-- Table structure for opt_invite_assist
-- ----------------------------
DROP TABLE IF EXISTS `opt_invite_assist`;
CREATE TABLE `opt_invite_assist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '点赞表主键',
  `user_id` int(8) DEFAULT NULL COMMENT '点赞用户id(如果需要关联可用此字段做已注册用户关联)',
  `phone` char(30) DEFAULT NULL COMMENT '点赞者电话',
  `collect_likes_user_id` int(8) DEFAULT NULL COMMENT '集赞者用户id',
  `collect_likes_user_phone` char(30) DEFAULT NULL COMMENT '集赞者电话',
  `collect_likes_user_name` varchar(100) DEFAULT NULL COMMENT '集赞人昵称',
  `islike` int(1) NOT NULL DEFAULT '1' COMMENT '1：点赞(默认)  0：取消',
  `insert_date` datetime DEFAULT NULL COMMENT '点赞时间，插入时间',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '相关活动uuid',
  `activity_name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  PRIMARY KEY (`id`),
  KEY `opt_invite_assist_index` (`insert_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94490 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_invite_cash_history
-- ----------------------------
DROP TABLE IF EXISTS `opt_invite_cash_history`;
CREATE TABLE `opt_invite_cash_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `auditor` varchar(255) DEFAULT NULL COMMENT '审核人',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `money` decimal(19,2) DEFAULT NULL COMMENT '金额',
  `openid` varchar(255) DEFAULT NULL COMMENT '微信id',
  `opt_invite_reward_id` int(11) DEFAULT NULL COMMENT 'opt_invite_reward表id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `result` varchar(255) DEFAULT NULL COMMENT '结果',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19938 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_invite_reg
-- ----------------------------
DROP TABLE IF EXISTS `opt_invite_reg`;
CREATE TABLE `opt_invite_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL,
  `invite_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '被邀请手机号码',
  `invite_date` datetime DEFAULT NULL COMMENT '邀请时间',
  `is_reg` int(11) DEFAULT '0' COMMENT '是否注册',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_invite_reward
-- ----------------------------
DROP TABLE IF EXISTS `opt_invite_reward`;
CREATE TABLE `opt_invite_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `reward_uuid` varchar(50) DEFAULT NULL COMMENT '红包记录Id 16位字符串',
  `user_id` int(11) DEFAULT NULL COMMENT '邀请人用户id',
  `is_invite` tinyint(4) DEFAULT NULL COMMENT '邀请人或被邀请人1:邀请人;0:被邀请人',
  `invited_user_id` int(11) DEFAULT NULL COMMENT '被邀请人用户id',
  `account_name` varchar(50) DEFAULT NULL COMMENT '被邀请人开户名称',
  `invite_mobile` varchar(20) DEFAULT NULL COMMENT '被邀请手机号',
  `reward_type` tinyint(4) DEFAULT NULL COMMENT '奖励类型 0:行情现金二选一 1:行情礼包;2:现金 3:永久免佣 4:金币 5:全球高级实时行情6：港股高级行情 7：美股高级行情  8：股票奖励 ',
  `stock_time` int(4) DEFAULT NULL COMMENT '行情时段 单位月',
  `stock_time_type` int(4) DEFAULT NULL COMMENT 'stock_time类型产品使用时长  0或null为月单位（默认） 1天为单位 2股票股数单位',
  `reward_amount` decimal(10,4) DEFAULT NULL COMMENT '奖励金额',
  `win_channel` tinyint(4) DEFAULT NULL COMMENT '获取奖励途径，0：注册；1：开户；2：入金',
  `win_status` tinyint(4) DEFAULT NULL COMMENT '领取状态0：未领取；2：待领取；3：审核中；1：已领取/已发放 4:已过期 5:审核不通过，6 微信红包发送失败',
  `win_reward_date` datetime DEFAULT NULL COMMENT '获取奖励时间 分别对应注册时间，开户时间，入金满10000时间',
  `win_date` datetime DEFAULT NULL COMMENT '领取时间',
  `wx_openid` varchar(100) DEFAULT NULL COMMENT '微信用户 OpenId',
  `apply_ip` varchar(50) DEFAULT NULL COMMENT '申请审核ip',
  `apply_reject_reason` varchar(100) DEFAULT NULL COMMENT '拒绝原因、失败原因',
  `apply_date` datetime DEFAULT NULL COMMENT '申请审核时间',
  `activity_name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `activity_end_date` datetime DEFAULT NULL COMMENT '活动截止时间',
  `reward_source` int(11) DEFAULT NULL COMMENT '哪种方式获取奖励，主要是用户兼容以前版本，主要用户一次性的奖励，1表示注册奖励，2表示开户奖励，3表示入金奖励4，表示美国绑卡',
  `reward_mold` varchar(50) DEFAULT NULL COMMENT '显示我的奖励中的奖励类型',
  `win_activate_date` datetime DEFAULT NULL,
  `auditing_time` datetime DEFAULT NULL COMMENT '奖励后台审核时间',
  `auditors` varchar(50) DEFAULT NULL COMMENT '审合人',
  `stock` varchar(10) DEFAULT NULL COMMENT '奖励股票代码',
  `activity_name_en` varchar(50) DEFAULT NULL COMMENT '活动英文名称',
  PRIMARY KEY (`id`),
  KEY `userId` (`user_id`),
  KEY `invitedUserId` (`invited_user_id`),
  KEY `idx_win_reward_date` (`win_reward_date`)
) ENGINE=InnoDB AUTO_INCREMENT=505780 DEFAULT CHARSET=utf8mb4 COMMENT='邀请开户奖励';

-- ----------------------------
-- Table structure for opt_joinin_detail
-- ----------------------------
DROP TABLE IF EXISTS `opt_joinin_detail`;
CREATE TABLE `opt_joinin_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户参与活动的流水',
  `wx_openid` varchar(64) DEFAULT NULL COMMENT '微信的openid',
  `area_country_code` varchar(8) DEFAULT NULL,
  `mobile_phone_number` varchar(20) DEFAULT NULL,
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `insert_time` bigint(20) NOT NULL COMMENT '参与时间，年与日时分秒',
  `property` varchar(32) DEFAULT NULL COMMENT '重要属性，每个活动自定义',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14479 DEFAULT CHARSET=utf8mb4 COMMENT='用户参与活动流水表';

-- ----------------------------
-- Table structure for opt_lv2_activity
-- ----------------------------
DROP TABLE IF EXISTS `opt_lv2_activity`;
CREATE TABLE `opt_lv2_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_sdate` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `activity_edate` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `give_type` int(11) DEFAULT NULL COMMENT '赠予类型 1月2季3年',
  `activity_status` int(11) DEFAULT NULL COMMENT '活动状态 1有效0无效',
  `activity_desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '活动描述',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商类型',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_lv2_market_gift_rejection
-- ----------------------------
DROP TABLE IF EXISTS `opt_lv2_market_gift_rejection`;
CREATE TABLE `opt_lv2_market_gift_rejection` (
  `id` int(11) NOT NULL COMMENT 'id主键',
  `account` varchar(100) DEFAULT NULL COMMENT '资金账号',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `start_time` datetime DEFAULT NULL COMMENT '权限开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '权限结束时间',
  `isindefinite` int(10) DEFAULT NULL COMMENT '是否无限期   0：是  1：否',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `market_gift_rejection_index` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='lv2行情赠送剔除用户';

-- ----------------------------
-- Table structure for opt_my_coupon
-- ----------------------------
DROP TABLE IF EXISTS `opt_my_coupon`;
CREATE TABLE `opt_my_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `coupon_product_id` int(11) NOT NULL COMMENT '卡券产品id',
  `get_date` datetime DEFAULT NULL COMMENT '获得时间',
  `activation_date` date DEFAULT NULL COMMENT '激活日期',
  `expiring_date` date DEFAULT NULL COMMENT '失效期限',
  `status` int(2) DEFAULT '0' COMMENT '卡券状态 0未使用 1已使用 2已失效',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '卡券总数',
  `used` int(11) NOT NULL DEFAULT '0' COMMENT '已使用的数量',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁版本控制',
  `activity` varchar(50) DEFAULT NULL COMMENT '相关活动标识',
  PRIMARY KEY (`id`),
  KEY `coupon_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58937 DEFAULT CHARSET=utf8mb4 COMMENT='用户卡券列表';

-- ----------------------------
-- Table structure for opt_phone_check_in
-- ----------------------------
DROP TABLE IF EXISTS `opt_phone_check_in`;
CREATE TABLE `opt_phone_check_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `area_code` varchar(10) DEFAULT NULL COMMENT '电话区号',
  `phone` varchar(20) DEFAULT NULL COMMENT '收集的用户手机号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户关联的用户id（如果存在）',
  `fund_account` varchar(20) DEFAULT NULL COMMENT '用户关联的资金账号（如果存在）',
  `amount_usd` double DEFAULT NULL COMMENT '美股IPO申购钱数（美元）',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `activity_code` varchar(100) DEFAULT NULL COMMENT '活动标识',
  `activity_name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `channel_code` varchar(20) DEFAULT NULL COMMENT '相关渠道号',
  PRIMARY KEY (`id`),
  KEY `check_in_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2401 DEFAULT CHARSET=utf8mb4 COMMENT='运营电话号记录相关表';

-- ----------------------------
-- Table structure for opt_prediction_statistic
-- ----------------------------
DROP TABLE IF EXISTS `opt_prediction_statistic`;
CREATE TABLE `opt_prediction_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `correct_times` int(8) DEFAULT '0' COMMENT '赢取次数',
  `profit` int(8) DEFAULT '0' COMMENT '猜大盘收益',
  `wrong_times` int(8) DEFAULT '0' COMMENT '猜错的次数',
  `nickname` char(100) DEFAULT NULL,
  `photo_url` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `last_statistic_time` datetime DEFAULT NULL COMMENT '最后一次结算的时间',
  `cycle_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '周期类型：日D周W月M季Q年Y',
  `cycle_time` int(10) DEFAULT '0' COMMENT '期周时间',
  `trader` varchar(100) DEFAULT NULL COMMENT '券商类型',
  PRIMARY KEY (`id`),
  KEY `userIdIndex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54448 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_qa_answer
-- ----------------------------
DROP TABLE IF EXISTS `opt_qa_answer`;
CREATE TABLE `opt_qa_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `answer` varchar(255) NOT NULL COMMENT '答案',
  `sequence` tinyint(3) NOT NULL COMMENT '排序/答案标号',
  `question_id` int(11) NOT NULL COMMENT '题目id',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `opt_qa_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COMMENT='答题类运营活动题库答案表';

-- ----------------------------
-- Table structure for opt_qa_question
-- ----------------------------
DROP TABLE IF EXISTS `opt_qa_question`;
CREATE TABLE `opt_qa_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `question` varchar(255) NOT NULL COMMENT '问题标题',
  `right_answers` varchar(30) NOT NULL COMMENT '正确答案  多个可用逗号隔开 对应答案表的排序列',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '错误提示',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为必选题 0否 1是',
  `activity` varchar(100) DEFAULT NULL COMMENT '所属活动',
  `sequence` tinyint(3) DEFAULT NULL COMMENT '排序/题目编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='答题类运营活动题库题目表';

-- ----------------------------
-- Table structure for opt_qa_user
-- ----------------------------
DROP TABLE IF EXISTS `opt_qa_user`;
CREATE TABLE `opt_qa_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `reward` varchar(50) DEFAULT NULL COMMENT '所获得的奖励',
  `crate_time` datetime DEFAULT NULL COMMENT '创建时间',
  `activity` varchar(100) DEFAULT NULL COMMENT '所属活动',
  `is_complete` tinyint(1) DEFAULT '0' COMMENT '是否完成答题 0未完成  1已完成 2题目已答完未抽奖',
  `complete_time` datetime DEFAULT NULL COMMENT '答题完成时间',
  `reward_status` varchar(50) DEFAULT '0' COMMENT '奖励状态  手动改变',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12306 DEFAULT CHARSET=utf8mb4 COMMENT='知识竞答用户记录表';

-- ----------------------------
-- Table structure for opt_rescue_fund
-- ----------------------------
DROP TABLE IF EXISTS `opt_rescue_fund`;
CREATE TABLE `opt_rescue_fund` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `fund_account` varchar(30) DEFAULT NULL COMMENT '资金账号',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `insert_time` datetime DEFAULT NULL COMMENT '添加时间',
  `channel` varchar(50) DEFAULT NULL COMMENT '相关渠道号',
  `activity` varchar(70) DEFAULT NULL COMMENT '相关活动',
  PRIMARY KEY (`id`),
  KEY `i_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7322 DEFAULT CHARSET=utf8mb4 COMMENT='运营相关活动全免申请记录';

-- ----------------------------
-- Table structure for opt_reward_details
-- ----------------------------
DROP TABLE IF EXISTS `opt_reward_details`;
CREATE TABLE `opt_reward_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `min_amount` decimal(20,3) DEFAULT NULL COMMENT '最小入金金额',
  `max_amount` decimal(20,3) DEFAULT NULL COMMENT '最大入金金额',
  `reward_amount` decimal(20,3) DEFAULT NULL COMMENT '现金金额',
  `stock_time` tinyint(4) DEFAULT NULL COMMENT '行情时间',
  `is_invited` tinyint(4) DEFAULT NULL COMMENT '1:邀请人;0:被邀请人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='奖品信息';

-- ----------------------------
-- Table structure for opt_share_detail
-- ----------------------------
DROP TABLE IF EXISTS `opt_share_detail`;
CREATE TABLE `opt_share_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '微信分享表主键',
  `wx_openid` varchar(64) DEFAULT NULL COMMENT '微信的openid',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `insert_time` bigint(20) NOT NULL COMMENT '参与时间，年与日时分秒',
  `property` varchar(32) DEFAULT NULL COMMENT '重要属性，每个活动自定义',
  `channel` varchar(32) DEFAULT 'wechat' COMMENT '新媒体平台微信、微博等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1872 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_share_the_market
-- ----------------------------
DROP TABLE IF EXISTS `opt_share_the_market`;
CREATE TABLE `opt_share_the_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '邀请人用户id',
  `invitee_mail` varchar(50) DEFAULT NULL COMMENT '被邀人邮箱',
  `status` varchar(20) DEFAULT NULL COMMENT '邮件发送状态',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='分享的行情关系表';

-- ----------------------------
-- Table structure for opt_storage
-- ----------------------------
DROP TABLE IF EXISTS `opt_storage`;
CREATE TABLE `opt_storage` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(200) DEFAULT NULL COMMENT '商品图片的链接',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商版本',
  `pname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `pdesc` varchar(400) DEFAULT NULL COMMENT '商品描述',
  `pstorage` int(11) DEFAULT '0' COMMENT '商品库存数量',
  `pexchanged` int(11) DEFAULT '0' COMMENT '已兑换商品数量',
  `pexchanging` int(11) DEFAULT '0' COMMENT '兑换中的商品数量',
  `ptype` int(11) DEFAULT NULL COMMENT '商品种类，1是京东E卡，2是充值卡 3是level2',
  `peffective` int(11) DEFAULT '-1' COMMENT '上架与否，1代表上架，-1代表下架',
  `available_number` int(11) DEFAULT '0' COMMENT '当日可用的数量',
  `validity_time` int(11) DEFAULT '0' COMMENT '有效期，单位是月',
  `pprice` int(11) DEFAULT '0' COMMENT '商品单价',
  `insert_time` datetime DEFAULT NULL COMMENT '入表时间',
  `valid` int(11) DEFAULT '1' COMMENT '0表示删除；1表示未删除',
  `sequence` int(2) DEFAULT '0' COMMENT '显示顺序，按照升序排列',
  `original_cost` varchar(255) DEFAULT NULL,
  `market` varchar(50) DEFAULT NULL COMMENT '行情信息',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_team_info
-- ----------------------------
DROP TABLE IF EXISTS `opt_team_info`;
CREATE TABLE `opt_team_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_uid` varchar(50) DEFAULT NULL COMMENT '团队uid',
  `team_name` varchar(100) DEFAULT NULL COMMENT '团队名称',
  `team_soldier` tinyint(4) DEFAULT NULL COMMENT '团队或单兵 0：单兵 1：团队 2：团队转单兵',
  `creater` int(11) DEFAULT NULL COMMENT '创建人userid团长',
  `status` tinyint(4) DEFAULT NULL COMMENT '0：创建 1：成立 2：解散 3：成功',
  `apply_time` datetime DEFAULT NULL COMMENT '团长申请时间',
  `found_time` datetime DEFAULT NULL COMMENT '选定团员时间',
  `disband_time` datetime DEFAULT NULL COMMENT '团队解散时间',
  `draw_time` datetime DEFAULT NULL COMMENT '领奖时间',
  `activity_uid` varchar(50) DEFAULT NULL COMMENT '活动uid',
  PRIMARY KEY (`id`),
  KEY `createrIndex` (`creater`),
  KEY `teamUidIndex` (`team_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=utf8mb4 COMMENT='团队信息';

-- ----------------------------
-- Table structure for opt_team_mem
-- ----------------------------
DROP TABLE IF EXISTS `opt_team_mem`;
CREATE TABLE `opt_team_mem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_id` int(11) DEFAULT NULL COMMENT '团队id',
  `mem_uid` varchar(50) DEFAULT NULL,
  `team_uid` varchar(50) DEFAULT NULL,
  `team_solider` tinyint(4) DEFAULT NULL COMMENT '团队或单兵 0:单兵 1：团队 2：团队转单兵',
  `team_status` tinyint(4) DEFAULT NULL COMMENT '团队状态 0：初创 1：建团 2：解散 3：成功',
  `colonel` tinyint(4) DEFAULT NULL COMMENT '是否团长 0:否 1：是',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `mem_name` varchar(100) DEFAULT NULL COMMENT '团员昵称',
  `mem_phone` varchar(15) DEFAULT NULL COMMENT '团员手机号',
  `mem_status` tinyint(4) DEFAULT NULL COMMENT '团员状态 1：受邀请；2:入团；3：获奖 4：离开团队（未被选中组团）5：团队解散 6:主动离开团队 7:已发放奖励  8:未被选中组团，发放了单兵作战奖励',
  `warn_count` tinyint(4) DEFAULT NULL COMMENT '提醒入金次数',
  `draw` tinyint(4) DEFAULT NULL COMMENT '是否抽奖 0:否 1：已抽奖',
  `draw_time` datetime DEFAULT NULL COMMENT '抽奖时间',
  `draw_prize` varchar(20) DEFAULT NULL COMMENT '奖品id',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间(创建时间)',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间，更多的记录解散或得奖时间',
  `activity_uid` varchar(50) DEFAULT NULL COMMENT '活动uid',
  PRIMARY KEY (`id`),
  KEY `teamidIndex` (`team_id`),
  KEY `useridIndex` (`user_id`),
  KEY `teamUidIndex` (`team_uid`),
  KEY `memUidIndex` (`mem_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8mb4 COMMENT='团队成员信息';

-- ----------------------------
-- Table structure for opt_user_goldcoin
-- ----------------------------
DROP TABLE IF EXISTS `opt_user_goldcoin`;
CREATE TABLE `opt_user_goldcoin` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goldcoin_count` int(11) DEFAULT NULL COMMENT '金币数量',
  `trader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '券商版本',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_user_login
-- ----------------------------
DROP TABLE IF EXISTS `opt_user_login`;
CREATE TABLE `opt_user_login` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `last_logindate` date DEFAULT NULL COMMENT '最后登陆日期',
  `contin_loginday` int(11) DEFAULT '0' COMMENT '连续登陆天数',
  `goldcoin_count` int(11) DEFAULT NULL COMMENT '金币数量',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_user_lv2
-- ----------------------------
DROP TABLE IF EXISTS `opt_user_lv2`;
CREATE TABLE `opt_user_lv2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `activity_id` int(11) DEFAULT NULL COMMENT 'lv2活动id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_user_lv2_activity
-- ----------------------------
DROP TABLE IF EXISTS `opt_user_lv2_activity`;
CREATE TABLE `opt_user_lv2_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `uuid` varchar(100) DEFAULT NULL COMMENT '活动的uuid，标识唯一的活动',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1180 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for opt_wechat_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `opt_wechat_subscribe`;
CREATE TABLE `opt_wechat_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `channel` varchar(50) DEFAULT NULL COMMENT '渠道编号',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户微信openid',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户微信昵称',
  `sex` char(10) DEFAULT NULL COMMENT '性别',
  `attention_time` datetime DEFAULT NULL COMMENT '关注时间',
  `modif_time` datetime DEFAULT NULL COMMENT '修改时间',
  `city` varchar(100) DEFAULT NULL COMMENT '用户所在城市',
  `country` varchar(100) DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(100) DEFAULT NULL COMMENT '用户所在省份',
  `subscribe_scene` varchar(100) DEFAULT NULL COMMENT '用户关注的渠道来源，ADD_SCENE_SEARCH 公众号搜索，ADD_SCENE_ACCOUNT_MIGRATION 公众号迁移，ADD_SCENE_PROFILE_CARD 名片分享，ADD_SCENE_QR_CODE 扫描二维码，ADD_SCENEPROFILE LINK 图文页内名称点击，ADD_SCENE_PROFILE_ITEM 图文页右上角菜单，ADD_SCENE_PAID 支付后关注，ADD_SCENE_OTHERS 其他',
  `qr_scene` varchar(100) DEFAULT NULL COMMENT '二维码扫码场景（开发者自定义）',
  `qr_scene_str` varchar(100) DEFAULT NULL COMMENT '二维码扫码场景描述（开发者自定义）',
  `issubscribe` int(10) DEFAULT '0' COMMENT '是否关注  0：关注   1：取关',
  `appid` varchar(100) DEFAULT NULL COMMENT '公众号微信号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17206 DEFAULT CHARSET=utf8mb4 COMMENT='微信公众号关注记录表';

-- ----------------------------
-- Table structure for opt_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `opt_wechat_user`;
CREATE TABLE `opt_wechat_user` (
  `wx_openid` varchar(64) NOT NULL COMMENT '关注公众号的微信用户id',
  `area_country_code` varchar(8) DEFAULT '+86',
  `mobile_phone_number` varchar(20) DEFAULT NULL,
  `aes_phone` varchar(128) DEFAULT NULL COMMENT '手机号（加盐）的aes',
  `bind_datatime` datetime NOT NULL,
  PRIMARY KEY (`wx_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='绑定关系';

-- ----------------------------
-- Table structure for opt_wechat_user_copy202102071622
-- ----------------------------
DROP TABLE IF EXISTS `opt_wechat_user_copy202102071622`;
CREATE TABLE `opt_wechat_user_copy202102071622` (
  `wx_openid` varchar(64) NOT NULL COMMENT '关注公众号的微信用户id',
  `area_country_code` varchar(8) DEFAULT '+86',
  `mobile_phone_number` varchar(20) DEFAULT NULL,
  `aes_phone` varchar(128) DEFAULT NULL COMMENT '手机号（加盐）的aes',
  `bind_datatime` datetime NOT NULL,
  PRIMARY KEY (`wx_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='绑定关系';

-- ----------------------------
-- Table structure for opt_wechat_user_del
-- ----------------------------
DROP TABLE IF EXISTS `opt_wechat_user_del`;
CREATE TABLE `opt_wechat_user_del` (
  `wx_openid` varchar(64) NOT NULL COMMENT '关注公众号的微信用户id',
  `area_country_code` varchar(8) DEFAULT '+86',
  `mobile_phone_number` varchar(20) DEFAULT NULL,
  `aes_phone` varchar(128) DEFAULT NULL COMMENT '手机号（加密）的aes',
  `bind_datatime` datetime NOT NULL,
  `del` int(1) DEFAULT '1' COMMENT '1：表示已删除（默认） 0：表示未删除',
  PRIMARY KEY (`wx_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='解绑关系';

-- ----------------------------
-- Table structure for opt_wheel_disc_activity
-- ----------------------------
DROP TABLE IF EXISTS `opt_wheel_disc_activity`;
CREATE TABLE `opt_wheel_disc_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `activity_name` varchar(100) DEFAULT NULL COMMENT '活动名称',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `activity_url` varchar(255) DEFAULT NULL COMMENT '活动url',
  `over_time` datetime DEFAULT NULL COMMENT '截止时间',
  `describe1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `describe2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `button_name` varchar(20) DEFAULT NULL COMMENT '按钮名称',
  `is_valid` int(1) DEFAULT '0' COMMENT '是否有效 0有效  1无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='轮盘活动关联表';

-- ----------------------------
-- Table structure for opt_wheel_disc_record
-- ----------------------------
DROP TABLE IF EXISTS `opt_wheel_disc_record`;
CREATE TABLE `opt_wheel_disc_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `is_valid` int(2) DEFAULT '0' COMMENT '是否有效  0有效  1无效（奖励已发）',
  `use_time` datetime DEFAULT NULL COMMENT '本次机会使用时间，抽奖时间',
  `stock_id` int(11) DEFAULT NULL COMMENT '股票表主键id',
  `lottery_result` varchar(30) DEFAULT NULL COMMENT '抽奖获得的股票',
  `activity_id` varchar(100) DEFAULT NULL COMMENT '相关活动',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54011 DEFAULT CHARSET=utf8mb4 COMMENT='轮盘记录表';

-- ----------------------------
-- Table structure for opt_wheel_disc_stock
-- ----------------------------
DROP TABLE IF EXISTS `opt_wheel_disc_stock`;
CREATE TABLE `opt_wheel_disc_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `fun_of_sum` int(11) DEFAULT NULL COMMENT '轮盘对应的数字',
  `exchange` varchar(20) DEFAULT NULL COMMENT '市场',
  `stock_code` varchar(20) DEFAULT NULL COMMENT '股票代码',
  `stock_name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `final_award_rate` double NOT NULL COMMENT '终奖率',
  `pre_close_price` double DEFAULT NULL COMMENT '上一个交易日收盘价',
  `inventory` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `issued` int(11) NOT NULL DEFAULT '0' COMMENT '已发放数量',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '关联活动',
  `insert_time` datetime DEFAULT NULL COMMENT '添加时间',
  `is_enabled` int(1) DEFAULT '0' COMMENT '是否有效  0有效  1无效',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `angle` varchar(10) DEFAULT NULL COMMENT '角度，股票所在转盘上角度上限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COMMENT='轮盘活动股票列表';

-- ----------------------------
-- Table structure for optional_stock
-- ----------------------------
DROP TABLE IF EXISTS `optional_stock`;
CREATE TABLE `optional_stock` (
  `optional_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '自选ID',
  `user_id` int(8) NOT NULL COMMENT '用户id',
  `stock_id` int(8) DEFAULT NULL COMMENT '股票id',
  `seq_code` int(8) DEFAULT '0',
  `insert_time` bigint(8) DEFAULT NULL COMMENT '插入时间',
  `exchange` varchar(10) DEFAULT NULL COMMENT '交易市场SH上海SZ深圳 HK港股',
  `code` varchar(30) DEFAULT NULL COMMENT '股票代码',
  PRIMARY KEY (`optional_id`),
  KEY `optional_stock_userid` (`user_id`),
  KEY `optional_stockid` (`stock_id`),
  KEY `exchange_code_index` (`exchange`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3811759 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for optional_stock_bak_20201229
-- ----------------------------
DROP TABLE IF EXISTS `optional_stock_bak_20201229`;
CREATE TABLE `optional_stock_bak_20201229` (
  `optional_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '自选ID',
  `user_id` int(8) NOT NULL COMMENT '用户id',
  `stock_id` int(8) DEFAULT NULL COMMENT '股票id',
  `seq_code` int(8) DEFAULT '0',
  `insert_time` bigint(8) DEFAULT NULL COMMENT '插入时间',
  `exchange` varchar(10) DEFAULT NULL COMMENT '交易市场SH上海SZ深圳 HK港股',
  `code` varchar(30) DEFAULT NULL COMMENT '股票代码',
  PRIMARY KEY (`optional_id`),
  KEY `optional_stock_userid` (`user_id`),
  KEY `optional_stockid` (`stock_id`),
  KEY `exchange_code_index` (`exchange`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2712632 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for optional_stock_cancel
-- ----------------------------
DROP TABLE IF EXISTS `optional_stock_cancel`;
CREATE TABLE `optional_stock_cancel` (
  `optional_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '自选ID',
  `user_id` int(8) NOT NULL COMMENT '用户id',
  `stock_id` int(8) DEFAULT NULL COMMENT '股票id',
  `insert_time` bigint(8) DEFAULT NULL COMMENT '插入时间',
  `cancel_time` bigint(8) DEFAULT NULL COMMENT '删除时间',
  `exchange` varchar(10) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`optional_id`)
) ENGINE=InnoDB AUTO_INCREMENT=727183 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for optional_user_label
-- ----------------------------
DROP TABLE IF EXISTS `optional_user_label`;
CREATE TABLE `optional_user_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `label_json` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3608 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for pc_user_limit
-- ----------------------------
DROP TABLE IF EXISTS `pc_user_limit`;
CREATE TABLE `pc_user_limit` (
  `user_id` int(11) NOT NULL,
  `limit_count` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for pc_user_login
-- ----------------------------
DROP TABLE IF EXISTS `pc_user_login`;
CREATE TABLE `pc_user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) DEFAULT NULL,
  `imei` varchar(100) DEFAULT NULL COMMENT '设备号',
  `login_time` bigint(20) unsigned zerofill DEFAULT '00000000000000000000' COMMENT '录登时间',
  PRIMARY KEY (`id`),
  KEY `index_pc_userid` (`user_id`),
  KEY `index_pc_imei` (`imei`)
) ENGINE=InnoDB AUTO_INCREMENT=177622 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for platform_info
-- ----------------------------
DROP TABLE IF EXISTS `platform_info`;
CREATE TABLE `platform_info` (
  `platform` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`platform`),
  UNIQUE KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for prediction_summary
-- ----------------------------
DROP TABLE IF EXISTS `prediction_summary`;
CREATE TABLE `prediction_summary` (
  `user_id` int(8) unsigned NOT NULL,
  `correct_times` int(8) NOT NULL DEFAULT '0' COMMENT '赢取次数',
  `win_gold_coin` int(8) NOT NULL DEFAULT '0' COMMENT '赢取的金币数量',
  `prediction_period` char(6) NOT NULL COMMENT '预测的周期，201504表示2015第4周',
  `wrong_times` int(8) NOT NULL DEFAULT '0' COMMENT '猜错的次数',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '统计类型，1 表示周，2表示月，3表示季',
  PRIMARY KEY (`user_id`,`type`,`prediction_period`),
  CONSTRAINT `prediction_weekly_summary_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for problem_feedback
-- ----------------------------
DROP TABLE IF EXISTS `problem_feedback`;
CREATE TABLE `problem_feedback` (
  `problem_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `post_problemid` bigint(13) DEFAULT NULL,
  `content_type` int(8) DEFAULT NULL,
  `problem_content` mediumtext CHARACTER SET utf8mb4,
  `post_time` bigint(20) DEFAULT NULL,
  `customerservice_id` int(11) DEFAULT NULL,
  `feedback_content` mediumtext CHARACTER SET utf8mb4,
  `feedback_time` bigint(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `user_id` int(8) unsigned NOT NULL,
  `flag` int(8) DEFAULT '0' COMMENT '0  终端未读回复   1 终端已读回复',
  `trader` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'ȯ??????',
  `verion_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'app?汾????',
  PRIMARY KEY (`problem_id`),
  KEY `fk_problem_feedback_userid` (`user_id`),
  KEY `fk_problem_feedback_status` (`status`),
  CONSTRAINT `fk_problem_feedback_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1492 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question_statistics
-- ----------------------------
DROP TABLE IF EXISTS `question_statistics`;
CREATE TABLE `question_statistics` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `step` int(5) DEFAULT NULL COMMENT '答题步数',
  `quest1` varchar(60) DEFAULT NULL,
  `quest2` varchar(60) DEFAULT NULL,
  `quest3` varchar(60) DEFAULT NULL,
  `quest4` varchar(60) DEFAULT NULL,
  `quest5` varchar(60) DEFAULT NULL,
  `quest6` varchar(60) DEFAULT NULL,
  `quest7` varchar(60) DEFAULT NULL,
  `quest8` varchar(500) DEFAULT NULL,
  `quest9` varchar(500) DEFAULT NULL,
  `quest10` varchar(500) DEFAULT NULL,
  `quest11` varchar(500) DEFAULT NULL,
  `quest12` varchar(500) DEFAULT NULL,
  `quest13` varchar(500) DEFAULT NULL,
  `quest14` varchar(60) DEFAULT NULL,
  `used_time` varchar(10) DEFAULT NULL COMMENT '用时',
  `funds_account` varbinary(10) DEFAULT NULL COMMENT '资金账号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for report_at_level2_detail
-- ----------------------------
DROP TABLE IF EXISTS `report_at_level2_detail`;
CREATE TABLE `report_at_level2_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(128) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_id_md5` varchar(32) DEFAULT NULL COMMENT 'md5后userid',
  `effective_sdate` date DEFAULT NULL COMMENT '有效开始时间',
  `effective_edate` date DEFAULT NULL COMMENT '有效结束时间',
  `report_sdate` datetime DEFAULT NULL COMMENT '上报开始时间',
  `report_edate` datetime DEFAULT NULL COMMENT '上报结束时间',
  `report_status` varchar(2) DEFAULT NULL COMMENT '0-待报 1-已报 2-关闭',
  `report_date` date DEFAULT NULL COMMENT '当前需上报时间',
  `insert_date` datetime DEFAULT NULL COMMENT '系统更新时间',
  `version` varchar(10) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_union_unique` (`trade_no`,`user_id`,`report_sdate`) USING BTREE COMMENT '去重索引',
  KEY `insert_date` (`insert_date`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157449 DEFAULT CHARSET=utf8mb4 COMMENT='AT上报数据详情表';

-- ----------------------------
-- Table structure for search_subscription
-- ----------------------------
DROP TABLE IF EXISTS `search_subscription`;
CREATE TABLE `search_subscription` (
  `sub_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `email` varchar(100) NOT NULL COMMENT '订阅邮箱',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '1订阅状态 0 取消订阅的状态',
  `sub_time` datetime DEFAULT NULL COMMENT '订阅时间',
  `unsub_time` datetime DEFAULT NULL COMMENT '取消订阅时间',
  `source` varchar(2) DEFAULT NULL COMMENT '订阅来源A/B',
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for section_ip
-- ----------------------------
DROP TABLE IF EXISTS `section_ip`;
CREATE TABLE `section_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_ip` bigint(20) DEFAULT NULL COMMENT 'IP的开始号段',
  `end_ip` bigint(20) DEFAULT NULL COMMENT 'ip的结束号段 ip去掉中间点，每个段不足3位用0补齐',
  `addr` varchar(500) DEFAULT NULL COMMENT 'IP段代表的地址',
  `sign_num` int(11) DEFAULT NULL COMMENT '1：大陆 2：香港 3：澳门 4:台湾 5：美国 6:新加坡 7：泰国 8:日本 9：亚太 10:印度',
  `state` varchar(50) DEFAULT NULL COMMENT '州',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省',
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `dimension` varchar(50) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `signIndex` (`sign_num`),
  KEY `ipIndex` (`start_ip`) USING BTREE,
  KEY `endIpIndex` (`end_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=442423 DEFAULT CHARSET=utf8mb4 COMMENT='ip地理位置';

-- ----------------------------
-- Table structure for security_adapter
-- ----------------------------
DROP TABLE IF EXISTS `security_adapter`;
CREATE TABLE `security_adapter` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `adapter_name` varchar(30) DEFAULT NULL COMMENT '名称',
  `trade_adapter` varchar(50) DEFAULT NULL COMMENT '实盘代码',
  `logo_url` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `selected_name` varchar(100) DEFAULT NULL,
  `security_type` int(8) DEFAULT NULL COMMENT '证券类型：1模拟盘 2实盘',
  PRIMARY KEY (`id`),
  KEY `trade_adapter_index1` (`trade_adapter`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for service_advisor
-- ----------------------------
DROP TABLE IF EXISTS `service_advisor`;
CREATE TABLE `service_advisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advisor_name` varchar(255) DEFAULT NULL,
  `advisor_name_en` varchar(255) DEFAULT NULL,
  `cdn_url` varchar(255) DEFAULT NULL,
  `md5` varchar(255) DEFAULT NULL,
  `qr_code_url` varchar(255) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `upload_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sh_area
-- ----------------------------
DROP TABLE IF EXISTS `sh_area`;
CREATE TABLE `sh_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `merger_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3750 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sms_receipt
-- ----------------------------
DROP TABLE IF EXISTS `sms_receipt`;
CREATE TABLE `sms_receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msgId` varchar(100) DEFAULT NULL COMMENT '短信渠道序列号',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号',
  `recv_time` datetime DEFAULT NULL COMMENT '接收时间',
  `recv_status` varchar(10) DEFAULT NULL COMMENT '发送状态码',
  `recv_info` varchar(100) DEFAULT NULL COMMENT '返回错误描述',
  `send_channel` varchar(10) DEFAULT NULL COMMENT '发送通道',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139724 DEFAULT CHARSET=utf8mb4 COMMENT='短信回执';

-- ----------------------------
-- Table structure for sms_result
-- ----------------------------
DROP TABLE IF EXISTS `sms_result`;
CREATE TABLE `sms_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号',
  `content` varchar(1000) DEFAULT NULL COMMENT '发送内容',
  `msgId` varchar(100) DEFAULT NULL COMMENT '通道返回的发送序列号',
  `send_status` varchar(10) DEFAULT NULL COMMENT '发送状态码',
  `send_info` varchar(200) DEFAULT NULL COMMENT '通道返回描述',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_channel` varchar(10) DEFAULT NULL COMMENT '发送通道  santo:闪通 mcwx:名传无线 readLetter:阅信   harmony和佳',
  PRIMARY KEY (`id`),
  KEY `time_index` (`send_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3476812 DEFAULT CHARSET=utf8mb4 COMMENT='短信发送结果';

-- ----------------------------
-- Table structure for stock_daily
-- ----------------------------
DROP TABLE IF EXISTS `stock_daily`;
CREATE TABLE `stock_daily` (
  `daily_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stock_id` int(11) NOT NULL COMMENT 'stock_info.stock_id',
  `trade_date` varchar(10) NOT NULL COMMENT '交易日期',
  `lclose` float(10,4) DEFAULT NULL COMMENT '昨日收盘',
  `open` float(10,4) DEFAULT NULL COMMENT '开盘价',
  `high` float(10,4) DEFAULT NULL COMMENT '最高价',
  `low` float(10,4) DEFAULT NULL COMMENT '最低价',
  `close` float(10,4) DEFAULT NULL COMMENT '收盘价',
  `trades` bigint(15) DEFAULT NULL COMMENT '成交笔数',
  `vol` bigint(15) DEFAULT NULL COMMENT '成交量',
  `turnover` double(17,2) DEFAULT NULL COMMENT '总金额',
  `avg5` float(10,4) DEFAULT NULL COMMENT '5日均线',
  `avg10` float(10,4) DEFAULT NULL COMMENT '10日均线',
  `avg20` float(10,4) DEFAULT NULL COMMENT '20日均线',
  `avg30` float(10,4) DEFAULT NULL COMMENT '30日均线',
  `avg60` float(10,4) DEFAULT NULL COMMENT '60日均线',
  `avg120` float(10,4) DEFAULT NULL COMMENT '120日均线',
  `avg250` float(10,4) DEFAULT NULL COMMENT '250日均线',
  `restore_price` float(10,4) DEFAULT NULL COMMENT '复权价',
  PRIMARY KEY (`daily_id`),
  KEY `stock_daily_stockid` (`stock_id`),
  KEY `stock_daily_date` (`trade_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock_early_warning
-- ----------------------------
DROP TABLE IF EXISTS `stock_early_warning`;
CREATE TABLE `stock_early_warning` (
  `user_id` int(8) NOT NULL,
  `exchange` varchar(10) CHARACTER SET utf8 NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `breaking_news_isremind` char(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`user_id`,`exchange`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_early_warning_detail
-- ----------------------------
DROP TABLE IF EXISTS `stock_early_warning_detail`;
CREATE TABLE `stock_early_warning_detail` (
  `user_id` int(8) NOT NULL,
  `exchange` varchar(10) CHARACTER SET utf8 NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `alert_type` char(1) CHARACTER SET utf8 NOT NULL,
  `alert_data` double(10,3) DEFAULT NULL,
  `alert_flag` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `frequency_id` int(8) DEFAULT NULL,
  `remind_date` int(8) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`exchange`,`code`,`alert_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_early_warning_frequency
-- ----------------------------
DROP TABLE IF EXISTS `stock_early_warning_frequency`;
CREATE TABLE `stock_early_warning_frequency` (
  `frequency_id` int(8) NOT NULL,
  `frequency_name` varchar(50) NOT NULL,
  `frequency_desc` varchar(200) DEFAULT NULL,
  `frequency_name_en` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `frequency_desc_en` varchar(500) DEFAULT NULL COMMENT '英文描述',
  PRIMARY KEY (`frequency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_index_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_index_info`;
CREATE TABLE `stock_index_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `exchange` char(4) DEFAULT NULL COMMENT '指数exchange',
  `code` varchar(10) DEFAULT NULL COMMENT '指数code',
  `avg_shares` int(11) DEFAULT NULL COMMENT '平均总股本',
  `base_shares` int(11) DEFAULT NULL COMMENT '基期总股本',
  `base_point` double(10,2) DEFAULT NULL COMMENT '基期点数',
  `stock_id` int(11) DEFAULT NULL COMMENT '股票id 同stock_info表stock_id',
  `name` varchar(10) DEFAULT '' COMMENT '股票名称',
  `is_yellowline` int(11) DEFAULT '1' COMMENT '是否画黄线,0否1是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

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
-- Table structure for stock_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_info`;
CREATE TABLE `stock_info` (
  `stock_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `exchange` varchar(10) NOT NULL COMMENT '交易市场',
  `code` varchar(30) NOT NULL COMMENT '编码',
  `name` varchar(500) NOT NULL COMMENT '名称',
  `short_name` varchar(100) DEFAULT NULL COMMENT '股票首字母',
  `english_name` varchar(1000) DEFAULT NULL COMMENT '英文名称',
  `traditional_name` varchar(500) DEFAULT NULL COMMENT '繁体字名称',
  `tshares` float(20,4) DEFAULT NULL COMMENT '总股本',
  `mshares` float(20,4) DEFAULT NULL COMMENT '流通股本',
  `is_suspend` char(1) DEFAULT NULL COMMENT '停牌 0 否 1是',
  `is_st` char(1) DEFAULT NULL COMMENT '0 不是st 1 是',
  `net_assets` float(20,4) DEFAULT NULL COMMENT '净值',
  `type` char(1) DEFAULT NULL COMMENT 'A股票 F基金 I指数  Z债券 Y衍生品',
  `is_delist` char(1) DEFAULT NULL COMMENT '是否退市 0否 1是',
  `listed_time` varchar(10) DEFAULT NULL COMMENT '上市时间',
  `delist_time` varchar(10) DEFAULT NULL COMMENT '退市时间',
  `eps` float(15,4) DEFAULT NULL COMMENT '每股收益(摊薄)',
  `report_quarter` int(1) DEFAULT NULL COMMENT '报告季度',
  `report_year` int(4) DEFAULT NULL COMMENT '报告年份',
  `roe` float(15,4) DEFAULT NULL,
  `suspend_date` varchar(19) DEFAULT NULL COMMENT '停牌时间',
  `suspend_reason` varchar(300) DEFAULT NULL COMMENT '??ͣԭ??',
  `is_warning` char(1) DEFAULT NULL COMMENT '???з???0?? 1??',
  `warnining_reason` varchar(300) DEFAULT NULL COMMENT '????ԭ??',
  `lclose` float(10,4) DEFAULT NULL COMMENT '???ռ?',
  `listed_sector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上市板块 上市板块 1:主板 2:创业板',
  `trading_unit` double DEFAULT NULL COMMENT '买卖单位（每手股数）',
  `cash_dividend_ps` double DEFAULT NULL COMMENT '股息',
  `stk_connect` int(11) DEFAULT NULL COMMENT 'exchange=HKEX 1沪港通 2 深港通 3 深港和沪港都通;exchange=SESH 1港沪通;exchange=SESZ 1港深通;',
  `country` varchar(20) DEFAULT NULL COMMENT '国家',
  `continent` varchar(50) DEFAULT NULL COMMENT '洲',
  `spreadtablecode` varchar(2) DEFAULT NULL COMMENT '港股分类 01:A类 03:B类',
  PRIMARY KEY (`stock_id`),
  UNIQUE KEY `stock_identity_index` (`exchange`,`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=719948 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock_month
-- ----------------------------
DROP TABLE IF EXISTS `stock_month`;
CREATE TABLE `stock_month` (
  `month_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stock_id` int(11) NOT NULL COMMENT 'stock_info.stock_id',
  `trade_date` varchar(10) NOT NULL COMMENT '交易日期',
  `lclose` float(10,4) DEFAULT NULL COMMENT '昨日收盘',
  `open` float(10,4) DEFAULT NULL COMMENT '开盘价',
  `high` float(10,4) DEFAULT NULL COMMENT '最高价',
  `low` float(10,4) DEFAULT NULL COMMENT '最低价',
  `close` float(10,4) DEFAULT NULL COMMENT '收盘价',
  `trades` bigint(15) DEFAULT NULL COMMENT '成交笔数',
  `vol` bigint(15) DEFAULT NULL COMMENT '成交量',
  `turnover` double(17,2) DEFAULT NULL COMMENT '总金额',
  `date_flag` int(11) DEFAULT NULL COMMENT '日期标识，哪天哪周哪月',
  `avg5` float(10,4) DEFAULT NULL COMMENT '5日均线',
  `avg10` float(10,4) DEFAULT NULL COMMENT '10日均线',
  `avg20` float(10,4) DEFAULT NULL COMMENT '20日均线',
  `avg30` float(10,4) DEFAULT NULL COMMENT '30日均线',
  `avg60` float(10,4) DEFAULT NULL COMMENT '60日均线',
  `avg120` float(10,4) DEFAULT NULL COMMENT '120日均线',
  `avg250` float(10,4) DEFAULT NULL COMMENT '250日均线',
  PRIMARY KEY (`month_id`),
  KEY `stock_month_stockid` (`stock_id`),
  KEY `stock_month_date` (`trade_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock_trading_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_trading_info`;
CREATE TABLE `stock_trading_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(16) NOT NULL COMMENT '资金账号',
  `code` varchar(30) NOT NULL COMMENT '编码',
  `orderqty` int(20) DEFAULT NULL COMMENT '委托股数',
  `curr_exec_qty` int(20) DEFAULT NULL COMMENT '本次成交股数',
  `bs_flag` int(2) DEFAULT NULL COMMENT '买卖标记 1 买入  2 卖出',
  `price` decimal(10,4) DEFAULT NULL COMMENT '价格',
  `insert_date_time` datetime DEFAULT NULL COMMENT '数据录入时间',
  `order_date_time` datetime DEFAULT NULL COMMENT '订单时间',
  PRIMARY KEY (`id`),
  KEY `user_index` (`funds_account`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12937974 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_warrants_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_warrants_info`;
CREATE TABLE `stock_warrants_info` (
  `exchange` varchar(50) NOT NULL DEFAULT '' COMMENT '交易市场',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '券证名称',
  `warrant_type` int(11) DEFAULT NULL COMMENT '权证类型 1：窝轮证;2:牛熊证',
  `warrant_character` int(11) DEFAULT NULL COMMENT '权证性质 1-认购，2-认沽，3-牛证，4-熊证，5-其他',
  `issuer` varchar(200) DEFAULT NULL COMMENT '发行人',
  `issuer_abbr` varchar(100) DEFAULT NULL COMMENT '发行人简称',
  `issuer_sn` int(11) DEFAULT NULL COMMENT '发行人编号',
  `isstock_code` varchar(10) DEFAULT NULL COMMENT '正股code',
  `premium` decimal(18,8) DEFAULT NULL COMMENT '溢价',
  `strike` decimal(18,3) DEFAULT NULL COMMENT '行权价',
  `implied_volatility` decimal(18,8) DEFAULT NULL COMMENT '引申波幅',
  `conversion_ratio` decimal(18,10) DEFAULT NULL COMMENT '换股比例',
  `leverage_ratio` decimal(18,8) DEFAULT NULL COMMENT '有效杠杆',
  `effective_gearing` decimal(18,8) DEFAULT NULL COMMENT '有效杠杆比例',
  `min_trade_size` int(11) DEFAULT NULL COMMENT '每手',
  `issue_vol` decimal(18,2) DEFAULT NULL COMMENT '发行数量',
  `still_out_no` decimal(18,2) DEFAULT NULL COMMENT '街货数量',
  `perc_of_still_out` decimal(18,2) DEFAULT NULL COMMENT '街货比',
  `last_trade_day` int(11) DEFAULT NULL COMMENT '最后交易日',
  `maturity_date` int(11) DEFAULT NULL COMMENT '到期日',
  `recovery_level` decimal(18,3) DEFAULT NULL COMMENT '收回水平',
  `p_str_price` varchar(10) DEFAULT NULL COMMENT '收回价',
  `break_even_price` varchar(10) DEFAULT NULL COMMENT '打和点',
  `trade_day` int(11) DEFAULT NULL COMMENT '交易日',
  `english_name` varchar(150) DEFAULT NULL,
  `issuer_engname` varchar(150) DEFAULT NULL COMMENT '发行人英文名',
  PRIMARY KEY (`exchange`,`code`),
  KEY `isstockcode` (`isstock_code`),
  KEY `code` (`code`),
  KEY `idx_maturity_date` (`maturity_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权证信息表';

-- ----------------------------
-- Table structure for stock_week
-- ----------------------------
DROP TABLE IF EXISTS `stock_week`;
CREATE TABLE `stock_week` (
  `week_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stock_id` int(11) NOT NULL COMMENT 'stock_info.stock_id',
  `trade_date` varchar(10) NOT NULL COMMENT '交易日期',
  `lclose` float(10,4) DEFAULT NULL COMMENT '昨日收盘',
  `open` float(10,4) DEFAULT NULL COMMENT '开盘价',
  `high` float(10,4) DEFAULT NULL COMMENT '最高价',
  `low` float(10,4) DEFAULT NULL COMMENT '最低价',
  `close` float(10,4) DEFAULT NULL COMMENT '收盘价',
  `trades` bigint(15) DEFAULT NULL COMMENT '成交笔数',
  `vol` bigint(15) DEFAULT NULL COMMENT '成交量',
  `turnover` double(17,2) DEFAULT NULL COMMENT '总金额',
  `date_flag` int(11) DEFAULT NULL COMMENT '日期标识，哪天哪周哪月',
  `avg5` float(10,4) DEFAULT NULL COMMENT '5日均线',
  `avg10` float(10,4) DEFAULT NULL COMMENT '10日均线',
  `avg20` float(10,4) DEFAULT NULL COMMENT '20日均线',
  `avg30` float(10,4) DEFAULT NULL COMMENT '30日均线',
  `avg60` float(10,4) DEFAULT NULL COMMENT '60日均线',
  `avg120` float(10,4) DEFAULT NULL COMMENT '120日均线',
  `avg250` float(10,4) DEFAULT NULL COMMENT '250日均线',
  PRIMARY KEY (`week_id`),
  KEY `stock_week_stockid` (`stock_id`),
  KEY `stock_week_date` (`trade_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(1000) DEFAULT NULL COMMENT '属性值',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `flag` int(11) DEFAULT NULL COMMENT '0无效 1有效',
  `value_us` varchar(1000) DEFAULT NULL COMMENT 'value英文值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tencent_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `tencent_qrcode`;
CREATE TABLE `tencent_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_code` varchar(255) DEFAULT NULL,
  `inset_date` datetime DEFAULT NULL,
  `is_perpetual` int(11) DEFAULT NULL,
  `tencent_url` varchar(255) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for third_user_info
-- ----------------------------
DROP TABLE IF EXISTS `third_user_info`;
CREATE TABLE `third_user_info` (
  `uid` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'user表中username',
  `screen_name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '友好显示名称',
  `province` int(11) DEFAULT NULL COMMENT '用户所在省级ID',
  `city` int(11) DEFAULT NULL COMMENT '用户所在城市ID',
  `location` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在地',
  `description` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户个人描述',
  `profile_image_url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '50*50微博头像或者40*40qq头像',
  `profile_url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户的微博统一URL地址',
  `gender` char(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别，m：男、f：女、n：未知',
  `followers_count` int(11) DEFAULT NULL COMMENT '粉丝数',
  `friends_count` int(11) DEFAULT NULL COMMENT '关注数',
  `statuses_count` int(11) DEFAULT NULL COMMENT '微博数',
  `created_at` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户创建（注册）时间',
  `avatar_large` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '180*180微博头像或者100*100qq头像',
  `user_id` int(8) unsigned DEFAULT NULL COMMENT '用户的ID，和user表的user_id关联',
  `verified` int(8) DEFAULT '0' COMMENT '是否是微博认证 0否 1是',
  `verified_reason` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证原因',
  PRIMARY KEY (`uid`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trade_list_info
-- ----------------------------
DROP TABLE IF EXISTS `trade_list_info`;
CREATE TABLE `trade_list_info` (
  `trade_id` int(8) NOT NULL AUTO_INCREMENT,
  `trade_name` varchar(300) DEFAULT NULL,
  `trade_adapter` varchar(150) DEFAULT NULL,
  `icon_url` varchar(600) DEFAULT NULL,
  `trade_uri` varchar(1500) DEFAULT NULL,
  `pms_uri` varchar(1500) DEFAULT NULL,
  `openaccount_url` varchar(1500) DEFAULT NULL COMMENT '开户url地址',
  `selected_name` varchar(30) DEFAULT NULL COMMENT '显示名称',
  `se_type` tinyint(4) DEFAULT NULL COMMENT '市场类型：1A股，2港股，3美股',
  `opt_type` tinyint(4) DEFAULT NULL COMMENT '1:实盘，2：模拟',
  `list_visible` varchar(6) DEFAULT NULL,
  `group_name` varchar(30) DEFAULT NULL,
  `priority` int(8) DEFAULT NULL COMMENT '优先级',
  `borrow_name` varchar(300) DEFAULT NULL COMMENT '融资融券账户名称',
  `security_available` int(8) DEFAULT NULL,
  `usable` varchar(6) DEFAULT '1' COMMENT '1可点 0 不可以',
  `english_name` varchar(150) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`trade_id`),
  KEY `tradeAdapter` (`trade_adapter`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trader_appid
-- ----------------------------
DROP TABLE IF EXISTS `trader_appid`;
CREATE TABLE `trader_appid` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `trader` varchar(100) DEFAULT NULL COMMENT '券商版本',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型, 同user表用户类型',
  `platform` varchar(100) DEFAULT NULL COMMENT '平台',
  `appid` varchar(100) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trader_info
-- ----------------------------
DROP TABLE IF EXISTS `trader_info`;
CREATE TABLE `trader_info` (
  `trader` varchar(100) NOT NULL COMMENT '券商版本',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `uploading_time` datetime DEFAULT NULL COMMENT '上传时间',
  `uploader` varchar(50) DEFAULT NULL COMMENT '上传者',
  PRIMARY KEY (`trader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trader_push_info
-- ----------------------------
DROP TABLE IF EXISTS `trader_push_info`;
CREATE TABLE `trader_push_info` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `trader` varchar(100) NOT NULL COMMENT '券商版本',
  `platform` varchar(30) DEFAULT NULL COMMENT '平台型号',
  `access_id` varchar(100) DEFAULT NULL COMMENT 'access_id',
  `access_key` varchar(100) DEFAULT NULL COMMENT 'access_key',
  `secret_key` varchar(100) DEFAULT NULL COMMENT 'secret_key',
  `env` varchar(10) DEFAULT NULL COMMENT 'ios环境，1：线上 2：测试',
  `title` varchar(100) DEFAULT NULL COMMENT '推送标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trader_sms_info
-- ----------------------------
DROP TABLE IF EXISTS `trader_sms_info`;
CREATE TABLE `trader_sms_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trader` varchar(100) DEFAULT NULL COMMENT '券商类型',
  `info_type` int(11) DEFAULT NULL,
  `valid_time` int(100) DEFAULT '10' COMMENT '有效时间，单位,分钟',
  `smscontent` text COMMENT '短信内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trader_sms_type
-- ----------------------------
DROP TABLE IF EXISTS `trader_sms_type`;
CREATE TABLE `trader_sms_type` (
  `info_type` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 主键ID',
  `info_desc` varchar(400) DEFAULT NULL COMMENT '短信类型描述：注册，忘记密码，绑定手机号（完善个人信息)，实盘开户，实盘登陆绑定手机号',
  PRIMARY KEY (`info_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for us_opt_symbol_info
-- ----------------------------
DROP TABLE IF EXISTS `us_opt_symbol_info`;
CREATE TABLE `us_opt_symbol_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exchange` char(4) CHARACTER SET utf8 NOT NULL DEFAULT 'NYSE' COMMENT '合约市场，目前使用默认值NYSE',
  `code` varchar(50) NOT NULL COMMENT '合约代码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `underlying_exchange` varchar(20) NOT NULL COMMENT '标的股的交易所',
  `underlying` varchar(20) NOT NULL COMMENT '标的股代码',
  `expiration_date` date NOT NULL COMMENT '到期日',
  `expiration_type` varchar(20) NOT NULL COMMENT '周期类型: quarterly,monthly,weekly',
  `strike` decimal(12,2) NOT NULL COMMENT '行权价',
  `type` varchar(20) NOT NULL COMMENT '类型　：　OPT',
  `sub_type` varchar(20) NOT NULL COMMENT '子类型：　Call | Put',
  `open_interest` int(11) DEFAULT NULL COMMENT '未平仓数',
  `lclose` decimal(12,3) DEFAULT NULL COMMENT '昨收价',
  `multiple` int(11) DEFAULT '100' COMMENT '合约乘数（每张代表的标的股数）',
  `underlying_price_factor` float DEFAULT '1' COMMENT '标的价格的乘数因子',
  `is_old` int(11) DEFAULT '0' COMMENT '1 是旧代码　０不是',
  `lot_size` int(11) DEFAULT '100' COMMENT '最小交易数量',
  `tick_type` varchar(50) DEFAULT NULL COMMENT 'tick类型，影响最小价格变动',
  `option_type` varchar(10) DEFAULT 'A' COMMENT 'A:美式  E:欧式',
  `hub_date` date NOT NULL COMMENT '抓取时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `underlying_index` (`underlying`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148376522 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for us_shareipo
-- ----------------------------
DROP TABLE IF EXISTS `us_shareipo`;
CREATE TABLE `us_shareipo` (
  `code` varchar(10) NOT NULL COMMENT '股票代码',
  `exchange` varchar(10) DEFAULT NULL COMMENT '交易所',
  `name` varchar(200) DEFAULT NULL COMMENT '股票名称',
  `company_cnname` varchar(200) DEFAULT NULL,
  `company_engname` varchar(200) DEFAULT NULL,
  `tshares` int(11) DEFAULT NULL COMMENT '总股本',
  `shares_offered` int(11) DEFAULT NULL COMMENT '公开发售新股股数',
  `total_amount` double DEFAULT NULL COMMENT '总市值',
  `ipoprice_low` decimal(18,4) DEFAULT NULL COMMENT '每股最低价',
  `ipoprice_high` decimal(18,4) DEFAULT NULL COMMENT '每股最高价',
  `ipoprice` decimal(18,4) DEFAULT NULL COMMENT '发行价',
  `ipo_date` date DEFAULT NULL COMMENT '预计上市日',
  `least_buy` int(11) DEFAULT NULL COMMENT '最低认购数',
  `least_amount` decimal(19,4) DEFAULT NULL COMMENT '最低认购金额',
  `applystartdate` date DEFAULT NULL COMMENT '申购起始日',
  `issueenddate` datetime DEFAULT NULL COMMENT '发行截止日',
  `issueresultpubldate` date DEFAULT NULL COMMENT '中签结果公告日',
  `prospectus_url` varchar(200) DEFAULT NULL COMMENT '招股说明书网址',
  `bookrunner` varchar(500) DEFAULT NULL COMMENT '承销商',
  `issue_status` int(11) DEFAULT '1' COMMENT '发行状态 1:正常 -1 失败',
  `allow_apply_flag` int(11) DEFAULT '0' COMMENT '是否允许申购 1:允许 0:不许',
  `createtime` datetime DEFAULT NULL COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_password` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `photo_url` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `photo_md5` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `user_level` int(8) unsigned NOT NULL DEFAULT '1',
  `last_login_device_imei` char(15) CHARACTER SET utf8 DEFAULT '',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '86表示中国大陆；852表示中国香港；001表示美国',
  `mobile_phone_number` char(20) CHARACTER SET utf8 DEFAULT '',
  `email` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_type` smallint(1) NOT NULL DEFAULT '1',
  `gender` smallint(1) DEFAULT '0',
  `phone_verify_code` char(6) CHARACTER SET utf8 DEFAULT NULL,
  `verify_code_timestamp` bigint(8) DEFAULT NULL,
  `user_state` smallint(1) NOT NULL DEFAULT '1',
  `three_part_token` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` bigint(8) DEFAULT NULL,
  `stock_age` smallint(1) DEFAULT NULL,
  `follow_user_count` int(11) NOT NULL DEFAULT '0',
  `followed_user_count` int(11) NOT NULL DEFAULT '0',
  `available_gold_coin` int(10) NOT NULL DEFAULT '0' COMMENT '用户拥有的金币数量',
  `imei` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户对应的imei',
  `monthly_prediction_gold_coin` int(10) NOT NULL DEFAULT '0',
  `is_followed` int(11) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `channel_open` varchar(255) DEFAULT NULL COMMENT '注册渠道码',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `is_auto_payment` varchar(2) DEFAULT NULL COMMENT '1 开启金账户自动续费  其他情况关闭',
  `is_gold_account_take_effect` varchar(2) DEFAULT NULL COMMENT '金账号是否生效中  1生效  其他情况失败',
  `register_area` varchar(30) DEFAULT 'HKG' COMMENT '原始注册地区（目前只有两个注册地香港HKG，美国USA）',
  `register_ip` varchar(30) DEFAULT NULL COMMENT '原始注册时IP地址',
  `phone_valid` int(1) NOT NULL DEFAULT '0' COMMENT '当前手机号是否为有效手机号 0 已校验有效 1未校验',
  PRIMARY KEY (`user_id`),
  KEY `user_imei` (`imei`),
  KEY `user_type_index1` (`user_type`),
  KEY `mobile_phone_number` (`mobile_phone_number`),
  KEY `index3` (`user_name`) USING BTREE,
  KEY `funds_account_index1` (`funds_account`)
) ENGINE=InnoDB AUTO_INCREMENT=453585 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_advisor_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_advisor_relation`;
CREATE TABLE `user_advisor_relation` (
  `user_id` int(8) unsigned NOT NULL COMMENT '用户id',
  `advisor_id` int(8) DEFAULT NULL COMMENT '客服id',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `fk_advisor_id` (`advisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_bak_20200628
-- ----------------------------
DROP TABLE IF EXISTS `user_bak_20200628`;
CREATE TABLE `user_bak_20200628` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_password` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `photo_url` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `photo_md5` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `user_level` int(8) unsigned NOT NULL DEFAULT '1',
  `last_login_device_imei` char(15) CHARACTER SET utf8 DEFAULT '',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '86表示中国大陆；852表示中国香港；001表示美国',
  `mobile_phone_number` char(20) CHARACTER SET utf8 DEFAULT '',
  `email` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_type` smallint(1) NOT NULL DEFAULT '1',
  `gender` smallint(1) DEFAULT '0',
  `phone_verify_code` char(6) CHARACTER SET utf8 DEFAULT NULL,
  `verify_code_timestamp` bigint(8) DEFAULT NULL,
  `user_state` smallint(1) NOT NULL DEFAULT '1',
  `three_part_token` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` bigint(8) DEFAULT NULL,
  `stock_age` smallint(1) DEFAULT NULL,
  `follow_user_count` int(11) NOT NULL DEFAULT '0',
  `followed_user_count` int(11) NOT NULL DEFAULT '0',
  `available_gold_coin` int(10) NOT NULL DEFAULT '0' COMMENT '用户拥有的金币数量',
  `imei` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户对应的imei',
  `monthly_prediction_gold_coin` int(10) NOT NULL DEFAULT '0',
  `is_followed` int(11) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `channel_open` varchar(38) DEFAULT NULL COMMENT '注册渠道码',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `is_auto_payment` varchar(2) DEFAULT NULL COMMENT '1 开启金账户自动续费  其他情况关闭',
  `is_gold_account_take_effect` varchar(2) DEFAULT NULL COMMENT '金账号是否生效中  1生效  其他情况失败',
  `register_area` varchar(30) DEFAULT 'HKG' COMMENT '原始注册地区（目前只有两个注册地香港HKG，美国USA）',
  `register_ip` varchar(30) DEFAULT NULL COMMENT '原始注册时IP地址',
  PRIMARY KEY (`user_id`),
  KEY `user_imei` (`imei`),
  KEY `user_type_index1` (`user_type`),
  KEY `mobile_phone_number` (`mobile_phone_number`),
  KEY `index3` (`user_name`) USING BTREE,
  KEY `funds_account_index1` (`funds_account`)
) ENGINE=InnoDB AUTO_INCREMENT=374561 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_bak_20210316
-- ----------------------------
DROP TABLE IF EXISTS `user_bak_20210316`;
CREATE TABLE `user_bak_20210316` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_password` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `photo_url` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `photo_md5` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `user_level` int(8) unsigned NOT NULL DEFAULT '1',
  `last_login_device_imei` char(15) CHARACTER SET utf8 DEFAULT '',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '86表示中国大陆；852表示中国香港；001表示美国',
  `mobile_phone_number` char(20) CHARACTER SET utf8 DEFAULT '',
  `email` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_type` smallint(1) NOT NULL DEFAULT '1',
  `gender` smallint(1) DEFAULT '0',
  `phone_verify_code` char(6) CHARACTER SET utf8 DEFAULT NULL,
  `verify_code_timestamp` bigint(8) DEFAULT NULL,
  `user_state` smallint(1) NOT NULL DEFAULT '1',
  `three_part_token` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` bigint(8) DEFAULT NULL,
  `stock_age` smallint(1) DEFAULT NULL,
  `follow_user_count` int(11) NOT NULL DEFAULT '0',
  `followed_user_count` int(11) NOT NULL DEFAULT '0',
  `available_gold_coin` int(10) NOT NULL DEFAULT '0' COMMENT '用户拥有的金币数量',
  `imei` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户对应的imei',
  `monthly_prediction_gold_coin` int(10) NOT NULL DEFAULT '0',
  `is_followed` int(11) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `channel_open` varchar(38) DEFAULT NULL COMMENT '注册渠道码',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `is_auto_payment` varchar(2) DEFAULT NULL COMMENT '1 开启金账户自动续费  其他情况关闭',
  `is_gold_account_take_effect` varchar(2) DEFAULT NULL COMMENT '金账号是否生效中  1生效  其他情况失败',
  `register_area` varchar(30) DEFAULT 'HKG' COMMENT '原始注册地区（目前只有两个注册地香港HKG，美国USA）',
  `register_ip` varchar(30) DEFAULT NULL COMMENT '原始注册时IP地址',
  `phone_valid` int(1) NOT NULL DEFAULT '0' COMMENT '当前手机号是否为有效手机号 0 已校验有效 1未校验',
  PRIMARY KEY (`user_id`),
  KEY `user_imei` (`imei`),
  KEY `user_type_index1` (`user_type`),
  KEY `mobile_phone_number` (`mobile_phone_number`),
  KEY `index3` (`user_name`) USING BTREE,
  KEY `funds_account_index1` (`funds_account`)
) ENGINE=InnoDB AUTO_INCREMENT=434871 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_bak_20210318
-- ----------------------------
DROP TABLE IF EXISTS `user_bak_20210318`;
CREATE TABLE `user_bak_20210318` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_password` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `photo_url` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `photo_md5` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `user_level` int(8) unsigned NOT NULL DEFAULT '1',
  `last_login_device_imei` char(15) CHARACTER SET utf8 DEFAULT '',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '86表示中国大陆；852表示中国香港；001表示美国',
  `mobile_phone_number` char(20) CHARACTER SET utf8 DEFAULT '',
  `email` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `user_type` smallint(1) NOT NULL DEFAULT '1',
  `gender` smallint(1) DEFAULT '0',
  `phone_verify_code` char(6) CHARACTER SET utf8 DEFAULT NULL,
  `verify_code_timestamp` bigint(8) DEFAULT NULL,
  `user_state` smallint(1) NOT NULL DEFAULT '1',
  `three_part_token` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` bigint(8) DEFAULT NULL,
  `stock_age` smallint(1) DEFAULT NULL,
  `follow_user_count` int(11) NOT NULL DEFAULT '0',
  `followed_user_count` int(11) NOT NULL DEFAULT '0',
  `available_gold_coin` int(10) NOT NULL DEFAULT '0' COMMENT '用户拥有的金币数量',
  `imei` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户对应的imei',
  `monthly_prediction_gold_coin` int(10) NOT NULL DEFAULT '0',
  `is_followed` int(11) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `channel_open` varchar(38) DEFAULT NULL COMMENT '注册渠道码',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `is_auto_payment` varchar(2) DEFAULT NULL COMMENT '1 开启金账户自动续费  其他情况关闭',
  `is_gold_account_take_effect` varchar(2) DEFAULT NULL COMMENT '金账号是否生效中  1生效  其他情况失败',
  `register_area` varchar(30) DEFAULT 'HKG' COMMENT '原始注册地区（目前只有两个注册地香港HKG，美国USA）',
  `register_ip` varchar(30) DEFAULT NULL COMMENT '原始注册时IP地址',
  `phone_valid` int(1) NOT NULL DEFAULT '0' COMMENT '当前手机号是否为有效手机号 0 已校验有效 1未校验',
  PRIMARY KEY (`user_id`),
  KEY `user_imei` (`imei`),
  KEY `user_type_index1` (`user_type`),
  KEY `mobile_phone_number` (`mobile_phone_number`),
  KEY `index3` (`user_name`) USING BTREE,
  KEY `funds_account_index1` (`funds_account`)
) ENGINE=InnoDB AUTO_INCREMENT=435137 DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `time` (`register_time`,`account_time`,`gold_time`) USING BTREE,
  KEY `funds_account` (`funds_account`) USING BTREE,
  KEY `channel` (`channel_source`,`channel_name`) USING BTREE,
  KEY `imei` (`reg_imei`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131085671 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户注册基础信息表';

-- ----------------------------
-- Table structure for user_consumption_record
-- ----------------------------
DROP TABLE IF EXISTS `user_consumption_record`;
CREATE TABLE `user_consumption_record` (
  `user_consumption_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(8) unsigned NOT NULL,
  `consumption_sum` float(8,2) DEFAULT NULL COMMENT '消费金额',
  `consumption_type` int(8) DEFAULT NULL COMMENT '消费类型，1 金币',
  `consumption_comment` char(32) DEFAULT NULL COMMENT '消费备注',
  `consumption_time` datetime DEFAULT NULL COMMENT '消费时间',
  PRIMARY KEY (`user_consumption_id`),
  KEY `user_consumption_record_FK_index` (`user_id`),
  CONSTRAINT `user_consumption_record_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=354290 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_device
-- ----------------------------
DROP TABLE IF EXISTS `user_device`;
CREATE TABLE `user_device` (
  `userdevice_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `imei` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户对应的imei',
  `user_id` int(8) DEFAULT NULL COMMENT '用户id',
  `platform` varchar(30) DEFAULT '' COMMENT '平台型号',
  `test_token` varchar(300) DEFAULT NULL,
  `production_token` varchar(300) DEFAULT NULL,
  `trader` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userdevice_id`),
  KEY `index_user_device_imei` (`imei`) USING BTREE COMMENT 'imei索引'
) ENGINE=InnoDB AUTO_INCREMENT=243100 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_first_login_device
-- ----------------------------
DROP TABLE IF EXISTS `user_first_login_device`;
CREATE TABLE `user_first_login_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `phone` varchar(50) DEFAULT NULL COMMENT '用户手机号',
  `imei` varchar(100) DEFAULT NULL COMMENT '登录设备imei号',
  `app_version` varchar(50) DEFAULT NULL COMMENT 'app版本号',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台',
  `os_version` varchar(100) DEFAULT NULL COMMENT '手机系统版本号',
  `model` varchar(50) DEFAULT NULL COMMENT '手机型号',
  `login_time` datetime DEFAULT NULL COMMENT '首次登录时间',
  `login_method` varchar(30) DEFAULT NULL COMMENT '登录方式  APP使用app登录    WEB使用H5登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71610 DEFAULT CHARSET=utf8mb4 COMMENT='用户首次登录记录表';

-- ----------------------------
-- Table structure for user_follow
-- ----------------------------
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE `user_follow` (
  `follow_id` int(8) NOT NULL AUTO_INCREMENT,
  `follow_user_id` int(8) NOT NULL,
  `followed_user_id` int(8) NOT NULL COMMENT '被关注的id',
  `follow_time` bigint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`follow_id`),
  KEY `idx_fo_user_id` (`follow_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49379 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`funds_account`) USING BTREE,
  KEY `funds_account` (`funds_account`) USING BTREE,
  KEY `ix_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户入金与转仓表';

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) DEFAULT NULL COMMENT '组名称',
  `userids` varchar(500) DEFAULT NULL COMMENT '组用户id',
  `flag` int(8) DEFAULT NULL COMMENT '0无效 1有效',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_level2_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_level2_detail`;
CREATE TABLE `user_level2_detail` (
  `trade_no` varchar(128) NOT NULL COMMENT '订单号',
  `fee_type` int(11) NOT NULL COMMENT '支付类型 1金币 2支付宝 3微信 4赠送',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `insert_date` datetime DEFAULT NULL COMMENT '订单生成时间，到秒',
  `fee_date` datetime DEFAULT NULL COMMENT '支付完成时间',
  `buy_fee` double(10,2) DEFAULT NULL COMMENT '支付金额',
  `number_of_cycle` int(11) DEFAULT NULL COMMENT '如果购买周期单位为天，则此字段表示发放天数',
  `cycle_type` int(11) DEFAULT NULL COMMENT '购买周期 1月2季3年4天   如果为4，则number_of_cycle字段中的值为发放具体天数，否则为空',
  `status` varchar(2) DEFAULT '0' COMMENT '0 未支付 1已支付',
  `effective_sdate` date DEFAULT NULL COMMENT '有效开始时间',
  `effective_edate` date DEFAULT NULL COMMENT '有效结束时间',
  `trade_status` varchar(64) DEFAULT NULL,
  `market` varchar(20) DEFAULT 'A' COMMENT '市场，A表示沪深，HK表示香港',
  `market_type` int(11) DEFAULT NULL COMMENT 'market=HK,null_大陆移动端，1_大陆全终端，2_全球全终端 ',
  `imei` char(50) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `used_date` date DEFAULT NULL COMMENT '使用时间（定时任务，修改时间）',
  `hk_edate` date DEFAULT NULL COMMENT '港美股others产品，港股使用时间追加。港股最后使用时间由本港美股others产品和港股产品共同决定',
  `us_edate` date DEFAULT NULL COMMENT '港美股others产品，美股使用时间追加。',
  `is_authority` int(20) DEFAULT '1' COMMENT '0是权限  1是订单(包含权限)，当增加一条港美股的时候会多加两条为1的数据',
  `othertrade_no` varchar(128) DEFAULT NULL COMMENT '记录父级订单号，根据这个来改变订单状态',
  `is_iphonepay` varchar(5) DEFAULT NULL COMMENT '1 是苹果支付   用来单独判断是否是苹果支付',
  `is_lucky_bag` tinyint(2) DEFAULT NULL COMMENT '1 是福袋 ，0 不是',
  PRIMARY KEY (`trade_no`,`fee_type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户订阅详情';

-- ----------------------------
-- Table structure for user_login_device
-- ----------------------------
DROP TABLE IF EXISTS `user_login_device`;
CREATE TABLE `user_login_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL COMMENT '用户id',
  `bind_date` datetime DEFAULT NULL COMMENT '绑定时间',
  `unbind_date` datetime DEFAULT NULL COMMENT '解绑定时间',
  `type` char(1) DEFAULT NULL COMMENT '绑定状态：1绑定 0解绑',
  `imei` varchar(128) DEFAULT NULL COMMENT '设备唯一标识',
  `model` varchar(64) DEFAULT NULL COMMENT '手机型号',
  PRIMARY KEY (`id`),
  KEY `index_user_login_device_imeianduserid` (`user_id`,`imei`) USING BTREE COMMENT '联合索引 userid imei'
) ENGINE=InnoDB AUTO_INCREMENT=170809 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_login_fail
-- ----------------------------
DROP TABLE IF EXISTS `user_login_fail`;
CREATE TABLE `user_login_fail` (
  `imei` varchar(50) NOT NULL COMMENT 'imei',
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `fail_count` int(11) DEFAULT NULL COMMENT '失败次数',
  `verify_code` varchar(4) DEFAULT NULL COMMENT '验证码',
  `user_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`imei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `user_msgid` int(11) NOT NULL AUTO_INCREMENT,
  `msg_ids` varchar(2000) NOT NULL,
  `user_id` int(8) NOT NULL COMMENT '用户ID',
  `min_msgid` int(11) DEFAULT '0' COMMENT '最小已读',
  `max_msgid` int(11) DEFAULT '0' COMMENT '最大已读',
  PRIMARY KEY (`user_msgid`)
) ENGINE=InnoDB AUTO_INCREMENT=4754 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_new_stock_message
-- ----------------------------
DROP TABLE IF EXISTS `user_new_stock_message`;
CREATE TABLE `user_new_stock_message` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `funs_account` varchar(8) DEFAULT NULL COMMENT '资金账户',
  `show_time` datetime DEFAULT NULL COMMENT '展示时间',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  `step_time` bigint(20) DEFAULT NULL COMMENT '停留时间',
  `is_to_buy` char(1) DEFAULT NULL COMMENT '1去下个页面 0退出',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176178 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_verification_code_record
-- ----------------------------
DROP TABLE IF EXISTS `user_verification_code_record`;
CREATE TABLE `user_verification_code_record` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_code` varchar(50) NOT NULL,
  `verification_code` varchar(50) NOT NULL,
  `send_time` bigint(16) NOT NULL,
  `use_frequency` int(11) DEFAULT NULL COMMENT '验证码使用次数',
  PRIMARY KEY (`record_id`),
  KEY `phone_index` (`phone_code`)
) ENGINE=InnoDB AUTO_INCREMENT=497088 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for valid_user
-- ----------------------------
DROP TABLE IF EXISTS `valid_user`;
CREATE TABLE `valid_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '86表示中国大陆；852表示中国香港；001表示美国',
  `mobile_phone_number` char(20) CHARACTER SET utf8 DEFAULT '',
  `valid_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobileIndex` (`mobile_phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for viewpoint
-- ----------------------------
DROP TABLE IF EXISTS `viewpoint`;
CREATE TABLE `viewpoint` (
  `viewpoint_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `post_time` bigint(8) NOT NULL DEFAULT '0',
  `comments_count` int(8) NOT NULL DEFAULT '0',
  `agree_count` int(8) NOT NULL DEFAULT '0',
  `disagree_count` int(8) NOT NULL DEFAULT '0',
  `user_id` int(8) unsigned NOT NULL,
  `stock_id` int(8) DEFAULT NULL COMMENT 'stock related to this viewpoint',
  `weibo_id` bigint(8) DEFAULT NULL,
  `source_type` int(8) NOT NULL DEFAULT '1',
  `verified_reason` varchar(300) DEFAULT NULL,
  `verified` int(8) DEFAULT NULL,
  PRIMARY KEY (`viewpoint_id`),
  KEY `index3` (`user_id`),
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=872611 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for viewpoint_agree
-- ----------------------------
DROP TABLE IF EXISTS `viewpoint_agree`;
CREATE TABLE `viewpoint_agree` (
  `agree_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `viewpoint_id` int(8) unsigned NOT NULL,
  `user_id` int(8) unsigned NOT NULL,
  `post_time` bigint(8) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`agree_id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_viewpoint` (`viewpoint_id`),
  CONSTRAINT `fk_user_id_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_viewpoint_id_1` FOREIGN KEY (`viewpoint_id`) REFERENCES `viewpoint` (`viewpoint_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3586 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for viewpoint_agree_removed
-- ----------------------------
DROP TABLE IF EXISTS `viewpoint_agree_removed`;
CREATE TABLE `viewpoint_agree_removed` (
  `removed_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `viewpoint_id` int(8) unsigned NOT NULL,
  `user_id` int(8) unsigned NOT NULL,
  `post_time` bigint(8) NOT NULL,
  `removed_time` bigint(8) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`removed_id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_viewpoint` (`viewpoint_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_viewpoint_id` FOREIGN KEY (`viewpoint_id`) REFERENCES `viewpoint` (`viewpoint_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2843 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for viewpoint_comment
-- ----------------------------
DROP TABLE IF EXISTS `viewpoint_comment`;
CREATE TABLE `viewpoint_comment` (
  `comment_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `comment_content` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `post_time` bigint(8) NOT NULL DEFAULT '0',
  `viewpoint_id` int(8) unsigned NOT NULL,
  `user_id` int(8) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_viewpoint` (`viewpoint_id`),
  KEY `fk_user_comment` (`user_id`),
  CONSTRAINT `fk_user_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_viewpoint` FOREIGN KEY (`viewpoint_id`) REFERENCES `viewpoint` (`viewpoint_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for viewpoint_image
-- ----------------------------
DROP TABLE IF EXISTS `viewpoint_image`;
CREATE TABLE `viewpoint_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `viewpoint_id` int(10) unsigned NOT NULL,
  `small_image_url` char(200) NOT NULL,
  `middle_image_url` char(200) DEFAULT NULL,
  `origin_image_url` char(200) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_id_UNIQUE` (`image_id`),
  KEY `image_viewpoint_id_index` (`viewpoint_id`),
  CONSTRAINT `viewpoint_id` FOREIGN KEY (`viewpoint_id`) REFERENCES `viewpoint` (`viewpoint_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=396437 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for visit_record
-- ----------------------------
DROP TABLE IF EXISTS `visit_record`;
CREATE TABLE `visit_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for weixin_menu
-- ----------------------------
DROP TABLE IF EXISTS `weixin_menu`;
CREATE TABLE `weixin_menu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `fu_id` int(20) DEFAULT '0' COMMENT '父级id',
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '菜单名字',
  `url` varchar(500) DEFAULT NULL COMMENT '页面路径',
  `location` varchar(50) DEFAULT NULL COMMENT '菜单位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for xuerqiujianianhua
-- ----------------------------
DROP TABLE IF EXISTS `xuerqiujianianhua`;
CREATE TABLE `xuerqiujianianhua` (
  `area_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for z_manual_prizes
-- ----------------------------
DROP TABLE IF EXISTS `z_manual_prizes`;
CREATE TABLE `z_manual_prizes` (
  `phone` varchar(50) DEFAULT NULL COMMENT '发奖人手机号',
  `amount` double(255,2) DEFAULT NULL COMMENT '发奖金额',
  `related_id` int(11) DEFAULT NULL COMMENT '奖励发生关系人id',
  `fund_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  KEY `z_phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手动发奖专用表';

-- ----------------------------
-- Table structure for zj_event
-- ----------------------------
DROP TABLE IF EXISTS `zj_event`;
CREATE TABLE `zj_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country` varchar(3) DEFAULT NULL COMMENT '国家',
  `exchange` varchar(20) DEFAULT NULL COMMENT '交易所',
  `code` varchar(20) DEFAULT NULL COMMENT '代码',
  `eng_name` varchar(500) DEFAULT NULL COMMENT '名称',
  `event_date` date DEFAULT NULL COMMENT '行动发生日期',
  `noticetype` varchar(20) DEFAULT NULL COMMENT '行动类型',
  `announce_time` varchar(50) DEFAULT NULL COMMENT '发布时间:盘前,盘后,未公布',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `eng_content` varchar(2000) DEFAULT NULL COMMENT '英文的内容',
  `event_type` varchar(20) DEFAULT NULL COMMENT '公司行动分类（新：earnings,dividends,splits,others）',
  `sync_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '同步到mysql表的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4095424 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_index_component
-- ----------------------------
DROP TABLE IF EXISTS `zj_index_component`;
CREATE TABLE `zj_index_component` (
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `index_code` varchar(50) DEFAULT NULL COMMENT '指数代码',
  `constituent_exchange` varchar(20) DEFAULT NULL,
  `constituent_code` varchar(50) DEFAULT NULL COMMENT '成分股代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  `hub_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_index_component_202205220615
-- ----------------------------
DROP TABLE IF EXISTS `zj_index_component_202205220615`;
CREATE TABLE `zj_index_component_202205220615` (
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `index_code` varchar(50) DEFAULT NULL COMMENT '指数代码',
  `constituent_exchange` varchar(20) DEFAULT NULL,
  `constituent_code` varchar(50) DEFAULT NULL COMMENT '成分股代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  `hub_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_index_component_202205230615
-- ----------------------------
DROP TABLE IF EXISTS `zj_index_component_202205230615`;
CREATE TABLE `zj_index_component_202205230615` (
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `index_code` varchar(50) DEFAULT NULL COMMENT '指数代码',
  `constituent_exchange` varchar(20) DEFAULT NULL,
  `constituent_code` varchar(50) DEFAULT NULL COMMENT '成分股代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  `hub_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_index_component_202205240615
-- ----------------------------
DROP TABLE IF EXISTS `zj_index_component_202205240615`;
CREATE TABLE `zj_index_component_202205240615` (
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `index_code` varchar(50) DEFAULT NULL COMMENT '指数代码',
  `constituent_exchange` varchar(20) DEFAULT NULL,
  `constituent_code` varchar(50) DEFAULT NULL COMMENT '成分股代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  `hub_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_index_component_202205250615
-- ----------------------------
DROP TABLE IF EXISTS `zj_index_component_202205250615`;
CREATE TABLE `zj_index_component_202205250615` (
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `index_code` varchar(50) DEFAULT NULL COMMENT '指数代码',
  `constituent_exchange` varchar(20) DEFAULT NULL,
  `constituent_code` varchar(50) DEFAULT NULL COMMENT '成分股代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  `hub_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_index_component_202205260615
-- ----------------------------
DROP TABLE IF EXISTS `zj_index_component_202205260615`;
CREATE TABLE `zj_index_component_202205260615` (
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `index_code` varchar(50) DEFAULT NULL COMMENT '指数代码',
  `constituent_exchange` varchar(20) DEFAULT NULL,
  `constituent_code` varchar(50) DEFAULT NULL COMMENT '成分股代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  `hub_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_index_component_202205270615
-- ----------------------------
DROP TABLE IF EXISTS `zj_index_component_202205270615`;
CREATE TABLE `zj_index_component_202205270615` (
  `market` varchar(10) DEFAULT NULL COMMENT '市场',
  `index_code` varchar(50) DEFAULT NULL COMMENT '指数代码',
  `constituent_exchange` varchar(20) DEFAULT NULL,
  `constituent_code` varchar(50) DEFAULT NULL COMMENT '成分股代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  `hub_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_ipo_qty
-- ----------------------------
DROP TABLE IF EXISTS `zj_ipo_qty`;
CREATE TABLE `zj_ipo_qty` (
  `id` int(10) NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '股票代码',
  `ipo_date` date NOT NULL COMMENT '上市日期',
  `qty` decimal(30,10) NOT NULL COMMENT '数量',
  `currency` varchar(10) DEFAULT NULL COMMENT '币种',
  `amount` decimal(30,10) NOT NULL DEFAULT '0.0000000000' COMMENT '金额',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入数据库的时间',
  KEY `Index 2` (`code`,`ipo_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_ipo_qty_temp
-- ----------------------------
DROP TABLE IF EXISTS `zj_ipo_qty_temp`;
CREATE TABLE `zj_ipo_qty_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '股票代码',
  `ipo_date` date NOT NULL COMMENT '上市日期',
  `qty` decimal(30,10) NOT NULL COMMENT '数量',
  `currency` varchar(10) DEFAULT NULL COMMENT '币种',
  `amount` decimal(30,10) NOT NULL DEFAULT '0.0000000000' COMMENT '金额',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入数据库的时间',
  PRIMARY KEY (`id`),
  KEY `Index 2` (`code`,`ipo_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4257228 DEFAULT CHARSET=utf8mb4 COMMENT='数量金额梯度表，即一个新股的‘申购股数’，‘所需金额’的对应关系，主要用于港股，数据是从批露易上抓取\r\n通过 code,ipo_date字段和zj_shareipo表相关联\r\n\r\n';

-- ----------------------------
-- Table structure for zj_shareipo
-- ----------------------------
DROP TABLE IF EXISTS `zj_shareipo`;
CREATE TABLE `zj_shareipo` (
  `id` int(10) NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '股票代码',
  `country` varchar(20) NOT NULL COMMENT '国家',
  `exchange` varchar(20) DEFAULT NULL COMMENT '挂牌交易所',
  `name` varchar(200) DEFAULT NULL COMMENT '股票名称',
  `name_en` varchar(200) DEFAULT NULL COMMENT '英文股票名称',
  `company_engname` varchar(200) DEFAULT NULL COMMENT '公司英文名',
  `company_cnname` varchar(200) DEFAULT NULL COMMENT '公司中文名',
  `tshares` bigint(20) DEFAULT NULL COMMENT '总股本',
  `shares_offered` bigint(20) DEFAULT NULL COMMENT '流通股本或发行股本',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '总市值',
  `ipoprice_low` decimal(18,4) DEFAULT NULL COMMENT '每股最低价',
  `ipoprice_high` decimal(18,4) DEFAULT NULL COMMENT '每股最高价',
  `ipoprice` decimal(18,4) DEFAULT NULL COMMENT '发行价',
  `tradeunit` int(11) DEFAULT NULL COMMENT '买卖单位(股/手)',
  `tradeunitpriceatceiling` decimal(18,4) DEFAULT NULL COMMENT '按最高价每手支付价格',
  `ipo_date` date DEFAULT NULL COMMENT '上市日',
  `least_buy` int(11) DEFAULT NULL COMMENT '最小申购股数',
  `least_amount` decimal(18,4) DEFAULT NULL COMMENT '最低认购金额',
  `applystartdate` date DEFAULT NULL COMMENT '申购起始日',
  `issueenddate` datetime DEFAULT NULL COMMENT '申购截止日',
  `issueresultpubldate` date DEFAULT NULL COMMENT '中签公布日',
  `bookrunner` varchar(1000) DEFAULT NULL COMMENT '承销商',
  `prospectus_url` varchar(1000) DEFAULT NULL COMMENT '招股书链接1',
  `url2` varchar(1000) DEFAULT NULL COMMENT '招股书链接2',
  `url3` varchar(1000) DEFAULT NULL COMMENT '招股书链接3',
  `url4` varchar(1000) DEFAULT NULL COMMENT '招股书链接4',
  `datetoaccount` date DEFAULT NULL COMMENT '股票发放日',
  `ipo_status` int(11) DEFAULT NULL COMMENT '聚源的进程状态',
  `is_apply` int(11) DEFAULT NULL COMMENT '是否配售 1 :是 0 不是',
  `issuetype` int(11) DEFAULT NULL COMMENT '发行类别  1 首发  3:增发',
  `marketcode` varchar(20) DEFAULT NULL COMMENT '市场代码 MAIN主板  GEM 创业板 ',
  `firstday_pchg` double(18,4) DEFAULT NULL COMMENT '首日涨跌幅',
  `dark_pchg` double(18,4) DEFAULT NULL COMMENT '暗盘日涨跌幅',
  `pubapplymultiple` decimal(18,8) DEFAULT NULL COMMENT '公众股认购倍数（聚源数据） ',
  `pubapplyshares` decimal(30,8) DEFAULT NULL COMMENT '公众股认购股数(股)',
  `pubapplyunit` decimal(18,2) DEFAULT NULL COMMENT '公众股认购有效申请份数(白/黄/电子)',
  `totalproceeds` decimal(18,2) DEFAULT NULL COMMENT '募资总额',
  `totalsubshares` decimal(18,2) DEFAULT NULL COMMENT '实际认购股数(股)',
  `issue_status` int(11) DEFAULT NULL COMMENT '申购状态 1 成功 -1 失败',
  `allow_apply_flag` int(11) DEFAULT NULL COMMENT '允许申购  1 手式录入数据(可申购) 0:抓取数据(不可申购)',
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
  `currency` varchar(10) DEFAULT NULL COMMENT '币种 USD HKD',
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
  `update_time` timestamp NULL DEFAULT NULL COMMENT '数据更新时间',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入mysql时间',
  `margin_cancel_end_time` datetime DEFAULT NULL COMMENT '融资最晚撤单时间',
  `company_introduction` varchar(2000) DEFAULT NULL COMMENT '公司简介',
  `placing_min_qty` int(11) DEFAULT NULL COMMENT '最小配售股数',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '通知内容',
  `notice_start_time` datetime DEFAULT NULL COMMENT '通知开始时间',
  `notice_end_time` datetime DEFAULT NULL COMMENT '通知截至时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zj_shareipo_temp
-- ----------------------------
DROP TABLE IF EXISTS `zj_shareipo_temp`;
CREATE TABLE `zj_shareipo_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '股票代码',
  `country` varchar(20) NOT NULL COMMENT '国家',
  `exchange` varchar(20) DEFAULT NULL COMMENT '挂牌交易所',
  `name` varchar(200) DEFAULT NULL COMMENT '股票名称',
  `name_en` varchar(200) DEFAULT NULL COMMENT '英文股票名称',
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
  `allow_apply_flag` int(11) DEFAULT NULL COMMENT '是否允许申购  1 手式录入数据(可申购) 0:抓取的数据(不可申购)',
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
  `update_time` timestamp NULL DEFAULT NULL COMMENT '数据更新时间',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '写入mysql时间',
  `margin_cancel_end_time` datetime DEFAULT NULL COMMENT '融资最晚撤单时间',
  `company_introduction` varchar(2000) DEFAULT NULL COMMENT '公司简介',
  `placing_min_qty` int(11) DEFAULT NULL COMMENT '最小配售股数',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '通知内容',
  `notice_start_time` datetime DEFAULT NULL COMMENT '通知开始时间',
  `notice_end_time` datetime DEFAULT NULL COMMENT '通知截至时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10537640 DEFAULT CHARSET=utf8mb4 COMMENT='美港股IPO信息,\r\n业务唯一性 code,ipo_date,\r\n通过 code,ipo_date字段和''数量金额梯度''表相关联';

-- ----------------------------
-- View structure for active_analyze
-- ----------------------------
DROP VIEW IF EXISTS `active_analyze`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_analyze` AS select `opt_invite_account`.`user_id` AS `user_id`,`opt_invite_account`.`invite_mobile` AS `invite_mobile`,`opt_invite_account`.`invite_date` AS `invite_date`,`opt_invite_account`.`channel_code` AS `channel_code`,`opt_invite_account`.`activity_name` AS `activity_name`,`opt_invite_account`.`activity_id` AS `activity_id` from `opt_invite_account` where isnull(`opt_invite_account`.`invited_user_id`);

-- ----------------------------
-- Procedure structure for getSpecificUserRanking
-- ----------------------------
DROP PROCEDURE IF EXISTS `getSpecificUserRanking`;
delimiter ;;
CREATE PROCEDURE `getSpecificUserRanking`(IN weeklyPeriod char(6),IN monthlyPeriod char(6), IN yearlyPeriod char(6), IN userId INT)
BEGIN
	SET @weeklyRank:=0;
    SET @monthlyRank:=0;
    SET @quarterlyRank:=0;
    SELECT * FROM
		(
		SELECT C.weekly_ranking FROM
			(
					SELECT B.*,(@weeklyRank:=@weeklyRank +1) as weekly_ranking 
					FROM 
						(
						SELECT A.user_id
						FROM prediction_summary A
						WHERE A.prediction_period = weeklyPeriod AND A.type=1
						ORDER BY A.win_gold_coin DESC , A.correct_times DESC, A.wrong_times ASC
						 ) B
			) C
		WHERE C.user_id=userId
		) D,
        (
		SELECT C.monthly_ranking FROM
			(
					SELECT B.*,(@monthlyRank:=@monthlyRank +1) as monthly_ranking 
					FROM 
						(
						SELECT A.user_id
						FROM prediction_summary A
						WHERE A.prediction_period = monthlyPeriod AND A.type=2
						ORDER BY A.win_gold_coin DESC ,A.correct_times DESC, A.wrong_times ASC
						 ) B
			) C
		WHERE C.user_id=userId
		) E,
        (
		SELECT C.quarterly_ranking FROM
			(
					SELECT B.*,(@quarterlyRank:=@quarterlyRank +1) as quarterly_ranking 
					FROM 
						(
						SELECT A.user_id
						FROM prediction_summary A
						WHERE A.prediction_period = yearlyPeriod AND A.type=3
						ORDER BY A.win_gold_coin DESC , A.correct_times DESC, A.wrong_times ASC
						 ) B
			) C
		WHERE C.user_id=userId
		) F,
        (
		SELECT (sum(correct_times)*100)/(sum(correct_times)+sum(wrong_times)) as correct_percent FROM
		prediction_summary A
        WHERE A.user_id=userId AND A.type=3
        )G;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getSpecificUserRanking2
-- ----------------------------
DROP PROCEDURE IF EXISTS `getSpecificUserRanking2`;
delimiter ;;
CREATE PROCEDURE `getSpecificUserRanking2`(IN weeklyPeriod char(6),IN monthlyPeriod char(6), IN yearlyPeriod char(6), IN userId INT)
BEGIN
	SET @weeklyRank:=0;
    SET @monthlyRank:=0;
    SET @quarterlyRank:=0;
		SELECT C.* FROM
			(
					SELECT B.*,(@weeklyRank:=@weeklyRank +1) as ranking 
					FROM 
						(
						SELECT A.*
						FROM prediction_summary A
						WHERE A.prediction_period = weeklyPeriod AND A.type=1
						ORDER BY A.win_gold_coin DESC , A.correct_times DESC, A.wrong_times ASC
						 ) B
			) C
		WHERE C.user_id=userId
        
		UNION ALL
        
		SELECT C.* FROM
			(
					SELECT B.*,(@monthlyRank:=@monthlyRank +1) as ranking 
					FROM 
						(
						SELECT A.*
						FROM prediction_summary A
						WHERE A.prediction_period = monthlyPeriod AND A.type=2
						ORDER BY A.win_gold_coin DESC , A.correct_times DESC, A.wrong_times ASC
						 ) B
			) C
		WHERE C.user_id=userId
		
        UNION ALL
        
		SELECT C.* FROM
			(
					SELECT B.*,(@quarterlyRank:=@quarterlyRank +1) as ranking 
					FROM 
						(
						SELECT A.*
						FROM prediction_summary A
						WHERE A.prediction_period = yearlyPeriod AND A.type=3
						ORDER BY A.win_gold_coin DESC , A.correct_times DESC, A.wrong_times ASC
						 ) B
			) C
		WHERE C.user_id=userId
		;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getUserMonthlyTopPercent
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserMonthlyTopPercent`;
delimiter ;;
CREATE PROCEDURE `getUserMonthlyTopPercent`(IN monthlyPeriod char(6), IN userId INT)
BEGIN
	SET @monthlyRank:=0;
	SELECT * FROM
	(
		SELECT C.monthly_ranking FROM
					(
							SELECT B.*,(@monthlyRank:=@monthlyRank +1) as monthly_ranking 
							FROM 
								(
								SELECT A.user_id,A.prediction_period
								FROM prediction_summary A
								WHERE A.prediction_period=monthlyPeriod AND A.type=2
								ORDER BY A.win_gold_coin DESC , A.correct_times DESC, A.wrong_times ASC
								 ) B
					) C
		WHERE C.user_id=userId
	)E,
	(
		SELECT count(A.user_id) AS person_count FROM prediction_summary A WHERE A.prediction_period=monthlyPeriod
	)F;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getUserPredictionStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserPredictionStatistics`;
delimiter ;;
CREATE PROCEDURE `getUserPredictionStatistics`(IN userId INT)
BEGIN
	SELECT
		DATE_FORMAT(from_unixtime(prediction_day/1000),'%Y%m') statistics_month,
        sum(prediction_correct) correct_amount
	FROM
        index_prediction
	WHERE user_id=userId
	GROUP BY statistics_month
    ORDER BY statistics_month DESC
    LIMIT 6;    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getUserRanking
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserRanking`;
delimiter ;;
CREATE PROCEDURE `getUserRanking`(IN startTime LONG,
            IN endTime LONG, IN tradingDays LONG, IN userId INT)
BEGIN
	SET @rank:=0;
    SELECT * FROM
		(
				SELECT B.*,(@rank:=@rank +1) as ranking 
				FROM 
					(
					SELECT (sum(A.prediction_correct)*100)/tradingDays as correct_percent,A.user_id as user_id
					FROM index_prediction A
					WHERE prediction_correct IS NOT NULL AND A.prediction_day>= startTime AND A.prediction_day<=endTime
					GROUP BY A.user_id 
					ORDER BY correct_percent DESC
					 ) B
		) C
	WHERE C.ranking<=10 OR C.user_id=userId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getUserRanking2
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserRanking2`;
delimiter ;;
CREATE PROCEDURE `getUserRanking2`(IN period char(6), IN summaryType INT, IN tradingDays LONG, IN userId INT)
BEGIN
	SET @rank:=0;
    SELECT * FROM
		(
				SELECT B.*,(@rank:=@rank +1) as ranking 
				FROM 
					(
					SELECT (A.correct_times*100)/tradingDays as correct_percent,A.user_id as user_id,A.correct_times AS correct_times,A.wrong_times as wrong_times,A.win_gold_coin as win_gold_coin
					FROM prediction_summary A
					WHERE A.prediction_period = period AND A.type=summaryType
					ORDER BY A.win_gold_coin DESC, A.correct_times DESC , A.wrong_times ASC
					 ) B
		) C
	WHERE C.ranking<=10 OR C.user_id=userId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getUserRankingByPeroidType
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserRankingByPeroidType`;
delimiter ;;
CREATE PROCEDURE `getUserRankingByPeroidType`(IN period char(6), IN summaryType INT, IN userId INT)
BEGIN
	SET @rank:=0;
    SELECT ranking FROM
		(
				SELECT B.*,(@rank:=@rank +1) as ranking 
				FROM 
					(
					SELECT A.user_id
					FROM prediction_summary A
					WHERE A.prediction_period = period AND A.type=summaryType
					ORDER BY A.win_gold_coin DESC, A.correct_times DESC, A.wrong_times ASC
					 ) B
		) C
	WHERE C.user_id=userId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mining_zj_index_component
-- ----------------------------
DROP PROCEDURE IF EXISTS `mining_zj_index_component`;
delimiter ;;
CREATE PROCEDURE `mining_zj_index_component`(IN source_database VARCHAR(200),IN source_table VARCHAR(200))
BEGIN
	DECLARE v_tt VARCHAR(500) DEFAULT '';
	DECLARE v_ttt VARCHAR(1000) DEFAULT '';
	DECLARE v_tt2 INT DEFAULT 1;
	DECLARE v_tt3 INT DEFAULT 0;
	DECLARE iDone INT DEFAULT 1;
    
	DECLARE err TINYINT DEFAULT 0;
	DECLARE cur1 CURSOR FOR SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA="miningstock" AND TABLE_NAME LIKE "zj_index_component_202%";
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err=1;
    
	OPEN cur1 ;
	loop_label:LOOP
		FETCH cur1 INTO v_tt;
		IF iDone=0 THEN
			LEAVE loop_label;
		END IF;
		IF iDone=1 THEN
			
			SET @sqlstr = CONCAT('TRUNCATE TABLE ',v_tt,';');
			PREPARE stmt FROM @sqlstr;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
			
			SET @sqlstr = CONCAT('DROP TABLE ',v_tt,';');
			PREPARE stmt FROM @sqlstr;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
			
		END IF;
	END LOOP loop_label;
	CLOSE cur1;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
