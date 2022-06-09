/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : bank

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:13:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bank_of_china_hk
-- ----------------------------
DROP TABLE IF EXISTS `bank_of_china_hk`;
CREATE TABLE `bank_of_china_hk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disposeDate` varchar(255) DEFAULT NULL COMMENT '处理时间',
  `effectDate` varchar(255) DEFAULT NULL COMMENT '生效时间',
  `transactionType` varchar(255) DEFAULT NULL COMMENT '交易类别',
  `accounts` varchar(255) DEFAULT NULL COMMENT '扣账/入账',
  `money` varchar(255) DEFAULT NULL COMMENT '金额',
  `accountBalance` varchar(255) DEFAULT NULL COMMENT '账户结余',
  `number` varchar(255) DEFAULT NULL COMMENT '备考号',
  `transactionAbstract` varchar(255) DEFAULT NULL COMMENT '交易摘要',
  `checkNum` varchar(255) DEFAULT NULL,
  `imgName` varchar(255) DEFAULT NULL COMMENT '截图名称',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4463 DEFAULT CHARSET=utf8 COMMENT='中银香港入金数据-列表页';

-- ----------------------------
-- Table structure for boc_erpi
-- ----------------------------
DROP TABLE IF EXISTS `boc_erpi`;
CREATE TABLE `boc_erpi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AcctNo` varchar(255) DEFAULT NULL COMMENT '账户号码',
  `SeqNo` varchar(255) DEFAULT NULL COMMENT '流水号',
  `Cur` varchar(255) DEFAULT NULL COMMENT '货币',
  `Time` varchar(255) DEFAULT NULL COMMENT '时间',
  `TxRefNo` varchar(255) DEFAULT NULL COMMENT '备考号',
  `Amount` decimal(20,2) DEFAULT NULL COMMENT '金额',
  `Particulars` varchar(255) DEFAULT NULL COMMENT '摘要',
  `TxDetail` varchar(255) DEFAULT NULL COMMENT '交易种类',
  `LastUpdateTime` varchar(255) DEFAULT NULL COMMENT '最后更新时间',
  `OriginalBody` longtext COMMENT '原始报文',
  `IsVerify` int(11) DEFAULT '0' COMMENT '是否匹配成功 0 未成功 1 成功',
  `Create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '该条数据插入时间',
  `Update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '该条记录最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `txrefNo` (`TxRefNo`),
  KEY `seq_no` (`SeqNo`) USING BTREE,
  KEY `acc_no` (`AcctNo`) USING BTREE,
  KEY `particulars` (`Particulars`) USING BTREE,
  KEY `IDX_LastUpdateTime` (`LastUpdateTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=232297 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for boc_fps
-- ----------------------------
DROP TABLE IF EXISTS `boc_fps`;
CREATE TABLE `boc_fps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageId` varchar(255) DEFAULT '' COMMENT '包序列ID',
  `txStatus` varchar(255) DEFAULT '' COMMENT '状态',
  `txRefNo` varchar(255) DEFAULT '' COMMENT '交易备考号',
  `txDate` varchar(255) DEFAULT '' COMMENT '交易日期',
  `txTime` varchar(255) DEFAULT '' COMMENT '交易时间',
  `errorCode` varchar(255) DEFAULT '' COMMENT '错误码',
  `errorDesc` varchar(255) DEFAULT '' COMMENT '错误描述',
  `status` varchar(255) DEFAULT '' COMMENT '结果',
  `transRef` varchar(255) DEFAULT '' COMMENT '交易参考号',
  `debitAmt` varchar(255) DEFAULT '' COMMENT '金额',
  `debitCur` varchar(255) DEFAULT '' COMMENT '币种',
  `beneType` varchar(255) DEFAULT '' COMMENT '收款人类别',
  `beneName` varchar(255) DEFAULT '' COMMENT '收款人姓名',
  `beneBankCode` varchar(255) DEFAULT '' COMMENT '收款人银行代号',
  `chargesOption` varchar(255) DEFAULT '' COMMENT '手续费付款方式',
  `remChgTolAmt` varchar(255) DEFAULT '' COMMENT '手续费金额',
  `remChrg` varchar(255) DEFAULT '' COMMENT '汇率',
  `valueDate` varchar(255) DEFAULT '' COMMENT '生效日期',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='中银FPS响应记录';

-- ----------------------------
-- Table structure for boc_refine
-- ----------------------------
DROP TABLE IF EXISTS `boc_refine`;
CREATE TABLE `boc_refine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) DEFAULT NULL COMMENT '账户号码',
  `trading_day` varchar(255) DEFAULT NULL COMMENT '交易日期',
  `trade_money` varchar(255) DEFAULT NULL COMMENT '金额',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `bank_charges` varchar(255) DEFAULT NULL COMMENT '银行手续费',
  `debit` varchar(255) DEFAULT NULL COMMENT '借贷方向',
  `summary` varchar(255) DEFAULT NULL COMMENT '描述',
  `running_number` varchar(255) DEFAULT NULL COMMENT '到账编号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5367 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for boc_sdda_bind
-- ----------------------------
DROP TABLE IF EXISTS `boc_sdda_bind`;
CREATE TABLE `boc_sdda_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageId` varchar(255) DEFAULT '' COMMENT '包序列id',
  `txstatus` varchar(255) DEFAULT '' COMMENT '状态',
  `errorCode` varchar(255) DEFAULT '' COMMENT '错误码',
  `errorDesc` varchar(255) DEFAULT '' COMMENT '错误描述',
  `txRefNo` varchar(255) DEFAULT '' COMMENT '交易备考号',
  `txDate` varchar(255) DEFAULT '' COMMENT '交易日期',
  `txTime` varchar(255) DEFAULT '' COMMENT '交易时间',
  `debtorName` varchar(255) DEFAULT '' COMMENT '扣款账户名称',
  `dbtrAcBkCode` varchar(255) DEFAULT '' COMMENT '扣款银行代号',
  `dbtrAcId` varchar(255) DEFAULT '' COMMENT '扣款账户账号',
  `dbtrAcCur` varchar(255) DEFAULT '' COMMENT '扣款币种',
  `dbtrAcIdType` varchar(255) DEFAULT '' COMMENT '付款人证件类型',
  `dbtrAcIdNo` varchar(255) DEFAULT '' COMMENT '付款人证件号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='中银DDA绑定响应记录';

