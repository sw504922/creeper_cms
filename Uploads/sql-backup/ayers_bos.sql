/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : ayers_bos

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:12:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for trans_cacc_cash_in
-- ----------------------------
DROP TABLE IF EXISTS `trans_cacc_cash_in`;
CREATE TABLE `trans_cacc_cash_in` (
  `TRAN_ID` varchar(100) NOT NULL,
  `BUSS_DATE` varchar(100) NOT NULL,
  `TRAN_DATE` varchar(100) NOT NULL,
  `VALUE_DATE` varchar(100) NOT NULL,
  `AVAIL_DATE` varchar(100) NOT NULL,
  `CLIENT_ACC_ID` varchar(100) NOT NULL,
  `CCY` varchar(4) NOT NULL,
  `AMOUNT` varchar(100) NOT NULL DEFAULT '0',
  `STATUS` varchar(10) NOT NULL,
  `CASH_TRAN_TYPE` varchar(100) NOT NULL,
  `DEPOSIT_BANK_ACC_ID` varchar(100) NOT NULL,
  `REMARK` text,
  `CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  `CANCEL_TIME` varchar(100) DEFAULT NULL,
  `CANCEL_USER` varchar(100) DEFAULT NULL,
  `OLD_TRAN_ID` varchar(100) DEFAULT NULL,
  `CREATE_TIME` varchar(100) DEFAULT NULL,
  `CREATE_USER` varchar(100) DEFAULT NULL,
  `CONFIRM_TIME` varchar(100) DEFAULT NULL,
  `CONFIRM_USER` varchar(100) DEFAULT NULL,
  `AUTO_GEN_TYPE` varchar(100) DEFAULT NULL,
  `GL_MAPPING_ITEM_ID` varchar(100) DEFAULT NULL,
  `CHEQUE_NO` varchar(20) DEFAULT NULL,
  `AUTO_GEN_TRAN_ID` varchar(100) DEFAULT NULL,
  `CR_GL_MAPPING_ITEM_ID` varchar(100) DEFAULT NULL,
  `TRAN_CODE` varchar(100) DEFAULT NULL,
  `OTHER_NAMES` text,
  `PRODUCT_ID` varchar(100) DEFAULT NULL,
  `FX_TXN` varchar(100) DEFAULT NULL,
  `FX_TXN_TO_CCY` varchar(4) DEFAULT NULL,
  `FX_TXN_RATE` varchar(100) DEFAULT NULL,
  `FX_TXN_TO_AMT` varchar(100) DEFAULT NULL,
  `REQ_CANCEL_TIME` varchar(100) DEFAULT NULL,
  `REQ_CANCEL_USER` varchar(10) DEFAULT NULL,
  `REQ_CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  `FX_TXN_REVERSE_RATE` varchar(10) DEFAULT NULL,
  `CANCEL_REASON` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `third_party` varchar(36) DEFAULT NULL,
  KEY `TRAN_ID` (`TRAN_ID`),
  KEY `idx_CLIENT_ACC_ID` (`CLIENT_ACC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trans_cacc_cash_out
-- ----------------------------
DROP TABLE IF EXISTS `trans_cacc_cash_out`;
CREATE TABLE `trans_cacc_cash_out` (
  `TRAN_ID` varchar(100) NOT NULL,
  `BUSS_DATE` varchar(100) NOT NULL,
  `TRAN_DATE` varchar(100) NOT NULL,
  `VALUE_DATE` varchar(100) NOT NULL,
  `CLIENT_ACC_ID` varchar(100) NOT NULL,
  `CCY` varchar(4) NOT NULL,
  `AMOUNT` varchar(100) NOT NULL DEFAULT '0',
  `STATUS` varchar(10) NOT NULL,
  `CASH_TRAN_TYPE` varchar(100) NOT NULL,
  `PAYMENT_BANK_ACC_ID` varchar(100) NOT NULL,
  `REMARK` text,
  `PAYEE_NAME` varchar(120) DEFAULT NULL,
  `BANK_CODE` varchar(100) DEFAULT NULL,
  `BANK_ACC` varchar(40) DEFAULT NULL,
  `CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  `CANCEL_TIME` varchar(100) DEFAULT NULL,
  `CANCEL_USER` varchar(100) DEFAULT NULL,
  `OLD_TRAN_ID` varchar(100) DEFAULT NULL,
  `CREATE_TIME` varchar(100) DEFAULT NULL,
  `CREATE_USER` varchar(100) DEFAULT NULL,
  `CONFIRM_TIME` varchar(100) DEFAULT NULL,
  `CONFIRM_USER` varchar(100) DEFAULT NULL,
  `AUTO_GEN_TYPE` varchar(100) DEFAULT NULL,
  `GL_MAPPING_ITEM_ID` varchar(100) DEFAULT NULL,
  `CHEQUE_NO` varchar(20) DEFAULT NULL,
  `AUTO_GEN_TRAN_ID` varchar(100) DEFAULT NULL,
  `EXPOSURES` text,
  `DR_GL_MAPPING_ITEM_ID` varchar(100) DEFAULT NULL,
  `TRAN_CODE` varchar(100) DEFAULT NULL,
  `OTHER_NAMES` text,
  `PRODUCT_ID` varchar(100) DEFAULT NULL,
  `FX_TXN` varchar(10) DEFAULT NULL,
  `FX_TXN_FROM_CCY` varchar(4) DEFAULT NULL,
  `FX_TXN_FROM_AMT` varchar(100) DEFAULT NULL,
  `FX_TXN_RATE` varchar(100) DEFAULT NULL,
  `REQ_CANCEL_TIME` varchar(100) DEFAULT NULL,
  `REQ_CANCEL_USER` varchar(10) DEFAULT NULL,
  `REQ_CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  `FX_TXN_REVERSE_RATE` varchar(10) DEFAULT NULL,
  `PAYEE_NAME_PRINT` varchar(120) DEFAULT NULL,
  `print_count` varchar(100) DEFAULT '0',
  `IS_EXPORTED` varchar(10) DEFAULT NULL,
  `CANCEL_REASON` varchar(200) DEFAULT NULL,
  `third_party` varchar(36) DEFAULT NULL,
  KEY `TRAN_ID` (`TRAN_ID`),
  KEY `idx_CLIENT_ACC_ID` (`CLIENT_ACC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trans_cacc_product_in
-- ----------------------------
DROP TABLE IF EXISTS `trans_cacc_product_in`;
CREATE TABLE `trans_cacc_product_in` (
  `TRAN_ID` varchar(100) NOT NULL,
  `BUSS_DATE` varchar(100) NOT NULL,
  `TRAN_DATE` varchar(100) NOT NULL,
  `VALUE_DATE` varchar(100) NOT NULL,
  `AVAIL_DATE` varchar(100) NOT NULL,
  `CLIENT_ACC_ID` varchar(100) NOT NULL,
  `PRODUCT_ID` varchar(100) NOT NULL,
  `CUSTODIAN_ACC_ID` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL,
  `PRODUCT_TRAN_TYPE` varchar(100) DEFAULT NULL,
  `NOMINEE_FLAG` varchar(10) DEFAULT NULL,
  `remark` text,
  `CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  `CANCEL_TIME` varchar(100) DEFAULT NULL,
  `CANCEL_USER` varchar(100) DEFAULT NULL,
  `OLD_TRAN_ID` varchar(100) DEFAULT NULL,
  `CREATE_TIME` varchar(100) DEFAULT NULL,
  `CREATE_USER` varchar(100) DEFAULT NULL,
  `CONFIRM_TIME` varchar(100) DEFAULT NULL,
  `CONFIRM_USER` varchar(100) DEFAULT NULL,
  `AUTO_GEN_TYPE` varchar(100) DEFAULT NULL,
  `AUTO_GEN_TRAN_ID` varchar(100) DEFAULT NULL,
  `CHARGE` varchar(100) DEFAULT '0',
  `AVG_PRICE` varchar(100) DEFAULT '0',
  `OTHER_NAMES` text,
  `REQ_CANCEL_TIME` varchar(100) DEFAULT NULL,
  `REQ_CANCEL_USER` varchar(10) DEFAULT NULL,
  `REQ_CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  KEY `TRAN_ID` (`TRAN_ID`),
  KEY `idx_CLIENT_ACC_ID` (`CLIENT_ACC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for trans_cacc_product_out
-- ----------------------------
DROP TABLE IF EXISTS `trans_cacc_product_out`;
CREATE TABLE `trans_cacc_product_out` (
  `TRAN_ID` varchar(100) NOT NULL,
  `BUSS_DATE` varchar(100) NOT NULL,
  `TRAN_DATE` varchar(100) NOT NULL,
  `VALUE_DATE` varchar(100) NOT NULL,
  `CLIENT_ACC_ID` varchar(100) NOT NULL,
  `PRODUCT_ID` varchar(100) NOT NULL,
  `CUSTODIAN_ACC_ID` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL,
  `PRODUCT_TRAN_TYPE` varchar(100) DEFAULT NULL,
  `NOMINEE_FLAG` varchar(10) DEFAULT NULL,
  `remark` text,
  `CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  `CANCEL_TIME` varchar(100) DEFAULT NULL,
  `CANCEL_USER` varchar(100) DEFAULT NULL,
  `OLD_TRAN_ID` varchar(100) DEFAULT NULL,
  `CREATE_TIME` varchar(100) DEFAULT NULL,
  `CREATE_USER` varchar(100) DEFAULT NULL,
  `CONFIRM_TIME` varchar(100) DEFAULT NULL,
  `CONFIRM_USER` varchar(100) DEFAULT NULL,
  `AUTO_GEN_TYPE` varchar(100) DEFAULT NULL,
  `AUTO_GEN_TRAN_ID` varchar(100) DEFAULT NULL,
  `CHARGE` varchar(100) DEFAULT '0',
  `OTHER_NAMES` text,
  `AVG_PRICE` varchar(100) DEFAULT '0',
  `REQ_CANCEL_TIME` varchar(100) DEFAULT NULL,
  `REQ_CANCEL_USER` varchar(10) DEFAULT NULL,
  `REQ_CANCEL_BUSS_DATE` varchar(100) DEFAULT NULL,
  KEY `TRAN_ID` (`TRAN_ID`),
  KEY `idx_CLIENT_ACC_ID` (`CLIENT_ACC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
