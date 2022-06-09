<?php
/**
 *操作日志
 * User: zheng
 * Date: 2014/07/24
 */
namespace Home\Controller;
use Think\Controller;
class OperatelogController extends Controller {
	public function index(){
		$log = D('Operatelog');
		$limit = 10;
		$count = $log->countLogs($data);
		$Page = new \Think\Page($count,$limit);
		$show = $Page->show($sign=1);
		$re = $log->getOperateLog($data,$Page->firstRow,$Page->listRows);
		$this->show =$show;
		$this->re = $re;
    	$this->display('index');
	}
	public function logAjax(){
		$log = D('Operatelog');
    	$limit = 10;
    	if(IS_GET){
			$i_name = I('get.i_name','','string');
			$i_user = I('get.i_user','','string');
			if($i_name){
				$data['operate_log.name'] = array('LIKE',"%".$i_name."%");
			}
			if($i_user){
				$data['user.username'] = array('LIKE',"%".$i_user."%");
			}
		}
		$count = $log->countLogs($data);
		$Page = new \Think\Page($count,$limit);
		$show = $Page->show($sign=1);
		$re = $log->getOperateLog($data,$Page->firstRow,$Page->listRows);
		$this->show = $show;
		$this->re = $re;
		layout(false);
		$data['status'] = 1;
		$data['content'] = $this->fetch('Operatelog/detail');
		$this->ajaxReturn($data);
	}

}