-- ----------------------------
-- Table structure for boc_sdda_ddi
-- ----------------------------
DROP TABLE IF EXISTS `boc_sdda_ddi`;
CREATE TABLE `boc_sdda_ddi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageId` varchar(255) DEFAULT '' COMMENT '包序列Id',
  `txStatus` varchar(255) DEFAULT '' COMMENT '状态',
  `txRefNo` varchar(255) DEFAULT '' COMMENT '交易备考号',
  `txDate` varchar(255) DEFAULT '' COMMENT '交易日期',
  `txTime` varchar(255) DEFAULT '' COMMENT '交易时间',
  `errorCode` varchar(255) DEFAULT '' COMMENT '错误码',
  `errorDesc` varchar(255) DEFAULT '' COMMENT '错误描述',
  `debtorName` varchar(255) DEFAULT '' COMMENT '扣款账户名称',
  `dbtrAcBkCode` varchar(255) DEFAULT '' COMMENT '扣款银行代号',
  `dbtrAcFPSCustId` varchar(255) DEFAULT '' COMMENT '扣款账户号码',
  `dbtrAcCur` varchar(255) DEFAULT '' COMMENT '扣款币种',
  `drAmt` varchar(255) DEFAULT '' COMMENT '扣款金额',
  `dbtrReference` varchar(255) DEFAULT '' COMMENT '债务人备查号',
  `txDetail` varchar(255) DEFAULT '' COMMENT '交易摘要',
  `transRef` varchar(255) DEFAULT '' COMMENT '客户交易编号',
  `postDate` varchar(255) DEFAULT '' COMMENT '执行日期',
  `status` int(11) DEFAULT '0' COMMENT '推送状态 0未推送 1已推送',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='中银DDI交易记录';

-- ----------------------------
-- Table structure for boc_sdda_receive
-- ----------------------------
DROP TABLE IF EXISTS `boc_sdda_receive`;
CREATE TABLE `boc_sdda_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageId` varchar(255) DEFAULT '' COMMENT '原包序列id',
  `txDate` varchar(255) DEFAULT '' COMMENT '交易日期，系统接收指示请求的日期，格式yyyy/MM/dd',
  `txStatus` varchar(255) DEFAULT '' COMMENT '结果',
  `rejectCode` varchar(255) DEFAULT '' COMMENT '错误代码',
  `rejectReason` varchar(255) DEFAULT '' COMMENT '错误说明',
  `transRef` varchar(255) DEFAULT '' COMMENT '客户交易编号',
  `postDate` varchar(255) DEFAULT '' COMMENT '执行日期，系统完成指示请求的日期，格式yyyy/MM/dd',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='接收中银推送DDA绑卡状态记录';

