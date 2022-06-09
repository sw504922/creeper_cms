<?php if (!defined('THINK_PATH')) exit();?>	<?php if($sign==1){?>
		<?php foreach($re as $key=>$value){?>
			<tr <?php if($value['failed']>($value['total']-$value['failed'])){?>style='color:red;'<?php }?>>
				<td><?php echo $value['host_port']?></td>
				<td><?php echo $value['total']-$value['failed']?></td>
				<td><?php echo $value['failed']?></td>
				<td><?php echo $value['total'];?></td>
				<td><?php echo round(($value['total']-$value['failed'])/($value['total'])*100, 2)."%";?></td>
			</tr>
		<?php }?>
		<tr>
			<td>总汇</td>
			<td><?php echo $re_all[0]['total']-$re_all[0]['failed']?></td>
			<td><?php echo $re_all[0]['failed']?$re_all[0]['failed']:0;?></td>
			<td><?php echo $re_all[0]['total']?$re_all[0]['total']:0;?></td>
			<td><?php echo round(($re_all[0]['total']-$re_all[0]['failed'])/($re_all[0]['total'])*100, 2)."%";?></td>
		</tr>
	<?php }elseif($sign==2){?>
		<?php foreach($re as $key=>$value){?>
			<tr <?php if($value['failed']>($value['total']-$value['failed'])){?>style='color:red;'<?php }?>>
				<td><?php echo $value['job_name']?></td>
				<td><?php echo $value['job_id']?></td>
				<td><?php echo $value['total']-$value['failed']?></td>
				<td><?php echo $value['failed']?></td>
				<td><?php echo $value['total']?></td>
				<td><?php echo round(($value['total']-$value['failed'])/($value['total'])*100, 2)."%";?></td>
			</tr>
		<?php }?>
		<tr>
			<td>总汇</td>
			<td>-</td>
			<td><?php echo $re_all[0]['total']-$re_all[0]['failed']?></td>
			<td><?php echo $re_all[0]['failed']?$re_all[0]['failed']:0;?></td>
			<td><?php echo $re_all[0]['total']?$re_all[0]['total']:0;?></td>
			<td><?php echo round(($re_all[0]['total']-$re_all[0]['failed'])/($re_all[0]['total'])*100, 2)."%";?></td>
		</tr>
	<?php }?>