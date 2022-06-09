<?php
/**
 * 操作日志
 * User:zheng
 * Date:2014/07/24
 */
namespace Home\Model;
use Think\Model;

class OperatelogModel extends Model{
	protected $_auto = array(
		array('update_time','date',self::MODEL_BOTH,'function',array('Y-m-d H:i:s')), // 对update_time字段在插入和更新的时候写入当前时间戳
	);
	protected $trueTableName = 'operate_log';
	//添加一条数据
	public function addOperateInfo($data=array()){
		if($this->create($data)){
			$id = $this->add();
			//echo M()->getLastSql();die;
			return $id ? $id : 0; //0-未知错误，大于0-成功
		} else {
			return $this->getError(); 
		}
	}
	//根据条件获取所有的数据
	public function getOperateLog($data=array(),$page=1,$limit=10){
		$arr = $this->field('operate_log.id,operate_log.create_time,operate_log.name,operate_log.controller,operate_log.action,user.username')
					->join('RIGHT JOIN user ON operate_log.user_id =user.id')
					->where($data)
					->limit($page,$limit)
					->order('create_time desc')
					->select();
		//echo M()->getLastSql();
		return $arr;
	}
	//获取数量
	public function countLogs($data=array()){
		$arr = $this->field('operate_log.id')->join('RIGHT JOIN user ON operate_log.user_id =user.id')->where($data)->count();
		return $arr;
	}
	//获取一条日志
	public function getOperateLogOne($id){
		$arr = $this->field('id,name,controller,action,before,after')
					->where(array('id'=>$id))
					->find();
		//echo M()->getLastSql();
		return $arr;
	}
}