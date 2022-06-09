<?php if (!defined('THINK_PATH')) exit();?><table class="table table-bordered">
    <thead>
      <tr>
      	<th>序号</th>
        <th>job_id</th>
        <th>job名称</th>
        <th>total</th>
        <th>type</th>
        <th>message</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach($re as $key=>$value){?>
		<tr>
			<td><?php echo $key+1;?></td>
			<td><?php echo $value['job_id'];?></td>
			<td><?php echo $value['job_name'];?></td>
			<td><?php echo $value['total']?></td>
			<td><?php echo $type[$value['type']];?></td>
			<td><?php echo $value['message']?></td>
			<td><a href='javascript:void(0)' onclick='detail(<?php echo $value['job_id'];?>,<?php echo $value['type'];?>)'>详情</a></td>
		</tr>
	<?php }?>
    </tbody>
  </table>
  <table class="table table-bordered" <?php if(empty($re_d)){?>style="display:none;"<?php }?>>
    <thead>
      <tr>
      	<th>序号</th>
        <th>job_id</th>
        <th>job名称</th>
        <th>total</th>
        <th>type</th>
        <th>message</th>
        <th>时间</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach($re_d as $key=>$value){?>
		<tr>
			<td><?php echo $key+1;?></td>
			<td><?php echo $value['job_id'];?></td>
			<td><?php echo $value['job_name'];?></td>
			<td><?php echo $value['total']?></td>
			<td><?php echo $type[$value['type']];?></td>
			<td><?php echo $value['message']?></td>
			<td><?php echo $value['time']?></td>
		</tr>
	<?php }?>
    </tbody>
  </table>
  <table class="table table-bordered" <?php if(empty($re_h)){?>style="display:none;"<?php }?>>
    <thead>
      <tr>
      	<th>序号</th>
        <th>job_id</th>
        <th>job名称</th>
        <th>total</th>
        <th>type</th>
        <th>message</th>
        <th>时间</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach($re_h as $key=>$value){?>
		<tr>
			<td><?php echo $key+1;?></td>
			<td><?php echo $value['job_id'];?></td>
			<td><?php echo $value['job_name'];?></td>
			<td><?php echo $value['total']?></td>
			<td><?php echo $type[$value['type']];?></td>
			<td><?php echo $value['message']?></td>
			<td><?php echo $value['time']?></td>
		</tr>
	<?php }?>
    </tbody>
  </table>