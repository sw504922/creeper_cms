<?php
/**
 * Created by PhpStorm.
 * User: zheng
 * Date:  7/17/14
 * Time: 5:07 PM
 */
namespace Home\Controller;
use Think\Controller;
use Think\Model;


class LogController extends Controller {
	private $limit = 10;
	//fecher列表页  zheng
	public function indexFetcher(){
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$status = I('get.status','2','int');
			$name = I('get.name');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$page = I('get.p','1','int');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
		}
		$data = array('stat_time'=>array(array('egt',$start),array('lt',$end)));
		if($status ==1){
			if(!empty($name)){
				$data['host_port'] = $name;
			}
			$group = 'host_port';
		}elseif($status ==2){
			if(!empty($name)){
				$data['job_name'] = array('like','%'.$name.'%');
			}
			$group = 'job_name';
		}
		$re = $Log->getFetcherNum($data,$group,$page);
		$re_all = $Log->getFetcherNum($data,'');
		$this->re = $re;
		$this->re_all = $re_all;
		$this->sign = $status;
		$this->display('Log/fetcher');
	}
	//fecher列表页ajax  zheng
	public function getDataFecther() {
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$status = I('get.status','2','int');
			$name = I('get.name');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$page = I('get.p','1','int');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
		}
		$data1 = array('stat_time'=>array(array('egt',$start),array('lt',$end)));
		if($status ==1){
			if(!empty($name)){
				$data1['fetcher_name'] = array('like','%'.$name.'%');
			}
			$group = 'host_port';
		}elseif($status ==2){
			if(!empty($name)){
				$data1['job_name'] = array('like','%'.$name.'%');
			}
			$group = 'job_name';
		}elseif($status==3){
			if(!empty($name)){
				$data1['job_id'] = array('like','%'.$name.'%');
			}
			$group = 'job_id';
		}
		$re = $Log->getFetcherNum($data1,$group,$page);
		$re_all = $Log->getFetcherNum($data1,'');
		//print_r($re);
		$this->re = $re;
		$this->re_all = $re_all;
		$this->sign = $status;
		layout(false);
		$data['status'] = 1;
		$data['content'] = $this->fetch('Log/fetcher_detail');
		$this->ajaxReturn($data);	
	}
	//时间轴数据 zheng
	public function getDataFectherByTime(){
		$Log = D('log');
		$Job = D('job');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$status = I('get.status','1','int');
			$name = I('get.name');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		if($start==''){
				$start = $timestart;
			} 
    		$end = I('get.end',$timeend,'string');
    		if($end==''){
				$end = $timeend;
			} 
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
		}
		$data1 = array('stat_time'=>array(array('egt',$start),array('lt',$end)));
		$group = 'stat_time';
		if($status ==1){
			if(!empty($name)){
				$data1['fetcher_name'] = array('like','%'.$name.'%');
			}
		}elseif($status ==2){
			if(!empty($name)){
				$data1['job_name'] = array('like','%'.$name.'%');
			}
		}elseif($status==3){
			if(!empty($name)){
				$data1['job_id'] = array('like','%'.$name.'%');
			}
		}elseif($status == -1){
			$result = $Job->getOneJobIds(array('sid'=>$name));
			foreach ($result as $key => $value) {
				$arr_s[] = $value['id'];
			}
			if(count($arr)>1){
				$data1['job_id'] = array('in',$arr_s);
			}else{
				$data1['job_id'] = intval($arr_s[0]);
			}
		}
		$high = $Log ->getFetcherNum($data1,$group);
		if($high){
			foreach ($high as $key => $value) {
				$suc = array();
				$suc[] = strtotime($value['stat_time'])*1000;
				$suc[] = intval($value['success']);
				$arr[] = $suc;
				$fail = array();
				$fail[] = strtotime($value['stat_time'])*1000;
				$fail[] = intval($value['failed']);
				$arr1[] = $fail;
				$total = array();
				$total[] = strtotime($value['stat_time'])*1000;
				$total[] = intval($value['success'])+intval($value['failed']);
				$arr2[] = $total; 
			}
			$curve = array(array('name'=>'success','data'=>$arr),array('name'=>'failed','data'=>$arr1),array('name'=>'total','data'=>$arr2));
			$data['curve'] = $curve;
			$data['status'] = 1;
		}else{
			$data['status'] = 0;
		}
		
		$this->ajaxReturn($data);
	}
	//handler列表页 zheng
	public function indexHandler() {
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$status = I('get.status','2','int');
			$name = I('get.name');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
		}
		$data = array('stat_time'=>array(array('egt',$start),array('lt',$end)));
		if($status ==1){
			if(!empty($name)){
				$data['host_port'] = $name;
			}
			$group = 'host_port';
		}elseif($status ==2){
			if(!empty($name)){
				$data['job_name'] = array('like','%'.$name.'%');
			}
			$group = 'job_name';
		}
		$re = $Log->getHandlerNum($data,$group,$page);
		$re_all = $Log->getHandlerNum($data,'');
		$this->re = $re;
		$this->re_all = $re_all;
		$this->sign = $status;
		$this->display('Log/handler');
	}
	//handler列表页ajax zheng
	public function getDataHandler(){
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$status = I('get.status','2','int');
			$name = I('get.name');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
		}
		$data1 = array('stat_time'=>array(array('egt',$start),array('lt',$end)));
		if($status ==1){
			if(!empty($name)){
				$data1['host_port'] = $name;
			}
			$group = 'host_port';
		}elseif($status ==2){
			if(!empty($name)){
				$data1['job_name'] = array('like','%'.$name.'%');
			}
			$group = 'job_name';
		}
		$re = $Log->getHandlerNum($data1,$group,$page);
		$re_all = $Log->getHandlerNum($data1,'');
		$this->re = $re;
		$this->re_all = $re_all;
		$this->sign = $status;
		layout(false);
		$data['status'] = 1;
		$data['content'] = $this->fetch('Log/handler_detail');
		$this->ajaxReturn($data);
	}
	//时间轴数据zheng
	public function getDataHandlerByTime(){
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$start = I('get.start',$timestart,'string');
			if($start==''){
				$start = $timestart;
			} 
    		$end = I('get.end',$timeend,'string');
    		if($end==''){
				$end = $timeend;
			} 
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		$status = I('get.status','2','int');
			$name = I('get.name');
		}
		$data1 = array('stat_time'=>array(array('egt',$start),array('lt',$end)));
		$group = 'stat_time';
		if($status ==1){
			if(!empty($name)){
				$data1['host_port'] = array('like','%'.$name.'%');
				$group .= ',host_port';
			}
			
		}elseif($status ==2){
			if(!empty($name)){
				$data1['job_name'] = array('like','%'.$name.'%');
				$group .= ',job_name';
			}
		}elseif($status == -1){
			$data1['job_id'] = $name;
		}
		$high = $Log ->getHandlerNum($data1,$group);
		if($high){
			foreach ($high as $key => $value) {
				$suc = array();
				$suc[] = strtotime($value['stat_time'])*1000;
				$suc[] = intval($value['total'])-intval($value['failed']);
				$arr[] = $suc;
				$fail = array();
				$fail[] = strtotime($value['stat_time'])*1000;
				$fail[] = intval($value['failed']);
				$arr1[] = $fail;
				$total = array();
				$total[] = strtotime($value['stat_time'])*1000;
				$total[] = intval($value['total']);
				$arr2[] = $total; 
			}
			$curve = array(array('name'=>'success','data'=>$arr),array('name'=>'failed','data'=>$arr1),array('name'=>'total','data'=>$arr2));
			$data['curve'] = $curve;
			$data['status'] = 1;
		}else{
			$data['status'] = 0;
		}
		
		$this->ajaxReturn($data);
	}
	//scheduler列表 zheng
	public function indexScheduler() {
		$type_s = C('SCHEDULER_TYPE');
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
    	$sign = 0;
    	$re_d = array();
    	$re_h = array();
    	$group = 'scheduler_stat.type,time';
		if(IS_GET){
			$status = I('get.i_status','-100','int');
			$name = I('get.i_name');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		if(strtotime($end)-strtotime($start)>=259200){
    			$sign = 0;
    		}else{
    			$sign = 1;
    		}
		}
		$data = array('scheduler_stat.create_time'=>array(array('egt',$start),array('lt',$end)));
		if($status != -100){
			$data['scheduler_stat.type'] = $status;
			$group = 'time';
		}
		if(!empty($name)){
			$data['job.job_name'] = array('like','%'.$name.'%');
			$field='from_unixtime(unix_timestamp(scheduler_stat.update_time),"%Y-%m-%d") as time ,scheduler_stat.job_id, sum(scheduler_stat.count) as total, scheduler_stat.message, scheduler_stat.type,job.job_name';
			$re_d = $Log->getDispatcherNumList($data,$field,$group);
			if($sign==1){
				$field='from_unixtime(unix_timestamp(scheduler_stat.update_time),"%Y-%m-%d %H") as time ,scheduler_stat.job_id, sum(scheduler_stat.count) as total, scheduler_stat.message, scheduler_stat.type,job.job_name';
				$re_h = $Log->getDispatcherNumList($data,$field,$group);
			}
		}
		$re = $Log->getSchedulerNum($data);
		$this->re = $re;
		$this->re_d = $re_d;
		$this->re_h = $re_h;
		$this->type = $type_s;
		$this->display('Log/scheduler');
	}
	//ajax zheng
	public function getDataScheduler() {
		$type_s = C('SCHEDULER_TYPE');
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
    	$sign = 0;
    	$re_d = array();
    	$re_h = array();
    	$group = 'scheduler_stat.type,time';
		if(IS_GET){
			$start = I('get.start',$timestart,'string');
			if($start==''){
				$start = $timestart;
			} 
    		$end = I('get.end',$timeend,'string');
    		if($end==''){
				$end = $timeend;
			} 
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		if(strtotime($end)-strtotime($start)>=259200){
    			$sign = 0;
    		}else{
    			$sign = 1;
    		}
    		$status = I('get.i_status','-100','int');
			$name = I('get.i_name');
		}
		$data = array('scheduler_stat.create_time'=>array(array('egt',$start),array('lt',$end)));
		if($status != -100){
			$data['scheduler_stat.type'] = $status;
			$group = 'time';
		}
		if(!empty($name)){
			$data['job.job_name'] = array('like','%'.$name.'%');
			$field='from_unixtime(unix_timestamp(scheduler_stat.update_time),"%Y-%m-%d") as time ,scheduler_stat.job_id, sum(scheduler_stat.count) as total, scheduler_stat.message, scheduler_stat.type,job.job_name';
			$re_d = $Log->getSchedulerNumList($data,$field,$group);
			if($sign==1){
				$field='from_unixtime(unix_timestamp(scheduler_stat.update_time),"%Y-%m-%d %H") as time ,scheduler_stat.job_id, sum(scheduler_stat.count) as total, scheduler_stat.message, scheduler_stat.type,job.job_name';
				$re_h = $Log->getSchedulerNumList($data,$field,$group);
			}
		}
		$re = $Log->getSchedulerNum($data);
		$this->re_d = $re_d;
		$this->re_h = $re_h;
		$this->re = $re;
		$this->type = $type_s;
		layout(false);
    	$datar['status'] = 1;
    	$datar['content'] = $this->fetch('Log/scheduler_detail');
		$this->ajaxReturn($datar);
	}
	//zheng
	public function indexDispatcher() {
		$type_d = C('DISPATCHER_TYPE');
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
    	$sign = 0;
    	$re_d = array();
    	$re_h = array();
    	$group = 'dispatcher_stat.type,time';
		if(IS_GET){
			$status = I('get.i_status','-100','int');
			$name = I('get.i_name');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		if(strtotime($end)-strtotime($start)>=259200){
    			$sign = 0;
    		}else{
    			$sign = 1;
    		}
		}

		$data = array('dispatcher_stat.create_time'=>array(array('egt',$start),array('lt',$end)));
		if($status != -100){
			$data['dispatcher_stat.type'] = $status;
			$group = 'time';
		}
		if(!empty($name)){
			$data['job.job_name'] = array('like','%'.$name.'%');
			$field='from_unixtime(unix_timestamp(dispatcher_stat.update_time),"%Y-%m-%d") as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name';
			$re_d = $Log->getSchedulerNumList($data,$field,$group);
			if($sign==1){
				$field='from_unixtime(unix_timestamp(dispatcher_stat.update_time),"%Y-%m-%d %H") as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name';
				$re_h = $Log->getSchedulerNumList($data,$field,$group);
			}
		}
		$re = $Log->getDispatcherNum($data);
		$this->re = $re;
		$this->re_d = $re_d;
		$this->re_h = $re_h;
		$this->type = $type_d;
		$this->display('Log/dispatcher');
	}
	//zheng
	public function getDataDispatcher(){
		$type_d = C('DISPATCHER_TYPE');
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
    	$sign = 0;
    	$re_d = array();
    	$re_h = array();
    	$group = 'dispatcher_stat.type,time';
		if(IS_GET){
			$start = I('get.start',$timestart,'string');
			if($start==''){
				$start = $timestart;
			} 
    		$end = I('get.end',$timeend,'string');
    		if($end==''){
				$end = $timeend;
			} 

    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		if(strtotime($end)-strtotime($start)>=259200){
    			$sign = 0;
    		}else{
    			$sign = 1;
    		}
    		$status = I('get.i_status','-100','int');
			$name = I('get.i_name');
		}
		$data = array('dispatcher_stat.create_time'=>array(array('egt',$start),array('lt',$end)));
		if($status != -100){
			$data['dispatcher_stat.type'] = $status;
			$group = 'time'; 
		}
		if(!empty($name)){
			$data['job.job_name'] = array('like','%'.$name.'%');
			$field='from_unixtime(unix_timestamp(dispatcher_stat.update_time),"%Y-%m-%d") as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name';
			$re_d = $Log->getDispatcherNumList($data,$field,$group);
			if($sign==1){
				$field='from_unixtime(unix_timestamp(dispatcher_stat.update_time),"%Y-%m-%d %H") as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name';
				$re_h = $Log->getDispatcherNumList($data,$field,$group);
			}
		}
		$re = $Log->getDispatcherNum($data);
		$this->re = $re;
		$this->re_d = $re_d;
		$this->re_h = $re_h;
		$this->type = $type_d;
		layout(false);
    	$datar['status'] = 1;
    	$datar['content'] = $this->fetch('Log/dispatcher_detail');
		$this->ajaxReturn($datar);
	}
	//zheng
	public function indexDispatcherList() {
		$type_d = C('DISPATCHER_TYPE');
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$job_id = I('get.job_id','','int');
			$type = I('get.type');
			$start = I('get.start',$timestart,'string');
    		$end = I('get.end',$timeend,'string');
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
		}
		$data = array('dispatcher_stat.job_id'=>$job_id,'dispatcher_stat.type'=>$type,'dispatcher_stat.create_time'=>array(array('egt',$start),array('lt',$end)));
		$re = $Log->getDispatcherNumList($data);
		$field='from_unixtime(unix_timestamp(dispatcher_stat.update_time),"%Y-%m-%d") as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name';
		$re_d = $Log->getDispatcherNumList($data,$field);
		$this->re_d = $re_d; 
		$this->re = $re;
		$this->type_id = $type;
		$this->type = $type_d;
		$this->job_id = $job_id;
		$this->display('Log/dispatcher_list');
	}
	//zheng
	public function getDataDispatcherList(){
		$type_d = C('DISPATCHER_TYPE');
		$Log = D('log');
		$timeend = date('Y-m-d H:i:s',time());
    	$timestart = date('Y-m-d H:i:s',time()-86400);
		if(IS_GET){
			$start = I('get.start',$timestart,'string');
			if($start==''){
				$start = $timestart;
			} 
    		$end = I('get.end',$timeend,'string');
    		if($end==''){
				$end = $timeend;
			} 
    		$start = date('Y-m-d H:i:s',strtotime($start));
    		$end = date('Y-m-d H:i:s',strtotime($end));
    		$job_id = I('get.job_id','','int');
			$type = I('get.type');
		}
		$data = array('dispatcher_stat.job_id'=>$job_id,'dispatcher_stat.type'=>$type,'dispatcher_stat.create_time'=>array(array('egt',$start),array('lt',$end)));
		$group = 'dispatcher_stat.update_time';
		$re = $Log->getDispatcherNum($data,$group);
		$field='from_unixtime(unix_timestamp(dispatcher_stat.update_time),"%Y-%m-%d") as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name';
		$re_d = $Log->getDispatcherNumList($data,$field);
		$this->re_d = $re_d; 
		$this->re = $re;
		$this->type_id = $type;
		$this->type = $type_d;
		$this->job_id = $job_id;
		layout(false);
    	$datar['status'] = 1;
    	$datar['content'] = $this->fetch('Log/dispatcher_detail_list');
		$this->ajaxReturn($datar);
	}

}