-- ----------------------------
-- Table structure for bu_refine
-- ----------------------------
DROP TABLE IF EXISTS `bu_refine`;
CREATE TABLE `bu_refine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `account_number` varchar(255) DEFAULT NULL COMMENT '账户号',
  `trading_day` varchar(255) DEFAULT NULL COMMENT '交易日期',
  `bai_code` varchar(255) DEFAULT NULL COMMENT '未知代码',
  `description` varchar(255) DEFAULT NULL COMMENT '交易描述',
  `debit` varchar(255) DEFAULT NULL COMMENT '支出金额',
  `trade_money` varchar(255) DEFAULT NULL COMMENT '收入金额',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `b_reference` varchar(255) DEFAULT NULL COMMENT 'b引言',
  `c_reference` varchar(255) DEFAULT NULL COMMENT 'c引言',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `name` varchar(255) DEFAULT NULL COMMENT '交易名称',
  `running_number` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3754 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='refine上传联合银行';

-- ----------------------------
-- Table structure for cbi_account_check_file
-- ----------------------------
DROP TABLE IF EXISTS `cbi_account_check_file`;
CREATE TABLE `cbi_account_check_file` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(255) DEFAULT NULL COMMENT '订单号',
  `bankOrderId` varchar(255) DEFAULT NULL COMMENT '银行订单号',
  `initiator` varchar(255) DEFAULT NULL COMMENT '发起方',
  `funds_account` varchar(255) DEFAULT NULL COMMENT '用户证券资金ID',
  `sub_account` varchar(255) DEFAULT NULL COMMENT '子账户类型',
  `payBankClientId` varchar(255) DEFAULT NULL COMMENT '支付卡号',
  `proceedsBankClientId` varchar(255) DEFAULT NULL COMMENT '收款卡号',
  `orderAmount` varchar(255) DEFAULT NULL COMMENT '订单金额',
  `orderTime` varchar(255) DEFAULT NULL COMMENT '订单时间',
  `stlAmount` varchar(255) DEFAULT NULL COMMENT '结算金额',
  `stlTime` varchar(255) DEFAULT NULL COMMENT '结算日期',
  `stlFee` varchar(255) DEFAULT NULL COMMENT '手续费',
  `stlCurrency` varchar(255) DEFAULT NULL COMMENT '币种',
  `flag` varchar(255) DEFAULT NULL COMMENT '文件标识',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='cbi对账文件记录';

-- ----------------------------
-- Table structure for cbi_b2s
-- ----------------------------
DROP TABLE IF EXISTS `cbi_b2s`;
CREATE TABLE `cbi_b2s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brokerClientId` varchar(255) DEFAULT NULL COMMENT '证券方用户唯一标识',
  `bankClientId` varchar(255) DEFAULT NULL COMMENT '银行账号唯一标识',
  `brokerMarkId` varchar(255) DEFAULT NULL COMMENT '证券商标识',
  `bankMarkId` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `bankOrderId` varchar(255) DEFAULT NULL COMMENT '银行流水号',
  `brokerOrderId` varchar(255) DEFAULT NULL COMMENT '证券方流水号',
  `txnAmount` varchar(255) DEFAULT NULL COMMENT '订单金额',
  `txnCurrency` varchar(255) DEFAULT NULL COMMENT '订单交易币种',
  `txnOrderTime` varchar(255) DEFAULT NULL COMMENT '订单时间',
  `userAccountNo` varchar(255) DEFAULT NULL COMMENT '客户银行账号',
  `brokerSubAccountType` varchar(255) DEFAULT NULL COMMENT '子账户类型',
  `brokerNo` varchar(255) DEFAULT NULL COMMENT '证券账户号',
  `brokerCard` varchar(255) DEFAULT NULL COMMENT '证券企业银行号',
  `orderType` varchar(255) DEFAULT NULL COMMENT '订单类型',
  `orderTypeDesc` varchar(255) DEFAULT NULL COMMENT '订单类型描述',
  `clientInfo` varchar(255) DEFAULT NULL COMMENT '用户身份信息',
  `stlDate` varchar(255) DEFAULT NULL COMMENT '结算日期',
  `stlAmount` varchar(255) DEFAULT NULL COMMENT '结算金额',
  `stlFee` varchar(255) DEFAULT NULL COMMENT '结算手续费',
  `stlCurrency` varchar(255) DEFAULT NULL COMMENT '结算币种',
  `orderStatus` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `orderStatusDesc` text COMMENT '订单状态描述',
  `failMsg` text COMMENT '订单失败说明 仅当订单状态=FAIL时有内容',
  `timestamp` varchar(255) DEFAULT NULL COMMENT '签名时间',
  `signature` text COMMENT '签名信息',
  `automaticStatus` int(11) DEFAULT '0' COMMENT '流水推送状态 0 默认 1已接收',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='cbi银转证交易';

-- ----------------------------
-- Table structure for cbi_s2b
-- ----------------------------
DROP TABLE IF EXISTS `cbi_s2b`;
CREATE TABLE `cbi_s2b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankOrderId` varchar(255) DEFAULT NULL COMMENT '银行流水号',
  `orderId` varchar(255) DEFAULT NULL COMMENT '证券方流水号',
  `txnTime` varchar(255) DEFAULT NULL COMMENT '订单时间',
  `txnAmount` varchar(255) DEFAULT NULL COMMENT '订单金额',
  `txnCurrency` varchar(255) DEFAULT NULL COMMENT '订单交易币种',
  `bankMarkId` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `brokerNo` varchar(255) DEFAULT NULL COMMENT '证券账户号',
  `brokerCard` varchar(255) DEFAULT NULL COMMENT '证券企业银行号',
  `brokerClientId` varchar(255) DEFAULT NULL COMMENT '证券方用户唯一标识',
  `bankClientId` varchar(255) DEFAULT NULL COMMENT '银行账号唯一标识',
  `stlDate` varchar(255) DEFAULT NULL COMMENT '结算日期',
  `stlAmount` varchar(255) DEFAULT NULL COMMENT '结算金额',
  `stlFee` varchar(255) DEFAULT NULL COMMENT '结算手续费',
  `stlCurrency` varchar(255) DEFAULT NULL COMMENT '结算币种',
  `orderStatus` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `orderStatusDesc` text COMMENT '订单状态描述',
  `failMsg` text COMMENT '订单失败说明',
  `orderType` varchar(255) DEFAULT NULL COMMENT '订单类型',
  `orderTypeDesc` text COMMENT '订单类型描述',
  `timestamp` varchar(255) DEFAULT NULL COMMENT '签名时间',
  `signature` text COMMENT '签名信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='cbi证转银交易';

-- ----------------------------
-- Table structure for cmb_refine
-- ----------------------------
DROP TABLE IF EXISTS `cmb_refine`;
CREATE TABLE `cmb_refine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operation` varchar(255) DEFAULT '' COMMENT '操作',
  `value_date` varchar(255) DEFAULT '' COMMENT '起息日',
  `debit` varchar(255) DEFAULT '' COMMENT '借',
  `credit` varchar(255) DEFAULT '' COMMENT '贷',
  `summary` varchar(255) DEFAULT '' COMMENT '摘要',
  `trading_day` varchar(255) DEFAULT '' COMMENT '交易日',
  `running_number` varchar(255) DEFAULT '' COMMENT '交易流水号',
  `name` varchar(255) DEFAULT '' COMMENT '对手姓名',
  `number` varchar(255) DEFAULT '' COMMENT '參考編號',
  `trade_money` double(255,0) DEFAULT '0' COMMENT '交易金额',
  `trade_type` varchar(255) DEFAULT '' COMMENT '交易类型',
  `bill_no` varchar(255) DEFAULT '' COMMENT '票據號',
  `balance` varchar(255) DEFAULT '0' COMMENT '余额',
  `start_balance` double(255,0) DEFAULT '0' COMMENT '初始余額',
  `end_balance` double(255,0) DEFAULT '0' COMMENT '截止余額',
  `currency` varchar(255) NOT NULL DEFAULT '港币' COMMENT '币种',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4757 DEFAULT CHARSET=utf8 COMMENT='refine上传CMB(招商)银行数据';

-- ----------------------------
-- Table structure for dbs
-- ----------------------------
DROP TABLE IF EXISTS `dbs`;
CREATE TABLE `dbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` varchar(20) DEFAULT '' COMMENT '交易日期',
  `effective_date` varchar(20) DEFAULT '' COMMENT '生效日期',
  `trade_type` varchar(255) DEFAULT '' COMMENT '交易說明 1',
  `trade_desc` text COMMENT '交易說明 1',
  `spending` varchar(255) DEFAULT '' COMMENT '支出',
  `deposit` varchar(255) DEFAULT '' COMMENT '存入',
  `balance` varchar(255) DEFAULT '' COMMENT '现有结余',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4402 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dbs_are
-- ----------------------------
DROP TABLE IF EXISTS `dbs_are`;
CREATE TABLE `dbs_are` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `send_json` text COMMENT '发送报文',
  `reception_json` longtext COMMENT '接收报文',
  `msgid` varchar(40) DEFAULT '' COMMENT '消息ID 唯一标识',
  `orgid` varchar(12) DEFAULT '' COMMENT '公司在星展的标识',
  `timestamps` varchar(30) DEFAULT '' COMMENT '发送数据时间',
  `ctry` varchar(5) DEFAULT '' COMMENT '国家标识',
  `accountno` varchar(45) DEFAULT '' COMMENT '交易的帐户号',
  `accountccy` varchar(5) DEFAULT '' COMMENT '查询货币类型,MCA查询所有货币,也可以指定货币',
  `fromdate` varchar(50) DEFAULT '' COMMENT '查询起始日期',
  `toDate` varchar(50) DEFAULT '' COMMENT '查询终止日期',
  `txnStatus` varchar(255) DEFAULT NULL COMMENT '接口返回数据状态RJCT错误',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `msgid` (`msgid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129327 DEFAULT CHARSET=utf8 COMMENT='星展银行ARE数据';

