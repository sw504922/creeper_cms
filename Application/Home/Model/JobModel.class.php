<?php
/**
 * Job 管理页面
 * User:zheng
 * Date:2014/07/10
 */
namespace Home\Model;
use Think\Model;

class JobModel extends Model{
	protected $_auto = array(
		array('update_time','date',self::MODEL_BOTH,'function',array('Y-m-d H:i:s')), // 对update_time字段在插入和更新的时候写入当前时间戳
	);
	/**
	 * 添加一条新的job
	 * @param  array $data 要添加的数据的数组形式
	 * eg:array('job_comment'=>'taobao','priority'=>'2')
	 * @return integer          添加成功or失败
	 */
	public function addJob($data,$table='job'){
		if($this->table($table)->create($data)){
			$id = $this->add();
			//echo M()->getLastSql();die;
			return $id ? $id : 0; //0-未知错误，大于0-成功
		} else {
			return $this->getError(); 
		}
	}
	/**
	 * 查询符合条件的Job
	 * @param  array $data 要添加的数据的数组形式
	 * eg:array('job_comment'=>'taobao','priority'=>'2')
	 * @param  int $page 第几页
	 * @param  int $limit 每页条数
	 * @return array          
	 */
	public function getJobs($data=array(),$page=1,$limit=10,$table='job'){
		$arr = $this->field('id,update_time,job_comment,job_name,suggest_priority,urls_file_path,fetcher_id,cookies,need_proxy,crawl_repeat,repeat_interval,status,is_deleted,handler_conf,fetcher_route,is_period,period_num,period_interval,error_retry,timeout,handler_id,queue_name,valid_time')
					->table($table)
					->where($data)
					->limit($page,$limit)
					->order('update_time desc')
					->select();
		//echo M()->getLastSql();
		return $arr;
	}
	/**
	 * 查询符合条件的Job
	 * @param  array $data 要添加的数据的数组形式
	 * eg:array('job_comment'=>'taobao','priority'=>'2')
	 * @return array          
	 */
	public function getJobsLog($data=array()){
		$arr = $this->field('id,job_name')
					->table('job')
					->where($data)
					->select();
		//echo M()->getLastSql();
		return $arr;
	}
	/**
	 * 查询符合条件的Job总条数
	 * @param  array $data 要添加的数据的数组形式
	 * eg:array('job_comment'=>'taobao','priority'=>'2')
	 * @return int          
	 */
	public function countJobs($data=array(),$table='job'){
		$arr = $this->field('id')->table($table)->where($data)->count();
		//echo M()->getLastSql();
		return $arr;
	}
	/**
	 * 根据job_id查询一条记录job_master
	 * @param  int $id job_id
	 * @return array
	 */
	public function getOneJob($id,$table='job'){
		$arr = $this->field('id,update_time,job_comment,job_name,suggest_priority,urls_file_path,fetcher_id,cookies,need_proxy,crawl_repeat,repeat_interval,last_crawl_at,status,is_deleted,handler_conf,fetcher_route,is_period,period_num,period_interval,error_retry,timeout,handler_id,queue_name,valid_time')
					->table($table)
					->where(array('id'=>$id))
					->find();
		return $arr;
	}
	/**
	 * 根据job_id查询一条记录job
	 * @param  array $id job_id
	 * @return array
	 */
	public function getOneJobOnly($id,$table='job'){
		$arr = $this->field('id,update_time,job_comment,job_name,suggest_priority,urls_file_path,fetcher_id,cookies,need_proxy,crawl_repeat,repeat_interval,last_crawl_at,status,is_deleted,handler_conf,fetcher_route,is_period,period_num,period_interval,sid,error_retry,timeout,handler_id,queue_name,valid_time')
					->table($table)
					->where($id)
					->find();
		return $arr;
	}
	/**
	 * 根据job_id查询符合条件的记录job
	 * @param  array $id job_id
	 * @return array
	 */
	public function getOneJobIds($id,$table='job'){
		$arr = $this->field('id')
					->table($table)
					->where($id)
					->select();
		return $arr;
	}
	/**
	 * 根据job_id修改一条记录
	 * @param  array $id array('id'=>job_id)
	 * @return int
	 */
	public function setOneJobById($id,$data,$table='job'){
		$re = $this->table($table)->where($id)->save($data);
		//echo M()->getLastSql();
		return $re;
	}
	/**
	 * 根据job_id删除一条记录
	 * @param  int $id job_id
	 * @return int
	 */
	public function delOneJobById($id){
		$re = M("job")->where(array('sid'=>$id))->delete();
		//echo M()->getLastSql();
		return $re;
	}
	
}