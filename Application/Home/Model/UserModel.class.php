<?php
namespace Home\Model;
use Think\Model;
/**
 * 会员模型
 */

class UserModel extends Model{
	public static $userStatus = array(
	    'proposed' => 0, // 新建
    	'approved' => 1, // 通过管理员审批
    	'rejected' => 2,  // 被管理员驳回
	);
	
	public static $userPushStatus = array(
	    'closed' => 0, // 关闭推送
    	'opened' => 1, // 打开推送
	);

	/* 用户模型自动验证 */
	protected $_validate = array(
	/* 验证用户名 */
	array('username', '3,30', -1, self::EXISTS_VALIDATE, 'length'), //用户名长度不合法
	array('username', 'checkDenyMember', -2, self::EXISTS_VALIDATE, 'callback'), //用户名禁止注册
	array('username', '', -3, self::EXISTS_VALIDATE, 'unique'), //用户名被占用

	/* 验证密码 */
	array('password', '0,30', -4, self::EXISTS_VALIDATE, 'length'), //密码长度不合法

	/* 验证邮箱 */
	array('email', 'email', -5, self::EXISTS_VALIDATE), //邮箱格式不正确
	array('email', '1,32', -6, self::EXISTS_VALIDATE, 'length'), //邮箱长度不合法
	array('email', 'checkDenyEmail', -7, self::EXISTS_VALIDATE, 'callback'), //邮箱禁止注册
	array('email', '', -8, self::EXISTS_VALIDATE, 'unique'), //邮箱被占用

	);
	
	/* 用户模型自动完成 */
	protected $_auto = array(
	array('password', 'think_ucenter_md5', self::MODEL_BOTH, 'function'),
	array('update_time','date',self::MODEL_BOTH,'function',array('Y-m-d H:i:s')), // 对update_time字段在插入和更新的时候写入当前时间戳
	);
	
	
	/**
	 * 注册一个新用户
	 * @param  string $username 用户名
	 * @param  string $password 用户密码
	 * @param  string $email    用户邮箱
	 * @param  string $mobile   用户手机号码
	 * @return integer          注册成功-用户信息，注册失败-错误编号
	 */
	public function register($username, $password, $email, $mobile){
		$data = array(
			'username' => $username,
			'password' => $password,
			'email'    => $email,
		);

		/* 添加用户 */
		if($this->create($data)){
			$uid = $this->add();
			return $uid ? $uid : 0; //0-未知错误，大于0-注册成功
		} else {
			return $this->getError(); //错误详情见自动验证注释
		}
	}
	
	/**
	 * 用户登录认证
	 * @param  string  $username 用户名
	 * @param  string  $password 用户密码
	 * @param  integer $type     用户名类型 （1-用户名，2-邮箱，3-手机，4-UID）
	 * @return integer           登录成功-用户ID，登录失败-错误编号
	 */
	public function login($username, $password, $autolog, $type = 1){
		$map = array();
		switch ($type) {
			case 1:
				$map['username'] = $username;
				break;
			case 2:
				$map['email'] = $username;
				break;
			case 3:
				$map['mobile'] = $username;
				break;
			case 4:
				$map['id'] = $username;
				break;
			default:
				return 0; //参数错误
		}

		/* 获取用户数据 */
		$user = $this->where($map)->find();
		if(is_array($user) && $user['id'] != null){
			
			if(intval($user['status'])==self::$userStatus['proposed']){
				return -5; //尚未通过管理员审批
			}
			else if (intval($user['status'])==self::$userStatus['rejected']) {
				return -4; //账户被管理员驳回;
			}else{
				/* 验证用户密码 */
				if(think_ucenter_md5($password) === $user['password']){
					$this->updateLogin($user, $autolog); //更新用户登录信息
					return $user['id']; //登录成功，返回用户ID
				} else {
					return -2; //密码错误
				}				
			}
			
		} else {
			return -1; //用户不存在或被禁用
		}
	}
	
