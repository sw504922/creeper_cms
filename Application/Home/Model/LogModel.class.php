<?php
/**
 * Log 管理页面的Model
 * User:zheng
 * Date:2014/07/17
 */
namespace Home\Model;
use Think\Model;

class LogModel extends Model {	
	protected $_auto = array (
	//TP是根据data是否提交了主键（id）来判断self::MODEL_INSERT或者self::MODEL_UPDATE
	//对created_at字段在需要自己定义
	array('update_time','date',self::MODEL_BOTH,'function',array('Y-m-d H:i:s')), // 对update_time字段在插入和更新的时候写入当前时间戳
	);
	//根据jobid获取Fetcher数据和
	public function getFetcherNumByJobId($data=array()){
		$re = $this->field('sum(success) as success, sum(failed) as failed')->table('fetcher_stat')->where($data)->select();
		//echo M()->getLastSql();
		return $re;
	}
	//根据jobid获取Handler数据和
	public function getHandlerNumByJobId($data=array()){
		$re = $this->field('sum(total) as total, sum(failed) as failed')->table('handler_stat')->where($data)->select();
		//echo M()->getLastSql();
		return $re;
	}
	//根据jobid获取Dispatcher数据和
	public function getDispatcherByJobId($data=array()){
		$re = $this->field('type,sum(count) as count')->table('dispatcher_stat')->where($data)->group('type')->select();
		//echo M()->getLastSql();
		return $re;
	}
	//根据jobid获取Scheduler数据和
	public function getSchedulerByJobId($data=array()){
		$re = $this->field('type,sum(count) as count')->table('scheduler_stat')->where($data)->group('type')->select();
		//echo M()->getLastSql();
		return $re;
	}
	//获取fetcher的数据
	public function getFetcherNum($data,$group='host_port',$page='1',$limit='10'){
		$re = $this->field('host_port, job_id,fetcher_name, job_name, stat_time, sum(success) as success, sum(failed) as failed')
				   ->table('fetcher_stat')
				   ->where($data)
				   //->limit($page,$limit)
				   ->group($group)
				   ->select();
				  // echo M()->getLastSql();
		return $re;
	}
	//获取handler的数据
	public function getHandlerNum($data,$group='host_port',$page='1',$limit='10'){
		$re = $this->field('host_port, job_id, job_name, sum(total) as total, sum(failed) as failed,stat_time')
				   ->table('handler_stat')
				   ->where($data)
				   //->limit($page,$limit)
				   ->group($group)
				   ->select();
				   //echo M()->getLastSql();
		return $re;
	}
	//获取dispatcher的数据
	public function getDispatcherNum($data,$group='dispatcher_stat.job_id,dispatcher_stat.type',$page='1',$limit='10'){
		$re = $this->field('dispatcher_stat.update_time as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name')
					->table('dispatcher_stat')
				   ->join('RIGHT JOIN job ON dispatcher_stat.job_id =job.id') 
				   ->where($data)
				   //->limit($page,$limit)
				   ->group($group)
				   ->select();
				   //echo M()->getLastSql();
		return $re;
	}
	//获取scheduler的数据
	public function getSchedulerNum($data,$group='scheduler_stat.job_id,scheduler_stat.type',$page='1',$limit='10'){
		$re = $this->field('scheduler_stat.update_time as time, scheduler_stat.job_id, sum(scheduler_stat.count) as total, scheduler_stat.message, scheduler_stat.type,job.job_name')
					->table('scheduler_stat')
				   ->join('RIGHT JOIN job ON scheduler_stat.job_id =job.id') 
				   ->where($data)
				   //->limit($page,$limit)
				   ->group($group)
				   ->select();
				   //echo M()->getLastSql();
		return $re;
	}
	//获取dispatcher的数据
	public function getDispatcherNumList($data,$field='from_unixtime(unix_timestamp(dispatcher_stat.update_time),"%Y-%m-%d %H") as time ,dispatcher_stat.job_id, sum(dispatcher_stat.count) as total, dispatcher_stat.message, dispatcher_stat.type,job.job_name',$group='time',$order='time desc',$page='1',$limit='10'){
		$re = $this->field($field)
					->table('dispatcher_stat')
				   ->join('RIGHT JOIN job ON dispatcher_stat.job_id =job.id') 
				   ->where($data)
				   //->limit($page,$limit)
				   ->order($order)
				   ->group($group)
				   ->select();
				  //echo M()->getLastSql();
		return $re;
	}
	//获取Scheduler的数据
	public function getSchedulerNumList($data,$field='from_unixtime(unix_timestamp(scheduler_stat.update_time),"%Y-%m-%d %H") as time ,scheduler_stat.job_id, sum(scheduler_stat.count) as total, scheduler_stat.message, scheduler_stat.type,job.job_name',$group='time',$order='time desc',$page='1',$limit='10'){
		$re = $this->field($field)
					->table('scheduler_stat')
				   ->join('RIGHT JOIN job ON scheduler_stat.job_id =job.id') 
				   ->where($data)
				   //->limit($page,$limit)
				   ->order($order)
				   ->group($group)
				   ->select();
				  //echo M()->getLastSql();
		return $re;
	}
}