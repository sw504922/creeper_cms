<?php
/**
 * 操作日志
 * User:zheng
 * Date:2014/07/24
 */
namespace Home\Model;
use Think\Model;

class LogfileModel extends Model{
	protected $_auto = array(
		array('update_time','date',self::MODEL_BOTH,'function',array('Y-m-d H:i:s')), // 对update_time字段在插入和更新的时候写入当前时间戳
	);
	protected $trueTableName = 'log_file';
	public function addFileLog($data){
		if($this->create($data)){
			$id = $this->add();
			//echo M()->getLastSql();die;
			return $id ? $id : 0; //0-未知错误，大于0-成功
		} else {
			return $this->getError(); 
		}
	}
}