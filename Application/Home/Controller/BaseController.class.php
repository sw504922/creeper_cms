<?php
/**
 * Created by PhpStorm.
 * User: wennan
 * Date: 6/27/14
 * Time: 5:07 PM
 */
namespace Home\Controller;
use Think\Controller;

/**
 * 后台首页控制器
 * @author weishi
 */

class BaseController extends Controller {
	/**
	 * 空操作，用于输出404页面
	 */
	public function _empty(){
		$this->redirect('Info/index');
	}	
	
/**
     * 后台控制器初始化
     */
    protected function _initialize(){
        if(!IS_GET && !IS_POST){
            return;
        }
    	
        if(!is_login()){// 还没登录 跳转到登录页面
            if(CONTROLLER_NAME."/".ACTION_NAME != 'Public/login'){
                session('ref_url', __SELF__);
            }
            $this->redirect('Public/login');
        }
		
        //判断是否是激活状态（管理员审批）
		//TODO
        
        
		$current_user = current_user();
        
        $this->assign('__MENU__', $this->getMenus());
		$this->assign('current_user', $current_user);
        $this->assign('__OPACTION__', CONTROLLER_NAME."/".ACTION_NAME);
        $this->assign('__OPCONTROLLER__', CONTROLLER_NAME);
        $this->assign('__OPSELF__', __SELF__);
        // 检测访问权限
        $this->accessControl($current_user);
    }
    
	public function getMenus(){
        $site = I('site','sina');
        $type = I('type','weibo');
        $group = I('group','time');
        $only_negative = I('showNeg','0');
        $filter = I('filter_id', null);
        $staff = I('staff_id', null);
        $history = I('complainant_id', null);
    	$mens['sider']['current'] = CONTROLLER_NAME."/".ACTION_NAME;
    	$mens['info-site']['current'] = $site;
    	$mens['info-site-type']['current'] = $type;
    	$mens['info-site-type-history']['current'] = $history;
    	$mens['info-site-type-group']['current'] = $group;
    	$mens['info-show-neg']['current'] = $only_negative;
    	$mens['info-site-type-group-filter']['current'] = $filter;
    	$mens['info-site-type-group-staff']['current'] = $staff;
    	return $mens;
    }
    
    
 /**
     * action访问控制,在 **登录成功** 后执行的第一项权限检测任务
     *
     * @return boolean|null  返回值必须使用 `===` 进行判断
     *
     *   返回 **false**, 不允许任何人访问(超管除外)
     *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
     *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
     * @author weishi
     */
    final protected function accessControl($current_user){
        
        $user = D('User');
        if(intval($current_user['status'])==$user::$userStatus['proposed']){
    		$this->redirect('Public/unapprovedNotice'); //尚未通过管理员审批
    	}
    	if (intval($current_user['status'])==$user::$userStatus['rejected']) {
    		$this->redirect('Public/rejectedNotice'); //账户被管理员驳回;
    	}
        
		if($current_user['is_staff'] && $current_user['is_admin']){
		    return true;//管理员和客服双权限
		}else if($current_user['is_admin']){
		    return true;
	    }else if($current_user['is_staff']){
    	    $deny  = C('ADMIN_ACTION');
    		$check = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);
            if (!empty($deny)  && in_array_case($check,$deny) ) {
                 $this->redirect('/Info/index');//非超管禁止访问deny中的方法
            }
            else{
            	return true;
            }
	    }else{
	        D('User')->logout();
			//$this->success('退出成功！', U('Public/login'),0);
			$this->redirect('Public/login');
	    }
        
    }
    
    
}