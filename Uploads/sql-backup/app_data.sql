/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : app_data

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:12:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_portion
-- ----------------------------
DROP TABLE IF EXISTS `account_portion`;
CREATE TABLE `account_portion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `process_date` date DEFAULT NULL,
  `account_id` varchar(16) DEFAULT NULL,
  `net_asset` decimal(30,10) DEFAULT NULL COMMENT '净资产',
  `currency` tinyint(4) DEFAULT NULL COMMENT '1代表CNY;2代表HKD;4代表USD',
  `in` decimal(30,10) NOT NULL DEFAULT '0.0000000000' COMMENT '净入金额',
  `out` decimal(30,10) NOT NULL DEFAULT '0.0000000000' COMMENT '净出金额',
  `net_in_amount` decimal(30,10) DEFAULT NULL COMMENT '出入净额，包括出入金和出入股票',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ix_process_date` (`process_date`) USING BTREE,
  KEY `ix_account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51063507 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for account_profit_ratio
-- ----------------------------
DROP TABLE IF EXISTS `account_profit_ratio`;
CREATE TABLE `account_profit_ratio` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `process_date` date DEFAULT NULL,
  `account_id` varchar(16) DEFAULT NULL,
  `currency` tinyint(4) DEFAULT NULL COMMENT '1代表CNY;2代表HKD;4代表USD',
  `share` decimal(50,10) DEFAULT NULL COMMENT '份额',
  `net_asset` decimal(50,10) DEFAULT NULL COMMENT '资产净值',
  `nav` varchar(128) DEFAULT NULL COMMENT '单位净值',
  `chg` double DEFAULT NULL COMMENT '涨跌幅',
  `net_in` decimal(50,10) DEFAULT NULL COMMENT '净入金额',
  `net_in_share` decimal(50,10) DEFAULT NULL COMMENT '净入份额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`process_date`,`currency`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26249650 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for account_share_profit
-- ----------------------------
DROP TABLE IF EXISTS `account_share_profit`;
CREATE TABLE `account_share_profit` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(16) NOT NULL DEFAULT '' COMMENT '资金账号',
  `process_date` date NOT NULL COMMENT '结算日期',
  `market_id` int(11) NOT NULL COMMENT '1:HK;2:US;4:SH;8:SZ;16:US',
  `currency` tinyint(4) NOT NULL DEFAULT '1' COMMENT '币种',
  `product_id` varchar(32) NOT NULL DEFAULT '' COMMENT '股票代码',
  `product_description` varchar(256) NOT NULL DEFAULT '' COMMENT '股票名称',
  `profit` double NOT NULL DEFAULT '0' COMMENT '盈亏金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `curreny` (`account_id`,`currency`) USING BTREE,
  KEY `process_date` (`process_date`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27985402 DEFAULT CHARSET=utf8 COMMENT='个股盈亏金额表';

-- ----------------------------
-- Table structure for hk_bills
-- ----------------------------
DROP TABLE IF EXISTS `hk_bills`;
CREATE TABLE `hk_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `rowkey` varchar(64) NOT NULL,
  `code` varchar(16) NOT NULL,
  `bill_type` varchar(16) NOT NULL,
  `bill_date` varchar(16) NOT NULL,
  `png_location` varchar(255) NOT NULL,
  `pdf_location` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_confirm` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_code_billdate` (`code`,`bill_date`) USING BTREE,
  KEY `ix_code_billtype_billdate` (`code`,`bill_type`,`bill_date`),
  KEY `ix_code_billuptime` (`update_time`),
  KEY `ix_billtype_billdate_uptime` (`bill_type`,`bill_date`,`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6002904 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for procedure_clean_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_clean_data`;
delimiter ;;
CREATE PROCEDURE `procedure_clean_data`(in source_table varchar(50), in col varchar(50), in time_threshold_day int)
BEGIN
    declare time_threshold datetime default Date_SUB(curdate(),interval time_threshold_day day);
    set @sqlStr_query = concat("select count(*) into @value from ", source_table, " where ", col," < '", time_threshold,"'");
	prepare stmt from @sqlStr_query;
    execute stmt;
    
	set @sqlStr_del = concat("delete from ", source_table, " where ", col," < '", time_threshold,"'");

    prepare stmt from @sqlStr_del;
    execute stmt;
    
    insert into table_data_clear_log values(null,source_table, now(), @value, @sqlStr_del);
    
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_migrate_news
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_migrate_news`;
delimiter ;;
CREATE PROCEDURE `procedure_migrate_news`(in source_table varchar(50), in target_table varchar(50))
BEGIN
	declare str_info_type varchar(500) default '1,2,3,4,5,6,7,8,9,101,102,103,19,41,42,';
    declare sql_where varchar(1000);
	declare time_threshold datetime default Date_SUB(curdate(),interval 120 day);
    declare fromId int default 0;
    declare toId int;
    declare news_fromTime datetime;
    declare news_toTime datetime;
    declare count int;
    declare task_beginTime datetime;
    declare task_endTime datetime;
    
    declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
    
	while(locate(',', str_info_type) > 0)
    do
    set @info_type = substring(str_info_type, 1, locate(',',str_info_type) - 1);
    set str_info_type = SUBSTRING(str_info_type, LOCATE(',', str_info_type) + 1);
    
    case when @info_type < 7 then 
			set time_threshold = Date_SUB(curdate(),interval 60 day); 
		when @info_type = 7 or @info_type = 8 then
			set time_threshold = Date_SUB(curdate(),interval 120 day);
		when @info_type >= 9 and @info_typ <=100 then
			set time_threshold = Date_SUB(curdate(),interval 60 day);
		when  @info_typ >100 then
			set time_threshold = Date_SUB(curdate(),interval 30 day);
    end case;
    
	set sql_where = concat("update_time < '",time_threshold,"' and info_type= ",@info_type);

    
    set @sqlstr = concat('select min(id) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set fromId = @value;
    
    
	set @sqlstr = concat('select max(id) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set toId = @value;
    
    
	set @sqlstr = concat('select min(update_time) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set news_fromTime = @value;
    
	
	set @sqlstr = concat('select max(update_time) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set news_toTime = @value;
    
	
	set @sqlstr = concat('select count(id) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set count = @value;
    
    if count > 0 then
		start transaction;
        
    	set task_beginTime = Now();
		set @sqlstr = concat('insert into ',target_table, ' select * from ', source_table, ' where ', sql_where, ';');
		prepare stmt from @sqlstr;
		execute stmt;
        
        set @sqlstr = concat('DELETE FROM ', source_table,' WHERE ', sql_where, ';');
        prepare stmt from @sqlstr;
		execute stmt;
        select @sqlstr;
        
		set task_endTime = Now();
	    insert into news_migration_log values(null,time_threshold,fromId,toId,news_fromTime,news_toTime,count,@info_type,task_beginTime,task_endTime,source_table,target_table);

        if err = 1 then
			rollback;
		else
			commit;
		end if;
	end if;
    
    END while;
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_migrate_relatednews
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_migrate_relatednews`;
delimiter ;;
CREATE PROCEDURE `procedure_migrate_relatednews`(in source_table varchar(50), in target_table varchar(50))
BEGIN	
    declare sql_where varchar(1000);
	declare time_threshold datetime default Date_SUB(curdate(),interval 15 day);
    declare fromId int default 0;
    declare toId int;
    declare news_fromTime datetime;
    declare news_toTime datetime;
    declare count int;
    declare task_beginTime datetime;
    declare task_endTime datetime;
    
    declare err tinyint default 0;
    declare continue handler for sqlexception set err=1; 
        
    
	set time_threshold = Date_SUB(curdate(),interval 15 day);
	
    
	set sql_where = concat("update_time < '",time_threshold, "'");

    
    set @sqlstr = concat('select min(id) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set fromId = @value;
    
    
	set @sqlstr = concat('select max(id) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set toId = @value;
    
    
	set @sqlstr = concat('select min(update_time) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set news_fromTime = @value;
    
	
	set @sqlstr = concat('select max(update_time) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set news_toTime = @value;
    
	
	set @sqlstr = concat('select count(id) into @value from ', source_table, ' where ', sql_where, ';');
	prepare stmt from @sqlstr;
    execute stmt;
	set count = @value;
    
    if count > 0 then
		start transaction;
        
    	set task_beginTime = Now();
		set @sqlstr = concat('insert into ',target_table, ' select * from ', source_table, ' where ', sql_where, ';');
		prepare stmt from @sqlstr;
		execute stmt;
        select @sqlstr;
        
        set @sqlstr = concat('DELETE FROM ', source_table,' WHERE ', sql_where, ';');
        prepare stmt from @sqlstr;
		execute stmt;
        select @sqlstr;
        
		set task_endTime = Now();
	    insert into news_migration_log values(null,time_threshold,fromId,toId,news_fromTime,news_toTime,count,1,task_beginTime,task_endTime,source_table,target_table);

        if err = 1 then
			rollback;
		else
			commit;
		end if;
	end if;  
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for pt
-- ----------------------------
DROP PROCEDURE IF EXISTS `pt`;
delimiter ;;
CREATE PROCEDURE `pt`()
begin
select count(*) from stock_info;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for pt0
-- ----------------------------
DROP PROCEDURE IF EXISTS `pt0`;
delimiter ;;
CREATE PROCEDURE `pt0`(in num int)
begin
select * from tag_index limit num;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