-- ----------------------------
-- Table structure for dbs_are_details
-- ----------------------------
DROP TABLE IF EXISTS `dbs_are_details`;
CREATE TABLE `dbs_are_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `drcrInd` varchar(255) DEFAULT NULL,
  `txnCode` varchar(255) DEFAULT NULL,
  `txnDesc` varchar(255) DEFAULT NULL,
  `txnDate` varchar(255) DEFAULT NULL,
  `valueDate` varchar(255) DEFAULT NULL,
  `txnCcy` varchar(255) DEFAULT NULL,
  `txnAmount` varchar(255) DEFAULT NULL,
  `txnDescplit` varchar(255) DEFAULT NULL,
  `firstfield` varchar(255) DEFAULT NULL,
  `secondfield` varchar(255) DEFAULT NULL,
  `thirdfield` varchar(255) DEFAULT NULL,
  `fourfield` varchar(255) DEFAULT NULL,
  `rowkey` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field` (`secondfield`,`thirdfield`) USING BTREE,
  KEY `rowkey` (`rowkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142240 DEFAULT CHARSET=utf8mb4 COMMENT='DBS ARE 入金详细接口数据';

-- ----------------------------
-- Table structure for dbs_are_gpp_details
-- ----------------------------
DROP TABLE IF EXISTS `dbs_are_gpp_details`;
CREATE TABLE `dbs_are_gpp_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `drcrInd` varchar(255) DEFAULT NULL,
  `txnCode` varchar(255) DEFAULT NULL,
  `txnDesc` varchar(255) DEFAULT NULL,
  `txnDate` varchar(255) DEFAULT NULL,
  `valueDate` varchar(255) DEFAULT NULL,
  `txnCcy` varchar(255) DEFAULT NULL,
  `txnAmount` varchar(255) DEFAULT NULL,
  `txnDescplit` varchar(255) DEFAULT NULL,
  `firstfield` varchar(255) DEFAULT NULL,
  `secondfield` varchar(255) DEFAULT NULL,
  `thirdfield` varchar(255) DEFAULT NULL,
  `fourfield` varchar(255) DEFAULT NULL,
  `rowkey` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field` (`secondfield`,`thirdfield`) USING BTREE,
  KEY `rowkey` (`rowkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=231248 DEFAULT CHARSET=utf8mb4 COMMENT='DBS ARE 出金账户详细流水数据';

-- ----------------------------
-- Table structure for dbs_check_edda
-- ----------------------------
DROP TABLE IF EXISTS `dbs_check_edda`;
CREATE TABLE `dbs_check_edda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `send_json` text COMMENT '发送报文',
  `reception_json` text COMMENT '银行返回报文',
  `enqstatus` varchar(255) DEFAULT NULL COMMENT '接口状态',
  `txnstatus` varchar(255) DEFAULT NULL COMMENT '签约状态ACCP(Pending), ACCT(Successful), RJCT(Rejected)',
  `msgid` varchar(255) DEFAULT NULL COMMENT '对应ACK1表的msgid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94620 DEFAULT CHARSET=utf8mb4 COMMENT='查询EDDA签订协议状态';

-- ----------------------------
-- Table structure for dbs_edda_ack_one
-- ----------------------------
DROP TABLE IF EXISTS `dbs_edda_ack_one`;
CREATE TABLE `dbs_edda_ack_one` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `send_json` text COMMENT '发送报文',
  `reception_json` text COMMENT '接收报文',
  `msgid` varchar(40) DEFAULT '' COMMENT '消息ID 唯一标识',
  `ddaref` varchar(45) DEFAULT '' COMMENT '指定的唯一标识符',
  `orgid` varchar(12) DEFAULT '' COMMENT '公司在星展的标识',
  `mandateid` varchar(255) DEFAULT '' COMMENT '银行返回的描述',
  `debtor_name` varchar(140) DEFAULT '' COMMENT '客户姓名',
  `bankid` varchar(100) DEFAULT '' COMMENT '客户银行编码',
  `txnstatus` varchar(255) DEFAULT '' COMMENT '银行返回的状态码',
  `timestamps` varchar(30) DEFAULT '' COMMENT '发送数据时间',
  `ctry` varchar(5) DEFAULT '' COMMENT '国家标识',
  `txntype` varchar(3) DEFAULT '' COMMENT '交易类型 DDA',
  `mandatetype` varchar(5) DEFAULT '' COMMENT '授权的类型 DDMP/DDMU',
  `seqtype` varchar(5) DEFAULT '' COMMENT '基础事务序列标识 RCUR(复发的)/OOFF(一次性)',
  `frqcytype` varchar(5) DEFAULT '' COMMENT '频率类型 YEAR – Annual\r\nMNTH – Monthly\r\nQURT – Quarterly\r\nMIAN – Semi Annual\r\nWEEK – Weekly\r\nDAIL – Daily\r\nADHO – Adhoc (If Adhoc is used, \r\n“CountPerPeriod” should be 1)\r\nFRTN – Fortnightly',
  `countperperiod` varchar(10) DEFAULT '' COMMENT '指定期间要创建和处理的指令数',
  `effdate` varchar(20) DEFAULT '' COMMENT '协议起始日期',
  `expdate` varchar(20) DEFAULT '' COMMENT '协议终止日期',
  `collamt` varchar(10) DEFAULT '' COMMENT '平均每次转多少钱',
  `collamtccy` varchar(3) DEFAULT '' COMMENT '币种',
  `maxamt` varchar(10) DEFAULT '' COMMENT '收集的最大金额,collAmt与maxAmt只能留一个',
  `maxamtccy` varchar(3) DEFAULT '' COMMENT '币种',
  `reason` varchar(10) DEFAULT '' COMMENT '协议设置原因 NWSTUP - New eDDA',
  `creditor_names` varchar(255) DEFAULT '' COMMENT '尊嘉账户名称',
  `accountno` varchar(255) DEFAULT '' COMMENT '尊嘉账户',
  `accountccy` varchar(255) DEFAULT '' COMMENT '尊嘉币种',
  `proxytype` varchar(2) DEFAULT '' COMMENT '类型：B',
  `proxyvalue` varchar(34) DEFAULT '' COMMENT '客户账号',
  `ultimatename` varchar(255) DEFAULT '' COMMENT '债务人名称',
  `corpcustomerid` varchar(35) DEFAULT '' COMMENT '机构号',
  `corpcustomeridtype` varchar(255) DEFAULT '' COMMENT '机构号类型 COID/CINC',
  `prvtcustomerid` varchar(35) DEFAULT '' COMMENT '身份证号',
  `prvtcustomeridtype` varchar(255) DEFAULT '' COMMENT 'CCPT护照，NIDN 香港身份证号',
  `txnrefid` varchar(255) DEFAULT '' COMMENT '银行返回的ID类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `msgid` (`msgid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20129 DEFAULT CHARSET=utf8 COMMENT='EDDA ACK1';

-- ----------------------------
-- Table structure for dbs_edda_ack_two
-- ----------------------------
DROP TABLE IF EXISTS `dbs_edda_ack_two`;
CREATE TABLE `dbs_edda_ack_two` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reception_json` longtext COMMENT '接收报文',
  `mandateId` varchar(255) DEFAULT '',
  `ddaRef` varchar(255) DEFAULT '',
  `txnStatus` varchar(255) DEFAULT NULL COMMENT '绑定状态',
  `msgId` varchar(255) DEFAULT NULL COMMENT '唯一ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ddref` (`ddaRef`) USING BTREE,
  KEY `idx_msgId` (`msgId`)
) ENGINE=InnoDB AUTO_INCREMENT=20075 DEFAULT CHARSET=utf8 COMMENT='DBS EDDA ACK2';

