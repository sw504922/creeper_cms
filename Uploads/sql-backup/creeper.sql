/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.2.171
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.2.171:13306
 Source Schema         : creeper

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/05/2022 15:13:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dispatcher_stat
-- ----------------------------
DROP TABLE IF EXISTS `dispatcher_stat`;
CREATE TABLE `dispatcher_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dispatcher_id` varchar(30) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '-10:因为超时而丢弃 -5:重新放入schedule -4:从pq中取数量 -3:重新放进mq -2:fetcher拒绝 -1：fetcher成功接收 1:DEBUG 2:WARN 3:INFO 4:ERROR',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `job_id` (`job_id`),
  KEY `dispatcher_id` (`dispatcher_id`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=148534837 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fetcher
-- ----------------------------
DROP TABLE IF EXISTS `fetcher`;
CREATE TABLE `fetcher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fetcher_id` int(11) NOT NULL DEFAULT '0',
  `fetcher_name` varchar(100) NOT NULL DEFAULT '',
  `comment` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_fetcher_fetcher_id` (`fetcher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for fetcher_deployment
-- ----------------------------
DROP TABLE IF EXISTS `fetcher_deployment`;
CREATE TABLE `fetcher_deployment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `host` varchar(30) NOT NULL,
  `port` varchar(50) NOT NULL,
  `shard_id` varchar(50) NOT NULL,
  `replica_id` varchar(50) NOT NULL,
  `fetch_route` varchar(50) NOT NULL COMMENT '对应zk_path',
  `rabbitmq` varchar(50) NOT NULL COMMENT '对应下游的mq_name',
  `fetcher_comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='fetcher的日志表';

-- ----------------------------
-- Table structure for fetcher_stat
-- ----------------------------
DROP TABLE IF EXISTS `fetcher_stat`;
CREATE TABLE `fetcher_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `host_port` varchar(30) NOT NULL,
  `fetcher_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `job_id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `stat_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计此时间到入库时间内的日志信息',
  `success` int(11) NOT NULL,
  `failed` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '0：正常 1：已删除',
  PRIMARY KEY (`id`),
  KEY `jod_id` (`job_id`),
  KEY `success` (`success`),
  KEY `faild` (`failed`)
) ENGINE=InnoDB AUTO_INCREMENT=23444660 DEFAULT CHARSET=utf8 COMMENT='fetcher的日志表';

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT ' ',
  `group_id` int(11) NOT NULL DEFAULT '-1' COMMENT ' ',
  `group_name` varchar(30) NOT NULL DEFAULT '' COMMENT ' ',
  `max_priority` int(11) NOT NULL DEFAULT '1' COMMENT ' ',
  `description` text NOT NULL COMMENT ' ',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_groups_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for handler_deployment
-- ----------------------------
DROP TABLE IF EXISTS `handler_deployment`;
CREATE TABLE `handler_deployment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `host` varchar(30) NOT NULL,
  `shard_id` varchar(50) NOT NULL,
  `replica_id` varchar(50) NOT NULL,
  `fetcher_mq` varchar(50) NOT NULL COMMENT '上接fetcher的mq',
  `handler_comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='fetcher的日志表';

-- ----------------------------
-- Table structure for handler_exception
-- ----------------------------
DROP TABLE IF EXISTS `handler_exception`;
CREATE TABLE `handler_exception` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `job_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `scheduler_doc` longblob NOT NULL,
  `html` text NOT NULL,
  `exception` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id_url` (`job_id`,`url`(255))
) ENGINE=InnoDB AUTO_INCREMENT=743168 DEFAULT CHARSET=utf8 COMMENT='fetcher的日志表';

