<?php
return array(
	//'配置项'=>'配置值'
	//数据库配置信息
	'DB_TYPE' => 'mysqli', // 数据库类型
    'DB_HOST' => 'localhost', // 服务器地址
    'DB_NAME' => 'creeper', // 数据库名
    'DB_USER' => 'root', // 用户名
    'DB_PWD' => '12345678', // 密码
    'DB_PORT' => 3306, // 端口
	'DB_PREFIX' => '',							//数据库表前缀
	
	'TMPL_TEMPLATE_SUFFIX'=>'.html',  			//默认模板文件后缀
	'URL_MODEL' => 0,
	
	//路由的相关设置
	'URL_ROUTER_ON'   => true, 					//开启路由
	'MODULE_ALLOW_LIST'    =>    array('Home','Admin','User'),
    'DEFAULT_MODULE'       =>    'Home',

	//模板的设置
	'LAYOUT_ON'=>true,
	'LAYOUT_NAME'=>'Layout/index',

	//上传文件根目录
	'PATH_UPLOAD'=>'./Uploads/',

    //'REDIS_DP'=>'192.168.202.27',
    'REDIS_DP'=>'192.168.5.105',
    'REDIS_PORT_DP'=>'6379',
    'REDIS_DB'=>'15',

	//相关角色的模块权限设置
	'ADMIN_ACTION' => array('Info/checkPending','SystemApprove/index','SystemSetTime/index','ObserverAccount/index','BadWord/index'),

	//邮件配置
	'EMAIL' => array(
	    'SMTP_HOST'   => 'mail.corp.vipshop.com', //SMTP服务器
	    'SMTP_PORT'   => '25', //SMTP服务器端口
	    'SMTP_USER'   => 'yuqing', //SMTP服务器用户名
	    'SMTP_PASS'   => 'yuqing123', //SMTP服务器密码
	    'FROM_EMAIL'  => 'yuqing@vipshop.com', //发件人EMAIL
	    'FROM_NAME'   => 'creeper管理系统', //发件人名称
	    'REPLY_EMAIL' => '', //回复EMAIL（留空则为发件人EMAIL）
	    'REPLY_NAME'  => '', //回复名称（留空则为发件人名称）
	),
	'Project_Address' => 'http://opinion.vip.vip.com',
	
	//thrift相关参数配置
	'ANNOTATION_THRIFT' => array(
		'THRIFT_SERVER_URL' => '10.102.32.52',    //服务端的url
		'THRIFT_PORT' => 9889, 		  //服务器端口
	    'BUFFER_SIZE' => 1024,
	),
	//job状态
	'JOB_STATUS' => array(
		'0'=>'新任务',
		'1'=>'处理中',
		'2'=>'结束',
		'3'=>'删除',			
		'4'=>'调整优先级',
		'5'=>'未开始',
		'6'=>'重置',
		'7'=>'定时任务'
	),
	'DISPATCHER_TYPE' => array(
		'-10'=>'因为超时而丢弃',
		'-5'=>'重新放入schedule',
		'-4'=>'从pq中取数量',
		'-3'=>'重新放进mq',
		'-2'=>'fetcher拒绝',
		'-1'=>'fetcher成功接收',
		'1'=>'DEBUG',
		'2'=>'WARN',
		'3'=>'INFO',
		'4'=>'ERROR'
	),
	'SCHEDULER_TYPE' => array(
		'-9'=>'来源于schedule_mq',
		'-8'=>'来源于mysql',
		'-7'=>'来源于handler_mq',
		'-1'=>'succ',
		'1'=>'DEBUG',
		'2'=>'WARN',
		'3'=>'INFO',
		'4'=>'ERROR'
	)
);
