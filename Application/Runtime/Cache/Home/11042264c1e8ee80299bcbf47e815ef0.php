<?php if (!defined('THINK_PATH')) exit();?>	<?php if($sign==1){?>
		<?php foreach($re as $key=>$value){?>
			<tr <?php if($value['failed']>$value['success']){?>style='color:red;'<?php }?>>
				<td><?php echo $value['fetcher_name']?></td>
				<td><?php echo $value['success']?></td>
				<td><?php echo $value['failed']?></td>
				<td><?php echo $value['success']+$value['failed']?></td>
				<td><?php echo round($value['success']/($value['success']+$value['failed'])*100, 2)."%";?></td>
			</tr>
		<?php }?>
		<tr>
			<td>总汇</td>
			<td><?php echo $re_all[0]['success']?$re_all[0]['success']:0;?></td>
			<td><?php echo $re_all[0]['failed']?$re_all[0]['failed']:0;?></td>
			<td><?php echo $re_all[0]['success']+$re_all[0]['failed'];?></td>
			<td><?php echo round($re_all[0]['success']/($re_all[0]['success']+$re_all[0]['failed'])*100, 2)."%";?></td>
		</tr>
	<?php }elseif($sign==2||$sign==3){?>
		<?php foreach($re as $key=>$value){?>
			<tr <?php if($value['failed']>$value['success']){?>style='color:red;'<?php }?>>
				<td><?php echo $value['job_name']?></td>
				<td><?php echo $value['job_id']?></td>
				<td><?php echo $value['success']?></td>
				<td><?php echo $value['failed']?></td>
				<td><?php echo $value['success']+$value['failed']?></td>
				<td><?php echo round($value['success']/($value['success']+$value['failed'])*100, 2)."%";?></td>
			</tr>
		<?php }?>
		<tr>
			<td>总汇</td>
			<td>-</td>
			<td><?php echo $re_all[0]['success']?$re_all[0]['success']:0;?></td>
			<td><?php echo $re_all[0]['failed']?$re_all[0]['failed']:0;?></td>
			<td><?php echo $re_all[0]['success']+$re_all[0]['failed'];?></td>
			<td><?php echo round($re_all[0]['success']/($re_all[0]['success']+$re_all[0]['failed'])*100, 2)."%";?></td>
		</tr>
	<?php }?>