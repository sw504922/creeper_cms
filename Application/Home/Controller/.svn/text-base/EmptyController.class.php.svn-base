<?php
namespace Home\Controller;
use Think\Controller;
class EmptyController extends Controller{

	public function index(){        //根据当前控制器名来判断要执行那个城市的操作
	    if(IS_GET){
    		$content = '当前控制器：'.CONTROLLER_NAME;
    		//$this->show($content, 'utf-8', 'text/plain');
    		$this->redirect('Job/index');
    		//$this->display('error');
	    }
	}
	    
}
