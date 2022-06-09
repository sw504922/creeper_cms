<?php if (!defined('THINK_PATH')) exit();?><table class="table table-bordered">
    <thead>
      <tr>
        <th width="3%">id</th>
        <th width="10%">job名称</th>
        <th width="10%">job描述</th>
        <th width="8%">代理</th>
        <th width="8%">重复抓取</th>
        <th width="6%">优先级</th>
        <th width="10%">状态</th>
        <th width="15%">修改时间</th>
        <th width="30%">操作</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($re as $val){?>
      <tr>
        <td><?php echo $val['id'];?></td>
        <td><?php echo $val['job_name']?$val['job_name']:'-';?></td>
        <td><?php echo $val['job_comment']?$val['job_comment']:'-';?></td>       
        <td><?php echo $val['need_proxy']==1?'外源代理':($val['need_proxy']==2?'内源代理':'否');?></td>
        <td><?php echo $val['crawl_repeat']==1?'是':'否';?></td>
        <td><?php echo $val['suggest_priority'];?></td>
        <td>
        <div class="open_d"><span><?php echo $status[$val['status']];?></span>
        <div class="widget-box">
                  <div class="widget-header">
                    <h6>修改状态</h6>
                    <span class="widget-toolbar">
                        <a data-action="close" href="javascript:void(0)">
                          <i class="icon-remove"></i>
                        </a>
                      </span>
                  </div><div class="widget-body">
                    <div class="widget-main no-padding">
                      <div class="row-fluid row_bg">
                          <label for="form-field-select-1">编辑</label>
                          <select id="e_status_<?php echo $val['id'];?>">
                            <option value='0' <?php if($val['status']==0){?>selected<?php }?>>新任务</option>
                            <option value='1' <?php if($val['status']==1){?>selected<?php }?>>处理中</option>              
                            <option value='2' <?php if($val['status']==2){?>selected<?php }?>>结束</option>
                            <option value='3' <?php if($val['status']==3){?>selected<?php }?>>删除</option>
                            <option value='4' <?php if($val['status']==4){?>selected<?php }?>>调整优先级</option>              
                            <option value='5' <?php if($val['status']==5){?>selected<?php }?>>未开始</option>
                            <option value='6' <?php if($val['status']==6){?>selected<?php }?>>重置</option>
                            <option value='7' <?php if($val['status']==7){?>selected<?php }?>>定时任务</option>
                          </select>
                        </div>
                        <div class="form-actions center">
                          <button class="btn btn-small btn-success" onclick="edit_status(<?php echo $val['id'];?>)">
                            保存
                            <i class="icon-arrow-right icon-on-right bigger-110"></i>
                          </button>
                        </div>
                    </div>
                  </div>
                </div>
         </div>
        </td>
        <td><?php echo $val['update_time'];?></td>
        <td>
       <button type="button" class="btn btn-primary btn-xs" onclick='c_edit(<?php echo $val['id']?>)'>编辑</button>
        <button type="button" class="btn btn-info btn-xs" onclick='c_list(<?php echo $val['id'];?>)'>详情</button>
        <button type="button" class="btn btn-success btn-xs" onclick='c_status(<?php echo $val['id'];?>,3)'>删除</button>
        <button type="button" class="btn btn-warning btn-xs" onclick='c_status(<?php echo $val['id'];?>,6)'>重置</button></td>
      </tr>
      <?php }?>
    </tbody>
  </table>
 <?php echo $show;?>