	/**
	 * 更新用户登录信息
	 * @param  integer $uid 用户ID
	 */
	protected function updateLogin($user, $autolog){  
		/* 记录登录SESSION和COOKIES */
		$auth = array(
   		    'id'             => $user['id'],
            'username'        => $user['username'],
            'email' => $user['email'],
		    'name_zh' => $user['name_zh'],
		    'status' => intval($user['status']),
			'is_admin' =>$this->is_admin($user['id']),
			'is_staff' =>$this->is_staff($user['id']),
		);
		
		session(null);
		session('user_auth', $auth);
		session('user_auth_sign', data_auth_sign($auth));
        if ($autolog) {
            cookie('user_auth', $auth, C('LOGIN_EXPIRED'));
            cookie('user_auth_sign', data_auth_sign($auth), C('LOGIN_EXPIRED'));
        }
	}
	
	
	/**
	 * OA用户登录认证
	 * @param  string  $username 用户名
	 * @param  string  $password 用户密码
	 * @param  integer $type     用户名类型 （1-用户名，2-邮箱，3-手机，4-UID）
	 * @return integer           登录成功-用户ID，登录失败-错误编号
	 */
	function oa_login($username, $password, $autolog, $type = 1) {
		$map = array();
		switch ($type) {
			case 1:
				$map['username'] = $username;
				break;
			case 2:
				$map['email'] = $username;
				break;
			case 3:
				$map['mobile'] = $username;
				break;
			case 4:
				$map['id'] = $username;
				break;
			default:
				return 0; //参数错误
		}
		/* 获取用户数据 */
		$data = oa_ldap_validate($username, $password);//TODO
		
		if($data > 0) {
			$user = $this->where($map)->find();
			//找到用户，判断用户状态
			if(is_array($user) && $user['id'] != null){
				if(intval($user['status'])==self::$userStatus['proposed']){
					return -5; //尚未通过管理员审批
				}
				else if (intval($user['status'])==self::$userStatus['rejected']) {
					return -4; //账户被管理员驳回;
				}else{	
					$this->updateLogin($user, $autolog); //更新用户登录信息
					return $user['id']; //登录成功，返回用户ID				
				}
			} else {
				//未找到，新建用户
				$user = array(
					'username' => $username,
					'name_zh' => $data['sn'][0],
				    'email' => strtolower($data['mail'][0]),
		    		'vip_uid' => $data['uid'][0],
					'status' => self::$userStatus['proposed'],
					'push_status' => self::$userPushStatus['opened'],
					'create_time' => date('Y-m-d H:i:s'),
				);
				
				//添加用户
				if($this->create($user)){
					$this->add();
				} else {
					return -6;//创建用户失败
				}
				mail_to_admin_approve();//给管理员发送邮件
				return -5; ////尚未通过管理员审批	
			}
		} else {
			return -3;		//OA验证失败
		}
		return 0;  //未知错误
		
	}
	
	/**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
        session(null);
        cookie('user_auth', null);
        cookie('user_auth_sign', null);
    }
    
	
	
	
	
	
	/***********************************************************************************************************************/
	/**
	 * 获得用户的角色
	 */
	public function roles($uid){
		$Role = M('Role');
		$data = $Role->join('JOIN role_user ON role.id = role_user.role_id')->where('role_user.user_id = '.$uid)
        	->distinct(true)->field('role.*')
        	->select();
        
      	return $data;
	}
	
	
	/**
	 * 判断用户是否是管理员
	 */
	public function is_admin($uid) {
		$Role = M('Role');
		$data = $Role->join('JOIN role_user ON role.id = role_user.role_id')->where("role_user.user_id = %d and role.name = 'admin'", $uid)
        	->field('role.*')
        	->select();
        
      	return !empty($data);
	}
	
	public function is_staff($uid) {
		$Role = M('Role');
		$data = $Role->join('JOIN role_user ON role.id = role_user.role_id')->where("role_user.user_id = %d and role.name = 'staff'", $uid)
        	->field('role.*')
        	->select();
        
      	return !empty($data);
	}
	
	
	public function set_role($uid,$role_id) {
		$RoleUser = M("RoleUser");
		$RoleUser->role_id = $role_id;
		$RoleUser->user_id = $uid;
		$RoleUser->create_time = date('Y-m-d H:i:s');
		$RoleUser->update_time = date('Y-m-d H:i:s');
		$RoleUser->add();
	}
	
}