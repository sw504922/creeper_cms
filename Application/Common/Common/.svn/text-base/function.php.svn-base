<?php
/**
 * Created by PhpStorm.
 * User: wennan
 * Date: 6/27/14
 * Time: 5:33 PM
 */


/**
 *
 * check if $haystack start_with $needle
 * @param string $haystack
 * @param string $needle
 */
 
/**
 *
 * 获得$datetime距离现在的时间
 * @param datetime(Y-m-d H:i:s) $datetime
 * @author wennnan
 */
function get_time_recent($datetime) {


	$my_date = date('Y-m-d H:i:s');
	$time_now = strtotime($my_date);
	$time_old = strtotime($datetime);
	$time_minutes = ($time_now - $time_old)/60;
	$time_recent = "";
	if($time_minutes < 60){
		$time_recent = intval($time_minutes).'分钟前';
	}else if($time_minutes >= 60 && $time_minutes < 60*24){
		$time_recent = intval($time_minutes/60).'小时前';
	}else if($time_minutes >= 60*24){
		$time_recent = intval($time_minutes/(60*24)).'天前';
	}
	return $time_recent;
}

/**
 *
 * 获得$datetime距离现在的时间
 * @param datetime(Y-m-d H:i:s) $datetime
 * @author wennan
 */
function get_time_left($time) {

    $my_date = date('Y-m-d H:i:s');
    $time_now = time();
    $time_expire = intval($time);
    $time_minutes = ($time_expire - $time_now)/60;
    $time_recent = "";
    if($time_minutes < 60){
        $time_recent = intval($time_minutes).'分钟';
    }else if($time_minutes >= 60 && $time_minutes < 60*24){
        $time_recent = intval($time_minutes/60).'小时';
    }else if($time_minutes >= 60*24){
        $time_recent = intval($time_minutes/(60*24)).'天';
    }
    return $time_recent;
}

/**
 *
 * 获得$datetime距离现在的时间
 * @param datetime(Y-m-d H:i:s) $datetime
 * @author wennan
 */
function getOldTime($day) {
	$my_date = date('Y-m-d H:i:s');
	$time_now = time();
	$time_old = date('Y-m-d H:i:s', strtotime(-$day.' day'));
	
	return $time_old;
}

/******************************************************************************************/

function UtilTimeFormate($str) {
//	$regexp = '(\d+)';
//	var_dump($str);
	$arr = explode(" ", $str);
	$ret1 = explode("-", $arr[0]);
	$ret2 = explode(":", $arr[1]);
	$ret1[1] = $ret1[1] - 1; 
	$ret = $ret1;
	$ret[3] = $ret2[0];
	$ret[4] = $ret2[1];
	$ret[5] = $ret2[2];
//	preg_match_all($regexp, $str, $arr);
//	var_dump($ret);
	$str_return = "Date.UTC(".$ret[0].", ".$ret[1].", ".$ret[2].", ".$ret[3].", ".$ret[4].", ".$ret[5].")";
	$str_return = strtotime($str);
	$str_return = $str_return * 1000;
	return $str_return;
}

function getJsonDataCurveChart($data, $arr, $type) {
/****************************************/
	$title_last = null;
//	$data = array();
	$element_data = array();
	$block_data = array();
	$row_data = null;
	$sum = count($arr);
/****************************************/
	for($i = 0; $i < $sum; $i++) {
		$title_detail = $arr[$i]['host_port'] .", ". $arr[$i]['job_id'] . ",". $type;
		if($title_last == null) {
			$title_last = $title_detail;
			$row_data = array();
		 	$ret = UtilTimeFormate($arr[$i]['stat_time']);
		 	array_push($row_data, $ret);
		 	array_push($row_data, $arr[$i][$type]);
		 	array_push($block_data, $row_data);
		}else if($title_last == $title_detail) {
			$ret = UtilTimeFormate($arr[$i]['stat_time']);
			$row_data = array();
			array_push($row_data, $ret);
		 	array_push($row_data, $arr[$i][$type]);
		 	array_push($block_data, $row_data);
		}else {
			$element_data['name'] = $title_last;
			$element_data['data'] = $block_data;
			array_push($data, $element_data);
			/********************************************/
			$title_last = $title_detail;
			$row_data = array();
			$block_data = array();
			$element_data = array();
		 	$ret = UtilTimeFormate($arr[$i]['stat_time']);
		 	array_push($row_data, $ret);
		 	array_push($row_data, $arr[$i][$type]);
		 	array_push($block_data, $row_data);
		}
	}
	$element_data['name'] = $title_last;
	$element_data['data'] = $block_data;
	array_push($data, $element_data);
	
//	var_dump(json_encode($data));
	return $data;
}

/**
 * 检测用户是否登录
 * @return integer 0-未登录，大于0-当前登录用户ID
 * @author wennan
 */
function is_login(){
	$user = current_user();
	if (empty($user)) {
		return 0;
	} else {
		return session('user_auth_sign') == data_auth_sign($user) ? $user['id'] : 0;
	}
}

/**
 *获取当前用户
 *@author wennan
 */
function current_user(){
	$user = session('user_auth');
    if (empty($user)) {
        $user = cookie('user_auth');
        if (!empty($user)) {
            session(null);
            session('user_auth', $user);
            session('user_auth_sign', data_auth_sign($user));
        }
    }
	return $user;
}


/**
 * 数据签名认证
 * @param  array  $data 被认证的数据
 * @return string       签名
 * @author weishi
 */
function data_auth_sign($data) {
	//数据类型检测
	if(!is_array($data)){
		$data = (array)$data;
	}
	ksort($data); //排序
	$code = http_build_query($data); //url编码并生成query字符串
	$sign = sha1($code); //生成签名
	return $sign;
}

/**
 * 系统非常规MD5加密方法
 * @param  string $str 要加密的字符串
 * @return string
 * @author weishi
 */
function think_ucenter_md5($str){
	$key = C('AUTH_MD5_KEY');
	return '' === $str ? '' : md5(sha1($str) . $key);
}


/**
 *
 * 使用唯品会LDAP验证OA用户身份
 * @param string $username
 * @param string $password
 * @return -1-用户不存在 -2-密码错误 array-用户信息
 * @author weishi
 */
function oa_ldap_validate($validate_user, $validate_pwd) {
	$ldap_host = 'ldap://ldap.oa.vipshop.com';
	#$ldap_host = 'ldap://10.19.131.102';
	$ldap_port = '389';
	$ldap_user = 'cn=search,dc=vipshop,dc=com';
	$ldap_pwd = '1qazSE$rfvGY&';
	$base_dn = 'ou=employees,dc=vipshop,dc=com';

	$ldap_conn = ldap_connect($ldap_host, $ldap_port);

	ldap_bind($ldap_conn, $ldap_user, $ldap_pwd);
	
	$result= ldap_search($ldap_conn, $base_dn, "(cn=$validate_user)");//执行查询
	$entry= ldap_get_entries($ldap_conn, $result);//获得查询结果
		
	//echo_ln(ldap_error($ldap_conn));
	//取消绑定
	ldap_unbind($ldap_conn);
	//关闭
	ldap_close($ldap_conn);
	
	//print_r($entry);
	if($entry['count'] > 0){
		$oa_password = $entry[0]["vippassword"][0];
		if(md5($validate_pwd) == $oa_password){
			return $entry[0];
		}else{
			return -2;
		}
	}
	else{
		return -1;
	}
	

}