<?php
namespace Home\Controller;
use Think\Controller;

class IndexController extends Controller {
    public function index(){
//		echo_ln("hello think");
   		if(IS_GET){
		    $this->redirect('Job/index');
		}
    }
    
	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}
}