-- ----------------------------
-- Table structure for dbs_fps
-- ----------------------------
DROP TABLE IF EXISTS `dbs_fps`;
CREATE TABLE `dbs_fps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `send_json` text COMMENT '发送的数据',
  `reception_json` text COMMENT '接收数据',
  `receivingname` varchar(255) DEFAULT '' COMMENT '接收人姓名',
  `txnstatus` varchar(10) DEFAULT '' COMMENT '银行返回状态 ACTC成功,ACCT代表认为修改',
  `txnstatusdescription` varchar(255) DEFAULT '' COMMENT '银行返回字段，状态描述',
  `msgId` varchar(255) DEFAULT '' COMMENT '发送msgID唯一的标识',
  `bankreference` varchar(255) DEFAULT '' COMMENT '银行返回字段',
  `orgid` varchar(10) DEFAULT '' COMMENT '公司在星展的标识',
  `timestamps` varchar(50) DEFAULT '' COMMENT '发送数据时间',
  `customerReference` varchar(255) DEFAULT '' COMMENT '唯一标识的数据',
  `txntype` varchar(3) DEFAULT '' COMMENT '交易类型FPS Payments - Value: ‘GPP’FPS Collection - Value: ‘GPC’FPS Payment with addressing: ‘PPP’',
  `txndate` varchar(12) DEFAULT '' COMMENT '交易日期',
  `txnccy` varchar(3) DEFAULT '' COMMENT '结算货币Value: ‘HKD’ and ‘CNY’',
  `txnAmount` varchar(15) DEFAULT '' COMMENT '结算金额',
  `purposeofpayment` varchar(6) DEFAULT '' COMMENT '支付类型\r\n1. CXSALA\r\n2. CXBSNS.\r\n',
  `name` varchar(255) DEFAULT '' COMMENT '发送人姓名',
  `accountno` varchar(34) DEFAULT '' COMMENT '发送人账户',
  `bankid` varchar(3) DEFAULT '' COMMENT '接收人银行',
  `bankctrycode` varchar(2) DEFAULT '' COMMENT '国家代码',
  `addresses` varchar(255) DEFAULT '' COMMENT '接收地址',
  `proxytype` varchar(10) DEFAULT '' COMMENT '代理类型Account Number - Value: ‘B’\r\nMobile number - Value: ‘M’\r\nEmail address - ‘E’\r\nFPS Identifier - ''S''',
  `proxyvalue` varchar(255) DEFAULT '' COMMENT '代理值',
  `email` varchar(255) DEFAULT '' COMMENT '邮件',
  `mode` varchar(10) DEFAULT '' COMMENT '模式',
  `phonenumber` varchar(35) DEFAULT '' COMMENT '发送人手机号',
  `invoicedetails` varchar(255) DEFAULT '' COMMENT '非结构化发票的详细信息。',
  `paymentdetails` varchar(255) DEFAULT '' COMMENT '付款的细节',
  `clientreferences` varchar(255) DEFAULT '' COMMENT '附加信息',
  `txnrefid` varchar(255) DEFAULT '' COMMENT '银行返回字段',
  `txnsettlementamt` varchar(255) DEFAULT '' COMMENT '银行返回字段，验证金额',
  `txnsettlementdt` varchar(255) DEFAULT '' COMMENT '银行返回字段，生效日期',
  `type` varchar(255) DEFAULT '' COMMENT 'collection入金，payment出金',
  `mandateid` varchar(255) DEFAULT '' COMMENT '入金需要的字段',
  `ddaref` varchar(255) DEFAULT '' COMMENT '入金需要的字段',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `msf` (`msgId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=193326 DEFAULT CHARSET=utf8mb4 COMMENT='星展银行的FPS数据';

