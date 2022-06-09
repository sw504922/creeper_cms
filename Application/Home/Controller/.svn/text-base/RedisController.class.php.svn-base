<?php
/**
 * User: zheng
 * Date: 2014/07/15
 */
namespace Home\Controller;
use Think\Controller;
class RedisController extends Controller {
	public function index(){
		$redis = new \Redis();
		$redis->connect(C('REDIS_DP'), C('REDIS_PORT_DP'));
		$redis->select(C('REDIS_DB'));
		$re = $redis->hGetAll('HOST_INTERVAL');
		$this->assign('re',$re);
		$this->display('index');
	}
	public function add(){
		$redis = new \Redis();
		$redis->connect(C('REDIS_DP'), C('REDIS_PORT_DP'));
		$redis->select(C('REDIS_DB'));
		if(IS_POST){
			$k = I('post.r_key');
			$v = I('post.r_value','','int');
			$redis->hSet('HOST_INTERVAL',$k,$v);
			$Olog = D('Operatelog');
			$data = array('key'=>$k,'value'=>$v);
			$d = array(
				'create_time' => date('Y-m-d H:i:s',time()),
				'controller' => CONTROLLER_NAME,
				'action' => ACTION_NAME,
				'name' => '【添加】reids',
				'after' => serialize($data),
				'user_id' => 1
			);
			$re = $Olog->addOperateInfo($d);
			$this->redirect('Redis/index');
		}
		$this->display('add');
	}
	public function edit(){
		$key = I('get.key');
		$redis = new \Redis();
		$redis->connect(C('REDIS_DP'), C('REDIS_PORT_DP'));
		$redis->select(C('REDIS_DB'));
		if(IS_POST){
			$key = I('post.hide_key');
			$val = I('post.r_value');
			$re = $redis->hSet('HOST_INTERVAL',$key,$val);
			if($re === 0){
				$val1 = $redis->hGet('HOST_INTERVAL',$key);
				$Olog = D('Operatelog');
				$data1 = array('key'=>$key,'value'=>$val1);
				$data = array('key'=>$key,'value'=>$val);
				$d = array(
					'create_time' => date('Y-m-d H:i:s',time()),
					'controller' => CONTROLLER_NAME,
					'action' => ACTION_NAME,
					'name' => '【修改】reids',
					'before' => serialize($data1),
					'after' => serialize($data),
					'user_id' => 1
				);
				$re = $Olog->addOperateInfo($d);
				$msg = array('status'=>'1','msg'=>'成功');
				$this->ajaxReturn($msg);
			}else{
				$msg = array('status'=>'2','msg'=>'失败');
				$this->ajaxReturn($msg);
			}
		}
		$val = $redis->hGet('HOST_INTERVAL',$key);
		$this->assign('key',$key);
		$this->assign('val',$val);
		$this->assign('sign','edit');
		$this->display('add');
	}
	public function del(){
		$key = I('get.key');
		$redis = new \Redis();
		$redis->connect(C('REDIS_DP'), C('REDIS_PORT_DP'));
		$redis->select(C('REDIS_DB'));
		$Olog = D('Operatelog');
		$val = $redis->hGet('HOST_INTERVAL',$key);
		$data = array('key'=>$key,'value'=>$val);
		$d = array(
			'create_time' => date('Y-m-d H:i:s',time()),
			'controller' => CONTROLLER_NAME,
			'action' => ACTION_NAME,
			'name' => '【删除】reids',
			'before' => serialize($data),
			'user_id' => 1
		);
		$re = $Olog->addOperateInfo($d);
		$redis->hDel('HOST_INTERVAL', $key);
		$this->redirect('Redis/index');
	}
	public function txt_out(){
		$redis = new \Redis();
		$redis->connect(C('REDIS_DP'), C('REDIS_PORT_DP'));
		$redis->select(C('REDIS_DB'));
		$re = $redis->hGetAll('HOST_INTERVAL');
		$arr = array();
		foreach($re as $key =>$value){
			$arr[]=array('key'=>$key,'value'=>$value);
		}
		$this->exporttxt($arr,array(),'redis');
	}
	/**
    * 导出数据为txt表格
    *@param $data    一个二维数组,结构如同从数据库查出来的数组
    *@param $title   txt的第一行标题,一个数组,如果为空则没有标题
    *@param $filename 下载的文件名
    *@examlpe exporttxt($arr,array('id','账户','密码','昵称'),'文件名!');
	*/
	function exporttxt($data=array(),$title=array(),$filename='report'){
	    header("Content-type:application/octet-stream");
	    header("Accept-Ranges:bytes");
	    header("'Content-Type: text/x-sql'");  
	    header("Content-Disposition:attachment;filename=".$filename.".txt");
	    header("Pragma: no-cache");
	    header("Expires: 0");
	    //导出xls 开始
	    if (!empty($title)){
	        foreach ($title as $k => $v) {
	            $title[$k]=iconv("UTF-8", "GB2312",$v);
	        }
	        $title= implode("\t", $title);
	        echo "$title\n";
	    }
	    if (!empty($data)){
	        foreach($data as $key=>$val){
	            foreach ($val as $ck => $cv) {
	                $data[$key][$ck]=iconv("UTF-8", "GB2312", $cv);
	            }
	            $data[$key]=implode("\t", $data[$key]);
	            
	        }
	        echo implode("\n",$data);
	    }
	}
	//导入
	public function fileIn(){
		$redis = new \Redis();
		$redis->connect(C('REDIS_DP'), C('REDIS_PORT_DP'));
		$redis->select(C('REDIS_DB'));
		if(IS_GET){
			$path = I('get.path');
		}
		$file = C('PATH_UPLOAD').$path;
		$re = $redis->hGetAll('HOST_INTERVAL');
		$time = date('Y-m-d H:i:s',time());
		$data = 'date:'.$time."\n".serialize($re)."\n";
		if(!is_file(C('PATH_UPLOAD').'redis/')){
       	 	mkdir(C('PATH_UPLOAD').'redis/',0777);
      	}
		file_put_contents(C('PATH_UPLOAD').'redis/redis.log', $data,FILE_APPEND);
		$fp=fopen($file,'r');
		while(!feof($fp)){
			$buffer=fgets($fp,4096);
			$arr =  explode("\t", $buffer);
			$key = $arr[0];
		 	$arrs = explode("\n", $arr[1]);
		 	$value = $arrs[0];
		 	$re = $redis->hSet('HOST_INTERVAL',$key,$value);
		}
		fclose($fp);
		$this->del_file($path);
		$Olog = D('Operatelog');
		$data = array('date'=>$time,'path'=>C('PATH_UPLOAD').'redis/redis.log');
		$d = array(
			'create_time' => date('Y-m-d H:i:s',time()),
			'controller' => CONTROLLER_NAME,
			'action' => ACTION_NAME,
			'name' => '【导入】reids',
			'before' => serialize($data),
			'user_id' => 1
		);
		$re = $Olog->addOperateInfo($d);
		$msg = array('status'=>'1','msg'=>'成功');
		$this->ajaxReturn($msg);
	}
	//删除文件 zheng
    public function del_file($f){
      $file = C('PATH_UPLOAD');
      if(file_exists($file.$f)){
        unlink($file.$f);
      }
    }
}