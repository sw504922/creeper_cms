/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : miningaccount

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:17:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for abamst
-- ----------------------------
DROP TABLE IF EXISTS `abamst`;
CREATE TABLE `abamst` (
  `id` int(20) NOT NULL,
  `aba_number` varchar(10) NOT NULL,
  `short_name` varchar(18) DEFAULT NULL,
  `destination_name` varchar(23) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address_1` varchar(40) DEFAULT NULL,
  `address_2` varchar(40) DEFAULT NULL,
  `address_3` varchar(40) DEFAULT NULL,
  `address_4` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `zip_ext` varchar(4) DEFAULT NULL,
  `data_added` varchar(10) DEFAULT NULL,
  `date_changed` varchar(10) DEFAULT NULL,
  `contra_acct_nbr` varchar(8) DEFAULT NULL,
  `on_line_ind` varchar(1) DEFAULT NULL,
  `internal_ext_ind` varchar(1) DEFAULT NULL,
  `ggroup` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`aba_number`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for academic
-- ----------------------------
DROP TABLE IF EXISTS `academic`;
CREATE TABLE `academic` (
  `academic_id` varchar(38) NOT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '学历名称',
  `title_us` varchar(100) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`academic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_agreement
-- ----------------------------
DROP TABLE IF EXISTS `account_agreement`;
CREATE TABLE `account_agreement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) DEFAULT NULL COMMENT '协议名字',
  `url` varchar(400) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `account_dictionary`;
CREATE TABLE `account_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `type_code` varchar(50) NOT NULL COMMENT '字典码key，相关数据类型code',
  `field_code` varchar(50) NOT NULL COMMENT '属性字段code',
  `countries_code` varchar(10) DEFAULT NULL COMMENT '国家简码',
  `inner_type` varchar(10) DEFAULT NULL COMMENT '字典类内部分类支持字段',
  `value` varchar(500) DEFAULT NULL COMMENT '属性内容',
  `value1` varchar(255) DEFAULT NULL COMMENT '属性内容1',
  `sequence` int(11) DEFAULT '0' COMMENT '排序',
  `availability` char(2) NOT NULL DEFAULT '0' COMMENT '有效性：0有效 1无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COMMENT='开户相关属性字典表';

-- ----------------------------
-- Table structure for account_info
-- ----------------------------
DROP TABLE IF EXISTS `account_info`;
CREATE TABLE `account_info` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `phone_address` varchar(30) DEFAULT NULL COMMENT '省市，20171213添加',
  `card_number` varchar(30) DEFAULT NULL COMMENT '行银卡号',
  `bank_id` int(11) DEFAULT NULL COMMENT '银行id',
  `funds_pwd` varchar(300) DEFAULT NULL COMMENT '资金密码',
  `trans_pwd` varchar(300) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL COMMENT '申请时间yyyy-MM-dd HH:mm:ss',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `one_yard_pass` varchar(20) DEFAULT NULL COMMENT '一码通账户',
  `shareholder_account` varchar(20) DEFAULT NULL COMMENT '股东账户',
  `imei` varchar(50) DEFAULT NULL COMMENT '设备imei',
  `platform` varchar(20) DEFAULT NULL COMMENT '设备类型',
  `market` varchar(20) NOT NULL DEFAULT '' COMMENT '开通市场  HK 港股  US 美股',
  `is_send_funds_account` int(11) DEFAULT '0' COMMENT '0代表没有发送资金账号；1代表已经发送资金账号',
  `area_id` varchar(38) DEFAULT NULL COMMENT '手机号归属地id',
  `source` int(3) DEFAULT '1' COMMENT '1代表app，2代表人工录入',
  `invite_code_id` int(20) DEFAULT NULL COMMENT '邀请码对应的id',
  `open_way` int(2) DEFAULT NULL COMMENT '开户方式  0：视频见证方式   1：单向开户方式',
  `is_ftp` int(2) DEFAULT '0' COMMENT '是否已经同步了ftp  0否  1是',
  `funds_account_valid` varchar(20) DEFAULT '1' COMMENT '资金账号是否失效，1、未生效，2生效，3，失败',
  `crm_update_time` datetime DEFAULT NULL COMMENT 'crm_status更新时间',
  `crm_status` int(2) DEFAULT '1' COMMENT '在crm中照片见证和初审状态 1显示 2不显示',
  `pass_expire_date` datetime DEFAULT NULL COMMENT '密码失效提醒日期',
  `update_time` datetime DEFAULT NULL COMMENT '资金账户更新日期',
  `account_step` varchar(4) DEFAULT NULL COMMENT '开户步骤',
  `account_apply_id` int(20) DEFAULT NULL COMMENT '开户步骤流水号',
  `is_audit_check` varchar(2) DEFAULT '0' COMMENT '是否人工审核',
  `account_version` varchar(10) DEFAULT '2' COMMENT '开户版本号，最新版本3',
  `is_institution` int(2) DEFAULT NULL COMMENT '是否是机构   空或者0属于个人    1是机构',
  `bms_account_status` int(2) DEFAULT NULL COMMENT '0-未激活；1-正常；2-停用；3-暂停交易',
  `is_option_agreement` int(2) DEFAULT '0' COMMENT '是否已同意期权协议  0 未同意  1 同意  默认为0',
  `option_agreement_date` datetime DEFAULT NULL COMMENT '同意期权协议时间',
  `is_ca_auth` int(2) NOT NULL DEFAULT '0' COMMENT '是否经过CA认证了 0未认证 1认证过了（全流程通过有pdf） 2认证了前两步（无pdf）',
  `is_fast` varchar(20) DEFAULT NULL COMMENT '是否是极速开户',
  `language` varchar(30) DEFAULT NULL COMMENT '开户时使用的语言，以最后用户提交一步为准',
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `funds_account` (`funds_account`)
) ENGINE=InnoDB AUTO_INCREMENT=190135 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_info_ext_us
-- ----------------------------
DROP TABLE IF EXISTS `account_info_ext_us`;
CREATE TABLE `account_info_ext_us` (
  `funds_account` varchar(20) NOT NULL COMMENT '资金账号',
  `velox_account` varchar(20) DEFAULT NULL COMMENT 'velox清算账号',
  `request_time` datetime DEFAULT NULL COMMENT '请求velox ooa接口时间',
  `request_status` varchar(1) DEFAULT NULL COMMENT '请求velox ooa接口的状态 0 成功',
  `request_msg` varchar(100) DEFAULT NULL COMMENT '请求velox ooa接口的描述',
  `response_time` datetime DEFAULT NULL COMMENT 'velox ooa接口返回结果时间',
  `velox_status` varchar(1) DEFAULT '0' COMMENT 'velox ooa状态 0审核中 1审核通过 2审核不通过',
  `message` varchar(200) DEFAULT NULL COMMENT '审核结果描述',
  PRIMARY KEY (`funds_account`),
  KEY `ext_us_velox_status` (`velox_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_info_org
-- ----------------------------
DROP TABLE IF EXISTS `account_info_org`;
CREATE TABLE `account_info_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) NOT NULL COMMENT '开户accountId',
  `partyid_type` int(11) DEFAULT NULL COMMENT '证件类型：1 社会标识号码  2 水手号 3 营业执照',
  `partyid` varchar(50) DEFAULT NULL COMMENT '机构注册号',
  `statement_mail` varchar(100) DEFAULT NULL COMMENT '结单邮箱',
  `other_qualifications` varchar(255) DEFAULT NULL COMMENT '上传的其他资质图片',
  `shareholders` varchar(100) DEFAULT NULL COMMENT '股东集。多个股东中间使用逗号隔开',
  `chairman` varchar(100) DEFAULT NULL COMMENT '董事长集   多个中间使用逗号隔开',
  `is_financial_license` varchar(2) DEFAULT NULL COMMENT '是否有金融牌照',
  `financial_license_url` varchar(300) DEFAULT NULL COMMENT '金融牌照图片',
  `bank_address` varchar(50) DEFAULT NULL COMMENT '银行所在地',
  `bank_account_name` varchar(50) DEFAULT NULL COMMENT '账户名称',
  `us_receipt_account` varchar(50) DEFAULT NULL COMMENT '美元收款账号',
  `hk_receipt_account` varchar(50) DEFAULT NULL COMMENT '港元收款账号',
  `swif_code` varchar(50) DEFAULT NULL COMMENT 'SWIF代码',
  `receipt_bank_address` varchar(100) DEFAULT NULL COMMENT '收款银行地址',
  `receipt_address` varchar(100) DEFAULT NULL COMMENT '收款地址',
  `author_info_url` varchar(300) DEFAULT NULL COMMENT '交易和提款授权信息',
  `option1` varchar(2) DEFAULT NULL COMMENT '客户是否于尊嘉证券或其他联营公司持有任何其他期货、证券或其他账户？',
  `question1_answer1` varchar(50) DEFAULT NULL COMMENT '对应第一个输入内容',
  `question1_answer2` varchar(50) DEFAULT NULL COMMENT '对应第二个输入内容',
  `question1_answer3` varchar(50) DEFAULT NULL COMMENT '对应第三个输入内容',
  `option2` varchar(2) DEFAULT NULL COMMENT '客户是否于有同一集团旗下之其他公司在尊嘉证券开立保证金账户？',
  `question2_answer1` varchar(50) DEFAULT NULL,
  `question2_answer2` varchar(50) DEFAULT NULL,
  `question2_answer3` varchar(50) DEFAULT NULL,
  `option3` varchar(2) DEFAULT NULL COMMENT '客户是否与任何董事，主任及职员有任何关联？',
  `question3_answer1` varchar(50) DEFAULT NULL,
  `question3_answer2` varchar(50) DEFAULT NULL,
  `question3_answer3` varchar(50) DEFAULT NULL,
  `option4` varchar(2) DEFAULT NULL COMMENT '阁下是公司保证金客户，请提供阁下是否有其他集团成员公司或单独持有阁下 35%或以上投票表决权之股东，并已在尊嘉证券开立保证金账户？',
  `question4_answer1` varchar(50) DEFAULT NULL,
  `question4_answer2` varchar(50) DEFAULT NULL,
  `option5` varchar(2) DEFAULT NULL COMMENT '本公司/吾等现声明本公司/吾等为该账户之最终受益人：',
  `question5_answer1` varchar(50) DEFAULT NULL,
  `question5_answer2` varchar(50) DEFAULT NULL,
  `question5_answer3` varchar(512) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `recorder` varchar(10) DEFAULT NULL COMMENT '录入人',
  `ae_id` varchar(50) DEFAULT NULL COMMENT '经纪人',
  PRIMARY KEY (`id`),
  KEY `account_org_index` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_manager
-- ----------------------------
DROP TABLE IF EXISTS `account_manager`;
CREATE TABLE `account_manager` (
  `account` varchar(50) NOT NULL COMMENT '登录账号',
  `password` varchar(128) DEFAULT NULL COMMENT 'md5存储',
  `display_name` varchar(128) DEFAULT NULL COMMENT '显示名称',
  `role` varchar(2) DEFAULT NULL COMMENT '此字段无用',
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_manager_right
-- ----------------------------
DROP TABLE IF EXISTS `account_manager_right`;
CREATE TABLE `account_manager_right` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `right_code` varchar(60) NOT NULL COMMENT '权限编码',
  `right_parent_code` varchar(60) DEFAULT NULL COMMENT '父权限编码',
  `right_name` varchar(60) DEFAULT NULL COMMENT '权限名称',
  `right_url` varchar(100) DEFAULT NULL COMMENT 'code对应的url地址',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图标的链接地址',
  `sequence` int(11) DEFAULT NULL COMMENT '顺序，可以调节左侧树的展示顺序，只针对父节点修改，即right_parent_code=0',
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `account_manager_role`;
CREATE TABLE `account_manager_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(60) DEFAULT NULL COMMENT '角色描述',
  `level` int(100) DEFAULT NULL COMMENT '角色级别（1、代表管理员；2、代表初审人员；3代表终审人员；4代表见证人员）',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_manager_role_right
-- ----------------------------
DROP TABLE IF EXISTS `account_manager_role_right`;
CREATE TABLE `account_manager_role_right` (
  `rf_id` int(11) NOT NULL AUTO_INCREMENT,
  `rf_role_id` int(11) DEFAULT NULL,
  `rf_right_code` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_manager_user_role
-- ----------------------------
DROP TABLE IF EXISTS `account_manager_user_role`;
CREATE TABLE `account_manager_user_role` (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`ur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_market_change_audit
-- ----------------------------
DROP TABLE IF EXISTS `account_market_change_audit`;
CREATE TABLE `account_market_change_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL COMMENT '账号id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别 0女 1男',
  `phone_number` char(11) DEFAULT NULL COMMENT '电话号码',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `market_change` char(20) DEFAULT NULL COMMENT '要增开的市场类型（1_美股 2_港股 3_衍生品 4_中华通）',
  `HKY_check` char(20) DEFAULT NULL COMMENT '港股衍生品选项，1,2,3',
  `sign_name_pic` varchar(100) DEFAULT NULL COMMENT '开户时签名照片',
  `sing_change_pic` varchar(100) DEFAULT NULL COMMENT '账户类型修改签名照片',
  `state` int(11) DEFAULT NULL COMMENT '状态，10001待交易员审核 10200交易员审核不通过 10300交易员审核通过  20100ro审核不通过 20200ro审核通过 30100变更成功',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `insert_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pdf` varchar(200) DEFAULT NULL COMMENT 'pdf文件。；分割',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5602 DEFAULT CHARSET=utf8mb4 COMMENT='增开 美股和中华通 市场';

-- ----------------------------
-- Table structure for account_market_change_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `account_market_change_audit_log`;
CREATE TABLE `account_market_change_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_type_change_id` int(11) DEFAULT NULL COMMENT '账号类型申请id',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '修改角色 1_交易员 2_OR 3_结算员',
  `auditor` varchar(50) DEFAULT NULL COMMENT '审核人  account_manager.account',
  `state` int(11) DEFAULT NULL COMMENT '状态，10001待交易员审核 10200交易员审核不通过 10300交易员审核通过  20100ro审核不通过 20200ro审核通过 30100变更成功',
  `comment` varchar(50) DEFAULT NULL COMMENT '不通过原因',
  `inset_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `idx_account_type_change_id` (`account_type_change_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21000 DEFAULT CHARSET=utf8mb4 COMMENT='增开美股中华通市场，审核日志';

-- ----------------------------
-- Table structure for account_phone_area
-- ----------------------------
DROP TABLE IF EXISTS `account_phone_area`;
CREATE TABLE `account_phone_area` (
  `prefix` int(11) NOT NULL COMMENT '手机号段',
  `province_code` int(11) DEFAULT NULL COMMENT '省号',
  `province` varchar(20) DEFAULT NULL COMMENT '省名称',
  `city_code` int(11) DEFAULT NULL COMMENT '市号',
  `city` varchar(20) DEFAULT NULL COMMENT '市名称',
  `supplier` varchar(10) DEFAULT NULL COMMENT '运营商',
  PRIMARY KEY (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_set_pass_fail_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_set_pass_fail_detail`;
CREATE TABLE `account_set_pass_fail_detail` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `new_pwd` varchar(300) DEFAULT NULL,
  `old_pwd` varchar(300) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '失败时间 yyyy-MM-dd HH:mm:ss',
  `account_version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `funds_account` (`funds_account`)
) ENGINE=InnoDB AUTO_INCREMENT=48816 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_step
-- ----------------------------
DROP TABLE IF EXISTS `account_step`;
CREATE TABLE `account_step` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `step_number` int(10) DEFAULT NULL COMMENT '步骤步数',
  `step_name` varchar(10) DEFAULT NULL COMMENT '步骤名字',
  `sort` int(5) DEFAULT NULL COMMENT '开户步骤排序',
  `is_valid` int(1) DEFAULT '0' COMMENT '是否有效 0有效  1无效',
  `account_version` varchar(50) DEFAULT NULL COMMENT '开户版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_type
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type` (
  `account_type_id` varchar(38) NOT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '账户类型名称',
  `title_us` varchar(50) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  `is_support` int(2) DEFAULT NULL COMMENT '当前是否支持此账户类型  0不支持 1 支持',
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_type_change_audit
-- ----------------------------
DROP TABLE IF EXISTS `account_type_change_audit`;
CREATE TABLE `account_type_change_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL COMMENT '账号id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别 0女 1男',
  `phone_number` char(11) DEFAULT NULL COMMENT '电话号码',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `funds_type_change` tinyint(4) DEFAULT NULL COMMENT '要申请的账户类型 0现金账户 1融资账户',
  `sign_name_pic` varchar(100) DEFAULT NULL COMMENT '开户时签名照片',
  `sing_change_pic` varchar(100) DEFAULT NULL COMMENT '账户类型修改签名照片',
  `state` int(11) DEFAULT NULL COMMENT '状态，10001待交易员审核 10200交易员审核不通过 10300交易员审核通过  20100ro审核不通过 20200ro审核通过 30100变更成功',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `insert_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6288 DEFAULT CHARSET=utf8mb4 COMMENT='转为现金账户审核\r\n\r\n转为保证金审核';

-- ----------------------------
-- Table structure for account_type_change_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `account_type_change_audit_log`;
CREATE TABLE `account_type_change_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_type_change_id` int(11) DEFAULT NULL COMMENT '账号类型申请id',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '修改角色 1交易员 2OR 3结算员',
  `auditor` varchar(50) DEFAULT NULL COMMENT '审核人  account_manager.account',
  `state` int(11) DEFAULT NULL COMMENT '状态，10001待交易员审核 10200交易员审核不通过 10300交易员审核通过  20100ro审核不通过 20200ro审核通过 30100变更成功',
  `comment` varchar(50) DEFAULT NULL COMMENT '不通过原因',
  `inset_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23880 DEFAULT CHARSET=utf8mb4 COMMENT='账号类型变更，审核日志';

-- ----------------------------
-- Table structure for adapter_info
-- ----------------------------
DROP TABLE IF EXISTS `adapter_info`;
CREATE TABLE `adapter_info` (
  `adapter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '券商ID',
  `adapter_name` varchar(50) DEFAULT NULL COMMENT '券商名称',
  `adapter_logo` varchar(100) DEFAULT NULL COMMENT '券商logo地址',
  `adapter_phone` varchar(20) DEFAULT NULL COMMENT '券商电话',
  `adapter_desc` varchar(100) DEFAULT NULL COMMENT '描述或者说明',
  PRIMARY KEY (`adapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

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
  `phone_number_count` int(2) DEFAULT NULL COMMENT '地区对应电话号码位数',
  `country_in_code` varchar(50) DEFAULT NULL COMMENT '国家简码',
  `access_code` int(5) NOT NULL DEFAULT '0' COMMENT '权限码，可以根据权限码根据不同的功能进行过滤，默认0',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assessment_options
-- ----------------------------
DROP TABLE IF EXISTS `assessment_options`;
CREATE TABLE `assessment_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `option_type` char(1) DEFAULT NULL COMMENT '选项类型',
  `option_content` varchar(200) DEFAULT NULL COMMENT '选项内容',
  `option_grade` int(11) DEFAULT NULL COMMENT '选项等级',
  `question_id` int(11) DEFAULT NULL COMMENT '问题id',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assessment_question
-- ----------------------------
DROP TABLE IF EXISTS `assessment_question`;
CREATE TABLE `assessment_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `question_desc` varchar(500) DEFAULT NULL COMMENT '问题描述',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for assessment_result
-- ----------------------------
DROP TABLE IF EXISTS `assessment_result`;
CREATE TABLE `assessment_result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `question_id` int(11) DEFAULT NULL COMMENT '问题ID',
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for automatic_black
-- ----------------------------
DROP TABLE IF EXISTS `automatic_black`;
CREATE TABLE `automatic_black` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(8) DEFAULT NULL COMMENT '资金账号',
  `source` varchar(2) DEFAULT NULL COMMENT '来源1手动添加2自动加入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for bank_acc_id
-- ----------------------------
DROP TABLE IF EXISTS `bank_acc_id`;
CREATE TABLE `bank_acc_id` (
  `bank_acc_id` varchar(100) NOT NULL COMMENT '该表bank_acc_id必须和BOS系统一致',
  `bank_code` varchar(20) NOT NULL COMMENT '银行代码，关联deposit_bank',
  `ccy` varchar(10) NOT NULL COMMENT '币种',
  PRIMARY KEY (`bank_acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for bank_info
-- ----------------------------
DROP TABLE IF EXISTS `bank_info`;
CREATE TABLE `bank_info` (
  `bank_id` varchar(38) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `is_open` int(11) DEFAULT '0' COMMENT '否是需要开通电话银行',
  `card_prefix` varchar(100) DEFAULT NULL COMMENT '该银行的卡号前缀',
  `bank_logo` varchar(100) DEFAULT NULL COMMENT '银行logo地址',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for bank_open_account_type
-- ----------------------------
DROP TABLE IF EXISTS `bank_open_account_type`;
CREATE TABLE `bank_open_account_type` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `open_account_code` varchar(50) DEFAULT NULL COMMENT '证件类型',
  `open_account_name` varchar(50) DEFAULT NULL COMMENT '证件描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='银证转账开户类型';

-- ----------------------------
-- Table structure for ca_result
-- ----------------------------
DROP TABLE IF EXISTS `ca_result`;
CREATE TABLE `ca_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT 'accountInfo.id',
  `status` int(2) DEFAULT NULL COMMENT '所处步骤  1 资料申请  2 证书申请   3 申请失败  4 确认签署  5 PDF下载完成',
  `rep_code` varchar(30) DEFAULT NULL COMMENT '响应错误码',
  `rep_msg` varchar(200) DEFAULT NULL COMMENT '结果和失败的原因',
  `begin_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `sign_file` varchar(100) DEFAULT NULL COMMENT '签署文件保存地址',
  `serial_number` varchar(100) DEFAULT NULL COMMENT 'CA PDF查询码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1400 DEFAULT CHARSET=utf8mb4 COMMENT='CA认证结果或错误原因';

-- ----------------------------
-- Table structure for channel_center
-- ----------------------------
DROP TABLE IF EXISTS `channel_center`;
CREATE TABLE `channel_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_info_id` int(11) DEFAULT NULL COMMENT 'channel_info表_id',
  `open_account_num` int(11) DEFAULT NULL COMMENT '开户人数',
  `deposite_num` int(11) DEFAULT NULL COMMENT '入金人数',
  `out_cash_num` int(11) DEFAULT NULL COMMENT '出金人数',
  `transfer_in_num` int(11) DEFAULT NULL COMMENT '转入股票人数',
  `transfer_out_num` int(11) DEFAULT NULL COMMENT '转出股票人数',
  `deposite_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额',
  `out_cash_amount` decimal(20,0) DEFAULT NULL COMMENT '出金金额',
  `transfer_in_amount` decimal(20,4) DEFAULT NULL COMMENT '转入股票金额',
  `transfer_out_amount` decimal(20,0) DEFAULT NULL COMMENT '转出股票金额',
  `daxin_num` int(11) DEFAULT NULL COMMENT '打新笔数',
  `daxin_commissions` decimal(20,4) DEFAULT NULL COMMENT '打新佣金',
  `deal_num` int(11) DEFAULT NULL COMMENT '交易笔数',
  `deal_commissions` decimal(20,4) DEFAULT NULL COMMENT '交易佣金',
  `date` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COMMENT='渠道总汇';

-- ----------------------------
-- Table structure for channel_info
-- ----------------------------
DROP TABLE IF EXISTS `channel_info`;
CREATE TABLE `channel_info` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '渠道ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '推荐人（父类）',
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `qr_code` varchar(200) DEFAULT NULL COMMENT '二维码（图片）',
  `qr_link` varchar(200) DEFAULT NULL COMMENT '二维码（外网连接）',
  PRIMARY KEY (`channel_id`),
  KEY `ch_code` (`ch_code`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COMMENT='渠道信息';

-- ----------------------------
-- Table structure for channel_user_info
-- ----------------------------
DROP TABLE IF EXISTS `channel_user_info`;
CREATE TABLE `channel_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL COMMENT '开户主键',
  `channel_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `open_account_time` datetime DEFAULT NULL COMMENT '开户时间',
  `first_deposit_time` datetime DEFAULT NULL COMMENT '首次入金时间',
  `first_deposit_money` decimal(20,4) DEFAULT NULL COMMENT '首次入金金额',
  `deposit_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额汇总',
  `first_out_cash_time` datetime DEFAULT NULL COMMENT '首次出金时间',
  `first_out_cash_money` decimal(20,0) DEFAULT NULL COMMENT '首次出金金额',
  `out_cash_amount` decimal(20,0) DEFAULT NULL COMMENT '出金金额汇总',
  `first_transfer_in_time` datetime DEFAULT NULL COMMENT '首次转入股票时间',
  `first_transfer_in_money` decimal(20,0) DEFAULT NULL COMMENT '首次转入股票金额',
  `transfer_in_amount` decimal(20,4) DEFAULT NULL COMMENT '转入股票金额汇总',
  `first_transfer_out_time` datetime DEFAULT NULL COMMENT '首次转出股票时间',
  `first_transfer_out_money` decimal(20,0) DEFAULT NULL COMMENT '首次转出股票金额',
  `transfer_out_amount` decimal(20,0) DEFAULT NULL COMMENT '转出股票金额汇总',
  `daxin_num` int(11) DEFAULT NULL COMMENT '打新笔数',
  `daxin_commissions` decimal(20,4) DEFAULT NULL COMMENT '打新佣金',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易笔数',
  `trade_commissions` decimal(20,4) DEFAULT NULL COMMENT '交易佣金',
  `source` tinyint(4) DEFAULT NULL COMMENT '来源（1_原生 2_录入）',
  `record_time` datetime DEFAULT NULL COMMENT '录入时间',
  `manager_account` varchar(50) DEFAULT NULL COMMENT '录入人(后台管理人员)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4977 DEFAULT CHARSET=utf8mb4 COMMENT='渠道。用户信息';

-- ----------------------------
-- Table structure for check_bank_log
-- ----------------------------
DROP TABLE IF EXISTS `check_bank_log`;
CREATE TABLE `check_bank_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '验证银行卡信息中的名字',
  `bank_id` varchar(38) DEFAULT NULL COMMENT '银行卡发卡行id',
  `bank_card` varchar(38) DEFAULT NULL COMMENT '银行卡号',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `phone_number` varchar(15) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `today_count` int(2) NOT NULL DEFAULT '0' COMMENT '今天该手机号验证的次数',
  `result` text COMMENT '银行卡验证结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77434 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for check_id_log
-- ----------------------------
DROP TABLE IF EXISTS `check_id_log`;
CREATE TABLE `check_id_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '对应acccountinfo表的accountId',
  `name` varchar(10) DEFAULT NULL COMMENT '名字',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `phone_number` varchar(15) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `result` text COMMENT '身份证验证结果',
  `today_count` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182183 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for conversion_assets
-- ----------------------------
DROP TABLE IF EXISTS `conversion_assets`;
CREATE TABLE `conversion_assets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `conversion_id` bigint(10) DEFAULT NULL COMMENT 'currency_conversion 主键id',
  `us_assets` varchar(50) DEFAULT NULL COMMENT '美元 结余/可取',
  `hk_assets` varchar(50) DEFAULT NULL COMMENT '港币 结余/可取',
  `cn_assets` varchar(50) DEFAULT NULL COMMENT '人民币 结余/可取',
  `funds_account` char(20) DEFAULT NULL COMMENT '资金账号',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56493 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for country_code
-- ----------------------------
DROP TABLE IF EXISTS `country_code`;
CREATE TABLE `country_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(3) DEFAULT NULL COMMENT '国家代码',
  `describe` varchar(50) DEFAULT NULL COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for currency_conversion
-- ----------------------------
DROP TABLE IF EXISTS `currency_conversion`;
CREATE TABLE `currency_conversion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `in_money_real` decimal(20,2) DEFAULT NULL COMMENT '实际兑入金额',
  `out_money_real` decimal(20,2) DEFAULT NULL COMMENT '实际兑出金额',
  `in_money` decimal(20,2) DEFAULT NULL COMMENT '兑入金额',
  `out_money` decimal(20,2) DEFAULT NULL COMMENT '兑出金额',
  `in_ccy` char(8) DEFAULT NULL COMMENT '兑入币种',
  `out_ccy` char(8) DEFAULT NULL COMMENT '兑出币种',
  `type` varchar(2) DEFAULT NULL COMMENT '兑换类型 1兑入2兑出',
  `in_remark` char(50) DEFAULT NULL COMMENT '兑入标识',
  `out_remark` char(50) DEFAULT NULL COMMENT '兑出标识',
  `in_status` char(5) DEFAULT NULL COMMENT '兑入状态 0未处理1已发送2已回报',
  `out_status` char(5) DEFAULT NULL COMMENT '兑出状态 0未处理1已发送2已回报',
  `funds_account` char(20) DEFAULT NULL COMMENT '资金账号',
  `rate_real` decimal(10,3) DEFAULT NULL COMMENT '实际兑换汇率',
  `rate` decimal(10,3) DEFAULT NULL COMMENT '兑换汇率',
  `status` char(5) DEFAULT NULL COMMENT '兑换状态 101待审核 102已完成 103待处理 104已拒绝 105已撤销',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `auditor` char(20) DEFAULT NULL COMMENT '审核人',
  `need_review` varchar(1) DEFAULT NULL COMMENT '是否人工审核 1需要0不需要',
  `side` varchar(2) DEFAULT NULL COMMENT '兑换方向 1正向 2反向',
  `comment` varchar(500) DEFAULT NULL COMMENT '驳回原因',
  `order_reff` varchar(40) DEFAULT NULL COMMENT 'bms流水号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57116 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposit_audite
-- ----------------------------
DROP TABLE IF EXISTS `deposit_audite`;
CREATE TABLE `deposit_audite` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '审核角色  1:交易员 2;会计 3:结算员',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `audit_id` bigint(11) DEFAULT NULL COMMENT '审核人id ',
  `audit_step` int(11) DEFAULT NULL COMMENT '交易员待审核   1；交易员驳回审核 11；会计待审核 2；会计审核退款22；结算员转账3',
  `audit_result` int(11) DEFAULT NULL COMMENT '审核结果\r\n   交易员待审核   100000；交易员审核通过 100010；交易员审核不通过 100020；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核后审核不通过或通过后单据流转到哪步 审核后的最终状态 \r\n    100000；交易员审核通过 100010；交易员审核不通过驳回给用户 100021；交易员审核不通过驳回到会计退款 100022；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_remarks` varchar(250) DEFAULT NULL COMMENT '备注',
  `audit_cert_url` varchar(500) DEFAULT NULL COMMENT '审核凭证',
  `createddate` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `depositId` (`deposit_id`),
  KEY `auditStatus` (`audit_status`)
) ENGINE=InnoDB AUTO_INCREMENT=652960 DEFAULT CHARSET=utf8mb4 COMMENT='入金审核';

-- ----------------------------
-- Table structure for deposit_audite_copy202008251740
-- ----------------------------
DROP TABLE IF EXISTS `deposit_audite_copy202008251740`;
CREATE TABLE `deposit_audite_copy202008251740` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '审核角色  1:交易员 2;会计 3:结算员',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `audit_id` bigint(11) DEFAULT NULL COMMENT '审核人id ',
  `audit_step` int(11) DEFAULT NULL COMMENT '交易员待审核   1；交易员驳回审核 11；会计待审核 2；会计审核退款22；结算员转账3',
  `audit_result` int(11) DEFAULT NULL COMMENT '审核结果\r\n   交易员待审核   100000；交易员审核通过 100010；交易员审核不通过 100020；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核后审核不通过或通过后单据流转到哪步 审核后的最终状态 \r\n    100000；交易员审核通过 100010；交易员审核不通过驳回给用户 100021；交易员审核不通过驳回到会计退款 100022；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_remarks` varchar(250) DEFAULT NULL COMMENT '备注',
  `audit_cert_url` varchar(500) DEFAULT NULL COMMENT '审核凭证',
  `createddate` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `depositId` (`deposit_id`),
  KEY `auditStatus` (`audit_status`)
) ENGINE=InnoDB AUTO_INCREMENT=318320 DEFAULT CHARSET=utf8mb4 COMMENT='入金审核';

-- ----------------------------
-- Table structure for deposit_audite_copy202101131718
-- ----------------------------
DROP TABLE IF EXISTS `deposit_audite_copy202101131718`;
CREATE TABLE `deposit_audite_copy202101131718` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '审核角色  1:交易员 2;会计 3:结算员',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `audit_id` bigint(11) DEFAULT NULL COMMENT '审核人id ',
  `audit_step` int(11) DEFAULT NULL COMMENT '交易员待审核   1；交易员驳回审核 11；会计待审核 2；会计审核退款22；结算员转账3',
  `audit_result` int(11) DEFAULT NULL COMMENT '审核结果\r\n   交易员待审核   100000；交易员审核通过 100010；交易员审核不通过 100020；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核后审核不通过或通过后单据流转到哪步 审核后的最终状态 \r\n    100000；交易员审核通过 100010；交易员审核不通过驳回给用户 100021；交易员审核不通过驳回到会计退款 100022；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_remarks` varchar(250) DEFAULT NULL COMMENT '备注',
  `audit_cert_url` varchar(500) DEFAULT NULL COMMENT '审核凭证',
  `createddate` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `depositId` (`deposit_id`),
  KEY `auditStatus` (`audit_status`)
) ENGINE=InnoDB AUTO_INCREMENT=467404 DEFAULT CHARSET=utf8mb4 COMMENT='入金审核';

-- ----------------------------
-- Table structure for deposit_audite_copy202102051717
-- ----------------------------
DROP TABLE IF EXISTS `deposit_audite_copy202102051717`;
CREATE TABLE `deposit_audite_copy202102051717` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '审核角色  1:交易员 2;会计 3:结算员',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `audit_id` bigint(11) DEFAULT NULL COMMENT '审核人id ',
  `audit_step` int(11) DEFAULT NULL COMMENT '交易员待审核   1；交易员驳回审核 11；会计待审核 2；会计审核退款22；结算员转账3',
  `audit_result` int(11) DEFAULT NULL COMMENT '审核结果\r\n   交易员待审核   100000；交易员审核通过 100010；交易员审核不通过 100020；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核后审核不通过或通过后单据流转到哪步 审核后的最终状态 \r\n    100000；交易员审核通过 100010；交易员审核不通过驳回给用户 100021；交易员审核不通过驳回到会计退款 100022；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_remarks` varchar(250) DEFAULT NULL COMMENT '备注',
  `audit_cert_url` varchar(500) DEFAULT NULL COMMENT '审核凭证',
  `createddate` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `depositId` (`deposit_id`),
  KEY `auditStatus` (`audit_status`)
) ENGINE=InnoDB AUTO_INCREMENT=515216 DEFAULT CHARSET=utf8mb4 COMMENT='入金审核';

-- ----------------------------
-- Table structure for deposit_audite_copy202102181706
-- ----------------------------
DROP TABLE IF EXISTS `deposit_audite_copy202102181706`;
CREATE TABLE `deposit_audite_copy202102181706` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '审核角色  1:交易员 2;会计 3:结算员',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `audit_id` bigint(11) DEFAULT NULL COMMENT '审核人id ',
  `audit_step` int(11) DEFAULT NULL COMMENT '交易员待审核   1；交易员驳回审核 11；会计待审核 2；会计审核退款22；结算员转账3',
  `audit_result` int(11) DEFAULT NULL COMMENT '审核结果\r\n   交易员待审核   100000；交易员审核通过 100010；交易员审核不通过 100020；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核后审核不通过或通过后单据流转到哪步 审核后的最终状态 \r\n    100000；交易员审核通过 100010；交易员审核不通过驳回给用户 100021；交易员审核不通过驳回到会计退款 100022；交易员驳回审核通过 110010；交易员驳回审核不通过 110020；会计审核通过 200010；会计审核驳回 200020；会计审核待退款 220000；会计同意退款 220010；结算员转入 300010',
  `audit_remarks` varchar(250) DEFAULT NULL COMMENT '备注',
  `audit_cert_url` varchar(500) DEFAULT NULL COMMENT '审核凭证',
  `createddate` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `depositId` (`deposit_id`),
  KEY `auditStatus` (`audit_status`)
) ENGINE=InnoDB AUTO_INCREMENT=533738 DEFAULT CHARSET=utf8mb4 COMMENT='入金审核';

-- ----------------------------
-- Table structure for deposit_detail
-- ----------------------------
DROP TABLE IF EXISTS `deposit_detail`;
CREATE TABLE `deposit_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_money_apply_id` int(11) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL COMMENT '开户名称',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '开户电话',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `currency` tinyint(4) DEFAULT NULL COMMENT '2:港币;3:美元',
  `region` varchar(20) DEFAULT NULL COMMENT '入金银行卡国家简称 cn:中国 hk:香港 us:美国',
  `deposit_bank_name` varchar(150) DEFAULT NULL COMMENT '入金银行名称',
  `deposit_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '入金银行中文名称',
  `deposit_bank_code` varchar(50) DEFAULT NULL COMMENT '入金银行编码',
  `receive_bank_name` varchar(150) DEFAULT NULL COMMENT '收款银行名称',
  `receive_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '收款银行中文名称',
  `receive_bank_code` varchar(50) DEFAULT NULL COMMENT '收款银行编码',
  `receive_account` varchar(200) DEFAULT NULL COMMENT '收款人账号 大陆是子账号，香港是银行收款账号',
  `subaccount_id` bigint(11) DEFAULT NULL COMMENT '子账号id',
  `deposit_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额 保留4位小数',
  `transfer_amount` decimal(20,4) DEFAULT NULL COMMENT '到账金额 保留4位小数',
  `deposit_type` tinyint(4) DEFAULT NULL COMMENT '存入方式  1:转账2:支票；3:现金 4:电汇',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `IP` varchar(50) DEFAULT NULL COMMENT 'IP',
  `certificate` varchar(500) DEFAULT NULL COMMENT '申请凭证',
  `cert_md5` varchar(50) DEFAULT NULL COMMENT '凭证md5 凭证base64 生成md5',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核结果',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_reson` varchar(200) DEFAULT NULL COMMENT '审核不通过的理由',
  `src` tinyint(4) DEFAULT NULL COMMENT '来源 1:app 2:交易员录入',
  `remit_date` datetime DEFAULT NULL COMMENT '汇款日期',
  `ver` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '版本号，乐观锁',
  `transfer_certificate` varchar(500) DEFAULT NULL COMMENT '到账凭证',
  `transfer_certificate_no` varchar(150) DEFAULT NULL COMMENT '到账凭证——流水号',
  `button_code` int(11) DEFAULT NULL COMMENT '用户入金点击按钮',
  `source` int(11) DEFAULT NULL COMMENT '1_用户提交 2_手工录入 3_重新入金',
  `deposit_account_name` varchar(150) DEFAULT NULL COMMENT '入金账户账户名',
  `deposit_bank_card` varchar(50) DEFAULT NULL COMMENT '入金银行账号',
  `trader_status` varchar(5) DEFAULT '0' COMMENT '柜台状态  0未提交到柜台 1已提交到柜台 2已查询到柜台返回结果',
  `order_reff` varchar(40) DEFAULT NULL COMMENT 'bms操作流水号',
  `dom_supplement` int(5) DEFAULT NULL COMMENT '是否需要补充凭证',
  `is_automatic` int(5) DEFAULT '0' COMMENT '是否自动审核0不是1是',
  `is_complete` int(5) DEFAULT '0' COMMENT '是否对账完成0未完成1已完成',
  `deposit_step` int(5) DEFAULT NULL COMMENT '90%购买力入金步骤，正常入金为空',
  `deposit_natural_id` bigint(11) DEFAULT NULL COMMENT '90%购买力入金对应的正常入金',
  `advance_amount` decimal(20,4) DEFAULT NULL COMMENT '提前入金购买力',
  `big_data_ccy` varchar(5) DEFAULT NULL COMMENT '大数据识别币种',
  `no_automatic_reason` varchar(20) DEFAULT NULL COMMENT '没进入自动列表原因',
  `deposit_fail_code` varchar(20) DEFAULT NULL COMMENT '银证转账入金失败代码',
  `deposit_fail_reason` varchar(150) DEFAULT NULL COMMENT '银证转账入金失败原因',
  `bank_reference` varchar(50) DEFAULT NULL COMMENT '银证转账银行流水号',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `phoneNumber` (`phone_mobile`),
  KEY `certMd5` (`cert_md5`),
  KEY `auditStatus` (`audit_status`),
  KEY `idx_transfer_certificate_no` (`transfer_certificate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=322661 DEFAULT CHARSET=utf8mb4 COMMENT='入金信息';

-- ----------------------------
-- Table structure for deposit_detail_copy202009081015
-- ----------------------------
DROP TABLE IF EXISTS `deposit_detail_copy202009081015`;
CREATE TABLE `deposit_detail_copy202009081015` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_money_apply_id` int(11) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL COMMENT '开户名称',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '开户电话',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `currency` tinyint(4) DEFAULT NULL COMMENT '2:港币;3:美元',
  `region` varchar(20) DEFAULT NULL COMMENT '入金银行卡国家简称 cn:中国 hk:香港 us:美国',
  `deposit_bank_name` varchar(150) DEFAULT NULL COMMENT '入金银行名称',
  `deposit_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '入金银行中文名称',
  `deposit_bank_code` varchar(50) DEFAULT NULL COMMENT '入金银行编码',
  `receive_bank_name` varchar(150) DEFAULT NULL COMMENT '收款银行名称',
  `receive_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '收款银行中文名称',
  `receive_bank_code` varchar(50) DEFAULT NULL COMMENT '收款银行编码',
  `receive_account` varchar(200) DEFAULT NULL COMMENT '收款人账号 大陆是子账号，香港是银行收款账号',
  `subaccount_id` bigint(11) DEFAULT NULL COMMENT '子账号id',
  `deposit_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额 保留4位小数',
  `transfer_amount` decimal(20,4) DEFAULT NULL COMMENT '到账金额 保留4位小数',
  `deposit_type` tinyint(4) DEFAULT NULL COMMENT '存入方式  1:转账2:支票；3:现金 4:电汇',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `IP` varchar(50) DEFAULT NULL COMMENT 'IP',
  `certificate` varchar(500) DEFAULT NULL COMMENT '申请凭证',
  `cert_md5` varchar(50) DEFAULT NULL COMMENT '凭证md5 凭证base64 生成md5',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核结果',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_reson` varchar(200) DEFAULT NULL COMMENT '审核不通过的理由',
  `src` tinyint(4) DEFAULT NULL COMMENT '来源 1:app 2:交易员录入',
  `remit_date` datetime DEFAULT NULL COMMENT '汇款日期',
  `ver` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '版本号，乐观锁',
  `transfer_certificate` varchar(500) DEFAULT NULL COMMENT '到账凭证',
  `transfer_certificate_no` varchar(150) DEFAULT NULL COMMENT '到账凭证——流水号',
  `button_code` int(11) DEFAULT NULL COMMENT '用户入金点击按钮',
  `source` int(11) DEFAULT NULL COMMENT '1_用户提交 2_手工录入 3_重新入金',
  `deposit_account_name` varchar(150) DEFAULT NULL COMMENT '入金账户账户名',
  `deposit_bank_card` varchar(50) DEFAULT NULL COMMENT '入金银行账号',
  `trader_status` varchar(5) DEFAULT '0' COMMENT '柜台状态  0未提交到柜台 1已提交到柜台 2已查询到柜台返回结果',
  `order_reff` varchar(40) DEFAULT NULL COMMENT 'bms操作流水号',
  `dom_supplement` int(5) DEFAULT NULL COMMENT '是否需要补充凭证',
  `is_automatic` int(5) DEFAULT '0' COMMENT '是否自动审核0不是1是',
  `is_complete` int(5) DEFAULT '0' COMMENT '是否对账完成0未完成1已完成',
  `deposit_step` int(5) DEFAULT NULL COMMENT '90%购买力入金步骤，正常入金为空',
  `deposit_natural_id` bigint(11) DEFAULT NULL COMMENT '90%购买力入金对应的正常入金',
  `advance_amount` decimal(20,4) DEFAULT NULL COMMENT '提前入金购买力',
  `big_data_ccy` varchar(5) DEFAULT NULL COMMENT '大数据识别币种',
  `no_automatic_reason` varchar(20) DEFAULT NULL COMMENT '没进入自动列表原因',
  `deposit_fail_code` varchar(20) DEFAULT NULL COMMENT '银证转账入金失败代码',
  `deposit_fail_reason` varchar(150) DEFAULT NULL COMMENT '银证转账入金失败原因',
  `bank_reference` varchar(50) DEFAULT NULL COMMENT '银证转账银行流水号',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `phoneNumber` (`phone_mobile`),
  KEY `certMd5` (`cert_md5`),
  KEY `auditStatus` (`audit_status`),
  KEY `idx_transfer_certificate_no` (`transfer_certificate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=132458 DEFAULT CHARSET=utf8mb4 COMMENT='入金信息';

-- ----------------------------
-- Table structure for deposit_detail_copy202101131718
-- ----------------------------
DROP TABLE IF EXISTS `deposit_detail_copy202101131718`;
CREATE TABLE `deposit_detail_copy202101131718` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_money_apply_id` int(11) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL COMMENT '开户名称',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '开户电话',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `currency` tinyint(4) DEFAULT NULL COMMENT '2:港币;3:美元',
  `region` varchar(20) DEFAULT NULL COMMENT '入金银行卡国家简称 cn:中国 hk:香港 us:美国',
  `deposit_bank_name` varchar(150) DEFAULT NULL COMMENT '入金银行名称',
  `deposit_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '入金银行中文名称',
  `deposit_bank_code` varchar(50) DEFAULT NULL COMMENT '入金银行编码',
  `receive_bank_name` varchar(150) DEFAULT NULL COMMENT '收款银行名称',
  `receive_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '收款银行中文名称',
  `receive_bank_code` varchar(50) DEFAULT NULL COMMENT '收款银行编码',
  `receive_account` varchar(200) DEFAULT NULL COMMENT '收款人账号 大陆是子账号，香港是银行收款账号',
  `subaccount_id` bigint(11) DEFAULT NULL COMMENT '子账号id',
  `deposit_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额 保留4位小数',
  `transfer_amount` decimal(20,4) DEFAULT NULL COMMENT '到账金额 保留4位小数',
  `deposit_type` tinyint(4) DEFAULT NULL COMMENT '存入方式  1:转账2:支票；3:现金 4:电汇',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `IP` varchar(50) DEFAULT NULL COMMENT 'IP',
  `certificate` varchar(500) DEFAULT NULL COMMENT '申请凭证',
  `cert_md5` varchar(50) DEFAULT NULL COMMENT '凭证md5 凭证base64 生成md5',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核结果',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_reson` varchar(200) DEFAULT NULL COMMENT '审核不通过的理由',
  `src` tinyint(4) DEFAULT NULL COMMENT '来源 1:app 2:交易员录入',
  `remit_date` datetime DEFAULT NULL COMMENT '汇款日期',
  `ver` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '版本号，乐观锁',
  `transfer_certificate` varchar(500) DEFAULT NULL COMMENT '到账凭证',
  `transfer_certificate_no` varchar(150) DEFAULT NULL COMMENT '到账凭证——流水号',
  `button_code` int(11) DEFAULT NULL COMMENT '用户入金点击按钮',
  `source` int(11) DEFAULT NULL COMMENT '1_用户提交 2_手工录入 3_重新入金',
  `deposit_account_name` varchar(150) DEFAULT NULL COMMENT '入金账户账户名',
  `deposit_bank_card` varchar(50) DEFAULT NULL COMMENT '入金银行账号',
  `trader_status` varchar(5) DEFAULT '0' COMMENT '柜台状态  0未提交到柜台 1已提交到柜台 2已查询到柜台返回结果',
  `order_reff` varchar(40) DEFAULT NULL COMMENT 'bms操作流水号',
  `dom_supplement` int(5) DEFAULT NULL COMMENT '是否需要补充凭证',
  `is_automatic` int(5) DEFAULT '0' COMMENT '是否自动审核0不是1是',
  `is_complete` int(5) DEFAULT '0' COMMENT '是否对账完成0未完成1已完成',
  `deposit_step` int(5) DEFAULT NULL COMMENT '90%购买力入金步骤，正常入金为空',
  `deposit_natural_id` bigint(11) DEFAULT NULL COMMENT '90%购买力入金对应的正常入金',
  `advance_amount` decimal(20,4) DEFAULT NULL COMMENT '提前入金购买力',
  `big_data_ccy` varchar(5) DEFAULT NULL COMMENT '大数据识别币种',
  `no_automatic_reason` varchar(20) DEFAULT NULL COMMENT '没进入自动列表原因',
  `deposit_fail_code` varchar(20) DEFAULT NULL COMMENT '银证转账入金失败代码',
  `deposit_fail_reason` varchar(150) DEFAULT NULL COMMENT '银证转账入金失败原因',
  `bank_reference` varchar(50) DEFAULT NULL COMMENT '银证转账银行流水号',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `phoneNumber` (`phone_mobile`),
  KEY `certMd5` (`cert_md5`),
  KEY `auditStatus` (`audit_status`),
  KEY `idx_transfer_certificate_no` (`transfer_certificate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=208793 DEFAULT CHARSET=utf8mb4 COMMENT='入金信息';

-- ----------------------------
-- Table structure for deposit_detail_copy202102051717
-- ----------------------------
DROP TABLE IF EXISTS `deposit_detail_copy202102051717`;
CREATE TABLE `deposit_detail_copy202102051717` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_money_apply_id` int(11) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL COMMENT '开户名称',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '开户电话',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `currency` tinyint(4) DEFAULT NULL COMMENT '2:港币;3:美元',
  `region` varchar(20) DEFAULT NULL COMMENT '入金银行卡国家简称 cn:中国 hk:香港 us:美国',
  `deposit_bank_name` varchar(150) DEFAULT NULL COMMENT '入金银行名称',
  `deposit_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '入金银行中文名称',
  `deposit_bank_code` varchar(50) DEFAULT NULL COMMENT '入金银行编码',
  `receive_bank_name` varchar(150) DEFAULT NULL COMMENT '收款银行名称',
  `receive_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '收款银行中文名称',
  `receive_bank_code` varchar(50) DEFAULT NULL COMMENT '收款银行编码',
  `receive_account` varchar(200) DEFAULT NULL COMMENT '收款人账号 大陆是子账号，香港是银行收款账号',
  `subaccount_id` bigint(11) DEFAULT NULL COMMENT '子账号id',
  `deposit_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额 保留4位小数',
  `transfer_amount` decimal(20,4) DEFAULT NULL COMMENT '到账金额 保留4位小数',
  `deposit_type` tinyint(4) DEFAULT NULL COMMENT '存入方式  1:转账2:支票；3:现金 4:电汇',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `IP` varchar(50) DEFAULT NULL COMMENT 'IP',
  `certificate` varchar(500) DEFAULT NULL COMMENT '申请凭证',
  `cert_md5` varchar(50) DEFAULT NULL COMMENT '凭证md5 凭证base64 生成md5',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核结果',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_reson` varchar(200) DEFAULT NULL COMMENT '审核不通过的理由',
  `src` tinyint(4) DEFAULT NULL COMMENT '来源 1:app 2:交易员录入',
  `remit_date` datetime DEFAULT NULL COMMENT '汇款日期',
  `ver` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '版本号，乐观锁',
  `transfer_certificate` varchar(500) DEFAULT NULL COMMENT '到账凭证',
  `transfer_certificate_no` varchar(150) DEFAULT NULL COMMENT '到账凭证——流水号',
  `button_code` int(11) DEFAULT NULL COMMENT '用户入金点击按钮',
  `source` int(11) DEFAULT NULL COMMENT '1_用户提交 2_手工录入 3_重新入金',
  `deposit_account_name` varchar(150) DEFAULT NULL COMMENT '入金账户账户名',
  `deposit_bank_card` varchar(50) DEFAULT NULL COMMENT '入金银行账号',
  `trader_status` varchar(5) DEFAULT '0' COMMENT '柜台状态  0未提交到柜台 1已提交到柜台 2已查询到柜台返回结果',
  `order_reff` varchar(40) DEFAULT NULL COMMENT 'bms操作流水号',
  `dom_supplement` int(5) DEFAULT NULL COMMENT '是否需要补充凭证',
  `is_automatic` int(5) DEFAULT '0' COMMENT '是否自动审核0不是1是',
  `is_complete` int(5) DEFAULT '0' COMMENT '是否对账完成0未完成1已完成',
  `deposit_step` int(5) DEFAULT NULL COMMENT '90%购买力入金步骤，正常入金为空',
  `deposit_natural_id` bigint(11) DEFAULT NULL COMMENT '90%购买力入金对应的正常入金',
  `advance_amount` decimal(20,4) DEFAULT NULL COMMENT '提前入金购买力',
  `big_data_ccy` varchar(5) DEFAULT NULL COMMENT '大数据识别币种',
  `no_automatic_reason` varchar(20) DEFAULT NULL COMMENT '没进入自动列表原因',
  `deposit_fail_code` varchar(20) DEFAULT NULL COMMENT '银证转账入金失败代码',
  `deposit_fail_reason` varchar(150) DEFAULT NULL COMMENT '银证转账入金失败原因',
  `bank_reference` varchar(50) DEFAULT NULL COMMENT '银证转账银行流水号',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `phoneNumber` (`phone_mobile`),
  KEY `certMd5` (`cert_md5`),
  KEY `auditStatus` (`audit_status`),
  KEY `idx_transfer_certificate_no` (`transfer_certificate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=236668 DEFAULT CHARSET=utf8mb4 COMMENT='入金信息';

-- ----------------------------
-- Table structure for deposit_detail_copy202102181706
-- ----------------------------
DROP TABLE IF EXISTS `deposit_detail_copy202102181706`;
CREATE TABLE `deposit_detail_copy202102181706` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_money_apply_id` int(11) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL COMMENT '开户名称',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '开户电话',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `currency` tinyint(4) DEFAULT NULL COMMENT '2:港币;3:美元',
  `region` varchar(20) DEFAULT NULL COMMENT '入金银行卡国家简称 cn:中国 hk:香港 us:美国',
  `deposit_bank_name` varchar(150) DEFAULT NULL COMMENT '入金银行名称',
  `deposit_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '入金银行中文名称',
  `deposit_bank_code` varchar(50) DEFAULT NULL COMMENT '入金银行编码',
  `receive_bank_name` varchar(150) DEFAULT NULL COMMENT '收款银行名称',
  `receive_bank_name_cn` varchar(150) DEFAULT NULL COMMENT '收款银行中文名称',
  `receive_bank_code` varchar(50) DEFAULT NULL COMMENT '收款银行编码',
  `receive_account` varchar(200) DEFAULT NULL COMMENT '收款人账号 大陆是子账号，香港是银行收款账号',
  `subaccount_id` bigint(11) DEFAULT NULL COMMENT '子账号id',
  `deposit_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额 保留4位小数',
  `transfer_amount` decimal(20,4) DEFAULT NULL COMMENT '到账金额 保留4位小数',
  `deposit_type` tinyint(4) DEFAULT NULL COMMENT '存入方式  1:转账2:支票；3:现金 4:电汇',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `IP` varchar(50) DEFAULT NULL COMMENT 'IP',
  `certificate` varchar(500) DEFAULT NULL COMMENT '申请凭证',
  `cert_md5` varchar(50) DEFAULT NULL COMMENT '凭证md5 凭证base64 生成md5',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `auditor` varchar(100) DEFAULT NULL COMMENT '审核人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核结果',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_reson` varchar(200) DEFAULT NULL COMMENT '审核不通过的理由',
  `src` tinyint(4) DEFAULT NULL COMMENT '来源 1:app 2:交易员录入',
  `remit_date` datetime DEFAULT NULL COMMENT '汇款日期',
  `ver` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '版本号，乐观锁',
  `transfer_certificate` varchar(500) DEFAULT NULL COMMENT '到账凭证',
  `transfer_certificate_no` varchar(150) DEFAULT NULL COMMENT '到账凭证——流水号',
  `button_code` int(11) DEFAULT NULL COMMENT '用户入金点击按钮',
  `source` int(11) DEFAULT NULL COMMENT '1_用户提交 2_手工录入 3_重新入金',
  `deposit_account_name` varchar(150) DEFAULT NULL COMMENT '入金账户账户名',
  `deposit_bank_card` varchar(50) DEFAULT NULL COMMENT '入金银行账号',
  `trader_status` varchar(5) DEFAULT '0' COMMENT '柜台状态  0未提交到柜台 1已提交到柜台 2已查询到柜台返回结果',
  `order_reff` varchar(40) DEFAULT NULL COMMENT 'bms操作流水号',
  `dom_supplement` int(5) DEFAULT NULL COMMENT '是否需要补充凭证',
  `is_automatic` int(5) DEFAULT '0' COMMENT '是否自动审核0不是1是',
  `is_complete` int(5) DEFAULT '0' COMMENT '是否对账完成0未完成1已完成',
  `deposit_step` int(5) DEFAULT NULL COMMENT '90%购买力入金步骤，正常入金为空',
  `deposit_natural_id` bigint(11) DEFAULT NULL COMMENT '90%购买力入金对应的正常入金',
  `advance_amount` decimal(20,4) DEFAULT NULL COMMENT '提前入金购买力',
  `big_data_ccy` varchar(5) DEFAULT NULL COMMENT '大数据识别币种',
  `no_automatic_reason` varchar(20) DEFAULT NULL COMMENT '没进入自动列表原因',
  `deposit_fail_code` varchar(20) DEFAULT NULL COMMENT '银证转账入金失败代码',
  `deposit_fail_reason` varchar(150) DEFAULT NULL COMMENT '银证转账入金失败原因',
  `bank_reference` varchar(50) DEFAULT NULL COMMENT '银证转账银行流水号',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `phoneNumber` (`phone_mobile`),
  KEY `certMd5` (`cert_md5`),
  KEY `auditStatus` (`audit_status`),
  KEY `idx_transfer_certificate_no` (`transfer_certificate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=248407 DEFAULT CHARSET=utf8mb4 COMMENT='入金信息';

-- ----------------------------
-- Table structure for deposit_from_bigdata
-- ----------------------------
DROP TABLE IF EXISTS `deposit_from_bigdata`;
CREATE TABLE `deposit_from_bigdata` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `bank` varchar(20) DEFAULT NULL COMMENT '用户的入金汇入的银行，取值（BOC， DBS）',
  `seq_no` varchar(64) DEFAULT NULL COMMENT '交易流水号',
  `acct_no` varchar(40) DEFAULT NULL COMMENT '尊嘉证券在香港BOS/DBS的银行账号',
  `trading_time` varchar(40) DEFAULT NULL COMMENT 'BOS/DBS收到入金的日期和时间, yyyy-mm-dd HH:MM:SS',
  `cur` varchar(20) DEFAULT NULL COMMENT '收到的入金币种（HKD,CNY,USD)',
  `amount` varchar(20) DEFAULT NULL COMMENT '金额',
  `debit_direction` varchar(20) DEFAULT NULL COMMENT '借贷方向，取值：C：入金，D：出金',
  `reciprocal_account` longtext COMMENT '对方账号,出入金用户的银行账号',
  `reciprocal_account_name` longtext COMMENT '对方账号名称',
  `reciprocal_account_bank` longtext COMMENT '对方开户银行',
  `reciprocal_account_address` varchar(20) DEFAULT NULL COMMENT '对方开户地',
  `transfer_bank` varchar(20) DEFAULT NULL COMMENT '中转银行',
  `bank_charges` varchar(20) DEFAULT NULL COMMENT '银行手续费',
  `particulars` longtext COMMENT '摘要',
  `purpose` varchar(128) DEFAULT NULL COMMENT '用途',
  `postscript` longtext COMMENT '附言，重要，用户在银行汇款时的留言',
  `status` int(2) DEFAULT NULL COMMENT '数据状态1已匹配0未匹配2其他3已审核',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `match_date` datetime DEFAULT NULL COMMENT '匹配时间',
  `type` varchar(30) DEFAULT NULL COMMENT '转账类型',
  PRIMARY KEY (`id`),
  KEY `idx_deposit_id` (`deposit_id`),
  KEY `idx_seq_no` (`seq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=284616 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposit_from_bigdata_copy202008251740
-- ----------------------------
DROP TABLE IF EXISTS `deposit_from_bigdata_copy202008251740`;
CREATE TABLE `deposit_from_bigdata_copy202008251740` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `bank` varchar(20) DEFAULT NULL COMMENT '用户的入金汇入的银行，取值（BOC， DBS）',
  `seq_no` varchar(64) DEFAULT NULL COMMENT '交易流水号',
  `acct_no` varchar(20) DEFAULT NULL COMMENT '尊嘉证券在香港BOS/DBS的银行账号',
  `trading_time` varchar(40) DEFAULT NULL COMMENT 'BOS/DBS收到入金的日期和时间, yyyy-mm-dd HH:MM:SS',
  `cur` varchar(20) DEFAULT NULL COMMENT '收到的入金币种（HKD,CNY,USD)',
  `amount` varchar(20) DEFAULT NULL COMMENT '金额',
  `debit_direction` varchar(20) DEFAULT NULL COMMENT '借贷方向，取值：C：入金，D：出金',
  `reciprocal_account` longtext COMMENT '对方账号,出入金用户的银行账号',
  `reciprocal_account_name` longtext COMMENT '对方账号名称',
  `reciprocal_account_bank` longtext COMMENT '对方开户银行',
  `reciprocal_account_address` varchar(20) DEFAULT NULL COMMENT '对方开户地',
  `transfer_bank` varchar(20) DEFAULT NULL COMMENT '中转银行',
  `bank_charges` varchar(20) DEFAULT NULL COMMENT '银行手续费',
  `particulars` longtext COMMENT '摘要',
  `purpose` varchar(128) DEFAULT NULL COMMENT '用途',
  `postscript` longtext COMMENT '附言，重要，用户在银行汇款时的留言',
  `status` int(2) DEFAULT NULL COMMENT '数据状态1已匹配0未匹配2其他3已审核',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `match_date` datetime DEFAULT NULL COMMENT '匹配时间',
  `type` varchar(30) DEFAULT NULL COMMENT '转账类型',
  PRIMARY KEY (`id`),
  KEY `idx_deposit_id` (`deposit_id`),
  KEY `idx_seq_no` (`seq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=102324 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposit_from_bigdata_copy202101131718
-- ----------------------------
DROP TABLE IF EXISTS `deposit_from_bigdata_copy202101131718`;
CREATE TABLE `deposit_from_bigdata_copy202101131718` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `bank` varchar(20) DEFAULT NULL COMMENT '用户的入金汇入的银行，取值（BOC， DBS）',
  `seq_no` varchar(64) DEFAULT NULL COMMENT '交易流水号',
  `acct_no` varchar(40) DEFAULT NULL COMMENT '尊嘉证券在香港BOS/DBS的银行账号',
  `trading_time` varchar(40) DEFAULT NULL COMMENT 'BOS/DBS收到入金的日期和时间, yyyy-mm-dd HH:MM:SS',
  `cur` varchar(20) DEFAULT NULL COMMENT '收到的入金币种（HKD,CNY,USD)',
  `amount` varchar(20) DEFAULT NULL COMMENT '金额',
  `debit_direction` varchar(20) DEFAULT NULL COMMENT '借贷方向，取值：C：入金，D：出金',
  `reciprocal_account` longtext COMMENT '对方账号,出入金用户的银行账号',
  `reciprocal_account_name` longtext COMMENT '对方账号名称',
  `reciprocal_account_bank` longtext COMMENT '对方开户银行',
  `reciprocal_account_address` varchar(20) DEFAULT NULL COMMENT '对方开户地',
  `transfer_bank` varchar(20) DEFAULT NULL COMMENT '中转银行',
  `bank_charges` varchar(20) DEFAULT NULL COMMENT '银行手续费',
  `particulars` longtext COMMENT '摘要',
  `purpose` varchar(128) DEFAULT NULL COMMENT '用途',
  `postscript` longtext COMMENT '附言，重要，用户在银行汇款时的留言',
  `status` int(2) DEFAULT NULL COMMENT '数据状态1已匹配0未匹配2其他3已审核',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `match_date` datetime DEFAULT NULL COMMENT '匹配时间',
  `type` varchar(30) DEFAULT NULL COMMENT '转账类型',
  PRIMARY KEY (`id`),
  KEY `idx_deposit_id` (`deposit_id`),
  KEY `idx_seq_no` (`seq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=179378 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposit_from_bigdata_copy202102051717
-- ----------------------------
DROP TABLE IF EXISTS `deposit_from_bigdata_copy202102051717`;
CREATE TABLE `deposit_from_bigdata_copy202102051717` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `bank` varchar(20) DEFAULT NULL COMMENT '用户的入金汇入的银行，取值（BOC， DBS）',
  `seq_no` varchar(64) DEFAULT NULL COMMENT '交易流水号',
  `acct_no` varchar(40) DEFAULT NULL COMMENT '尊嘉证券在香港BOS/DBS的银行账号',
  `trading_time` varchar(40) DEFAULT NULL COMMENT 'BOS/DBS收到入金的日期和时间, yyyy-mm-dd HH:MM:SS',
  `cur` varchar(20) DEFAULT NULL COMMENT '收到的入金币种（HKD,CNY,USD)',
  `amount` varchar(20) DEFAULT NULL COMMENT '金额',
  `debit_direction` varchar(20) DEFAULT NULL COMMENT '借贷方向，取值：C：入金，D：出金',
  `reciprocal_account` longtext COMMENT '对方账号,出入金用户的银行账号',
  `reciprocal_account_name` longtext COMMENT '对方账号名称',
  `reciprocal_account_bank` longtext COMMENT '对方开户银行',
  `reciprocal_account_address` varchar(20) DEFAULT NULL COMMENT '对方开户地',
  `transfer_bank` varchar(20) DEFAULT NULL COMMENT '中转银行',
  `bank_charges` varchar(20) DEFAULT NULL COMMENT '银行手续费',
  `particulars` longtext COMMENT '摘要',
  `purpose` varchar(128) DEFAULT NULL COMMENT '用途',
  `postscript` longtext COMMENT '附言，重要，用户在银行汇款时的留言',
  `status` int(2) DEFAULT NULL COMMENT '数据状态1已匹配0未匹配2其他3已审核',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `match_date` datetime DEFAULT NULL COMMENT '匹配时间',
  `type` varchar(30) DEFAULT NULL COMMENT '转账类型',
  PRIMARY KEY (`id`),
  KEY `idx_deposit_id` (`deposit_id`),
  KEY `idx_seq_no` (`seq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=204730 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposit_from_bigdata_copy202102181706
-- ----------------------------
DROP TABLE IF EXISTS `deposit_from_bigdata_copy202102181706`;
CREATE TABLE `deposit_from_bigdata_copy202102181706` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `bank` varchar(20) DEFAULT NULL COMMENT '用户的入金汇入的银行，取值（BOC， DBS）',
  `seq_no` varchar(64) DEFAULT NULL COMMENT '交易流水号',
  `acct_no` varchar(40) DEFAULT NULL COMMENT '尊嘉证券在香港BOS/DBS的银行账号',
  `trading_time` varchar(40) DEFAULT NULL COMMENT 'BOS/DBS收到入金的日期和时间, yyyy-mm-dd HH:MM:SS',
  `cur` varchar(20) DEFAULT NULL COMMENT '收到的入金币种（HKD,CNY,USD)',
  `amount` varchar(20) DEFAULT NULL COMMENT '金额',
  `debit_direction` varchar(20) DEFAULT NULL COMMENT '借贷方向，取值：C：入金，D：出金',
  `reciprocal_account` longtext COMMENT '对方账号,出入金用户的银行账号',
  `reciprocal_account_name` longtext COMMENT '对方账号名称',
  `reciprocal_account_bank` longtext COMMENT '对方开户银行',
  `reciprocal_account_address` varchar(20) DEFAULT NULL COMMENT '对方开户地',
  `transfer_bank` varchar(20) DEFAULT NULL COMMENT '中转银行',
  `bank_charges` varchar(20) DEFAULT NULL COMMENT '银行手续费',
  `particulars` longtext COMMENT '摘要',
  `purpose` varchar(128) DEFAULT NULL COMMENT '用途',
  `postscript` longtext COMMENT '附言，重要，用户在银行汇款时的留言',
  `status` int(2) DEFAULT NULL COMMENT '数据状态1已匹配0未匹配2其他3已审核',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `match_date` datetime DEFAULT NULL COMMENT '匹配时间',
  `type` varchar(30) DEFAULT NULL COMMENT '转账类型',
  PRIMARY KEY (`id`),
  KEY `idx_deposit_id` (`deposit_id`),
  KEY `idx_seq_no` (`seq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=215806 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposit_rate
-- ----------------------------
DROP TABLE IF EXISTS `deposit_rate`;
CREATE TABLE `deposit_rate` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ccy` varchar(5) DEFAULT NULL,
  `rate` decimal(5,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposit_subaccount
-- ----------------------------
DROP TABLE IF EXISTS `deposit_subaccount`;
CREATE TABLE `deposit_subaccount` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `subaccount` varchar(20) DEFAULT NULL COMMENT '子账号',
  `apply_date` datetime DEFAULT NULL COMMENT '子账号申请日期',
  `expire_date` datetime DEFAULT NULL COMMENT '子账号到期日期 计算规则：申请日期在10号之前（包括10号），有效期截止到本月倒数第二天，申请日期在10号之后，有效期截止到下月倒数第二天',
  `validate_day` int(11) DEFAULT NULL COMMENT '有效期天数  到期日期减去申请日期',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '子账号所属银行名称',
  `bank_name_cn` varchar(150) DEFAULT NULL COMMENT '子账号所属银行中文名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '子账号所属银行code',
  `receiver_account_name` varchar(100) DEFAULT NULL COMMENT '收款人账户名称 规则：JC+名字拼音大写(中间没有空格) 大陆入金',
  `effect_date` datetime DEFAULT NULL COMMENT '子账号生效时间',
  `is_effective` int(11) DEFAULT '0' COMMENT '子账号是否生效，1生效，0未生效，定时任务发送短信和邮件使用',
  `send_time` datetime DEFAULT NULL COMMENT '定时任务发送短信和邮件时间',
  `crm_status` int(5) DEFAULT '0' COMMENT '是否在crm中显示 1显示0不显示',
  `open_subaccount_error` varchar(255) DEFAULT NULL COMMENT '开通子账户异常信息',
  PRIMARY KEY (`id`),
  KEY `funds_account` (`funds_account`),
  KEY `phone_mobile` (`phone_mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=43204 DEFAULT CHARSET=utf8mb4 COMMENT='子账号信息';

-- ----------------------------
-- Table structure for deposit_subaccount_copy202007081710
-- ----------------------------
DROP TABLE IF EXISTS `deposit_subaccount_copy202007081710`;
CREATE TABLE `deposit_subaccount_copy202007081710` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `subaccount` varchar(20) DEFAULT NULL COMMENT '子账号',
  `apply_date` datetime DEFAULT NULL COMMENT '子账号申请日期',
  `expire_date` datetime DEFAULT NULL COMMENT '子账号到期日期 计算规则：申请日期在10号之前（包括10号），有效期截止到本月倒数第二天，申请日期在10号之后，有效期截止到下月倒数第二天',
  `validate_day` int(11) DEFAULT NULL COMMENT '有效期天数  到期日期减去申请日期',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '子账号所属银行名称',
  `bank_name_cn` varchar(150) DEFAULT NULL COMMENT '子账号所属银行中文名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '子账号所属银行code',
  `receiver_account_name` varchar(100) DEFAULT NULL COMMENT '收款人账户名称 规则：JC+名字拼音大写(中间没有空格) 大陆入金',
  `effect_date` datetime DEFAULT NULL COMMENT '子账号生效时间',
  `is_effective` int(11) DEFAULT '0' COMMENT '子账号是否生效，1生效，0未生效，定时任务发送短信和邮件使用',
  `send_time` datetime DEFAULT NULL COMMENT '定时任务发送短信和邮件时间',
  `crm_status` int(5) DEFAULT '0' COMMENT '是否在crm中显示 1显示0不显示',
  PRIMARY KEY (`id`),
  KEY `funds_account` (`funds_account`),
  KEY `phone_mobile` (`phone_mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=24089 DEFAULT CHARSET=utf8mb4 COMMENT='子账号信息';

-- ----------------------------
-- Table structure for deposit_subaccount_copy202007081731
-- ----------------------------
DROP TABLE IF EXISTS `deposit_subaccount_copy202007081731`;
CREATE TABLE `deposit_subaccount_copy202007081731` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `subaccount` varchar(20) DEFAULT NULL COMMENT '子账号',
  `apply_date` datetime DEFAULT NULL COMMENT '子账号申请日期',
  `expire_date` datetime DEFAULT NULL COMMENT '子账号到期日期 计算规则：申请日期在10号之前（包括10号），有效期截止到本月倒数第二天，申请日期在10号之后，有效期截止到下月倒数第二天',
  `validate_day` int(11) DEFAULT NULL COMMENT '有效期天数  到期日期减去申请日期',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '子账号所属银行名称',
  `bank_name_cn` varchar(150) DEFAULT NULL COMMENT '子账号所属银行中文名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '子账号所属银行code',
  `receiver_account_name` varchar(100) DEFAULT NULL COMMENT '收款人账户名称 规则：JC+名字拼音大写(中间没有空格) 大陆入金',
  `effect_date` datetime DEFAULT NULL COMMENT '子账号生效时间',
  `is_effective` int(11) DEFAULT '0' COMMENT '子账号是否生效，1生效，0未生效，定时任务发送短信和邮件使用',
  `send_time` datetime DEFAULT NULL COMMENT '定时任务发送短信和邮件时间',
  `crm_status` int(5) DEFAULT '0' COMMENT '是否在crm中显示 1显示0不显示',
  PRIMARY KEY (`id`),
  KEY `funds_account` (`funds_account`),
  KEY `phone_mobile` (`phone_mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=24089 DEFAULT CHARSET=utf8mb4 COMMENT='子账号信息';

-- ----------------------------
-- Table structure for deposit_subaccount_copy202009221512
-- ----------------------------
DROP TABLE IF EXISTS `deposit_subaccount_copy202009221512`;
CREATE TABLE `deposit_subaccount_copy202009221512` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `subaccount` varchar(20) DEFAULT NULL COMMENT '子账号',
  `apply_date` datetime DEFAULT NULL COMMENT '子账号申请日期',
  `expire_date` datetime DEFAULT NULL COMMENT '子账号到期日期 计算规则：申请日期在10号之前（包括10号），有效期截止到本月倒数第二天，申请日期在10号之后，有效期截止到下月倒数第二天',
  `validate_day` int(11) DEFAULT NULL COMMENT '有效期天数  到期日期减去申请日期',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '子账号所属银行名称',
  `bank_name_cn` varchar(150) DEFAULT NULL COMMENT '子账号所属银行中文名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '子账号所属银行code',
  `receiver_account_name` varchar(100) DEFAULT NULL COMMENT '收款人账户名称 规则：JC+名字拼音大写(中间没有空格) 大陆入金',
  `effect_date` datetime DEFAULT NULL COMMENT '子账号生效时间',
  `is_effective` int(11) DEFAULT '0' COMMENT '子账号是否生效，1生效，0未生效，定时任务发送短信和邮件使用',
  `send_time` datetime DEFAULT NULL COMMENT '定时任务发送短信和邮件时间',
  `crm_status` int(5) DEFAULT '0' COMMENT '是否在crm中显示 1显示0不显示',
  `open_subaccount_error` varchar(255) DEFAULT NULL COMMENT '开通子账户异常信息',
  PRIMARY KEY (`id`),
  KEY `funds_account` (`funds_account`),
  KEY `phone_mobile` (`phone_mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=29319 DEFAULT CHARSET=utf8mb4 COMMENT='子账号信息';

-- ----------------------------
-- Table structure for deposite_bank
-- ----------------------------
DROP TABLE IF EXISTS `deposite_bank`;
CREATE TABLE `deposite_bank` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称',
  `logo` varchar(150) DEFAULT 'logo',
  `bank_namecn` varchar(150) DEFAULT NULL COMMENT '银行中文名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `bank_branch_code` varchar(50) DEFAULT NULL COMMENT '分行号码',
  `region` varchar(10) DEFAULT NULL COMMENT '国家简称 cn:中国 hk:香港 us:美国',
  `cash_in` tinyint(4) DEFAULT NULL COMMENT '1: 我的资金在以下银行  2:我的资金不在以上银行',
  `use_type` tinyint(4) DEFAULT NULL COMMENT '1:入金;0:出金 2:收款',
  `cost` varchar(100) DEFAULT NULL COMMENT '费用描述，页面展示使用，不参与计算',
  `arrival_time` varchar(100) DEFAULT NULL COMMENT '到账时间描述',
  `receiver_address` varchar(300) DEFAULT NULL COMMENT '收款人地址',
  `swift_code` varchar(100) DEFAULT NULL COMMENT 'swift代码，中英文用逗号分隔',
  `receiver_bank_addr` varchar(300) DEFAULT NULL COMMENT '收款银行地址',
  `receiver_account_name` varchar(100) DEFAULT NULL COMMENT '收款人账户名称 香港入金',
  `receiver_account_code` varchar(300) DEFAULT NULL COMMENT '收款人账户号码 香港入金 多个账号用逗号隔开，第一个美元，第二港元,,中英文用@分隔',
  `net_remit_guide` varchar(150) DEFAULT NULL COMMENT '网银汇款指引',
  `bar_remit_guide` varchar(150) DEFAULT NULL COMMENT '柜台汇款指引',
  `show_order` tinyint(4) DEFAULT NULL COMMENT '银行卡展示顺序',
  `is_others` tinyint(4) DEFAULT NULL COMMENT '香港入金是否其他银行：1_是其他银行 2_不是其他银行',
  `cost_en` varchar(200) DEFAULT NULL COMMENT 'cost英文名',
  `arrival_time_en` varchar(200) DEFAULT NULL COMMENT 'arrival_time英文名',
  `receiver_address_en` varchar(600) DEFAULT NULL COMMENT 'receiver_address英文名',
  `receiver_bank_addr_en` varchar(600) DEFAULT NULL COMMENT 'receiver_bank_addr英文',
  `receiver_account_name_en` varchar(200) DEFAULT NULL COMMENT 'receiver_account_name英文',
  `aba_ruting_no` varchar(100) DEFAULT NULL COMMENT 'ABA Ruting NO',
  `bank_namehk` varchar(150) DEFAULT NULL COMMENT '银行繁体名称',
  `bank_nameus` varchar(150) DEFAULT NULL COMMENT '银行英文名称',
  PRIMARY KEY (`id`),
  KEY `region` (`region`),
  KEY `useType` (`use_type`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='入金银行信息';

-- ----------------------------
-- Table structure for deposite_bank_copy20200402
-- ----------------------------
DROP TABLE IF EXISTS `deposite_bank_copy20200402`;
CREATE TABLE `deposite_bank_copy20200402` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称',
  `logo` varchar(150) DEFAULT 'logo',
  `bank_namecn` varchar(150) DEFAULT NULL COMMENT '银行中文名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `bank_branch_code` varchar(50) DEFAULT NULL COMMENT '分行号码',
  `region` varchar(10) DEFAULT NULL COMMENT '国家简称 cn:中国 hk:香港 us:美国',
  `cash_in` tinyint(4) DEFAULT NULL COMMENT '1: 我的资金在以下银行  2:我的资金不在以上银行',
  `use_type` tinyint(4) DEFAULT NULL COMMENT '1:入金;0:出金 2:收款',
  `cost` varchar(100) DEFAULT NULL COMMENT '费用描述，页面展示使用，不参与计算',
  `arrival_time` varchar(100) DEFAULT NULL COMMENT '到账时间描述',
  `receiver_address` varchar(300) DEFAULT NULL COMMENT '收款人地址',
  `swift_code` varchar(100) DEFAULT NULL COMMENT 'swift代码，中英文用逗号分隔',
  `receiver_bank_addr` varchar(300) DEFAULT NULL COMMENT '收款银行地址',
  `receiver_account_name` varchar(100) DEFAULT NULL COMMENT '收款人账户名称 香港入金',
  `receiver_account_code` varchar(300) DEFAULT NULL COMMENT '收款人账户号码 香港入金 多个账号用逗号隔开，第一个美元，第二港元,,中英文用@分隔',
  `net_remit_guide` varchar(150) DEFAULT NULL COMMENT '网银汇款指引',
  `bar_remit_guide` varchar(150) DEFAULT NULL COMMENT '柜台汇款指引',
  `show_order` tinyint(4) DEFAULT NULL COMMENT '银行卡展示顺序',
  `is_others` tinyint(4) DEFAULT NULL COMMENT '香港入金是否其他银行：1_是其他银行 2_不是其他银行',
  `cost_en` varchar(200) DEFAULT NULL COMMENT 'cost英文名',
  `arrival_time_en` varchar(200) DEFAULT NULL COMMENT 'arrival_time英文名',
  `receiver_address_en` varchar(600) DEFAULT NULL COMMENT 'receiver_address英文名',
  `receiver_bank_addr_en` varchar(600) DEFAULT NULL COMMENT 'receiver_bank_addr英文',
  `receiver_account_name_en` varchar(200) DEFAULT NULL COMMENT 'receiver_account_name英文',
  PRIMARY KEY (`id`),
  KEY `region` (`region`),
  KEY `useType` (`use_type`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COMMENT='入金银行信息';

-- ----------------------------
-- Table structure for deposite_bank_info
-- ----------------------------
DROP TABLE IF EXISTS `deposite_bank_info`;
CREATE TABLE `deposite_bank_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称',
  `logo` varchar(150) DEFAULT NULL COMMENT 'logo',
  `bank_namecn` varchar(150) DEFAULT NULL COMMENT '银行中文名称',
  `bank_namehk` varchar(150) DEFAULT NULL COMMENT '银行繁体名称',
  `bank_nameus` varchar(150) DEFAULT NULL COMMENT '银行英文名称',
  `region` varchar(10) DEFAULT NULL COMMENT '国家简称 cn:中国 hk:香港 us:美国 hw:海外银行',
  `customer_service_telephone_numbers` varchar(20) DEFAULT NULL COMMENT '客服电话',
  `status` varchar(2) DEFAULT NULL COMMENT '银行卡生效状态 0 未生效  1 线上生效  2 测试包使用生效',
  `id_type` varchar(150) DEFAULT NULL COMMENT '支持的证件类型，空为支持全部类型，多个类型以英文逗号分隔',
  `edda_corporate_account_id` int(4) DEFAULT NULL COMMENT '公司edda账户',
  `guide_messagecn` varchar(150) DEFAULT NULL COMMENT '银行账号填写提示信息',
  `guide_messagehk` varchar(150) DEFAULT NULL COMMENT '银行账号填写提示信息',
  `guide_messageus` varchar(150) DEFAULT NULL COMMENT '银行账号填写提示信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COMMENT='银证转账入金银行信息';

-- ----------------------------
-- Table structure for deposite_bank_info_20211029
-- ----------------------------
DROP TABLE IF EXISTS `deposite_bank_info_20211029`;
CREATE TABLE `deposite_bank_info_20211029` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称',
  `logo` varchar(150) DEFAULT NULL COMMENT 'logo',
  `bank_namecn` varchar(150) DEFAULT NULL COMMENT '银行中文名称',
  `bank_namehk` varchar(150) DEFAULT NULL COMMENT '银行繁体名称',
  `bank_nameus` varchar(150) DEFAULT NULL COMMENT '银行英文名称',
  `region` varchar(10) DEFAULT NULL COMMENT '国家简称 cn:中国 hk:香港 us:美国 hw:海外银行',
  `customer_service_telephone_numbers` varchar(20) DEFAULT NULL COMMENT '客服电话',
  `status` varchar(2) DEFAULT NULL COMMENT '银行卡生效状态 0 未生效  1 线上生效  2 测试包使用生效',
  `id_type` varchar(150) DEFAULT NULL COMMENT '支持的证件类型，空为支持全部类型，多个类型以英文逗号分隔',
  `edda_corporate_account_id` int(4) DEFAULT NULL COMMENT '公司edda账户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COMMENT='银证转账入金银行信息';

-- ----------------------------
-- Table structure for deposite_bank_info_copy20200612
-- ----------------------------
DROP TABLE IF EXISTS `deposite_bank_info_copy20200612`;
CREATE TABLE `deposite_bank_info_copy20200612` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称',
  `logo` varchar(150) DEFAULT NULL COMMENT 'logo',
  `bank_namecn` varchar(150) DEFAULT NULL COMMENT '银行中文名称',
  `bank_namehk` varchar(150) DEFAULT NULL COMMENT '银行繁体名称',
  `bank_nameus` varchar(150) DEFAULT NULL COMMENT '银行英文名称',
  `region` varchar(10) DEFAULT NULL COMMENT '国家简称 cn:中国 hk:香港 us:美国 hw:海外银行',
  `customer_service_telephone_numbers` varchar(20) DEFAULT NULL COMMENT '客服电话',
  `status` varchar(2) DEFAULT NULL COMMENT '银行卡生效状态 0 未生效  1 线上生效  2 测试包使用生效',
  `id_type` varchar(150) DEFAULT NULL COMMENT '支持的证件类型，空为支持全部类型，多个类型以英文逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COMMENT='银证转账入金银行信息';

-- ----------------------------
-- Table structure for deposite_bank_num
-- ----------------------------
DROP TABLE IF EXISTS `deposite_bank_num`;
CREATE TABLE `deposite_bank_num` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_num` varchar(50) DEFAULT NULL COMMENT '银行编号',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='银证转账入金银行编号信息';

-- ----------------------------
-- Table structure for deposite_bind_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `deposite_bind_bank_card`;
CREATE TABLE `deposite_bind_bank_card` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `bank_num` varchar(50) DEFAULT NULL COMMENT '银行编号',
  `account_name` varchar(50) DEFAULT NULL COMMENT '银行户名',
  `open_account_type` int(2) DEFAULT NULL COMMENT '银行开户证件类型 1-港奥通行证 2-中国内地身份证 3-中国香港身份证 4-护照',
  `bank_card_num` varchar(50) DEFAULT NULL COMMENT '银行开户证件号码',
  `bind_status` varchar(2) DEFAULT NULL COMMENT '绑定状态 0 绑定中  1 成功  2 失败 3 已逻辑删除',
  `mandateid` varchar(50) DEFAULT NULL COMMENT '绑卡查询银行成功后，需要入金传递的唯一标识',
  `ddaref` varchar(50) DEFAULT NULL COMMENT '签订协议生效的字段',
  `fail_code` varchar(200) DEFAULT NULL COMMENT '失败代码，大数据返回',
  `fail_reason` varchar(200) DEFAULT NULL COMMENT '失败原因',
  `msg_id` varchar(50) DEFAULT NULL COMMENT '绑卡关联唯一标识',
  `cli_msg_id` varchar(50) DEFAULT NULL COMMENT '服务端生成给客户端id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `insert_time` datetime DEFAULT NULL COMMENT '绑定入库时间',
  `select_fail_num` int(11) DEFAULT '0' COMMENT '查询大数据绑卡状态失败次数',
  `send_msg_flag` int(2) DEFAULT NULL COMMENT '发送大数据队列 状态 1 已发送 其他状态，未发送',
  `send_msg_time` datetime DEFAULT NULL COMMENT '发送大数据队列更新时间',
  `edda_corporate_account_id` int(4) DEFAULT NULL COMMENT 'edda公司账户',
  `certificate` varchar(500) DEFAULT NULL,
  `is_need_manual_audit` varchar(1) DEFAULT '1' COMMENT '是否需要人工审核 1 不需要 0 需要 2 已操作',
  `comparerate` varchar(50) DEFAULT NULL COMMENT '相似度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21188 DEFAULT CHARSET=utf8mb4 COMMENT='银证转账用户绑卡状态';

-- ----------------------------
-- Table structure for deposite_manual_bind_result
-- ----------------------------
DROP TABLE IF EXISTS `deposite_manual_bind_result`;
CREATE TABLE `deposite_manual_bind_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposite_bind_bank_card_id` int(11) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL COMMENT '审核状态 2不通过，1通过',
  `audite_user_id` varchar(255) DEFAULT NULL,
  `audite_date` datetime DEFAULT NULL,
  `commet` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for deposite_subaccount_item
-- ----------------------------
DROP TABLE IF EXISTS `deposite_subaccount_item`;
CREATE TABLE `deposite_subaccount_item` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账户',
  `subaccount_id` bigint(11) DEFAULT NULL COMMENT '子账户id',
  `apply_date` datetime DEFAULT NULL COMMENT '子账户申请日期',
  `expire_date` datetime DEFAULT NULL COMMENT '子账户到期日期',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '子账户所属银行code',
  `subaccount` varchar(20) DEFAULT NULL COMMENT '子账号',
  `effect_date` datetime DEFAULT NULL COMMENT '子账号生效时间',
  PRIMARY KEY (`id`),
  KEY `fundsAccount` (`funds_account`),
  KEY `subAccountId` (`subaccount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43444 DEFAULT CHARSET=utf8mb4 COMMENT='子账户申请记录';

-- ----------------------------
-- Table structure for deposite_time_info
-- ----------------------------
DROP TABLE IF EXISTS `deposite_time_info`;
CREATE TABLE `deposite_time_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `deposite_from` int(11) NOT NULL COMMENT '入金来源，1：中国大陆入金，2：香港卡入金，3：海外卡入金',
  `deposite_type` int(11) DEFAULT NULL COMMENT '目前香港区分：1：FPS， 2：EDDA， 3：同行或跨行转账',
  `deposite_time` varchar(100) DEFAULT NULL COMMENT '时效',
  `deposite_time_en` varchar(100) DEFAULT NULL COMMENT '时效英文',
  `deposite_time_desc` varchar(500) DEFAULT NULL COMMENT '时效文案描述',
  `deposite_time_desc_en` varchar(500) DEFAULT NULL COMMENT '时效文案描述英文',
  `is_del` int(11) NOT NULL COMMENT '0:未删 1:删除',
  `other` varchar(100) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='入金时效信息描述';

-- ----------------------------
-- Table structure for deposite_transfer_detail
-- ----------------------------
DROP TABLE IF EXISTS `deposite_transfer_detail`;
CREATE TABLE `deposite_transfer_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `bank_num` varchar(50) DEFAULT NULL COMMENT '银行编号',
  `deduction_currency` varchar(5) DEFAULT NULL COMMENT '币种 HKD-港币',
  `account_name` varchar(50) DEFAULT NULL COMMENT '银行户名',
  `deposit_amount` decimal(20,4) DEFAULT NULL COMMENT '入金金额 保留4位小数',
  `transfer_amount` decimal(20,4) DEFAULT NULL COMMENT '到账金额 保留4位小数',
  `order_reff` varchar(40) DEFAULT NULL COMMENT 'bms操作流水号',
  `mandateid` varchar(50) DEFAULT NULL COMMENT '绑卡查询银行成功后，需要入金传递的唯一标识',
  `bank_reference` varchar(50) DEFAULT NULL COMMENT '银行流水号',
  `ddaref` varchar(50) DEFAULT NULL COMMENT '签订协议生效的字段',
  `deposite_status` varchar(2) DEFAULT NULL COMMENT '入金状态 0 处理中  1 成功  2 失败',
  `msg_id` varchar(50) DEFAULT NULL COMMENT '绑卡关联唯一标识',
  `fail_code` varchar(200) DEFAULT NULL COMMENT '失败代码，大数据返回',
  `fail_reason` varchar(200) DEFAULT NULL COMMENT '失败原因',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `insert_time` datetime DEFAULT NULL COMMENT '入库时间',
  `deposit_id` bigint(11) DEFAULT NULL COMMENT '入金主键',
  `send_msg_flag` int(2) DEFAULT NULL COMMENT '发送大数据队列 状态 1 已发送 其他状态，未发送',
  `send_msg_time` datetime DEFAULT NULL COMMENT '发送大数据队列更新时间',
  `cli_msg_id` varchar(50) DEFAULT NULL COMMENT '本次入金大数据返回唯一标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75491 DEFAULT CHARSET=utf8mb4 COMMENT='银证转账入金记录表';

-- ----------------------------
-- Table structure for document_info
-- ----------------------------
DROP TABLE IF EXISTS `document_info`;
CREATE TABLE `document_info` (
  `doc_id` varchar(38) NOT NULL,
  `doc_title` varchar(100) DEFAULT NULL,
  `doc_logo` varchar(100) DEFAULT NULL,
  `doc_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for dzh_callback_log
-- ----------------------------
DROP TABLE IF EXISTS `dzh_callback_log`;
CREATE TABLE `dzh_callback_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '发送调用的url',
  `param` text COMMENT '传递的参数',
  `response` text COMMENT '返回值',
  `insert_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1424 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for dzh_ext_info
-- ----------------------------
DROP TABLE IF EXISTS `dzh_ext_info`;
CREATE TABLE `dzh_ext_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(18) NOT NULL COMMENT '手机号码',
  `ext` varchar(1024) NOT NULL COMMENT '大智慧传递的ext 需要回传',
  `is_final` int(2) DEFAULT NULL COMMENT '是否是最终值 0不是 1是  当用户完成资料填写，并且回调大智慧接口后，此值置为1，就不再需要变更了',
  `insert_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1294 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for edda_corporate_account
-- ----------------------------
DROP TABLE IF EXISTS `edda_corporate_account`;
CREATE TABLE `edda_corporate_account` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '可绑定收款银行表（公司的银行）',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行英文名',
  `bank_name_cn` varchar(255) DEFAULT NULL COMMENT '银行中文名',
  `bank_code` varchar(20) DEFAULT NULL COMMENT '银行编号',
  `account` varchar(100) DEFAULT NULL COMMENT '账号',
  `status` tinyint(2) DEFAULT NULL COMMENT '0-禁用；1-启用',
  `api_type_bind` varchar(20) DEFAULT NULL COMMENT '调用大数据绑卡参数',
  `api_type_deposit` varchar(20) DEFAULT NULL COMMENT '调用大数据入金参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for email_suffix
-- ----------------------------
DROP TABLE IF EXISTS `email_suffix`;
CREATE TABLE `email_suffix` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `suffix` varchar(18) DEFAULT NULL COMMENT '邮箱后缀',
  `seq` int(3) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `exchange_rate`;
CREATE TABLE `exchange_rate` (
  `eid` int(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '上传时间',
  `hkd_cnh` varchar(50) DEFAULT NULL COMMENT '港币/人民币',
  `usd_cnh` varchar(50) DEFAULT NULL COMMENT '美金/人民币',
  `usd_hkd` varchar(50) DEFAULT NULL COMMENT '美金/港币',
  `effective_time` varchar(50) DEFAULT NULL COMMENT '生效时间',
  `submitter` int(20) DEFAULT '0' COMMENT '0接口1人工',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=843 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for financial_standing_options
-- ----------------------------
DROP TABLE IF EXISTS `financial_standing_options`;
CREATE TABLE `financial_standing_options` (
  `option_id` varchar(38) NOT NULL COMMENT 'ID',
  `option_type` char(1) DEFAULT NULL COMMENT '选项类型',
  `option_content` varchar(200) DEFAULT NULL COMMENT '选项内容',
  `option_content_us` varchar(500) DEFAULT NULL,
  `option_content_hk` varchar(500) DEFAULT NULL,
  `question_id` varchar(38) DEFAULT NULL COMMENT '问题id',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for financial_standing_question
-- ----------------------------
DROP TABLE IF EXISTS `financial_standing_question`;
CREATE TABLE `financial_standing_question` (
  `question_id` varchar(38) NOT NULL COMMENT 'ID',
  `question_desc` varchar(500) DEFAULT NULL COMMENT '问题描述',
  `question_desc_us` varchar(500) DEFAULT NULL,
  `question_desc_hk` varchar(500) DEFAULT NULL,
  `market` varchar(20) NOT NULL COMMENT '问题所属的开户市场  HK港股  US美股',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for financial_standing_result
-- ----------------------------
DROP TABLE IF EXISTS `financial_standing_result`;
CREATE TABLE `financial_standing_result` (
  `result_id` varchar(38) NOT NULL COMMENT 'ID',
  `account_id` varchar(38) DEFAULT NULL COMMENT '用户ID',
  `question_id` varchar(38) DEFAULT NULL COMMENT '问题ID',
  `option_id` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for financing_amount
-- ----------------------------
DROP TABLE IF EXISTS `financing_amount`;
CREATE TABLE `financing_amount` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stock_name` varchar(100) DEFAULT NULL COMMENT '股票名称',
  `stock_code` varchar(10) DEFAULT NULL COMMENT '股票代码',
  `impawn_rate` decimal(10,4) DEFAULT NULL COMMENT '抵押率，单位%',
  `market` tinyint(4) DEFAULT NULL COMMENT '市场 1:港股 2:美股',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60786 DEFAULT CHARSET=utf8mb4 COMMENT='融资标的额\r\n记录可以融资的股票，和质押率';

-- ----------------------------
-- Table structure for hk_identification_code
-- ----------------------------
DROP TABLE IF EXISTS `hk_identification_code`;
CREATE TABLE `hk_identification_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT '账户id',
  `funds_account` varchar(100) DEFAULT NULL COMMENT '资金账号',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `status` int(2) DEFAULT '0' COMMENT '账户香港识别码授权状态 0 未授权  1 已授权 ',
  `url` varchar(100) DEFAULT NULL COMMENT '授权文件地址',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127866 DEFAULT CHARSET=utf8 COMMENT='2022-02-25 17:45 前开户成功的账户数据';

-- ----------------------------
-- Table structure for id_info
-- ----------------------------
DROP TABLE IF EXISTS `id_info`;
CREATE TABLE `id_info` (
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT 'account_info.id',
  `id` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `national` varchar(20) DEFAULT NULL COMMENT '民族',
  `addr` varchar(200) DEFAULT NULL COMMENT '常住地址',
  `office` varchar(100) DEFAULT NULL COMMENT '签发单位',
  `valid` varchar(50) DEFAULT NULL COMMENT '有效期',
  `academic_id` varchar(38) DEFAULT NULL COMMENT '学历',
  `profession_id` varchar(38) DEFAULT NULL COMMENT '职业',
  `front` varchar(100) DEFAULT NULL COMMENT '身份证正面图片地址',
  `reverse` varchar(100) DEFAULT NULL COMMENT '身份证背面图片地址',
  `id_head_photo` varchar(100) DEFAULT NULL COMMENT '身份证上大头像',
  `sex` int(11) DEFAULT NULL COMMENT '性别：0女 1男',
  `first_name` varchar(50) DEFAULT NULL COMMENT '名的拼音',
  `middle_name` varchar(50) DEFAULT NULL COMMENT '中间名（美国开户用到）',
  `last_name` varchar(50) DEFAULT NULL COMMENT '姓的拼音',
  `special_surname` varchar(50) DEFAULT NULL COMMENT '中文姓',
  `special_givenname` varchar(50) DEFAULT NULL COMMENT '中文名',
  `birth` varchar(11) DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `comm_addr` int(2) DEFAULT NULL COMMENT '通讯地址  0 和身份证地址相同 1 和身份证地址不同',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `job` varchar(200) DEFAULT NULL COMMENT '职务',
  `tax_state` varchar(38) DEFAULT NULL COMMENT '税务国家/地区',
  `tax_number` varchar(50) DEFAULT NULL COMMENT '税务编号',
  `bank` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名字，香港用户开户名字是输入的',
  `bank_number` varchar(30) DEFAULT NULL COMMENT '银行卡号码',
  `hand_id_pic` varchar(100) DEFAULT NULL COMMENT '手持身份证照片',
  `comm_addr_proof_pic` varchar(100) DEFAULT NULL COMMENT '居住证明照片',
  `comm_addr_proof_text` varchar(255) DEFAULT NULL COMMENT '居住证明图片对应的地址文字',
  `command_photo` varchar(100) DEFAULT NULL COMMENT '指令动作照片',
  `instructions` varchar(30) DEFAULT NULL,
  `sign_name_pic` varchar(100) DEFAULT NULL COMMENT '签名照',
  `account_type` varchar(38) DEFAULT NULL COMMENT '账户类型： 5现金账户；6融资账户',
  `is_derivative` int(2) DEFAULT NULL COMMENT '是否衍生品投资 0 否 1 是',
  `derivative_detail` varchar(10) DEFAULT NULL COMMENT '衍生品明细',
  `agree1` int(1) DEFAULT '0' COMMENT '同意上传身份证页面的数字证书服务 0 否 1 是',
  `agree2` int(1) DEFAULT '0' COMMENT '同意个人声明',
  `agree3` int(1) DEFAULT '0' COMMENT '同意协议签署',
  `agree4` int(1) DEFAULT '0' COMMENT '同意风险披露',
  `market` varchar(5) DEFAULT NULL COMMENT '开通市场 HK 港股 US 美股',
  `employment` varchar(50) DEFAULT NULL COMMENT '就业情况',
  `is_terrorists` int(2) DEFAULT NULL COMMENT '是否恐怖分子  0不是  1是',
  `is_official` int(2) DEFAULT NULL COMMENT '是否高官  0不是  1是',
  `official_id` varchar(38) DEFAULT NULL COMMENT '高官对应的 official_position表的id',
  `check_return_pic` varchar(255) DEFAULT NULL COMMENT '校验身份证返回的照片对应的路径',
  `check_id_result` int(2) DEFAULT NULL COMMENT '验证身份证信息  0未通过  1通过  3 主备都故障 未验证过',
  `ip` varchar(255) DEFAULT NULL COMMENT '用户ip',
  `is_open_us` int(2) DEFAULT NULL COMMENT '是否开通美股 0 否 1 是',
  `check_bank_result` int(2) DEFAULT NULL COMMENT '银行卡验证结果   0未通过  1通过  3 主备都故障 未验证过',
  `similarity` varchar(10) DEFAULT NULL COMMENT '活体和身份证对比相似度',
  `countries` int(2) DEFAULT NULL COMMENT '第一步选择居民身份  0 大陆 1 其他地区',
  `is_open_hk` int(2) DEFAULT NULL COMMENT '是否开通港股 0 否 1 是',
  `is_open_zht` int(2) DEFAULT NULL COMMENT '是否开通中华通 0 否 1 是',
  `is_open_others` varchar(20) DEFAULT NULL COMMENT '其他市场',
  `ip_country` varchar(50) DEFAULT NULL COMMENT '开户用户IP对应的国家',
  `ip_region` varchar(50) DEFAULT NULL COMMENT '开户用户IP对应的省',
  `ip_city` varchar(50) DEFAULT NULL COMMENT '开户用户IP对应的城市',
  `ip_isp` varchar(50) DEFAULT NULL COMMENT '开户用户IP对应的网络运营商',
  `person_info_pdfurl` varchar(200) DEFAULT NULL COMMENT '个人信息收集pdf存储地址',
  `id_type` varchar(50) DEFAULT NULL COMMENT '证件类型 1身份证 2护照',
  `is_OFAC` int(11) DEFAULT NULL COMMENT '1是0不是',
  `industry` varchar(60) DEFAULT NULL COMMENT '受雇公司的行业',
  `supply_time` datetime DEFAULT NULL,
  `is_againsupply` int(5) DEFAULT NULL,
  `id_ustype` varchar(50) DEFAULT NULL COMMENT ' 美国开户证件类型 1SSN 2中国内地护照 3中国香港护照 4中国澳门护照 5中国台湾护照 6加拿大护照 0中国内地身份证 7香港身份证8驾驶证9其他国家护照',
  `is_account_type` varchar(5) DEFAULT NULL COMMENT '1是升级为融资账户',
  `account_type_time` datetime DEFAULT NULL COMMENT '升级融资账户时间',
  `apply_account_pdf_url` varchar(200) DEFAULT NULL COMMENT '开户申请pdf存储位置',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for information_disclosure
-- ----------------------------
DROP TABLE IF EXISTS `information_disclosure`;
CREATE TABLE `information_disclosure` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) DEFAULT NULL COMMENT '用户id',
  `own` varchar(20) DEFAULT NULL COMMENT '唯一收益拥有人  null：勾选    1：未勾选',
  `company_ship` varchar(20) DEFAULT NULL COMMENT '有关系董事或同事',
  `mechanism_director` varchar(20) DEFAULT NULL COMMENT '持牌机构董事',
  `exchange_director` varchar(20) DEFAULT NULL COMMENT '交易所工作人员',
  `spouse` varchar(20) DEFAULT NULL COMMENT '配偶账号',
  `american` varchar(20) DEFAULT NULL COMMENT '美国居民  null：勾选   1：未勾选',
  `tax_area` varchar(20) DEFAULT NULL COMMENT '税务地区',
  `tax_id` varchar(40) DEFAULT NULL COMMENT '税务编号',
  `tax_area2` varchar(20) DEFAULT NULL COMMENT '第二税务国家',
  `tax_id2` varchar(40) DEFAULT NULL COMMENT '第二税务国家税务号',
  `tax_area3` varchar(20) DEFAULT NULL COMMENT '第三税务国家',
  `tax_id3` varchar(40) DEFAULT NULL COMMENT '第三税务国家税务号',
  `listed_company_director` varchar(1) DEFAULT '0' COMMENT '是否上市公司董事0否 1是',
  `listed_company_symbol` varchar(20) DEFAULT NULL COMMENT '上市公司代码',
  `broker_relation` varchar(1) DEFAULT '0' COMMENT '1 有受雇 0无受雇于经纪公司',
  `broker_name` varchar(200) DEFAULT NULL COMMENT '经纪公司名称',
  `relation_name` varchar(50) DEFAULT NULL COMMENT '雇员名称',
  `relation` varchar(10) DEFAULT NULL COMMENT '与您的关系 配偶/子女/父母/本人/其他',
  `marital_status` varchar(30) DEFAULT NULL COMMENT '婚姻状况 未婚/已婚/丧偶/离异',
  `family_number` varchar(2) DEFAULT NULL COMMENT '家庭成员人数',
  `empower_url` varchar(100) DEFAULT NULL COMMENT '授权信',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `is_spouse_deposit` varchar(2) DEFAULT '0' COMMENT '您的配偶是尊嘉金融的另一保证金客户吗？ 0否 1是',
  `spouse_deposit_remark` varchar(20) DEFAULT NULL COMMENT '您的配偶是尊嘉金融的另一保证金客户吗？备注信息（配偶账号）',
  `source_income` varchar(200) DEFAULT NULL COMMENT '收入来源 0薪酬，1自营公司收入，2租金，3储蓄，4退休金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98735 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for investment_account
-- ----------------------------
DROP TABLE IF EXISTS `investment_account`;
CREATE TABLE `investment_account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) DEFAULT NULL,
  `funds_account` varchar(10) DEFAULT NULL COMMENT '资金账户',
  `sub_account` varchar(10) DEFAULT NULL COMMENT '子账户',
  `product_id` int(10) DEFAULT NULL COMMENT '商品id',
  `request_time` datetime DEFAULT NULL COMMENT '请求velox ooa接口时间',
  `request_status` varchar(1) DEFAULT NULL COMMENT '请求velox ooa接口的状态 0 成功',
  `request_msg` varchar(100) DEFAULT NULL COMMENT '请求velox ooa接口的描述',
  `response_time` datetime DEFAULT NULL COMMENT 'velox ooa接口返回结果时间',
  `velox_status` varchar(1) DEFAULT NULL COMMENT 'velox ooa状态 0审核中 1审核通过 2审核不通过',
  `message` varchar(200) DEFAULT NULL COMMENT '审核结果描述',
  `is_agreement` varchar(2) DEFAULT NULL COMMENT '1已经签订了协议这个字段只对2020-06-24 16:30:00前开户的有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for investment_situation
-- ----------------------------
DROP TABLE IF EXISTS `investment_situation`;
CREATE TABLE `investment_situation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) DEFAULT NULL COMMENT '用户id',
  `annual_income` varchar(30) DEFAULT NULL COMMENT '年收入',
  `family_assets` varchar(30) DEFAULT NULL COMMENT '家庭资产/净资产',
  `risk_tolerance` varchar(30) DEFAULT NULL COMMENT '风险承受能力',
  `risk_off` varchar(50) DEFAULT NULL COMMENT '风险厌恶(不愿意投资）',
  `investment_objectives` varchar(50) DEFAULT NULL COMMENT '投资目标',
  `stock_exp` varchar(50) DEFAULT NULL COMMENT '证券经验',
  `fund_exp` varchar(50) DEFAULT NULL COMMENT '基金经验',
  `foreign_exchange_exp` varchar(50) DEFAULT NULL COMMENT '外汇经验',
  `income_exp` varchar(50) DEFAULT NULL COMMENT '固收经验',
  `other_exp` varchar(50) DEFAULT NULL COMMENT '其他经验',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97948 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for invite_code
-- ----------------------------
DROP TABLE IF EXISTS `invite_code`;
CREATE TABLE `invite_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(38) NOT NULL COMMENT '邀请码',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `sex` int(2) DEFAULT NULL COMMENT '性别：0女 1男',
  `phone_number` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `social_type` int(11) DEFAULT NULL COMMENT '社交类型：1、微信；2、QQ；3、微博',
  `social_account` varchar(160) DEFAULT NULL COMMENT '社交账号',
  `address` varchar(160) DEFAULT NULL COMMENT '地址',
  `attach_type` int(2) DEFAULT NULL COMMENT '归属类型:1、经纪人；2、居间人3、邀请人',
  `insert_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `code_2` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mobile_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `mobile_verification_code`;
CREATE TABLE `mobile_verification_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `verif_code` varchar(10) DEFAULT NULL COMMENT '验证码',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1279 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for modify_account_history
-- ----------------------------
DROP TABLE IF EXISTS `modify_account_history`;
CREATE TABLE `modify_account_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `auditor` varchar(80) DEFAULT NULL,
  `modify_detail` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for obligate_account
-- ----------------------------
DROP TABLE IF EXISTS `obligate_account`;
CREATE TABLE `obligate_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(20) NOT NULL COMMENT '资金账号',
  `status` int(2) DEFAULT NULL COMMENT '状态 0 未用  1 已用',
  `create_user` varchar(38) DEFAULT NULL COMMENT '添加人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for offical_position
-- ----------------------------
DROP TABLE IF EXISTS `offical_position`;
CREATE TABLE `offical_position` (
  `name` varchar(100) NOT NULL DEFAULT '官员姓名',
  `sex` varchar(2) NOT NULL COMMENT '官员性别',
  `birth` varchar(10) NOT NULL COMMENT '出生年月',
  `id` varchar(38) NOT NULL COMMENT '官员id',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `type` int(2) DEFAULT NULL COMMENT '官员类型，0为地方官员，1为主要领导人。自定义',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `birthplace` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `nation` varchar(38) DEFAULT NULL COMMENT '民族',
  `graduateinstitution` varchar(255) DEFAULT NULL COMMENT '毕业院校',
  `degree` varchar(100) DEFAULT NULL COMMENT '学历学位',
  `joiningtheparty` varchar(10) DEFAULT NULL COMMENT '入党时间',
  `worktime` varchar(10) DEFAULT NULL COMMENT '参加工作时间',
  `mainexperience` blob COMMENT '主要经验',
  `updatetime` varchar(50) DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_apply
-- ----------------------------
DROP TABLE IF EXISTS `open_account_apply`;
CREATE TABLE `open_account_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT 'account_info.account_id',
  `step_id` int(4) NOT NULL DEFAULT '1' COMMENT '当前处于开户申请第几步',
  `sub_step_id` int(4) NOT NULL DEFAULT '1' COMMENT '子步骤',
  `account_step_id` int(11) DEFAULT NULL,
  `insert_date` datetime NOT NULL COMMENT 'yyyy-MM-dd HH:mm:ss',
  `channel_code` varchar(38) DEFAULT NULL COMMENT '渠道码',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `is_qualified` int(2) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `page_type` int(2) DEFAULT NULL COMMENT '做为页面A/B测试类型标记  1：A    2：B',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `sub_step_id` (`sub_step_id`),
  KEY `channel_code` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2832426 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_apply_bak
-- ----------------------------
DROP TABLE IF EXISTS `open_account_apply_bak`;
CREATE TABLE `open_account_apply_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT 'account_info.account_id',
  `channel_code` varchar(38) DEFAULT NULL COMMENT '渠道码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29446 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_apply_bak01
-- ----------------------------
DROP TABLE IF EXISTS `open_account_apply_bak01`;
CREATE TABLE `open_account_apply_bak01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT 'account_info.account_id',
  `step_id` int(4) NOT NULL DEFAULT '1' COMMENT '当前处于开户申请第几步',
  `sub_step_id` int(4) NOT NULL DEFAULT '1' COMMENT '子步骤',
  `insert_date` datetime NOT NULL COMMENT 'yyyy-MM-dd HH:mm:ss',
  `channel_code` varchar(38) DEFAULT NULL COMMENT '渠道码',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=576279 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_apply_us
-- ----------------------------
DROP TABLE IF EXISTS `open_account_apply_us`;
CREATE TABLE `open_account_apply_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT 'account_info.account_id',
  `step_id` int(4) NOT NULL DEFAULT '1' COMMENT '当前处于开户申请第几步',
  `sub_step_id` int(4) NOT NULL DEFAULT '1' COMMENT '子步骤',
  `insert_date` datetime NOT NULL COMMENT 'yyyy-MM-dd HH:mm:ss',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_certificate
-- ----------------------------
DROP TABLE IF EXISTS `open_account_certificate`;
CREATE TABLE `open_account_certificate` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `account_id` int(8) NOT NULL COMMENT 'account_info.account_id',
  `current_status` varchar(2) DEFAULT NULL COMMENT '见证状态，00：待见证，01：正在排队，02：等到回拨。10：见证成功。20：见证失败',
  `modify_date` datetime DEFAULT NULL,
  `certi_date` datetime DEFAULT NULL COMMENT '见证时间 yyyy-MM-dd HH:mm:ss',
  `certi_user_id` varchar(50) DEFAULT NULL COMMENT '见证人id account_manage.account',
  `result_id` int(8) DEFAULT NULL COMMENT '认证结果 0:正确  1：网络中断 2:不是本人 3:用户不配合 4其他comment',
  `comment` varchar(500) DEFAULT NULL COMMENT '其它原因',
  `vedio_url` varchar(256) DEFAULT NULL COMMENT '视频路径',
  `wy_channelId` bigint(20) DEFAULT NULL COMMENT '网易视频通道id,用于获取视频路径',
  `mTargetUserId` varchar(50) DEFAULT NULL,
  `myUserId` varchar(50) DEFAULT NULL,
  `webVideoUrl` varchar(256) DEFAULT NULL,
  `clientVideoUrl` varchar(256) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2965 DEFAULT CHARSET=utf8mb4 COMMENT='开户认证';

-- ----------------------------
-- Table structure for open_account_check_result
-- ----------------------------
DROP TABLE IF EXISTS `open_account_check_result`;
CREATE TABLE `open_account_check_result` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(8) NOT NULL COMMENT 'account_info.account_id',
  `status` int(2) DEFAULT NULL COMMENT '0 不通过  1 通过',
  `reviewe_date` datetime DEFAULT NULL COMMENT '审核时间 yyyy-MM-dd HH:mm:ss',
  `reviewe_user_id` varchar(50) DEFAULT NULL COMMENT '审核人id account_manage.account',
  `comment` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `ip` varchar(20) DEFAULT NULL COMMENT '客服ip地址',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50387 DEFAULT CHARSET=utf8mb4 COMMENT='照片见证审核结果';

-- ----------------------------
-- Table structure for open_account_compliance_result
-- ----------------------------
DROP TABLE IF EXISTS `open_account_compliance_result`;
CREATE TABLE `open_account_compliance_result` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `account_id` int(8) NOT NULL COMMENT 'account_info.account_id',
  `status` int(2) DEFAULT NULL COMMENT '0 不通过  1 通过',
  `reviewe_date` datetime DEFAULT NULL COMMENT '审核时间 yyyy-MM-dd HH:mm:ss',
  `reviewe_user_id` varchar(50) DEFAULT NULL COMMENT '审核人id account_manage.account',
  `comment` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `step` varchar(30) DEFAULT NULL COMMENT '审核失败对应步骤数（适用开户3.0之后）',
  `ip` varchar(20) DEFAULT NULL COMMENT '客服ip地址',
  PRIMARY KEY (`id`),
  KEY `idx_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1401 DEFAULT CHARSET=utf8mb4 COMMENT='合规结果';

-- ----------------------------
-- Table structure for open_account_final_result
-- ----------------------------
DROP TABLE IF EXISTS `open_account_final_result`;
CREATE TABLE `open_account_final_result` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `account_id` int(8) NOT NULL COMMENT 'account_info.account_id',
  `status` int(2) DEFAULT NULL COMMENT '0 不通过  1 通过',
  `reviewe_date` datetime DEFAULT NULL COMMENT '审核时间 yyyy-MM-dd HH:mm:ss',
  `reviewe_user_id` varchar(50) DEFAULT NULL COMMENT '审核人id account_manage.account',
  `comment` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `step` varchar(30) DEFAULT NULL COMMENT '审核失败对应步骤数（适用开户3.0之后）',
  `ip` varchar(20) DEFAULT NULL COMMENT '客服ip地址',
  PRIMARY KEY (`id`),
  KEY `idx_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131537 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_first_result
-- ----------------------------
DROP TABLE IF EXISTS `open_account_first_result`;
CREATE TABLE `open_account_first_result` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `account_id` int(8) NOT NULL COMMENT 'account_info.account_id',
  `status` int(2) DEFAULT NULL COMMENT '0 不通过  1 通过',
  `reviewe_date` datetime DEFAULT NULL COMMENT '审核时间 yyyy-MM-dd HH:mm:ss',
  `reviewe_user_id` varchar(50) DEFAULT NULL COMMENT '审核人id account_manage.account',
  `comment` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `step` varchar(30) DEFAULT NULL COMMENT '审核失败对应步骤数（适用开户3.0之后）',
  `ip` varchar(20) DEFAULT NULL COMMENT '客服ip地址',
  PRIMARY KEY (`id`),
  KEY `idx_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137841 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_first_result_bak01
-- ----------------------------
DROP TABLE IF EXISTS `open_account_first_result_bak01`;
CREATE TABLE `open_account_first_result_bak01` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `account_id` int(8) NOT NULL COMMENT 'account_info.account_id',
  `status` int(2) DEFAULT NULL COMMENT '0 不通过  1 通过',
  `reviewe_date` datetime DEFAULT NULL COMMENT '审核时间 yyyy-MM-dd HH:mm:ss',
  `reviewe_user_id` varchar(50) DEFAULT NULL COMMENT '审核人id account_manage.account',
  `comment` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `ip` varchar(20) DEFAULT NULL COMMENT '客服ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19318 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_manager_warn
-- ----------------------------
DROP TABLE IF EXISTS `open_account_manager_warn`;
CREATE TABLE `open_account_manager_warn` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `sms` varchar(500) DEFAULT NULL COMMENT '手机号（多个）',
  `sms_content` varchar(50) DEFAULT NULL COMMENT '手机短信',
  `email` varchar(500) DEFAULT NULL COMMENT '邮箱（多个）',
  `email_subject` varchar(200) DEFAULT NULL COMMENT '邮件主题',
  `email_content` varchar(200) DEFAULT NULL COMMENT '邮件内容',
  `is_send` tinyint(4) DEFAULT NULL COMMENT '是否推送 1：推送 2：不推送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='后台开户，无见证人员发送邮件和短信';

-- ----------------------------
-- Table structure for open_account_result
-- ----------------------------
DROP TABLE IF EXISTS `open_account_result`;
CREATE TABLE `open_account_result` (
  `result_id` int(8) NOT NULL AUTO_INCREMENT,
  `result_desc` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_step_info
-- ----------------------------
DROP TABLE IF EXISTS `open_account_step_info`;
CREATE TABLE `open_account_step_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `icon` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_step_info_us
-- ----------------------------
DROP TABLE IF EXISTS `open_account_step_info_us`;
CREATE TABLE `open_account_step_info_us` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `icon` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_sub_step_info
-- ----------------------------
DROP TABLE IF EXISTS `open_account_sub_step_info`;
CREATE TABLE `open_account_sub_step_info` (
  `step_id` int(4) NOT NULL COMMENT '大步骤id',
  `sub_step_id` int(4) NOT NULL COMMENT '子步骤id',
  `sub_step_desc` varchar(50) NOT NULL COMMENT '步骤描述',
  `next_step_id` int(4) NOT NULL COMMENT '下一个大步骤',
  `next_sub_step_id` int(4) NOT NULL COMMENT '下一个小步骤',
  PRIMARY KEY (`step_id`,`sub_step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for open_account_sub_step_info_us
-- ----------------------------
DROP TABLE IF EXISTS `open_account_sub_step_info_us`;
CREATE TABLE `open_account_sub_step_info_us` (
  `step_id` int(4) NOT NULL COMMENT '大步骤id',
  `sub_step_id` int(4) NOT NULL COMMENT '子步骤id',
  `sub_step_desc` varchar(50) NOT NULL COMMENT '步骤描述',
  `next_step_id` int(4) NOT NULL COMMENT '下一个大步骤',
  `next_sub_step_id` int(4) NOT NULL COMMENT '下一个小步骤',
  PRIMARY KEY (`step_id`,`sub_step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for personal_statement
-- ----------------------------
DROP TABLE IF EXISTS `personal_statement`;
CREATE TABLE `personal_statement` (
  `id` varchar(38) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '内容',
  `market` varchar(3) NOT NULL COMMENT '市场  HK 港股市场  US 美股市场',
  `seq` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for photoid_audite
-- ----------------------------
DROP TABLE IF EXISTS `photoid_audite`;
CREATE TABLE `photoid_audite` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `account_id` int(20) DEFAULT NULL,
  `reason` varchar(20) DEFAULT NULL COMMENT '驳回原因',
  `auditor` varchar(20) DEFAULT NULL COMMENT '审核人',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `audite_type` int(5) DEFAULT NULL COMMENT '0首次提交，1驳回，2重新提交',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for problems_info
-- ----------------------------
DROP TABLE IF EXISTS `problems_info`;
CREATE TABLE `problems_info` (
  `id` int(11) NOT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '题问',
  `answer` varchar(300) DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `profession_id` varchar(38) NOT NULL COMMENT '职业ID',
  `title` varchar(100) DEFAULT NULL,
  `title_us` varchar(100) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL COMMENT '排列序号',
  `flag` int(11) DEFAULT '1' COMMENT '是否有效 1有效 0无效',
  PRIMARY KEY (`profession_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL COMMENT '区域主键',
  `name` varchar(40) DEFAULT NULL COMMENT '区域名称',
  `pid` int(11) DEFAULT NULL COMMENT '区域上级标识',
  `sname` varchar(40) DEFAULT NULL COMMENT '地名简称',
  `level` int(11) DEFAULT NULL COMMENT '区域等级',
  `citycode` varchar(20) DEFAULT NULL COMMENT '区域编码',
  `yzcode` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `mername` varchar(100) DEFAULT NULL COMMENT '组合名称',
  `pinyin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for regist_account_log
-- ----------------------------
DROP TABLE IF EXISTS `regist_account_log`;
CREATE TABLE `regist_account_log` (
  `id` varchar(38) NOT NULL,
  `phone_number` varchar(30) NOT NULL DEFAULT '' COMMENT '手机号码',
  `market` varchar(30) NOT NULL COMMENT '开通市场',
  `id_code` varchar(18) NOT NULL COMMENT '身份证号',
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
  `request_param` text NOT NULL COMMENT '发送给柜台请求的参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for regist_ria_account_log
-- ----------------------------
DROP TABLE IF EXISTS `regist_ria_account_log`;
CREATE TABLE `regist_ria_account_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `insert_time` datetime DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `uuid` varchar(38) DEFAULT NULL COMMENT '柜台返回的唯一uuid，用来查询是否生效',
  `response_code` int(10) DEFAULT NULL COMMENT '状态 0 已申报  1成功  2失败',
  `error_message` varchar(255) DEFAULT NULL,
  `is_effective` int(2) DEFAULT NULL COMMENT '是否生效  0 未生效  1 已成功  2 已失败  -1 上报失败',
  `effective_time` datetime DEFAULT NULL COMMENT '生效/未能成功生效 时间',
  `is_set_pwd` int(2) DEFAULT NULL COMMENT '是否初始化密码  0未设置  1 已设置',
  `is_rewrite` int(2) DEFAULT NULL COMMENT '设置密码成功后是否成功会写到account库中  0 未回写  1 已回写',
  `is_set_us` int(2) DEFAULT NULL COMMENT '是否成功设置美股市场信息',
  `request_param` text COMMENT '发送给柜台请求的参数',
  `account_type` int(2) DEFAULT NULL COMMENT '资金账号类型 0 现金账号  1 融资账户',
  `is_rewrite_user` int(2) DEFAULT NULL COMMENT '设置密码成功后是否成功回写stock.user表中  0 未回写  1 已回写',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for reset_pwd
-- ----------------------------
DROP TABLE IF EXISTS `reset_pwd`;
CREATE TABLE `reset_pwd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insert_time` datetime DEFAULT NULL COMMENT '重置时间',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `auditor` varchar(20) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for return_visit_option
-- ----------------------------
DROP TABLE IF EXISTS `return_visit_option`;
CREATE TABLE `return_visit_option` (
  `option_id` int(8) NOT NULL AUTO_INCREMENT,
  `option_content` varchar(1000) CHARACTER SET utf8 NOT NULL COMMENT '选项内容',
  `must_checked` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否必选。1：必选，0：非必选',
  `question_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `回访问卷问题id` (`question_id`),
  CONSTRAINT `回访问卷问题id` FOREIGN KEY (`question_id`) REFERENCES `return_visit_question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for return_visit_question
-- ----------------------------
DROP TABLE IF EXISTS `return_visit_question`;
CREATE TABLE `return_visit_question` (
  `question_id` int(8) NOT NULL,
  `question_desc` varchar(1000) CHARACTER SET utf8 NOT NULL COMMENT '问题描述',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ria_bind_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ria_bind_bank_card`;
CREATE TABLE `ria_bind_bank_card` (
  `bind_seq` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `funds_account` varchar(20) NOT NULL COMMENT '资金账号，按照这个限制不能超过2个',
  `bank_account_type` varchar(32) NOT NULL COMMENT '账号类型：1支票账户 2 储蓄账户 3 货币市场账户',
  `bank_account_name` varchar(256) NOT NULL COMMENT '银行账号用户的姓名',
  `bank_aba_no` varchar(512) NOT NULL COMMENT '银行的ABA NO',
  `bank_account_no` varchar(512) NOT NULL COMMENT '银行账号',
  `bind_request_status` varchar(10) DEFAULT NULL COMMENT '请求velox的状态 0 成功 1及其它失败',
  `bind_request_time` datetime DEFAULT NULL COMMENT '请求velox的时间',
  `bind_request_msg` varchar(200) DEFAULT NULL COMMENT '请求velox的结果描述',
  `verify_request_status` varchar(10) DEFAULT NULL COMMENT '验证银行卡时请求velox的状态 0 成功 1及其它失败',
  `verify_request_time` datetime DEFAULT NULL COMMENT '验证银行卡时请求velox的时间',
  `verify_request_msg` varchar(200) DEFAULT NULL COMMENT '验证银行卡时请求velox的结果描述',
  `bind_response_status` varchar(5) DEFAULT NULL COMMENT 'velox返回的绑定结果 0成功 1及其它失败',
  `bind_response_time` datetime DEFAULT NULL COMMENT 'velox返回结果的时间',
  `bind_reponse_msg` varchar(512) DEFAULT NULL COMMENT 'velox返回的结果描述',
  `bind_status` varchar(2) DEFAULT '1' COMMENT '绑定状态：1 待验证 2 已绑定 3 已解绑 4绑定失败 5超时未提交小额出入金失败 6提交验证，审核中，7删除',
  `bind_status_code` varchar(5) DEFAULT NULL COMMENT '验证失败的错误码 为1就是验证失败错误码，其余都是正确',
  `update_time` datetime DEFAULT NULL COMMENT '记录修改的时间',
  `isplaid` int(5) DEFAULT NULL COMMENT '0不是plaid校验的，1是plaid校验的',
  PRIMARY KEY (`bind_seq`),
  KEY `funds_account_index` (`funds_account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ria_pdf
-- ----------------------------
DROP TABLE IF EXISTS `ria_pdf`;
CREATE TABLE `ria_pdf` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `pdf_url` varchar(2000) DEFAULT NULL,
  `pdf_name` varchar(400) DEFAULT NULL,
  `pdf_type` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ria_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ria_transfer`;
CREATE TABLE `ria_transfer` (
  `transfer_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '出入金请求id',
  `bind_seq` bigint(11) NOT NULL COMMENT 'bind.bind_seq',
  `transfer_amount` double(15,2) NOT NULL COMMENT '出入金金额',
  `transfer_request_time` datetime DEFAULT NULL COMMENT '请求velox接口的时间',
  `transfer_request_status` varchar(2) DEFAULT NULL COMMENT '0 成功 1及其它失败',
  `transfer_request_msg` varchar(200) DEFAULT NULL COMMENT '请求velox的结果描述',
  `transfer_response_time` datetime DEFAULT NULL COMMENT 'velox返回结果的时间',
  `transfer_reponse_status` varchar(5) DEFAULT NULL COMMENT '0 成功 1及其它失败',
  `transfer_reponse_msg` varchar(218) DEFAULT NULL COMMENT 'velox的出金结果描述',
  `transfer_status` varchar(2) NOT NULL COMMENT '入金状态 1 待审核 2 成功 3 失败',
  `create_time` datetime DEFAULT NULL COMMENT '出入金时间',
  `transfer_type` varchar(2) DEFAULT NULL COMMENT '1入金2出金',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `callback_type` varchar(5) DEFAULT NULL COMMENT '用来判断绑卡回调时，是否将缓存的入金信息报到velox，0报  1不报',
  PRIMARY KEY (`transfer_id`),
  KEY `transfer_status_index` (`transfer_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ria_verify_amount
-- ----------------------------
DROP TABLE IF EXISTS `ria_verify_amount`;
CREATE TABLE `ria_verify_amount` (
  `verify_bind_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '绑定小额出入金记录的自增id',
  `bind_seq` bigint(11) NOT NULL COMMENT 'ria_bind_band_card.bind_seq',
  `amount` varchar(32) NOT NULL COMMENT '小额金额，有正负区分,多个数据用逗号分隔',
  `verify_time` datetime DEFAULT NULL COMMENT '提交验证的时间',
  PRIMARY KEY (`verify_bind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ria_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ria_withdraw`;
CREATE TABLE `ria_withdraw` (
  `withdraw_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '出金请求id',
  `funds_account` varchar(20) NOT NULL COMMENT '资金账号',
  `withdraw_amount` double(15,2) NOT NULL COMMENT '出金金额',
  `bank_account_no` varchar(512) NOT NULL,
  `bank_account_name` varchar(256) NOT NULL,
  `bank_aba_no` varchar(512) NOT NULL,
  `bank_name` varchar(218) NOT NULL,
  `bank_account_type` varchar(2) NOT NULL,
  `withdraw_request_time` datetime DEFAULT NULL COMMENT '请求velox接口的时间',
  `withdraw_request_status` varchar(2) DEFAULT NULL COMMENT '0 成功 1及其它失败',
  `withdraw_request_msg` varchar(50) DEFAULT NULL COMMENT '请求velox的结果描述',
  `withdraw_response_time` datetime DEFAULT NULL COMMENT 'velox返回结果的时间',
  `withdraw_reponse_status` varchar(2) DEFAULT NULL COMMENT '0 成功 1及其它失败',
  `withdraw_reponse_msg` varchar(218) DEFAULT NULL COMMENT 'velox的出金结果描述',
  `withdraw_status` varchar(2) NOT NULL COMMENT '出金状态 1 待审核 2 成功 3 失败',
  PRIMARY KEY (`withdraw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for risk_assessment
-- ----------------------------
DROP TABLE IF EXISTS `risk_assessment`;
CREATE TABLE `risk_assessment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) DEFAULT NULL,
  `funds_account` varchar(10) DEFAULT NULL COMMENT '资金账号',
  `other_exp` varchar(50) DEFAULT NULL COMMENT '投资期限',
  `investment_objectives` varchar(50) DEFAULT NULL COMMENT '投资目标',
  `risk_off` varchar(50) DEFAULT NULL COMMENT '风险厌恶(不愿意投资）',
  `risk_tolerance` varchar(50) DEFAULT NULL COMMENT '最想拥有的投资',
  `step` varchar(5) DEFAULT NULL COMMENT '步骤',
  `total_score` int(5) DEFAULT NULL COMMENT '总分',
  `insert_time` datetime DEFAULT NULL COMMENT '答题时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for risk_disclosure_people
-- ----------------------------
DROP TABLE IF EXISTS `risk_disclosure_people`;
CREATE TABLE `risk_disclosure_people` (
  `id` varchar(38) NOT NULL,
  `licensed_representative` varchar(10) DEFAULT NULL COMMENT '持牌代表',
  `license` varchar(38) DEFAULT NULL COMMENT '牌照号',
  `picture` varchar(255) DEFAULT NULL COMMENT '人员头像地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for risk_disclosure_text
-- ----------------------------
DROP TABLE IF EXISTS `risk_disclosure_text`;
CREATE TABLE `risk_disclosure_text` (
  `id` varchar(38) NOT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '文本内容',
  `seq` int(2) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for risk_disclosure_video
-- ----------------------------
DROP TABLE IF EXISTS `risk_disclosure_video`;
CREATE TABLE `risk_disclosure_video` (
  `id` varchar(38) NOT NULL,
  `video_path` varchar(500) DEFAULT NULL COMMENT '风险测评视频路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for risk_grade
-- ----------------------------
DROP TABLE IF EXISTS `risk_grade`;
CREATE TABLE `risk_grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `grade_name` varchar(100) DEFAULT NULL COMMENT '等级名称',
  `grade_desc` varchar(500) DEFAULT NULL COMMENT '等级描述',
  `grade_maxnum` int(11) DEFAULT NULL COMMENT '大最分值',
  `grade_minnum` int(11) DEFAULT NULL COMMENT '最小分值',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for robot_financing_order
-- ----------------------------
DROP TABLE IF EXISTS `robot_financing_order`;
CREATE TABLE `robot_financing_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seq_no` varchar(50) NOT NULL COMMENT '订单编号',
  `funds_account` varchar(50) DEFAULT NULL COMMENT '资金账号',
  `sub_account` varchar(50) DEFAULT NULL COMMENT '子账户资金账号',
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `customer_name_en` varchar(100) DEFAULT NULL COMMENT '客户姓名英文',
  `customer_mobile` varchar(50) DEFAULT NULL COMMENT '客户手机号',
  `product_id` int(11) DEFAULT NULL COMMENT '产品编号',
  `product_code` varchar(50) DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `product_name_en` varchar(200) DEFAULT NULL COMMENT '产品名称英文',
  `currency` tinyint(2) DEFAULT NULL COMMENT '币种 0-港币；1-美金；2-人民币',
  `amount` decimal(20,4) DEFAULT NULL COMMENT '申请金额',
  `amount_real` decimal(20,4) DEFAULT NULL COMMENT '实际金额',
  `type` tinyint(2) DEFAULT NULL COMMENT '1-买入；2-卖出；',
  `deal_all` tinyint(2) DEFAULT NULL COMMENT '1-全部；2-部分；',
  `status` tinyint(2) DEFAULT NULL COMMENT '1-已报；2-处理中；3-已成；4-废单；5-已撤；',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `seq_no` (`seq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for robot_financing_order_log
-- ----------------------------
DROP TABLE IF EXISTS `robot_financing_order_log`;
CREATE TABLE `robot_financing_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robot_financing_order_id` int(11) DEFAULT NULL COMMENT '智能投顾单编号',
  `status` tinyint(2) DEFAULT NULL COMMENT '1-已报；2-处理中；3-已成；4-废单；5-已撤；',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for robot_financing_product
-- ----------------------------
DROP TABLE IF EXISTS `robot_financing_product`;
CREATE TABLE `robot_financing_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `name_en` varchar(200) DEFAULT NULL COMMENT '产品英文名称',
  `code` varchar(50) DEFAULT NULL COMMENT '产品编码',
  `status` tinyint(2) DEFAULT NULL COMMENT '1-启用；2-禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for statement_info
-- ----------------------------
DROP TABLE IF EXISTS `statement_info`;
CREATE TABLE `statement_info` (
  `statement_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '声明ID',
  `name` varchar(100) DEFAULT NULL COMMENT '标题',
  `name_us` varchar(500) DEFAULT NULL,
  `category` int(11) DEFAULT NULL COMMENT '0 责任声明 1 协议 2 券商银行投资者三方协议',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL 地址',
  `market` varchar(3) DEFAULT NULL COMMENT '属于那个市场的协议  HK 港股 US 美股',
  PRIMARY KEY (`statement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_transfer
-- ----------------------------
DROP TABLE IF EXISTS `stock_transfer`;
CREATE TABLE `stock_transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `detail_id` bigint(20) DEFAULT NULL COMMENT '提交转仓记录id',
  `exchange` varchar(10) DEFAULT NULL COMMENT '股票市场',
  `code` varchar(15) DEFAULT NULL COMMENT '股票code',
  `name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `amount` int(11) DEFAULT NULL COMMENT '转仓股票数量',
  `insert_time` datetime DEFAULT NULL COMMENT '插入表时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3480 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_transfer_audit
-- ----------------------------
DROP TABLE IF EXISTS `stock_transfer_audit`;
CREATE TABLE `stock_transfer_audit` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detail_id` bigint(11) DEFAULT NULL COMMENT '提交转仓记录id',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '修改角色 1交易员 2结算员',
  `auditor` varchar(50) DEFAULT NULL COMMENT '审核人  account_manager.account',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核结果，10000交易员申请待审核，10001交易员审核成功，10002交易员审核失败，20001结算员审核成功，20002结算员审核失败',
  `comment` varchar(50) DEFAULT NULL COMMENT '不通过原因',
  `inset_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8144 DEFAULT CHARSET=utf8mb4 COMMENT='增开美股中华通市场，审核日志';

-- ----------------------------
-- Table structure for stock_transfer_detail
-- ----------------------------
DROP TABLE IF EXISTS `stock_transfer_detail`;
CREATE TABLE `stock_transfer_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trader_code` varchar(10) DEFAULT NULL COMMENT '券商code',
  `account_number` varchar(30) DEFAULT NULL COMMENT '账户号码',
  `account_name` varchar(128) DEFAULT NULL COMMENT '账户姓名',
  `trader_name` varchar(128) DEFAULT NULL,
  `receive_email` varchar(30) DEFAULT NULL COMMENT '个人接收转仓表格邮箱',
  `phone_mobile` varchar(20) DEFAULT NULL COMMENT '开户电话',
  `area_country_code` varchar(8) DEFAULT '+86' COMMENT '手机区域号',
  `IP` varchar(100) DEFAULT NULL COMMENT '申请IP',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `ver` bigint(20) DEFAULT '0' COMMENT '版本号，乐观锁',
  `auditor` varchar(40) DEFAULT NULL COMMENT '审核人',
  `audit_status` int(11) DEFAULT NULL COMMENT '审核结果，10000交易员申请待审核，10001交易员审核成功，10002交易员审核失败，20001结算员审核成功，20002结算员审核失败',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_reson` varchar(100) DEFAULT NULL COMMENT '审核不通过的理由',
  `table_url` varchar(500) DEFAULT NULL COMMENT '转仓表格申请地址，多个表格用“，”隔开',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `audit_type` int(20) DEFAULT '0' COMMENT '0用户申请 ，1 驳回',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2734 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_transfer_remark
-- ----------------------------
DROP TABLE IF EXISTS `stock_transfer_remark`;
CREATE TABLE `stock_transfer_remark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stock_id` bigint(20) DEFAULT NULL COMMENT 'stock_transfer_detail的主键',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注内容',
  `create_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `remark_user` varchar(20) DEFAULT NULL COMMENT '备注人',
  PRIMARY KEY (`id`),
  KEY `stock_Id` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_transfer_trader
-- ----------------------------
DROP TABLE IF EXISTS `stock_transfer_trader`;
CREATE TABLE `stock_transfer_trader` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trader_name_ch` varchar(50) DEFAULT NULL COMMENT '券商中文名',
  `trader_name_en` varchar(50) DEFAULT NULL COMMENT '券商英文名',
  `trader_code` varchar(10) DEFAULT NULL COMMENT '券商标识',
  `ccass` varchar(20) DEFAULT NULL COMMENT '中央结算编号',
  `rollover_guide_url` varchar(50) DEFAULT NULL COMMENT '转仓指引',
  `is_download_table` int(11) DEFAULT NULL COMMENT '是否可以下载转仓表格，1表示可以，0不可以，3other',
  `contact` varchar(40) DEFAULT NULL COMMENT '联系人',
  `trader_email` varchar(40) DEFAULT NULL COMMENT '券商联系邮件',
  `trader_phone_number_hk` varchar(30) DEFAULT NULL COMMENT '券商香港电话',
  `trader_phone_number_ch` varchar(30) DEFAULT NULL COMMENT '券商大陆电话',
  `sequence` int(11) DEFAULT NULL COMMENT '排序顺序',
  `is_display` int(11) DEFAULT NULL COMMENT '是否显示，1显示，0不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for stock_transfer_update_flow
-- ----------------------------
DROP TABLE IF EXISTS `stock_transfer_update_flow`;
CREATE TABLE `stock_transfer_update_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `detail_id` bigint(20) NOT NULL COMMENT '提交一次转仓申请的时间',
  `stock_id` bigint(20) NOT NULL COMMENT '转仓申请的股票id',
  `exchange` varchar(10) DEFAULT NULL COMMENT '股票市场',
  `code` varchar(15) DEFAULT NULL COMMENT '股票code',
  `amount` int(11) DEFAULT NULL COMMENT '转仓股票数量',
  `reviser` varchar(30) DEFAULT NULL COMMENT '修改股票信息的人姓名',
  `insert_time` datetime DEFAULT NULL COMMENT '入表时间',
  `name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `type` int(11) DEFAULT NULL COMMENT '1表示增加和修改，2表示删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sub_account_log
-- ----------------------------
DROP TABLE IF EXISTS `sub_account_log`;
CREATE TABLE `sub_account_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(10) DEFAULT NULL COMMENT '资金账户',
  `sub_account` varchar(10) DEFAULT NULL COMMENT '子账户',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '手机号',
  `insert_time` datetime DEFAULT NULL COMMENT '生成子账户时间',
  `create_type` varchar(2) DEFAULT NULL COMMENT '0无效1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for supplement_account
-- ----------------------------
DROP TABLE IF EXISTS `supplement_account`;
CREATE TABLE `supplement_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL COMMENT '邮箱',
  `step` varchar(4) DEFAULT NULL COMMENT '步骤',
  `name` varchar(150) DEFAULT NULL COMMENT '姓名',
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `special_surname` varchar(50) DEFAULT NULL COMMENT '中文姓',
  `special_givenname` varchar(50) DEFAULT NULL COMMENT '中文名',
  `area_code` varchar(10) DEFAULT NULL COMMENT '区号',
  `phone_number` varchar(30) DEFAULT NULL COMMENT '电话',
  `birthday` varchar(100) DEFAULT NULL COMMENT '生日',
  `sex` int(2) DEFAULT NULL COMMENT '性别：0女 1男',
  `address` varchar(255) DEFAULT NULL COMMENT '住址',
  `address2` varchar(255) DEFAULT NULL COMMENT '住址2',
  `province` varchar(100) DEFAULT NULL COMMENT '省份',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `zip_code` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `tax_state` varchar(50) DEFAULT NULL COMMENT '纳税国家',
  `listed_company_director` varchar(10) DEFAULT '0' COMMENT '是否上市公司董事0否 1是',
  `listed_company_symbol` varchar(50) DEFAULT NULL COMMENT '公司名称/公司股票代码',
  `id_url` varchar(200) DEFAULT NULL COMMENT '身份证图片地址',
  `id_code` varchar(255) DEFAULT NULL,
  `id_type` varchar(10) DEFAULT NULL COMMENT ' 美国开户证件类型 1SSN 2中国内地护照 3中国香港护照 4中国澳门护照 5中国台湾护照 6加拿大护照 0中国内地身份证 7香港身份证8驾驶证9其他国家护照',
  `broker_relation` varchar(10) DEFAULT '0' COMMENT '1 有受雇 0无受雇于经纪公司',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `house_number` varchar(50) DEFAULT NULL COMMENT '门牌号',
  `country` varchar(500) DEFAULT NULL COMMENT '国家',
  `ssn_id` varchar(50) DEFAULT NULL COMMENT 'SSN号',
  `employment` varchar(50) DEFAULT NULL COMMENT '就业情况1就业2失业3退休4学生',
  `industry` varchar(50) DEFAULT NULL COMMENT '职位',
  `investment_objectives` varchar(50) DEFAULT NULL COMMENT '投资目标',
  `annual_income` varchar(50) DEFAULT NULL COMMENT '年收入',
  `family_assets` varchar(50) DEFAULT NULL COMMENT '净资产',
  `other_exp` varchar(50) DEFAULT NULL COMMENT '投资期限',
  `risk_off` varchar(50) DEFAULT NULL COMMENT '哪种投资最不喜欢',
  `risk_tolerance` varchar(50) DEFAULT NULL COMMENT '哪种投资最喜欢',
  `relation_name` varchar(50) DEFAULT NULL COMMENT '券商名/公司名',
  `agreement` varchar(1) DEFAULT '0' COMMENT '是否同意协议0否1是',
  `funds_account` varchar(10) DEFAULT NULL COMMENT '资金账号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `update_time` datetime DEFAULT NULL COMMENT '审核时间',
  `register_type` varchar(2) DEFAULT NULL COMMENT '1邮箱注册2手机号注册',
  `account_type` int(2) DEFAULT '0' COMMENT '0待提交 1:审核成功 2:审核失败',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for system_message
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message` (
  `id` int(8) DEFAULT NULL,
  `parent_code` int(8) DEFAULT NULL,
  `children_code` int(8) DEFAULT NULL,
  `name` varchar(800) DEFAULT NULL,
  `value` varchar(2000) DEFAULT NULL,
  `description` varchar(800) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `value_en` varchar(2000) DEFAULT NULL,
  `description_en` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for task_compensation
-- ----------------------------
DROP TABLE IF EXISTS `task_compensation`;
CREATE TABLE `task_compensation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` int(11) NOT NULL COMMENT '当前执行的任务id',
  `task_type` int(11) NOT NULL COMMENT '任务类型，自定义可以定义多个重试任务数据',
  `task_name` varchar(100) DEFAULT NULL COMMENT '任务名称',
  `task_data` varchar(1000) DEFAULT NULL COMMENT '任务报文',
  `request_url` varchar(300) DEFAULT NULL COMMENT '回调URL',
  `insert_time` datetime DEFAULT NULL COMMENT '数据插入时间 yyyy-MM-dd HH:mm:ss',
  `update_time` datetime DEFAULT NULL COMMENT '失败时间 yyyy-MM-dd HH:mm:ss',
  `retry_count` int(11) DEFAULT NULL COMMENT '重试次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48813 DEFAULT CHARSET=utf8mb4 COMMENT='任务补偿表';

-- ----------------------------
-- Table structure for trading_experience_options
-- ----------------------------
DROP TABLE IF EXISTS `trading_experience_options`;
CREATE TABLE `trading_experience_options` (
  `option_id` varchar(38) NOT NULL COMMENT 'ID',
  `option_type` char(1) DEFAULT NULL COMMENT '选项类型',
  `option_content` varchar(200) DEFAULT NULL COMMENT '选项内容',
  `option_content_us` varchar(500) DEFAULT NULL,
  `option_content_hk` varchar(500) DEFAULT NULL,
  `question_id` varchar(38) DEFAULT NULL COMMENT '问题id',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trading_experience_question
-- ----------------------------
DROP TABLE IF EXISTS `trading_experience_question`;
CREATE TABLE `trading_experience_question` (
  `question_id` varchar(38) NOT NULL COMMENT 'ID',
  `question_desc` varchar(500) DEFAULT NULL COMMENT '问题描述',
  `question_desc_us` varchar(500) DEFAULT NULL,
  `question_desc_hk` varchar(500) DEFAULT NULL,
  `market` varchar(20) NOT NULL COMMENT '问题所属的市场  HK US',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trading_experience_result
-- ----------------------------
DROP TABLE IF EXISTS `trading_experience_result`;
CREATE TABLE `trading_experience_result` (
  `result_id` varchar(38) NOT NULL COMMENT 'ID',
  `account_id` varchar(38) DEFAULT NULL COMMENT '用户ID',
  `question_id` varchar(38) DEFAULT NULL COMMENT '问题ID',
  `option_id` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_bank_info
-- ----------------------------
DROP TABLE IF EXISTS `transfer_bank_info`;
CREATE TABLE `transfer_bank_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(38) DEFAULT NULL COMMENT '银行名称',
  `status` int(2) DEFAULT NULL COMMENT '状态  0未启用  1启用',
  `seq` int(3) DEFAULT NULL COMMENT '排序',
  `bank_type_id` int(11) DEFAULT NULL COMMENT '所属银行类型id（关联transfer_bank_type的id字段）',
  `name_en` varchar(100) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_bank_info_copy20200402
-- ----------------------------
DROP TABLE IF EXISTS `transfer_bank_info_copy20200402`;
CREATE TABLE `transfer_bank_info_copy20200402` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(38) DEFAULT NULL COMMENT '银行名称',
  `status` int(2) DEFAULT NULL COMMENT '状态  0未启用  1启用',
  `seq` int(3) DEFAULT NULL COMMENT '排序',
  `bank_type_id` int(11) DEFAULT NULL COMMENT '所属银行类型id（关联transfer_bank_type的id字段）',
  `name_en` varchar(100) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_bank_info_copy20200612
-- ----------------------------
DROP TABLE IF EXISTS `transfer_bank_info_copy20200612`;
CREATE TABLE `transfer_bank_info_copy20200612` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(38) DEFAULT NULL COMMENT '银行名称',
  `status` int(2) DEFAULT NULL COMMENT '状态  0未启用  1启用',
  `seq` int(3) DEFAULT NULL COMMENT '排序',
  `bank_type_id` int(11) DEFAULT NULL COMMENT '所属银行类型id（关联transfer_bank_type的id字段）',
  `name_en` varchar(100) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_bank_info_copy202006221406
-- ----------------------------
DROP TABLE IF EXISTS `transfer_bank_info_copy202006221406`;
CREATE TABLE `transfer_bank_info_copy202006221406` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(38) DEFAULT NULL COMMENT '银行名称',
  `status` int(2) DEFAULT NULL COMMENT '状态  0未启用  1启用',
  `seq` int(3) DEFAULT NULL COMMENT '排序',
  `bank_type_id` int(11) DEFAULT NULL COMMENT '所属银行类型id（关联transfer_bank_type的id字段）',
  `name_en` varchar(100) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_bank_type
-- ----------------------------
DROP TABLE IF EXISTS `transfer_bank_type`;
CREATE TABLE `transfer_bank_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(38) NOT NULL COMMENT '银行类型的名字',
  `short_name` varchar(10) DEFAULT NULL COMMENT '简名',
  `status` int(2) NOT NULL COMMENT '状态 0 未使用 1 使用中',
  `seq` int(3) NOT NULL COMMENT '展示顺序',
  `name_en` varchar(100) DEFAULT NULL COMMENT '英文名',
  `short_name_en` varchar(100) DEFAULT NULL COMMENT '简名英文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_batch_record
-- ----------------------------
DROP TABLE IF EXISTS `transfer_batch_record`;
CREATE TABLE `transfer_batch_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `staff` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `date` datetime DEFAULT NULL COMMENT '操作日期',
  `succeed` int(10) DEFAULT NULL COMMENT '成功数量',
  `error` int(10) DEFAULT NULL COMMENT '失败数量',
  `is_auto` int(10) DEFAULT NULL COMMENT '1-自动；2-人工',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5664 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_batch_record_info
-- ----------------------------
DROP TABLE IF EXISTS `transfer_batch_record_info`;
CREATE TABLE `transfer_batch_record_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transfer_batch_record_id` int(10) DEFAULT NULL COMMENT '批量转账记录编号',
  `transfer_money_apply_id` int(10) DEFAULT NULL COMMENT '出金编号',
  `name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '账号',
  `amount` varchar(15) DEFAULT NULL COMMENT '转账金额',
  `status` varchar(2) DEFAULT NULL COMMENT '1-成功；2-失败',
  `message` varchar(100) DEFAULT NULL COMMENT '信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117630 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_cash_audit
-- ----------------------------
DROP TABLE IF EXISTS `transfer_cash_audit`;
CREATE TABLE `transfer_cash_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_money_apply_id` int(11) DEFAULT NULL COMMENT '出金申请',
  `state` int(11) DEFAULT NULL COMMENT '1001_初审 1002_初审通过 1003_初审不通过 2001_结算员通过 2002_结算员不通过 1004_驳回通过 1005_驳回不通过 3001_会计转账成功 3002_会计转账失败 1006_交易员重新出金 1007_交易员重新入金 3003_会计退款成功 4000 用户撤回',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '审核角色  1_交易员 2_结算员 3_会计',
  `auditor` char(20) DEFAULT NULL COMMENT '审核人 account_manager.account',
  `comment` varchar(500) DEFAULT NULL COMMENT '不通过原因',
  `audit_cert_url` varchar(500) DEFAULT NULL COMMENT '转账，退款等审核票据凭证',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_transfer_money_apply_id` (`transfer_money_apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=844094 DEFAULT CHARSET=utf8mb4 COMMENT='出金审核';

-- ----------------------------
-- Table structure for transfer_cash_audit_copy202009251354
-- ----------------------------
DROP TABLE IF EXISTS `transfer_cash_audit_copy202009251354`;
CREATE TABLE `transfer_cash_audit_copy202009251354` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_money_apply_id` int(11) DEFAULT NULL COMMENT '出金申请',
  `state` int(11) DEFAULT NULL COMMENT '1001_初审 1002_初审通过 1003_初审不通过 2001_结算员通过 2002_结算员不通过 1004_驳回通过 1005_驳回不通过 3001_会计转账成功 3002_会计转账失败 1006_交易员重新出金 1007_交易员重新入金 3003_会计退款成功 4000 用户撤回',
  `audit_role` tinyint(4) DEFAULT NULL COMMENT '审核角色  1_交易员 2_结算员 3_会计',
  `auditor` char(20) DEFAULT NULL COMMENT '审核人 account_manager.account',
  `comment` varchar(500) DEFAULT NULL COMMENT '不通过原因',
  `audit_cert_url` varchar(500) DEFAULT NULL COMMENT '转账，退款等审核票据凭证',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_transfer_money_apply_id` (`transfer_money_apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=280279 DEFAULT CHARSET=utf8mb4 COMMENT='出金审核';

-- ----------------------------
-- Table structure for transfer_frenquently_bank
-- ----------------------------
DROP TABLE IF EXISTS `transfer_frenquently_bank`;
CREATE TABLE `transfer_frenquently_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_type_id` int(11) DEFAULT NULL COMMENT '银行分类id',
  `bank_type_name` varchar(38) DEFAULT NULL COMMENT '银行分类名称',
  `bank_id` int(3) DEFAULT NULL COMMENT '银行id',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称',
  `bank_card_num` varchar(38) DEFAULT NULL COMMENT '银行卡号',
  `payee_name` varchar(150) DEFAULT NULL COMMENT '收款人姓名',
  `funds_account` varchar(38) DEFAULT NULL COMMENT '资金账号',
  `short_bank_type_name` varchar(10) DEFAULT NULL COMMENT '银行分类缩写',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '注释',
  `address` varchar(255) DEFAULT NULL COMMENT '居住地址',
  `currency` varchar(20) DEFAULT NULL COMMENT '提取币种 0 港币 1 美金 2 人民币',
  `bank_address` varchar(255) DEFAULT NULL COMMENT '收款银行地址',
  `aba` varchar(255) DEFAULT NULL COMMENT 'aba routing no',
  `swift_code` varchar(255) DEFAULT NULL COMMENT 'swift code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76435 DEFAULT CHARSET=utf8mb4 COMMENT='常用银行表';

-- ----------------------------
-- Table structure for transfer_frenquently_bank_202005261800
-- ----------------------------
DROP TABLE IF EXISTS `transfer_frenquently_bank_202005261800`;
CREATE TABLE `transfer_frenquently_bank_202005261800` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_type_id` int(11) DEFAULT NULL COMMENT '银行分类id',
  `bank_type_name` varchar(38) DEFAULT NULL COMMENT '银行分类名称',
  `bank_id` int(3) DEFAULT NULL COMMENT '银行id',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称',
  `bank_card_num` varchar(38) DEFAULT NULL COMMENT '银行卡号',
  `payee_name` varchar(150) DEFAULT NULL COMMENT '收款人姓名',
  `funds_account` varchar(38) DEFAULT NULL COMMENT '资金账号',
  `short_bank_type_name` varchar(10) DEFAULT NULL COMMENT '银行分类缩写',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '注释',
  `address` varchar(255) DEFAULT NULL COMMENT '居住地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21749 DEFAULT CHARSET=utf8mb4 COMMENT='常用银行表';

-- ----------------------------
-- Table structure for transfer_money_apply
-- ----------------------------
DROP TABLE IF EXISTS `transfer_money_apply`;
CREATE TABLE `transfer_money_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_type_id` int(3) DEFAULT NULL COMMENT '银行分类id',
  `bank_type_name` varchar(38) DEFAULT NULL COMMENT '银行分类名字-收款银行',
  `bank_id` int(3) DEFAULT NULL COMMENT '银行id-收款银行',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称-收款银行',
  `currency` varchar(38) DEFAULT NULL COMMENT '提取币种 0 港币 1 美金 2 人民币',
  `transfer_method_id` int(3) DEFAULT NULL COMMENT '支取方式id',
  `transfer_method_name` varchar(38) DEFAULT NULL COMMENT '支取方式名称',
  `payee_name` varchar(150) DEFAULT NULL COMMENT '收款人姓名',
  `bank_card_num` varchar(38) DEFAULT NULL COMMENT '收款银行账号',
  `amount` double(15,2) DEFAULT NULL COMMENT '提取金额',
  `amount_real` double(15,2) DEFAULT NULL COMMENT '汇款金额',
  `funds_account` varchar(38) DEFAULT NULL COMMENT '资金账号',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `insert_date` datetime DEFAULT NULL COMMENT '创建时间',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `ver` int(11) unsigned DEFAULT '0' COMMENT '乐观锁',
  `auditor` varchar(20) DEFAULT NULL COMMENT '审核人',
  `source` tinyint(4) DEFAULT NULL COMMENT '来源 1:用户录入;2:交易员录入;3:重新汇款;',
  `retransfer_id` int(11) DEFAULT NULL COMMENT '重新出金的话记录原id',
  `remit_bank` varchar(100) DEFAULT NULL COMMENT '汇出银行',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `fee` double(15,2) DEFAULT NULL COMMENT '收取手续费',
  `order_reff` varchar(40) DEFAULT NULL COMMENT '出金流水号',
  `re_order_id` varchar(40) DEFAULT NULL COMMENT '修改出金后的流水号',
  `bms_status` int(5) DEFAULT NULL COMMENT 'bms状态 0未冻结 1已冻结 2未解冻 3已解冻 4修改出金中 5修改出金完成',
  `deposit_step` int(5) DEFAULT '0',
  `msg_id` varchar(50) DEFAULT NULL COMMENT '大数据自动转账流水号',
  `bank_info` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203124 DEFAULT CHARSET=utf8mb4 COMMENT='出金记录';

-- ----------------------------
-- Table structure for transfer_money_apply_202009251354
-- ----------------------------
DROP TABLE IF EXISTS `transfer_money_apply_202009251354`;
CREATE TABLE `transfer_money_apply_202009251354` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_type_id` int(3) DEFAULT NULL COMMENT '银行分类id',
  `bank_type_name` varchar(38) DEFAULT NULL COMMENT '银行分类名字-收款银行',
  `bank_id` int(3) DEFAULT NULL COMMENT '银行id-收款银行',
  `bank_name` varchar(150) DEFAULT NULL COMMENT '银行名称-收款银行',
  `currency` varchar(38) DEFAULT NULL COMMENT '提取币种 0 港币 1 美金 2 人民币',
  `transfer_method_id` int(3) DEFAULT NULL COMMENT '支取方式id',
  `transfer_method_name` varchar(38) DEFAULT NULL COMMENT '支取方式名称',
  `payee_name` varchar(150) DEFAULT NULL COMMENT '收款人姓名',
  `bank_card_num` varchar(38) DEFAULT NULL COMMENT '收款银行账号',
  `amount` double(15,2) DEFAULT NULL COMMENT '提取金额',
  `amount_real` double(15,2) DEFAULT NULL COMMENT '汇款金额',
  `funds_account` varchar(38) DEFAULT NULL COMMENT '资金账号',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `insert_date` datetime DEFAULT NULL COMMENT '创建时间',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `ver` int(11) unsigned DEFAULT '0' COMMENT '乐观锁',
  `auditor` varchar(20) DEFAULT NULL COMMENT '审核人',
  `source` tinyint(4) DEFAULT NULL COMMENT '来源 1:用户录入;2:交易员录入;3:重新汇款;',
  `retransfer_id` int(11) DEFAULT NULL COMMENT '重新出金的话记录原id',
  `remit_bank` varchar(100) DEFAULT NULL COMMENT '汇出银行',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `fee` double(15,2) DEFAULT NULL COMMENT '收取手续费',
  `order_reff` varchar(40) DEFAULT NULL COMMENT '出金流水号',
  `re_order_id` varchar(40) DEFAULT NULL COMMENT '修改出金后的流水号',
  `bms_status` int(5) DEFAULT NULL COMMENT 'bms状态 0未冻结 1已冻结 2未解冻 3已解冻 4修改出金中 5修改出金完成',
  `deposit_step` int(5) DEFAULT '0',
  `msg_id` varchar(50) DEFAULT NULL COMMENT '大数据自动转账流水号',
  `bank_info` varchar(255) DEFAULT NULL COMMENT '银行信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85991 DEFAULT CHARSET=utf8mb4 COMMENT='出金记录';

-- ----------------------------
-- Table structure for transfer_money_auto_flag
-- ----------------------------
DROP TABLE IF EXISTS `transfer_money_auto_flag`;
CREATE TABLE `transfer_money_auto_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funds_account` varchar(50) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `bank_card_num` varchar(50) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '0-禁用，1-启用',
  `update_time` date DEFAULT NULL COMMENT '更新时间',
  `staff` varchar(50) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_money_auto_record
-- ----------------------------
DROP TABLE IF EXISTS `transfer_money_auto_record`;
CREATE TABLE `transfer_money_auto_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(50) DEFAULT NULL COMMENT '请求大数据流水号',
  `transfer_money_apply_id` int(10) DEFAULT NULL COMMENT '出金申请编号',
  `funds_account` varchar(20) DEFAULT NULL COMMENT '资金账号',
  `bank_code` varchar(20) DEFAULT NULL COMMENT '银行编码',
  `bank_card_num` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `ccy` varchar(10) DEFAULT NULL COMMENT '币种',
  `amount` varchar(20) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `status` int(10) DEFAULT NULL COMMENT '状态 4001-成功；4002-失败；4004转账中',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型 1-初始请求；2-补偿请求',
  `message` varchar(200) DEFAULT NULL COMMENT '描述',
  `request` varchar(5000) DEFAULT NULL COMMENT '请求报文',
  `response` varchar(5000) DEFAULT NULL COMMENT '响应报文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120217 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transfer_money_method
-- ----------------------------
DROP TABLE IF EXISTS `transfer_money_method`;
CREATE TABLE `transfer_money_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(38) DEFAULT NULL COMMENT '提取方式的名字',
  `tips` varchar(38) DEFAULT NULL COMMENT '提取方式后边的小提示',
  `status` int(2) DEFAULT NULL COMMENT '启用状态 0 未启用  1启用',
  `seq` int(3) DEFAULT NULL COMMENT '排序',
  `bank_type_id` int(2) DEFAULT NULL COMMENT '所属银行类型id（关联transfer_bank_type的id字段）',
  `service_charge` double DEFAULT NULL COMMENT '手续费',
  `name_en` varchar(100) DEFAULT NULL COMMENT '英文名',
  `tips_en` varchar(100) DEFAULT NULL COMMENT '英文提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='提取方式';

-- ----------------------------
-- Table structure for transfer_money_method_copy20200402
-- ----------------------------
DROP TABLE IF EXISTS `transfer_money_method_copy20200402`;
CREATE TABLE `transfer_money_method_copy20200402` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(38) DEFAULT NULL COMMENT '提取方式的名字',
  `tips` varchar(38) DEFAULT NULL COMMENT '提取方式后边的小提示',
  `status` int(2) DEFAULT NULL COMMENT '启用状态 0 未启用  1启用',
  `seq` int(3) DEFAULT NULL COMMENT '排序',
  `bank_type_id` int(2) DEFAULT NULL COMMENT '所属银行类型id（关联transfer_bank_type的id字段）',
  `service_charge` double DEFAULT NULL COMMENT '手续费',
  `name_en` varchar(100) DEFAULT NULL COMMENT '英文名',
  `tips_en` varchar(100) DEFAULT NULL COMMENT '英文提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='提取方式';

-- ----------------------------
-- Table structure for transfer_money_unauto_bank
-- ----------------------------
DROP TABLE IF EXISTS `transfer_money_unauto_bank`;
CREATE TABLE `transfer_money_unauto_bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_id` int(10) DEFAULT NULL COMMENT '银行编号',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for update_account_backups
-- ----------------------------
DROP TABLE IF EXISTS `update_account_backups`;
CREATE TABLE `update_account_backups` (
  `backups_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) DEFAULT NULL,
  `funds_account` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL COMMENT '姓拼英',
  `first_name` varchar(50) DEFAULT NULL COMMENT '名拼英',
  `id` varchar(30) DEFAULT NULL COMMENT '证件号码',
  `addr` varchar(100) DEFAULT NULL COMMENT '通讯地址',
  `office` varchar(100) DEFAULT NULL COMMENT '签发单位',
  `valid` varchar(50) DEFAULT NULL COMMENT '证件有效时间',
  `front` varchar(500) DEFAULT NULL COMMENT '身份证正面',
  `reverse` varchar(500) DEFAULT NULL COMMENT '身份证背面图片地址',
  `sign_name_pic` varchar(500) DEFAULT NULL COMMENT '签名照',
  `tax_area` varchar(100) DEFAULT NULL COMMENT '税务地区',
  `tax_id` varchar(100) DEFAULT NULL COMMENT '税务编号',
  `command_photo` varchar(500) DEFAULT NULL COMMENT '指令动作照片（活体检测照片）',
  `step` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`backups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for update_account_detail
-- ----------------------------
DROP TABLE IF EXISTS `update_account_detail`;
CREATE TABLE `update_account_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) DEFAULT NULL,
  `funds_account` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '名字',
  `last_name` varchar(30) DEFAULT NULL COMMENT '姓拼英',
  `first_name` varchar(30) DEFAULT NULL COMMENT '名拼英',
  `id_code` varchar(30) DEFAULT NULL COMMENT '证件号码',
  `address` varchar(100) DEFAULT NULL COMMENT '通讯地址',
  `office` varchar(100) DEFAULT NULL COMMENT '签发单位',
  `valid_start` varchar(50) DEFAULT NULL COMMENT '证件有效时间开始时间',
  `valid_end` varchar(50) DEFAULT NULL COMMENT '证件有效时间结束时间',
  `front` varchar(100) DEFAULT NULL COMMENT '身份证正面',
  `reverse` varchar(100) DEFAULT NULL COMMENT '身份证背面图片地址',
  `sign_name_pic` varchar(100) DEFAULT NULL COMMENT '签名照',
  `tax_area` varchar(20) DEFAULT NULL COMMENT '税务地区',
  `tax_id` varchar(40) DEFAULT NULL COMMENT '税务编号',
  `command_photo` varchar(300) DEFAULT NULL COMMENT '指令动作照片（活体检测照片）',
  `instructions` varchar(30) DEFAULT NULL COMMENT '指令名称',
  `step` varchar(10) DEFAULT NULL COMMENT '步骤',
  `reviewer` varchar(30) DEFAULT NULL COMMENT '审核员',
  `remarks` varchar(20) DEFAULT NULL COMMENT '备注',
  `reason` varchar(500) DEFAULT NULL COMMENT '具体原因',
  `reviewer_time` datetime DEFAULT NULL COMMENT '审核时间',
  `examine_type` varchar(10) DEFAULT NULL COMMENT '审核状态 1待审核2审核成功3审核失败',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `submit` int(2) DEFAULT '0' COMMENT '0是已提交1是未提交',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=936 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
