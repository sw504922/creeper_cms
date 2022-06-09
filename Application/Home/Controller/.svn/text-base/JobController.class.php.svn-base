<?php
namespace Home\Controller;
use Think\Controller;
class JobController extends Controller {
    //列表总 zheng
	public function index(){
		$Job = D('Job');
		$status =C('JOB_STATUS');
		$data = array();
		$limit = 10;
		if(IS_GET){
			$i_name = I('get.i_name','','string');
			//$i_user = I('get.i_user','','string');
			$i_status = I('get.i_status','','int');
			if($i_name){
				$data['job_name'] = array('LIKE',"%".$i_name."%");
			}
			if($i_status!=-1 && $i_status !== ''){
				$data['status'] = $i_status;
			}else{
				$i_status = -1;
			}
			$p = I('get.p','1','int');
		}
		$count = $Job->countJobs($data,'job_master');
		$Page = new \Think\Page($count,$limit);
		$show = $Page->show();
		$re = $Job->getJobs($data,$Page->firstRow,$Page->listRows,'job_master');
		$this->assign('status',$status);
		$this->assign('re',$re);
		$this->assign('i_status',$i_status);
		$this->assign('i_name',$i_name);
		$this->assign('show',$show);
		$this->assign('h_page',$p);
    	$this->display('indexsum');
    }
    //作废
    public function jobAjax(){
    	$Job = D('Job');
    	$limit = 10;
    	$status =C('JOB_STATUS');
    	
		$count = $Job->countJobs($data,'job_master');
		$Page = new \Think\Page($count,$limit);
		$show = $Page->show();
		$re = $Job->getJobs($data,$Page->firstRow,$Page->listRows,'job_master');
		$this->show = $show;
		$this->re = $re;
		$this->status = $status;
		layout(false);
		$data['status'] = 1;
		$data['content'] = $this->fetch('Job/jobsum_detail');
		$this->ajaxReturn($data);
    }
    //列表 zheng
	public function indexList(){
		$Job = D('Job');
		$status = C('JOB_STATUS');
		$id = I('get.id','','int');
		$data = array();
		$data = array('sid'=>$id);
		$limit = 10;
		$count = $Job->countJobs($data);
		$Page = new \Think\Page($count,$limit);
		$show = $Page->show($sign=1);
		$re = $Job->getJobs($data,$Page->firstRow,$Page->listRows);
		$this->status =$status;
		$this->show =$show;
		$this->re = $re;
		$this->id = $id;
    	$this->display('index');
    }
    public function jobAjaxdetail(){
    	$Job = D('Job');
    	$limit = 10;
    	$status = C('JOB_STATUS');
		
    	if(IS_GET){
    		$id = I('get.id','','int');
			$i_name = I('get.i_name','','string');
			//$i_user = I('get.i_user','','string');
			$i_status = I('get.i_status','','int');
			$data = array('sid'=>$id);
			if($i_name){
				$data['job_name'] = array('LIKE',"%".$i_name."%");
			}
			if($i_status!=-1){
				$data['status'] = $i_status;
			}else{
				$i_status = -1;
			}
		}
		$count = $Job->countJobs($data);
		$Page = new \Think\Page($count,$limit);
		$show = $Page->show($sign=1);
		$re = $Job->getJobs($data,$Page->firstRow,$Page->listRows);
		$this->show = $show;
		$this->re = $re;
		$this->status = $status;
		layout(false);
		$data['status'] = 1;
		$data['content'] = $this->fetch('Job/job_detail');
		$this->ajaxReturn($data);
    }
    //添加 zheng
    public function add(){
    	if(IS_POST){
    		//dump($_POST);die;
    		$Job = D('Job');
    		$error = '';
    		$data = array();
    		$i_comment = I('post.i_comment','','string');
    		$i_name = I('post.i_name','','string');
    		$i_s_priority = I('post.i_s_priority','','int');
    		$i_status = I('post.i_status','','int');
    		$i_path = I('post.i_paths','','string');
    		$i_f_id = I('post.i_f_id','','int');
    		$i_cookie = I('post.i_cookie','','string');
    		$i_need = I('post.i_need','','int');
    		$i_repeat = I('post.i_repeat','','int');
    		$i_interval = I('post.i_interval','','int');
    		$i_h_conf = I('post.i_h_config','','string');
    		$i_route = I('post.i_route','','string');
    		$i_period = I('post.i_period','','int');
    		$i_period_num = I('post.i_period_num','','int');
    		$i_p_interval = I('post.i_p_interval','','int');
    		$i_error_retry = I('post.i_error_retry',3,'int');
    		$i_timeout = I('post.i_timeout','','int');
    		$i_h_id = I('post.i_h_id','','int');
    		$i_q_name = I('post.i_q_name','','string');
    		$i_valid = I('post.i_valid','','int');
    		$i_priority = $i_s_priority;
    		if($error!=''){
				$error = array('status'=>'2','msg'=>$error);
				$this->ajaxReturn($error);
			}
			$data = array(
				'create_time' => date('Y-m-d H:i:s',time()),
				'job_comment' => $i_comment,
				'job_name' => $i_name,
				'priority' => $i_priority,
				'suggest_priority' => $i_s_priority,
				'request_time' => date('Y-m-d H:i:s',time()),
				'urls_file_path' => $i_path,
				'fetcher_id' => $i_f_id,
				'cookies' => $i_cookie,
				'need_proxy' => $i_need,
				'crawl_repeat' => $i_repeat,
				'repeat_interval' => $i_interval,
				'status' => $i_status,
				'is_period' => $i_period,
				'handler_conf' => $i_h_conf,
				'fetcher_route' => $i_route,
				'error_retry' =>$i_error_retry,
				'timeout' => $i_timeout,
				'handler_id' => $i_h_id,
				'queue_name' => $i_q_name,
				'valid_time' => $i_valid
			);
    		if($i_period==1&&$i_period_num>1){
    			$file = C('PATH_UPLOAD');
		    	$arr = explode('.', $i_path);
		    	$f_path = $file.$arr[0].'/';
			    if(!is_file($f_path)){
			    	mkdir($f_path,0777);
			    }
			    $content = file_get_contents($file.$i_path);
			    $array = explode("\n", $content);
			    $count = count($array);
			    $num = ceil($count/$i_period_num);//一个文件的条数
			    $data['period_num'] = $i_period_num;
			    $data['period_interval'] = $i_p_interval;
			    $id = $Job->addJob($data,'job_master');
			    $data['sid'] = $id;
			    $data_r=array();
			    for($i=0;$i<$i_period_num;$i++){
			    	$data1 = array();
			    	$data1 = array_slice($array,$i*$num,$num);
			    	foreach ($data1 as $key => $value) {
			    		if($key == $num-1){
			    			$value = str_replace("\r", '', $value);
			    			$data_r .= $value;
			    		}else{
			    			$data_r .= $value."\n";
			    		}
			    	}		    	
			    	$f_url = $f_path.$arr[0].'_'.$i.'.txt';
			    	$url_i = $arr[0].'/'.$arr[0].'_'.$i.'.txt';
			    	$time = date('Y-m-d H:i:s',(time()+$i_p_interval*60*$i));
			    	file_put_contents($f_url, $data_r);
			    	$data['urls_file_path'] = $url_i;
			    	$data['start_time'] = $time;
			    	$data['status'] = 7;
					$id = $Job->addJob($data);
			    }
    		}else{
    			$id = $Job->addJob($data,'job_master');
    			$data['sid'] = $id;
    			$id = $Job->addJob($data);
    		}
			if($id){
				$Olog = D('Operatelog');
				$d = array(
					'create_time' => date('Y-m-d H:i:s',time()),
					'controller' => CONTROLLER_NAME,
					'action' => ACTION_NAME,
					'name' => '【添加】job名称为:'.$i_name,
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
    	}else{
    		$this->display('add');
    	}
    }
    //修改总 zheng 
    public function edit(){
    	$Job = D('Job');
    	$status = C('JOB_STATUS');
    	if(IS_GET){
    		$id = I('get.id','','int');
    		$p = I('get.p','1','int');
    		$name_g = I('get.name','','string');
    		$status_g = I('get.status','','int');
    	}
    	if(IS_POST){
    		$id = I('post.id','','int');
    		$i_comment = I('post.i_comment','','string');
    		$i_name = I('post.i_name','','string');
    		$i_s_priority = I('post.i_s_priority','','int');
    		$i_path = I('post.i_paths','','string');
    		$hide_path = I('post.hide_path','','string');
    		$i_status = I('post.i_status','','int');
    		$i_f_id = I('post.i_f_id','','int');
    		$i_cookie = I('post.i_cookie','','string');
    		$i_need = I('post.i_need','','int');
    		$i_repeat = I('post.i_repeat','','int');
    		$i_interval = I('post.i_interval','','int');
    		$i_h_conf = I('post.i_h_config','','string');
    		$i_route = I('post.i_route','','string');
    		$i_period = I('post.i_period','','int');
    		$i_period_num = I('post.i_period_num','','int');
    		$i_p_interval = I('post.i_p_interval','','int');
    		$i_error_retry = I('post.i_error_retry',3,'int');
    		$i_timeout = I('post.i_timeout','','int');
    		$i_h_id = I('post.i_h_id','','int');
    		$i_q_name = I('post.i_q_name','','string');
    		$i_valid = I('post.i_valid','','int');
    		$is_deleted = 0;
    		$i_priority = $i_s_priority;
    		$data = array(
				'job_comment' => $i_comment,
				'job_name' => $i_name,
				'priority' => $i_priority,
				'suggest_priority' => $i_s_priority,
				'urls_file_path' => $i_path,
				'fetcher_id' => $i_f_id,
				'cookies' => $i_cookie,
				'need_proxy' => $i_need,
				'crawl_repeat' => $i_repeat,
				'repeat_interval' => $i_interval,
				'is_deleted' => $is_deleted,
				'handler_conf' => $i_h_conf,
				'fetcher_route' => $i_route,
				'error_retry' =>$i_error_retry,
				'timeout' => $i_timeout,
				'handler_id' => $i_h_id,
				'queue_name' => $i_q_name,
				'valid_time' => $i_valid
			);

    		if($i_path != $hide_path){
    			$data['is_period'] = $i_period;
    			$data['period_num'] = $i_period_num;
    			$data['period_interval'] = $i_p_interval;
    			$data['create_time'] = date('Y-m-d H:i:s',time());
    			if($i_period==1&&$i_period_num>1){
	    			$file = C('PATH_UPLOAD');
			    	$arr = explode('.', $i_path);
			    	$f_path = $file.$arr[0].'/';
				    if(!is_file($f_path)){
				    	mkdir($f_path,0777);
				    }
				    $content = file_get_contents($file.$i_path);
				    $array = explode("\n", $content);
				    $count = count($array);
				    $num = ceil($count/$i_period_num);//一个文件的条数
				    $data['period_num'] = $i_period_num;
				    $data['period_interval'] = $i_p_interval;
				    $re = $Job->setOneJobById(array('id'=>$id),$data,'job_master');
				    $Job->delOneJobById($id);
				    $data['sid'] = $id;
				    for($i=0;$i<$i_period_num;$i++){
				    	$data1 = array();
				    	$data1 = array_slice($array,$i*$num,$num);
				    	$data_r = '';
				    	foreach ($data1 as $key => $value) {
				    		if($key == $num-1){
				    			$value = str_replace("\r", '', $value);
				    			$data_r .= $value;
				    		}else{
				    			$data_r .= $value."\n";
				    		}
				    	}	
				    	//$data_r = implode("\n", $data1);
				    	//$data_r = substr($data_r, 0,strlen($data_r)-2);
				    	$f_url = $f_path.$arr[0].'_'.$i.'.txt';
				    	$url_i = $arr[0].'/'.$arr[0].'_'.$i.'.txt';
				    	$time = date('Y-m-d H:i:s',(time()+$i_p_interval*60*$i));
				    	file_put_contents($f_url, $data_r);
				    	$data['urls_file_path'] = $url_i;
				    	$data['start_time'] = $time;
				    	$data['status'] = 7;
						$re = $Job->addJob($data);
				    }
				    $this->del_file($hide_path);
	    		}else{
	    			if($i_status==3){
						$i_repeat = 0;
						$is_deleted = 1;
					}
					$data['crawl_repeat'] = $i_repeat;
					$data['is_deleted'] = $is_deleted;
	    			$data['status'] = $i_status;
	    			$re = $Job->setOneJobById(array('id'=>$id),$data,'job_master');
	    			$Job->delOneJobById($id);
	    			$data['sid'] = $id;
	    			$re = $Job->addJob($data);
	    			$this->del_file($hide_path);
	    		}
    		}else{
    			$re_c = $Job->setOneJobById(array('id'=>$id),$data,'job_master');
    			$re = $Job->setOneJobById(array('sid'=>$id),$data);
    		}

			if($re_c === 0){
    			$msg = array('status'=>'3','msg'=>'您没有修改！');
				$this->ajaxReturn($msg);
    		}
    		if($re!==false){
				$result = $Job->getOneJob($id,'job_master');
	    		$Olog = D('Operatelog');
				$d = array(
					'create_time' => date('Y-m-d H:i:s',time()),
					'controller' => CONTROLLER_NAME,
					'action' => ACTION_NAME,
					'name' => '【修改】job名称为:'.$i_name,
					'before' => serialize($result),
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
    	$re = $Job->getOneJob($id,'job_master');
    	$this->assign('sign','edit');
    	$this->assign('re',$re);
    	$this->assign('id',$id);
    	$this->assign('h_page',$p);
    	$this->assign('status_g',$status_g);
    	$this->assign('name_g',$name_g);
    	$this->assign('status',$status);
    	$this->display('add');
    }
    //修改 zheng 
    public function editDetail(){
    	$Job = D('Job');
    	$status = C('JOB_STATUS');
    	if(IS_GET){
    		$id = I('get.id','','int');
    	}
    	if(IS_POST){
    		$id = I('post.id','','int');
    		$i_comment = I('post.i_comment','','string');
    		//$i_name = I('post.i_name','','string');
    		$i_s_priority = I('post.i_s_priority','','int');
    		$i_status = I('post.i_status','','int');
    		$i_f_id = I('post.i_f_id','','int');
    		$i_cookie = I('post.i_cookie','','string');
    		$i_need = I('post.i_need','','int');
    		$i_repeat = I('post.i_repeat','','int');
    		$i_interval = I('post.i_interval','','int');
    		$i_h_conf = I('post.i_h_config','','string');
    		$i_route = I('post.i_route','','string');
    		$i_error_retry = I('post.i_error_retry',3,'int');
    		$i_timeout = I('post.i_timeout','','int');
    		$i_h_id = I('post.i_h_id','','int');
    		$i_q_name = I('post.i_q_name','','string');
    		$i_valid = I('post.i_valid','','int');
    		$is_deleted = 0;
    		$i_priority = $i_s_priority;
    		if($i_status==3){
    			$i_repeat = 0;
    			$is_deleted = 1;
    		}
    		$data = array(
				'job_comment' => $i_comment,
				//'job_name' => $i_name,
				'priority' => $i_priority,
				'suggest_priority' => $i_s_priority,
				'fetcher_id' => $i_f_id,
				'cookies' => $i_cookie,
				'need_proxy' => $i_need,
				'crawl_repeat' => $i_repeat,
				'repeat_interval' => $i_interval,
				'status' => $i_status,
				'is_deleted' => $is_deleted,
				'handler_conf' => $i_h_conf,
				'fetcher_route' => $i_route,
				'error_retry' =>$i_error_retry,
				'timeout' => $i_timeout,
				'handler_id' => $i_h_id,
				'queue_name' => $i_q_name,
				'valid_time' => $i_valid
			);
    		$re = $Job->setOneJobById(array('id'=>$id),$data);
			if($re!==false){
				$result = $Job->getOneJob($id);
	    		$Olog = D('Operatelog');
				$d = array(
					'create_time' => date('Y-m-d H:i:s',time()),
					'controller' => CONTROLLER_NAME,
					'action' => ACTION_NAME,
					'name' => '【修改】job名称为:'.$result['job_name'],
					'before' => serialize($result),
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
    	$re = $Job->getOneJobOnly(array('id'=>$id));
    	$this->assign('re',$re);
    	$this->assign('id',$id);
    	$this->assign('status',$status);
    	$this->display('edit');
    }
    //详情 zheng
    public function jobList(){
    	$Job = D('Job');
    	$Log = D('Log');
    	$status = C('JOB_STATUS');
		$type_d = C('DISPATCHER_TYPE');
		$type_s = C('SCHEDULER_TYPE');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
    		$id = I('get.id','1','int');
    		$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		$sign = I('get.sign',0,'int');
    	}
    	if($sign == 1){
    		$table = 'job_master';
    	}else{
    		$table = 'job';
    	}
		$re = $Job->getOneJob($id,$table);

		if($sign == 1){
			$result = $Job->getOneJobIds(array('sid'=>$id));
			foreach ($result as $key => $value) {
				$arr[] = $value['id'];
			}
			$data = array('stat_time'=> array(array('egt',$start),array('lt',$end)));
			if(count($arr)>1){
				$data['job_id'] = array('in',$arr);
			}else{
				$data['job_id'] = intval($arr[0]);
			}
			$f_re = $Log->getFetcherNumByJobId($data);
			$data['job_id'] = $id;
			$h_re = $Log->getHandlerNumByJobId($data);
		}else{
			$data = array('job_id'=>$id,'stat_time'=> array(array('egt',$start),array('lt',$end)));
			$f_re = $Log->getFetcherNumByJobId($data);
		}
    	$data = array('job_id'=>$id,'update_time'=>array(array('egt',$start),array('lt',$end)));
		$d_re = $Log->getDispatcherByJobId($data);
    	$s_re = $Log->getSchedulerByJobId($data);
    	$this->f_re= $f_re;
    	$this->h_re= $h_re;
    	$this->d_re= $d_re;
    	$this->s_re= $s_re;
    	$this->type_d = $type_d;
    	$this->type_s = $type_s;
    	$this->assign('id',$id);
		$this->assign('status',$status);
    	$this->assign('re',$re);
    	if($sign == 1){
    		$this->display('listsum');
    	}else{
    		$this->display('list');
    	}
    }
    public function ajaxList(){
    	$Log = D('Log');
    	$Job = D('Job');
    	$type_d = C('DISPATCHER_TYPE');
		$type_s = C('SCHEDULER_TYPE');
    	$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
    	if(IS_GET){
    		$id = I('get.id','1','int');
    		$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		$sign = I('get.sign',0,'int');
    	}
    	if($sign == 1){
			$result = $Job->getOneJobIds(array('sid'=>$id));
			foreach ($result as $key => $value) {
				$arr[] = $value['id'];
			}
			$data = array('stat_time'=>array(array('egt',$start),array('lt',$end)));
			if(count($arr)>1){
				$data['job_id'] = array('in',$arr);
			}else{
				$data['job_id'] = intval($arr[0]);
			}
			$f_re = $Log->getFetcherNumByJobId($data);
			$data['job_id'] = $id;
			$h_re = $Log->getHandlerNumByJobId($data);
		}else{
			$data = array('job_id'=>$id,'stat_time'=>array(array('egt',$start),array('lt',$end)));
			$f_re = $Log->getFetcherNumByJobId($data);
		}
    	$data2 = array('job_id'=>$id,'update_time'=>array(array('egt',$start),array('lt',$end)));
		$d_re = $Log->getDispatcherByJobId($data2);
    	$s_re = $Log->getSchedulerByJobId($data2);
    	$this->f_re = $f_re;
    	$this->h_re = $h_re;
    	$this->d_re = $d_re;
    	$this->s_re = $s_re;
    	$this->type_d = $type_d;
    	$this->type_s = $type_s;
    	layout(false);
    	$data['status'] = 1;
    	if($sign == 1){
    		$data['content'] = $this->fetch('Job/sumdetail');
    	}else{
    		$data['content'] = $this->fetch('Job/detail');
    	}
		
		$this->ajaxReturn($data);
    }
    //删除文件 zheng
    public function del_file($f){
		$file = C('PATH_UPLOAD');
		if(file_exists($file.$f)){
			unlink($file.$f);
		}
		$arr = explode('.', $f);
		if(file_exists($file.$arr[0])){
			$dh=opendir($file.$arr[0]);
			while ($file1=readdir($dh)) {
				if($file1!="." && $file1!="..") {
					$fullpath=$file.$arr[0]."/".$file1;
					if(!is_dir($fullpath)) {
				        unlink($fullpath);
				    }else{
				        del_file($fullpath);
				    }
				}	
			}
			closedir($dh);
			if(rmdir($file.$arr[0])) {
				return true;
			}else{
				return false;
			}
		}
    }
    //根据id修改状态 zheng
    public function setStatus(){
    	$Job = D('Job');
    	$data = array();
    	if(IS_POST){
    		$id = I('post.id','','int');
    		$status = I('post.status','','int');
    		$sign = I('post.sign',0,'int');
    		$data = array('status'=>$status);
    		$data['is_deleted'] = 0;
    		if($status == 3){
    			$data['is_deleted'] = 1;
    			$data['crawl_repeat'] = 0;
    		}
    	}
    	if($sign == 1){
    		$re = $Job->setOneJobById(array('id'=>$id),$data,'job_master');
    		$re = $Job->setOneJobById(array('sid'=>$id),$data);
    	}else{
    		$re = $Job->setOneJobById(array('id'=>$id),$data);
    	}
    	if($re!==false){
    		$re1 = $Job->getOneJob($id);
    		$data1 = array(
    			'status'=>$re1['status'],
    			'is_deleted' => $re1['is_deleted'],
    			'crawl_repeat' => $re1['crawl_repeat']
    		);
    		$i_name = $re1['job_name'];
    		$Olog = D('Operatelog');
			$d = array(
				'create_time' => date('Y-m-d H:i:s',time()),
				'controller' => CONTROLLER_NAME,
				'action' => ACTION_NAME,
				'name' => '【修改】修改状态,job名称为:'.$i_name,
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
    /*
    *测试对txt文件操作 zheng
    */
    public function test(){
    	$id = 42;
    	$opt = 'del';
    	$value = "http://index.baidu.com/?tpl=sentiment&word=%CE%A8%C6%B7%BB%E1";
    	$replace = 'http://index.baidu.com/?tpl=sentiment&word=%CE%A8%C6%B7%BB%E2';
    	$re = $this->setFileContent($id,$opt,$value);
    	print_r($re);
    }
    /*
    *对txt文件操作  zheng
    *$id 为主表id
    *$opt 为操作 add为添加  edit为修改 del为删除
    *$value 为value值
    *$replace 为替换的内容 只有在edit时使用
    *add时会在最后一个文件中插入一条数据
    */
    public function setFileContent($id,$opt,$value,$replace=''){
    	$Job = D('Job');
    	$Log = D('Logfile');
    	$path = C('PATH_UPLOAD');
    	$arr = array(
					'create_time' => date('Y-m-d H:i:s',time()),
					'controller' => CONTROLLER_NAME,
					'action' => ACTION_NAME,
					);
    	$id = I('post.id','','int');
    	$opt = I('post.opt','','string');
    	$value = I('post.value','','string');
    	$replace = I('post.replace','','string');
    	if(empty($id)){
    		$result = json_encode(array('status'=>'010101','msg'=>'id error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result; die;
    	}
    	if(!empty($opt)){
    		if($opt!='add'&&$opt!='edit'&&$opt!='del'){
    			$result = json_encode(array('status'=>'010102','msg'=>'opt type error'));
    			$arr['msg'] = serialize(array('result'=>$result));
    			$Log->addFileLog($arr);
    			echo $result;die;
    		}
    	}else{
    		$result = json_encode(array('status'=>'010103','msg'=>'opt error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result;die;
    	}
    	if(empty($value)){
    		$result = json_encode(array('status'=>'010104','msg'=>'value error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result;die;
    	}
    	if($opt == 'edit' && empty($replace)){
    		$result = json_encode(array('status'=>'010105','msg'=>'replace error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result;die;
    	}
    	$re = $Job->getOneJob($id,'job_master');
    	$url = $re['urls_file_path'];
    	$period_num = $re['period_num'];
    	if($period_num > 1){
    		$arr_r = explode('.', $url);
    		$url_file = $arr_r[0];
    		$file = $path.$url_file.'/';
    		if($opt == 'edit'||$opt == 'del'){
    			for($i=0;$i<$period_num;$i++){
	    			$dir = $file.$url_file.'_'.$i.'.txt';
	    			$con = file_get_contents($dir);
	    			if($opt == 'del'){
	    				$con2 = str_replace($value."\n",$replace,$con);
	    				$con1 = str_replace("\n".$value,$replace,$con2);
	    			}else{
	    				$con1 = str_replace($value,$replace,$con);
	    			}
	    			$data = file_put_contents($dir, $con1);
	    		}
	    		if($data>0){
	    			$result = json_encode(array('status'=>'00000','msg'=>'option is success'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}else{
	    			$result = json_encode(array('status'=>'010301','msg'=>'option is fail'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}
    		}else{
    			$i = $period_num-1;
    			$dir = $file.$url_file.'_'.$i.'.txt';
    			$file = fopen($dir,"a");
 				$data = fwrite($file,"\n".$value);
				fclose($file);
				if($data == false){
					$result = json_encode(array('status'=>'010301','msg'=>'option is fail'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}else{
					$result = json_encode(array('status'=>'00000','msg'=>'option is success'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}
    		}
    	}else{
    		$url = $path.$url;
    		if($opt == 'edit'||$opt == 'del'){
    			$con = file_get_contents($url);
    			if($opt == 'del'){
    				$con2 = str_replace($value."\n",$replace,$con);
	    			$con1 = str_replace("\n".$value,$replace,$con2);
    			}
				$con1 = str_replace($value,$replace,$con);
				$data = file_put_contents($url, $con1);
				if($data>0){
	    			$result = json_encode(array('status'=>'00000','msg'=>'option is success'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}else{
	    			$result = json_encode(array('status'=>'010301','msg'=>'option is fail'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}
    		}else{
    			$file = fopen($url,"a");
 				$data = fwrite($file,"\n".$value);
				fclose($file);
				if($data == false){
					$result = json_encode(array('status'=>'010301','msg'=>'option is fail'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}else{
					$result = json_encode(array('status'=>'00000','msg'=>'option is success'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}
    		}
    	}
    }
    /*
    *对txt文件操作  zheng
    *$id 为主表id
    *$opt 为操作 add为添加  edit为修改 del为删除
    *$value 为value值
    *$replace 为替换的内容 只有在edit时使用
    *add时会在每一个文件中同时插入一条数据
    */
    public function setFileContentAll($id,$opt,$value,$replace=''){
    	$Job = D('Job');
    	$Log = D('Logfile');
    	$path = C('PATH_UPLOAD');
    	$arr = array(
					'create_time' => date('Y-m-d H:i:s',time()),
					'controller' => CONTROLLER_NAME,
					'action' => ACTION_NAME,
					);
    	$id = I('post.id','','int');
    	$opt = I('post.opt','','string');
    	$value = I('post.value','','string');
    	$replace = I('post.replace','','string');
    	if(empty($id)){
    		$result = json_encode(array('status'=>'010101','msg'=>'id error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result;die;
    	}
    	if(!empty($opt)){
    		if($opt!='add'&&$opt!='edit'&&$opt!='del'){
    			$result = json_encode(array('status'=>'010102','msg'=>'opt type error'));
    			$arr['msg'] = serialize(array('result'=>$result));
    			$Log->addFileLog($arr);
    			echo $result;die;
    		}
    	}else{
    		$result = json_encode(array('status'=>'010103','msg'=>'opt error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result;die;
    	}
    	if(empty($value)){
    		$result = json_encode(array('status'=>'010104','msg'=>'value error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result;die;
    	}
    	if($opt == 'edit' && empty($replace)){
    		$result = json_encode(array('status'=>'010105','msg'=>'replace error'));
    		$arr['msg'] = serialize(array('result'=>$result));
    		$Log->addFileLog($arr);
    		echo $result;die;
    	}
    	$re = $Job->getOneJob($id,'job_master');
    	$url = $re['urls_file_path'];
    	$period_num = $re['period_num'];
    	if($period_num > 1){
    		$arr_r = explode('.', $url);
    		$url_file = $arr_r[0];
    		$file_r = $path.$url_file.'/';
    		if($opt == 'edit'||$opt == 'del'){
    			for($i=0;$i<$period_num;$i++){
	    			$dir = $file_r.$url_file.'_'.$i.'.txt';
	    			$con = file_get_contents($dir);
	    			if($opt == 'del'){
	    				$con2 = str_replace($value."\n",$replace,$con);
	    				$con1 = str_replace("\n".$value,$replace,$con2);
	    			}else{
	    				$con1 = str_replace($value,$replace,$con);
	    			}
	    			$data = file_put_contents($dir, $con1);
	    		}
	    		if($data>0){
	    			$result = json_encode(array('status'=>'000000','msg'=>'option is success'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}else{
	    			$result = json_encode(array('status'=>'010301','msg'=>'option is fail'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}
    		}else{
    			for($i=0;$i<$period_num;$i++){
	    			$dir = $file_r.$url_file.'_'.$i.'.txt';
	    			$file = fopen($dir,"a");
	 				$data = fwrite($file,"\n".$value);
	 				fclose($file);
	    		}
	    		if($data == false){
					$result = json_encode(array('status'=>'010301','msg'=>'operation is failled'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}else{
					$result = json_encode(array('status'=>'000000','msg'=>'option is success'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}
    		}
    	}else{
    		$url = $path.$url;
    		if($opt == 'edit'||$opt == 'del'){
    			$con = file_get_contents($url);
    			if($opt == 'del'){
    				$con2 = str_replace($value."\n",$replace,$con);
	    			$con1 = str_replace("\n".$value,$replace,$con2);
    			}
				$con1 = str_replace($value,$replace,$con);
				$data = file_put_contents($url, $con1);
				if($data>0){
	    			$result = json_encode(array('status'=>'000000','msg'=>'option is success'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}else{
	    			$result = json_encode(array('status'=>'010301','msg'=>'option is fail'));
	    			$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
	    			echo $result;die;
	    		}
    		}else{
    			$file = fopen($url,"a");
 				$data = fwrite($file,"\n".$value);
				fclose($file);
				if($data == false){
					$result = json_encode(array('status'=>'010301','msg'=>'option is fail'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}else{
					$result = json_encode(array('status'=>'00000','msg'=>'option is success'));
					$arr['msg'] = serialize(array('id'=>$id,'opt'=>$opt,'value'=>$value,'replace'=>$replace,'result'=>$result));
    				$Log->addFileLog($arr);
					echo $result;die;
				}
    		}
    	}
    }

}