-- ----------------------------
-- Table structure for dbs_inward
-- ----------------------------
DROP TABLE IF EXISTS `dbs_inward`;
CREATE TABLE `dbs_inward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgId` varchar(35) NOT NULL COMMENT 'unique message id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orgId` varchar(12) NOT NULL COMMENT 'organisation id provided by dbs',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'account credited time',
  `ctry` varchar(4) NOT NULL COMMENT 'account held country',
  `txnType` varchar(30) NOT NULL COMMENT 'transaction code',
  `customerReference` varchar(35) NOT NULL COMMENT 'from request message',
  `txnRefid` varchar(32) NOT NULL COMMENT 'unique transaction reference',
  `txnDate` date NOT NULL COMMENT 'transaction received date',
  `valueDt` date NOT NULL COMMENT 'account credited date',
  `recipientName` varchar(70) DEFAULT '' COMMENT 'recipient account name',
  `accountNo` varchar(34) NOT NULL COMMENT 'recipient account number',
  `virtualAccountNo` varchar(34) DEFAULT '' COMMENT 'virtual account number',
  `virtualAccountName` varchar(34) DEFAULT '' COMMENT 'virtual account name',
  `proxyType` varchar(2) DEFAULT '' COMMENT 'proxy type',
  `ProxyValue` varchar(34) DEFAULT '' COMMENT 'proxy value',
  `txnCcy` varchar(3) NOT NULL COMMENT 'currency code',
  `txnAmt` varchar(32) NOT NULL COMMENT 'transaction settlement amount',
  `Name` varchar(70) DEFAULT '' COMMENT 'sender party name',
  `senderAccountNo` varchar(34) DEFAULT '' COMMENT 'sender account number',
  `senderBankId` varchar(34) DEFAULT '' COMMENT 'sender bank bic',
  `senderBankCode` varchar(34) DEFAULT '' COMMENT 'sender bank local clearing code',
  `senderBranchCode` varchar(34) DEFAULT '' COMMENT 'sender branch code',
  `paymentDetails` varchar(140) DEFAULT '' COMMENT 'details of payment',
  `addtlInf` varchar(520) DEFAULT '' COMMENT 'additional details',
  `purposeCode` varchar(20) DEFAULT '' COMMENT 'purpose code',
  `status` varchar(4) DEFAULT '' COMMENT '0代表已经扣除手续费;1代表未扣除手续费;2代表Are补的数据;3忽略数据(不确定性)',
  PRIMARY KEY (`id`,`txnAmt`) USING BTREE,
  KEY `IDX_UpdateTime` (`update_time`),
  KEY `idx_txntype_status` (`txnType`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73563 DEFAULT CHARSET=utf8 COMMENT='dbs inward records';

-- ----------------------------
-- Table structure for dbs_log
-- ----------------------------
DROP TABLE IF EXISTS `dbs_log`;
CREATE TABLE `dbs_log` (
  `local_id` varchar(255) NOT NULL COMMENT '唯一id',
  `request_body` varchar(5000) DEFAULT NULL COMMENT '请求报文',
  `response_body` varchar(5000) DEFAULT NULL COMMENT '响应报文',
  `status` int(11) DEFAULT '0' COMMENT '发送消息队列状态 0未发送 1已发送 2错误处理 3忽略错误',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`local_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for dbs_real
-- ----------------------------
DROP TABLE IF EXISTS `dbs_real`;
CREATE TABLE `dbs_real` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `transaction_date` varchar(20) NOT NULL COMMENT '交易日期',
  `cr_id` varchar(11) NOT NULL COMMENT '对应dbs表中的id',
  `chgs_id` varchar(11) NOT NULL COMMENT '对应dbs表中的id',
  `transaction_no` varchar(32) NOT NULL COMMENT '交易参考标号',
  `customer_no` varchar(32) NOT NULL COMMENT '客户参考号',
  `account_no` varchar(32) NOT NULL COMMENT '账户号',
  `name_address` varchar(255) NOT NULL COMMENT '姓名地址',
  `transfer_money` varchar(50) NOT NULL COMMENT '存入',
  `fee` varchar(50) NOT NULL COMMENT '费用',
  `real_money_recieved` varchar(50) NOT NULL COMMENT '实际收到',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2053 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for dbs_va_message
-- ----------------------------
DROP TABLE IF EXISTS `dbs_va_message`;
CREATE TABLE `dbs_va_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgId` varchar(35) NOT NULL DEFAULT '' COMMENT 'messageid',
  `accountNo` varchar(16) NOT NULL DEFAULT '' COMMENT 'account number',
  `accountName` varchar(80) NOT NULL DEFAULT '' COMMENT 'account name',
  `vaNo` varchar(64) NOT NULL DEFAULT '' COMMENT 'virtual account number',
  `request` text NOT NULL COMMENT 'request by junior',
  `response` text NOT NULL COMMENT 'response from dbs',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3156 DEFAULT CHARSET=utf8 COMMENT='dbs virtual account creation and deletion';

-- ----------------------------
-- Table structure for fts
-- ----------------------------
DROP TABLE IF EXISTS `fts`;
CREATE TABLE `fts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SeqNo` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  `AcctNo` varchar(255) DEFAULT NULL COMMENT '账户号',
  `TradingTime` varchar(255) DEFAULT NULL COMMENT '交易日期',
  `StartAccrualTime` varchar(255) DEFAULT NULL COMMENT '起息日期',
  `Cur` varchar(255) DEFAULT NULL COMMENT '币种',
  `Amount` decimal(20,2) DEFAULT NULL COMMENT '交易金额',
  `DebitDirection` varchar(255) DEFAULT NULL COMMENT '借贷方向 C为入金 D为出金',
  `AccountBalance` decimal(20,2) DEFAULT NULL COMMENT '账户余额',
  `ReciprocalAccount` varchar(255) DEFAULT NULL COMMENT '对方账户',
  `ReciprocalAccountName` varchar(255) DEFAULT NULL COMMENT '对方账户名称',
  `ReciprocalAccountBank` varchar(255) DEFAULT NULL COMMENT '对方开户银行',
  `ReciprocalAccountAddress` varchar(255) DEFAULT NULL COMMENT '对方开户地',
  `ReciprocalCompany` varchar(255) DEFAULT NULL COMMENT '对方公司',
  `TransferBank` varchar(255) DEFAULT NULL COMMENT '中转银行',
  `ClearingForm` varchar(255) DEFAULT NULL COMMENT '结算方式',
  `ProofType` varchar(255) DEFAULT NULL COMMENT '凭证类型',
  `ProofNum` varchar(255) DEFAULT NULL COMMENT '凭证号',
  `BankCharges` decimal(20,2) DEFAULT NULL COMMENT '银行手续费',
  `Particulars` varchar(255) DEFAULT NULL COMMENT '摘要',
  `Purpose` varchar(255) DEFAULT NULL COMMENT '用途',
  `Postscript` varchar(255) DEFAULT NULL COMMENT '附言',
  `Standby` varchar(255) DEFAULT NULL COMMENT '备用',
  `Finality` varchar(255) DEFAULT NULL COMMENT '终结符号',
  `OriginalBody` longtext COMMENT '原始报文',
  `IsVerify` int(11) DEFAULT '0' COMMENT '是否匹配成功 0 未成功 1 成功',
  `Create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '该条数据插入时间',
  `Update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '该条数据最后一次修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `seq_no` (`SeqNo`) USING BTREE,
  KEY `acc_no` (`AcctNo`) USING BTREE,
  KEY `postscript` (`Postscript`) USING BTREE,
  KEY `IDX_CreateTime` (`Create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1924838 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gold_out_list
-- ----------------------------
DROP TABLE IF EXISTS `gold_out_list`;
CREATE TABLE `gold_out_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL COMMENT '用户姓名',
  `PhoneNumber` varchar(255) NOT NULL COMMENT '电话',
  `platNo` varchar(255) NOT NULL COMMENT '资金账号',
  `amount` decimal(20,2) NOT NULL COMMENT '出金金额',
  `amountTo` decimal(20,2) NOT NULL COMMENT '应转账金额',
  `Cur` varchar(255) NOT NULL COMMENT '币种',
  `bankName` varchar(500) NOT NULL COMMENT '收款银行',
  `accountName` varchar(255) NOT NULL COMMENT '账户名称',
  `bankCode` varchar(10) NOT NULL COMMENT ' 银行代码',
  `account` varchar(255) NOT NULL COMMENT '银行账户',
  `outDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '账户扣款日期',
  `desc` varchar(500) DEFAULT NULL COMMENT '备注',
  `desc1` varchar(500) DEFAULT NULL COMMENT '备注1',
  `status` int(11) DEFAULT '0' COMMENT '0：表示初始化, 1: 待出金, 2:成功出金，3：出金失败,4：待检查',
  `Create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '该条数据插入时间',
  `Update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '该条数据最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for icbc
-- ----------------------------
DROP TABLE IF EXISTS `icbc`;
CREATE TABLE `icbc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trade_date` varchar(255) DEFAULT NULL COMMENT '交易时间',
  `pay_date` varchar(255) DEFAULT NULL COMMENT '起息日期',
  `business_type` varchar(255) DEFAULT NULL COMMENT '业务类型',
  `income_amount` varchar(255) DEFAULT NULL COMMENT '收入金额',
  `spending_amount` varchar(255) DEFAULT NULL COMMENT '支出金额',
  `balance` varchar(255) DEFAULT NULL COMMENT '余额',
  `account` varchar(255) DEFAULT NULL COMMENT '对方账号',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `trade_place` varchar(255) DEFAULT NULL COMMENT '交易场所',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '截图图片名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1906 DEFAULT CHARSET=utf8 COMMENT='工商银行数据';

-- ----------------------------
-- Table structure for icbc_refine
-- ----------------------------
DROP TABLE IF EXISTS `icbc_refine`;
CREATE TABLE `icbc_refine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trading_day` varchar(255) DEFAULT '' COMMENT '交易日',
  `value_date` varchar(255) DEFAULT '' COMMENT '起息日',
  `trade_type` varchar(255) DEFAULT '' COMMENT '业务类型',
  `summary` varchar(255) DEFAULT '' COMMENT '摘要',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `trade_money` varchar(255) DEFAULT '' COMMENT '收入金額',
  `credit` varchar(255) DEFAULT '' COMMENT '支出金額',
  `balance` varchar(255) DEFAULT '0' COMMENT '余额',
  `number` varchar(255) DEFAULT '' COMMENT '凭证号',
  `account_number` varchar(255) DEFAULT '0' COMMENT '對方賬號',
  `name` varchar(255) DEFAULT '' COMMENT '對方戶名',
  `market` varchar(255) DEFAULT '0' COMMENT '交易場所',
  `running_number` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  `currency` varchar(255) DEFAULT '港币',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3431 DEFAULT CHARSET=utf8 COMMENT='refine上传ICBC(工商)银行数据';

-- ----------------------------
-- Table structure for in_account
-- ----------------------------
DROP TABLE IF EXISTS `in_account`;
CREATE TABLE `in_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` int(11) NOT NULL COMMENT '入账编号',
  `bank_id` varchar(32) NOT NULL COMMENT '银行编号',
  `desc` varchar(255) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bank_name` varchar(32) NOT NULL DEFAULT '' COMMENT '银行名称',
  PRIMARY KEY (`id`),
  KEY `idx_deposit_id` (`deposit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6158 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for remittance_detail
-- ----------------------------
DROP TABLE IF EXISTS `remittance_detail`;
CREATE TABLE `remittance_detail` (
  `transactionAbstract` varchar(255) DEFAULT NULL COMMENT '交易摘要',
  `gatheringAccount` varchar(255) DEFAULT NULL COMMENT '收款账户',
  `payeeNameAndAddress` varchar(255) DEFAULT NULL COMMENT '收款人账户名称及地址',
  `productType` varchar(255) DEFAULT NULL COMMENT '产品类别',
  `bankNumber` varchar(255) DEFAULT NULL COMMENT '银行备考号',
  `accountsData` varchar(255) DEFAULT NULL COMMENT '入账日期',
  `remittanceMoney` varchar(255) DEFAULT NULL COMMENT '汇款金额',
  `contractNum` varchar(255) DEFAULT NULL COMMENT '合约号码',
  `bankBuyingPrice` varchar(255) DEFAULT NULL COMMENT '银行买入价',
  `swiefCode` varchar(255) DEFAULT NULL COMMENT 'SWIFT CODE',
  `remittanceBankName` varchar(255) DEFAULT NULL COMMENT '汇款银行名称',
  `accountsMoney` varchar(255) DEFAULT NULL COMMENT '入账金额',
  `bankServiceCharge` varchar(255) DEFAULT NULL COMMENT '银行手续费',
  `agencyServiceCharge` varchar(255) DEFAULT NULL COMMENT '代理行手续费',
  `effectDate` varchar(255) DEFAULT NULL COMMENT '生效日期',
  `remitterNameAndAddress` varchar(255) DEFAULT NULL COMMENT '汇款人名称及地址',
  `imgName` varchar(255) DEFAULT NULL COMMENT '截图名称',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中银香港入金数据-详情页';

-- ----------------------------
-- Table structure for transfer_boc
-- ----------------------------
DROP TABLE IF EXISTS `transfer_boc`;
CREATE TABLE `transfer_boc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionID` varchar(255) DEFAULT NULL COMMENT '交易编号',
  `fileNumber` varchar(255) DEFAULT NULL COMMENT '档案编号',
  `payeeName` varchar(255) DEFAULT NULL COMMENT '收款人名称',
  `chequeNumber` varchar(255) DEFAULT NULL COMMENT '支票/本票号码',
  `clientNumber` varchar(255) DEFAULT NULL COMMENT '客户备考号',
  `dealType` varchar(255) DEFAULT NULL COMMENT '交易类别',
  `currency` varchar(255) DEFAULT NULL COMMENT '收款/付款货币',
  `asset` varchar(255) DEFAULT NULL COMMENT '收款/付款金额',
  `debitAsset` varchar(255) DEFAULT NULL COMMENT '扣账金额',
  `dealDate` varchar(255) DEFAULT NULL COMMENT '交易日期',
  `dealStatus` varchar(255) DEFAULT NULL COMMENT '交易状态',
  `imgName` varchar(255) DEFAULT NULL COMMENT '截图名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2867 DEFAULT CHARSET=utf8 COMMENT='中银香港出金转速快数据-列表页';

-- ----------------------------
-- Table structure for transfer_boc_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_boc_detail`;
CREATE TABLE `transfer_boc_detail` (
  `transactionID` varchar(255) NOT NULL COMMENT '交易编号',
  `bankNumber` varchar(255) DEFAULT NULL COMMENT '银行备考号',
  `debitAccount` varchar(255) DEFAULT NULL COMMENT '扣账账户',
  `debitAccountName` varchar(255) DEFAULT NULL COMMENT '扣账账户名称',
  `accountCurrency` varchar(255) DEFAULT NULL COMMENT '账户币种',
  `debitCurrency` varchar(255) DEFAULT NULL COMMENT '扣账货币',
  `debitAsset` varchar(255) DEFAULT NULL COMMENT '扣账金额',
  `paymentCuccency` varchar(255) DEFAULT NULL COMMENT '付款货币',
  `paymentAsset` varchar(255) DEFAULT NULL COMMENT '付款金额',
  `effectDate` varchar(255) DEFAULT NULL COMMENT '生效日期',
  `serviceCharge` varchar(255) DEFAULT NULL COMMENT '手续费',
  `debitAccountTwo` varchar(255) DEFAULT NULL COMMENT '扣账账户2',
  `debitAccountCurrency` varchar(255) DEFAULT NULL COMMENT '扣账账户币种',
  `debitAccountNameTwo` varchar(255) DEFAULT NULL COMMENT '扣账账户名称2',
  `payeeAccountType` varchar(255) DEFAULT NULL COMMENT '收款人账户类别',
  `accountNumber` varchar(255) DEFAULT NULL COMMENT '账户号码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `bankNo` varchar(255) DEFAULT NULL COMMENT '银行编号',
  `bankName` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `toPayeeMessage` varchar(255) DEFAULT NULL COMMENT '给收款人的附言',
  `dealDateAndTime` varchar(255) DEFAULT NULL COMMENT '交易日期及时间',
  `fileNumber` varchar(255) DEFAULT NULL COMMENT '档案编号',
  `handlingPersonnel` varchar(255) DEFAULT NULL COMMENT '经办人员',
  `firstAuthorizer` varchar(255) DEFAULT NULL COMMENT '第一授权人',
  `secondAuthorizer` varchar(255) DEFAULT NULL COMMENT '第二授权人',
  `imgName` varchar(255) DEFAULT NULL COMMENT '截图名称',
  PRIMARY KEY (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中银香港出金转速快数据-详情页';

-- ----------------------------
-- Table structure for velo_refine
-- ----------------------------
DROP TABLE IF EXISTS `velo_refine`;
CREATE TABLE `velo_refine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `account_id` varchar(255) DEFAULT NULL COMMENT '账户号',
  `account_nick_name` varchar(255) DEFAULT NULL COMMENT '未知名称',
  `trading_day` varchar(255) DEFAULT NULL COMMENT '交易时间',
  `transaction` varchar(255) DEFAULT NULL COMMENT '交易',
  `summary` varchar(255) DEFAULT NULL COMMENT '交易描述',
  `status` varchar(255) DEFAULT NULL COMMENT '交易状态',
  `trade_money` varchar(255) DEFAULT NULL COMMENT '交易金额',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `balance` varchar(255) DEFAULT NULL COMMENT '余额',
  `running_number` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11627 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for wlb
-- ----------------------------
DROP TABLE IF EXISTS `wlb`;
CREATE TABLE `wlb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealTime` varchar(255) DEFAULT NULL COMMENT '交易时间',
  `companyName` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `account` varchar(255) DEFAULT NULL COMMENT '账户',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `amountPaid` varchar(255) DEFAULT NULL COMMENT '支出金额',
  `credit` varchar(255) DEFAULT NULL COMMENT '收入金额',
  `accountBalance` varchar(255) DEFAULT NULL COMMENT '账户余额',
  `transactionAbstract` varchar(255) DEFAULT NULL COMMENT '交易摘要',
  `imgName` varchar(255) DEFAULT NULL COMMENT '截图名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COMMENT='永隆银行数据';

-- ----------------------------
-- Table structure for wlb_ocr
-- ----------------------------
DROP TABLE IF EXISTS `wlb_ocr`;
CREATE TABLE `wlb_ocr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deposit_id` int(11) NOT NULL COMMENT '后台id',
  `path` varchar(500) DEFAULT NULL COMMENT '到账凭证路径',
  `ocr_text` longtext COMMENT 'ocr识别内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for wlb_refine
-- ----------------------------
DROP TABLE IF EXISTS `wlb_refine`;
CREATE TABLE `wlb_refine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trading_day` varchar(255) DEFAULT '' COMMENT '交易日',
  `company_name` varchar(255) DEFAULT '' COMMENT '公司名称',
  `account` varchar(255) DEFAULT '' COMMENT '账号',
  `currency` varchar(255) DEFAULT '' COMMENT '币种',
  `credit` varchar(255) DEFAULT '' COMMENT '支出金额',
  `trade_money` varchar(255) DEFAULT '' COMMENT '收入金额',
  `balance` varchar(255) DEFAULT '' COMMENT '账户余额',
  `summary` varchar(255) DEFAULT '' COMMENT '交易摘要',
  `running_number` varchar(255) DEFAULT '' COMMENT '交易流水号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='refine上传WLB银行数据';

SET FOREIGN_KEY_CHECKS = 1;
