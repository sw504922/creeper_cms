<?php
namespace Home\Controller;
use Think\Controller;
use Think\Upload; 
class UploadController extends Controller {
    public function upload(){
      $path = $_FILES['i_paths'];;
      $name = explode('.',$path['name']);
      $file = C('PATH_UPLOAD');
      if(!is_file($file)){
        mkdir($file,0777);
      }
    	$upload = new \Think\Upload();// 实例化上传类
    	//$upload->maxSize   =     3145728 ;// 设置附件上传大小
    	$upload->exts      =     array('txt');// 设置附件上传类型
      $upload->autoSub   =      false;
    	$upload->rootPath  =      $file; // 设置附件上传根目录
      $upload->saveName  =      $name[0].'_'.time();
    	// 上传单个文件 
    	$info   =   $upload->uploadOne($path);
   	 	if(!$info) {// 上传错误提示错误信息
        $arr = array('status'=>2,'msg'=>$upload->getError());
        $re = json_encode($arr);
   	   	echo $re;
   		}else{// 上传成功 获取上传文件信息
        $arr = array('status'=>1,'msg'=>$info['savepath'].$info['savename']);
        $re = json_encode($arr);
        echo $re;
   		}
    }
}