-- ----------------------------
-- Table structure for handler_stat
-- ----------------------------
DROP TABLE IF EXISTS `handler_stat`;
CREATE TABLE `handler_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `host_port` varchar(30) NOT NULL COMMENT '线下线上_IP_shard_replica',
  `job_id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `stat_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计此时间与入库时间段内的日志情况',
  `total` int(11) NOT NULL COMMENT '一小时内任务解析的总页面数',
  `failed` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=255337 DEFAULT CHARSET=utf8 COMMENT='handler的日志表';

-- ----------------------------
-- Table structure for handler_urls_stat
-- ----------------------------
DROP TABLE IF EXISTS `handler_urls_stat`;
CREATE TABLE `handler_urls_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增字段',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '入库时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '入库时间',
  `host_port` varchar(100) NOT NULL COMMENT '相关机器',
  `job_id` int(11) NOT NULL COMMENT '相关job',
  `job_name` varchar(100) NOT NULL COMMENT '相关job_name',
  `stat_hour` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计时间',
  `total_urls` int(11) NOT NULL COMMENT '统计数据',
  PRIMARY KEY (`id`),
  KEY `host_port` (`host_port`,`job_id`,`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新url生成数表';

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '1' COMMENT '0:新任务 1:处理中 2:完成 3:取消 4:修改优先级 5:待修改 6:删除pq中此job数据 7:定时任务',
  `sid` int(11) DEFAULT '0',
  `job_name` varchar(1000) CHARACTER SET utf8 NOT NULL COMMENT '总表id',
  `fetcher_id` int(11) DEFAULT '2',
  `fetcher_route` varchar(30) DEFAULT NULL,
  `queue_name` varchar(30) DEFAULT NULL,
  `timeout` int(11) DEFAULT '50',
  `need_proxy` tinyint(4) DEFAULT '0',
  `crawl_repeat` tinyint(4) DEFAULT '0',
  `repeat_interval` int(11) DEFAULT '0',
  `urls_file_path` varchar(300) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' ',
  `job_comment` text CHARACTER SET utf8 NOT NULL COMMENT ' ',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT ' ',
  `priority` decimal(10,0) NOT NULL DEFAULT '0' COMMENT ' ',
  `suggest_priority` decimal(10,0) NOT NULL DEFAULT '0' COMMENT ' ',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT ' ',
  `recrawl_depth` int(11) NOT NULL DEFAULT '1' COMMENT ' ',
  `error_retry` int(11) NOT NULL DEFAULT '0' COMMENT ' ',
  `request_time` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00' COMMENT ' ',
  `store_path` varchar(300) NOT NULL DEFAULT '' COMMENT ' ',
  `scheduler_id` int(11) NOT NULL DEFAULT '0',
  `handler_id` int(11) NOT NULL DEFAULT '0' COMMENT ' ',
  `cookies` varchar(2048) NOT NULL DEFAULT '' COMMENT ' ',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `last_crawl_at` timestamp NULL DEFAULT '2014-01-01 00:00:00',
  `handler_conf` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'handler配置文件名字',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '单位：分钟',
  `is_period` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否分期0：否1：是',
  `period_num` int(11) DEFAULT '0' COMMENT '分期数',
  `period_interval` int(11) DEFAULT '0' COMMENT '分期间隔（分钟）',
  `header` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '对应于http协议中的header字段',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for job_master
-- ----------------------------
DROP TABLE IF EXISTS `job_master`;
CREATE TABLE `job_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT ' ',
  `job_comment` text NOT NULL COMMENT ' 任务描述',
  `job_name` varchar(60) NOT NULL COMMENT 'job名称',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT ' ',
  `urls_file_path` varchar(300) NOT NULL DEFAULT '' COMMENT 'URL上传路径',
  `priority` decimal(10,0) NOT NULL DEFAULT '0' COMMENT ' 任务优先级',
  `suggest_priority` decimal(10,0) NOT NULL DEFAULT '0' COMMENT ' 初始优先级',
  `queue_name` varchar(30) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT ' 组id（扩展使用）',
  `recrawl_depth` int(11) NOT NULL DEFAULT '1' COMMENT ' 抓取深度（扩展使用）',
  `error_retry` int(11) NOT NULL DEFAULT '0' COMMENT ' 重抓次数（扩展使用）',
  `request_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT ' 任务提交时间',
  `store_path` varchar(300) NOT NULL DEFAULT '',
  `scheduler_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id（扩展使用）',
  `fetcher_id` int(11) NOT NULL DEFAULT '0' COMMENT ' fetcher_id',
  `handler_id` int(11) NOT NULL DEFAULT '0' COMMENT ' handle_id(扩展使用)',
  `cookies` varchar(2048) NOT NULL DEFAULT '' COMMENT ' 下载时使用的cookie',
  `timeout` int(11) NOT NULL COMMENT '超时时间（扩展使用）',
  `need_proxy` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:不用代理 1：用代理',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT ' 任务状态',
  `crawl_repeat` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:不重抓 1：重复抓',
  `repeat_interval` int(11) NOT NULL DEFAULT '0' COMMENT '单位:分钟',
  `last_crawl_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_period` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否分期0：否1：是',
  `period_num` int(11) DEFAULT '0' COMMENT '分期数',
  `period_interval` int(11) DEFAULT '0' COMMENT '分期间隔（分钟）',
  `handler_conf` varchar(50) NOT NULL DEFAULT ' ' COMMENT 'handler配置文件名字',
  `fetcher_route` varchar(30) NOT NULL COMMENT '路由',
  `valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '单位：分钟',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10142 DEFAULT CHARSET=utf8 COMMENT='Job主表';

-- ----------------------------
-- Table structure for job_schedule
-- ----------------------------
DROP TABLE IF EXISTS `job_schedule`;
CREATE TABLE `job_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `job_id` int(11) NOT NULL DEFAULT '0',
  `schedule_ids` varchar(500) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_job_sche_job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19642480 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `center_ip` varchar(50) NOT NULL,
  `service` varchar(10) NOT NULL,
  `level` varchar(10) NOT NULL,
  `param` text,
  `log` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for log_file
-- ----------------------------
DROP TABLE IF EXISTS `log_file`;
CREATE TABLE `log_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `controller` varchar(20) NOT NULL DEFAULT '' COMMENT 'Controller',
  `action` varchar(20) NOT NULL DEFAULT '' COMMENT 'Action',
  `msg` text COMMENT '操作内容',
  `user_id` varchar(30) NOT NULL DEFAULT '0' COMMENT '操作者id',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3433 DEFAULT CHARSET=utf8 COMMENT='操作文件表';

-- ----------------------------
-- Table structure for mailinfo
-- ----------------------------
DROP TABLE IF EXISTS `mailinfo`;
CREATE TABLE `mailinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mailfrom` varchar(255) NOT NULL,
  `mailto` varchar(255) NOT NULL,
  `body` varchar(500) NOT NULL,
  `user_ip` varchar(50) NOT NULL,
  `priority` int(11) DEFAULT '2',
  `filter` int(11) DEFAULT '0',
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `is_sent` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16298 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for monitor
-- ----------------------------
DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `center_ip` varchar(50) NOT NULL,
  `error` varchar(100) NOT NULL,
  `errorMsg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `controller` varchar(20) NOT NULL DEFAULT '' COMMENT 'Controller',
  `action` varchar(20) NOT NULL DEFAULT '' COMMENT 'Action',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `before` text COMMENT '操作之前',
  `after` text COMMENT '操作以后',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作id',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2530 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' ',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT ' ',
  `schedule_id` int(11) NOT NULL DEFAULT '0' COMMENT ' ',
  `last_priority` int(11) NOT NULL DEFAULT '0' COMMENT ' ',
  `cur_priority` int(11) NOT NULL DEFAULT '0' COMMENT ' ',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_prio_sche_id` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21182467 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for proxy
-- ----------------------------
DROP TABLE IF EXISTS `proxy`;
CREATE TABLE `proxy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '80',
  `succ_count` int(11) NOT NULL DEFAULT '0',
  `fail_count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `status_sh` int(11) NOT NULL DEFAULT '0',
  `quality` int(11) NOT NULL DEFAULT '0',
  `source_url` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_PROXY_KEY` (`ip`,`port`),
  KEY `IDX_STATUS` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20436961 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for proxy_bak
-- ----------------------------
DROP TABLE IF EXISTS `proxy_bak`;
CREATE TABLE `proxy_bak` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '80',
  `succ_count` int(11) NOT NULL DEFAULT '0',
  `fail_count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `status_sh` int(11) NOT NULL DEFAULT '0',
  `quality` int(11) NOT NULL DEFAULT '0',
  `source_url` varchar(100) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proxy_translation
-- ----------------------------
DROP TABLE IF EXISTS `proxy_translation`;
CREATE TABLE `proxy_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '80',
  `succ_count` int(11) NOT NULL DEFAULT '0',
  `fail_count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `status_sh` int(11) NOT NULL DEFAULT '0',
  `quality` int(11) NOT NULL DEFAULT '0',
  `source_url` varchar(500) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for scheduler
-- ----------------------------
DROP TABLE IF EXISTS `scheduler`;
CREATE TABLE `scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduler_id` int(11) NOT NULL DEFAULT '0',
  `scheduler_name` varchar(50) NOT NULL DEFAULT '',
  `comment` varchar(500) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_sche_sche_id` (`scheduler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for scheduler_stat
-- ----------------------------
DROP TABLE IF EXISTS `scheduler_stat`;
CREATE TABLE `scheduler_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduler_id` varchar(30) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `source` varchar(30) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '-9 来源于schedule_mq -8:来源于mysql -7:来源于handler_mq  -1:succ 0:STAT 1:DEBUG 2:WARN 3:INFO 4:ERROR',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `job_id` (`job_id`),
  KEY `scheduler_id` (`scheduler_id`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=79204596 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsinfo
-- ----------------------------
DROP TABLE IF EXISTS `smsinfo`;
CREATE TABLE `smsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(100) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `user_ip` varchar(50) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT '2',
  `filter` int(11) DEFAULT '0',
  `is_sent` int(11) DEFAULT '0',
  `repeat_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `name_zh` varchar(32) NOT NULL DEFAULT '' COMMENT '中文名称',
  `email` varchar(32) NOT NULL DEFAULT '' COMMENT '邮箱',
  `vip_uid` varchar(20) NOT NULL DEFAULT '' COMMENT '唯品id',
  `operatorid` int(11) NOT NULL DEFAULT '0' COMMENT '操作id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态位1:正常0:锁定',
  `push_status` int(11) NOT NULL DEFAULT '0' COMMENT '推送状态',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for weibo_staruser
-- ----------------------------
DROP TABLE IF EXISTS `weibo_staruser`;
CREATE TABLE `weibo_staruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='fetcher的日志表';

SET FOREIGN_KEY_CHECKS = 1;
