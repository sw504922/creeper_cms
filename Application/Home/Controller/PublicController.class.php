<?php
/**
 * Created by PhpStorm.
 * User: weishi
 * Date: 1/17/14
 * Time: 3:07 PM
 */
namespace Home\Controller;
use Think\Controller;
use Home\Model\UserModel;



//require_once dirname(__FILE__).'/../../../ThinkPHP/Library/Vendor/SinaWeibo/config.php';
//require_once dirname(__FILE__).'/../../../ThinkPHP/Library/Vendor/SinaWeibo/saetv2.ex.class.php';

/**
 * 用户控制器
 * 包括用户中心，用户登录及注册
 */
class PublicController extends Controller {

	/**
	 * 空操作，用于输出404页面
	 */
	public function _empty(){
		$this->redirect('Public/login');
	}

	public function callback($code = null) {

        $o = new \SaeTOAuthV2( WB_AKEY , WB_SKEY );

        if (!is_null($code)) {
            $keys = array();
            $keys['code'] = $code;
            $keys['redirect_uri'] = WB_CALLBACK_URL;
            try {
                $token = $o->getAccessToken( 'code', $keys ) ;
            } catch (OAuthException $e) {
            }
        }
        $this->token = $token;
        $this->o = $o;
        layout(false);
        $this->display('callback');
    }
	public function unapprovedNotice() {
	    layout(false); 
		$this->display();
	}
	public function rejectedNotice() {
	    layout(false); 
		$this->display();
	}

	/* 注册页面 */
	public function register($username = '', $password = '', $repassword = '', $email = '', $verify = ''){
		if(!C('USER_ALLOW_REGISTER')){
			$this->error('注册已关闭');
		}
		if(IS_POST){ //注册用户
			/* 检测验证码 */
			if(!check_verify($verify)){
				$this->error('验证码输入错误！');
			}

			/* 检测密码 */
			if($password != $repassword){
				$this->error('密码和重复密码不一致！');
			}

			/* 调用注册接口注册用户 */
			$User = new UserModel();
			$uid = $User->register($username, $password, $email);
			if(0 < $uid){ //注册成功
				//TODO: 发送验证邮件
				$this->success('注册成功！',U('login'));
			} else { //注册失败，显示错误信息
				$this->error($this->showRegError($uid));
			}

		} else { //显示注册表单
			$this->display();
		}
	}

	/* 登录页面 */
	public function login($username = '', $password = '', $verify = '', $ref_url='', $autolog=false){

		if(IS_POST){ //登录验证
			/* 检测验证码 */
//			if(!check_verify($verify)){
//				$this->error('验证码输入错误！');
//			}

			/* 调用登录接口登录 */
			$user = new UserModel();
			$uid = $user->oa_login($username, $password, $autolog);
			
			/* 调用OA用户登录认证 TODO*/
			//$uid = $user->oa_login($username, $password);
			
			if(0 < $uid){ //UC登录成功
			    $current_user = current_user();
			                    
			    if(!empty($ref_url)){
			        $this->success('登录成功！',$ref_url);
			    }
			    if($current_user['is_staff']){
			        $this->success('登录成功！',U('Info/index'));
			    }else if($current_user['is_admin']){
			        $this->success('登录成功！',U('Info/checkPending'));
			    }else{
			        D('User')->logout();
			        $this->error('你的帐号没有权限');
			    }
				
			}else { //登录失败
				switch($uid) {
					case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
					case -2: $error = '密码错误！'; break;
					case -3: $error = '您的用户名密码不匹配'; break;
					case -4: $this->success('尚未通过管理员审批',U('Public/rejectedNotice')); break;//被管理员驳回
					case -5: $this->success('尚未通过管理员审批',U('Public/unapprovedNotice')); break;//尚未通过管理员审批
					case -6: $error = '创建用户失败！'; break;
					default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
				}
				$this->error($error);
			}

		} else { //显示登录表单
			if(is_login()){
			    $current_user = current_user();
			    if($current_user['is_staff']){
				    $this->redirect('Info/index');
			    }else if($current_user['is_admin']){
			        $this->redirect('Info/checkPending');
			    }
			}else{
			    
				$this->display();
			}
				
		}
	}

	/* 退出登录 */
	public function logout(){
		if(is_login()){
			D('User')->logout();
			//$this->success('退出成功！', U('Public/login'),0);
			$this->redirect('Public/login');
		} else {
			$this->redirect('Public/login');
		}
	}

	/* 验证码，用于登录和注册 */
	public function verify(){
		$verify = new \Think\Verify();
		$verify->entry(1);
	}

	/**
	 * 获取用户注册错误信息
	 * @param  integer $code 错误编码
	 * @return string        错误信息
	 */
	private function showRegError($code = 0){
		switch ($code) {
			case -1:  $error = '用户名长度必须在16个字符以内！'; break;
			case -2:  $error = '用户名被禁止注册！'; break;
			case -3:  $error = '用户名被占用！'; break;
			case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
			case -5:  $error = '邮箱格式不正确！'; break;
			case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
			case -7:  $error = '邮箱被禁止注册！'; break;
			case -8:  $error = '邮箱被占用！'; break;
			default:  $error = '未知错误';
		}
		return $error;
	}


}
