<?php if (!defined('THINK_PATH')) exit();?><table class="table table-bordered">
    <thead>
      <tr>
        <th>名称</th>
        <th>success</th>
        <th>failed</th>
        <th>total</th>
      </tr>
    </thead>
    <tbody id="table_dispatcher">
    <tr>
      <td>fetcher</td>
      <td><?php echo $f_re[0]['success']?$f_re[0]['success']:0;?></td>
      <td><?php echo $f_re[0]['failed']?$f_re[0]['failed']:0;?></td>
      <td><?php echo $f_re[0]['success']+$f_re[0]['failed'];?></td>
    </tr>
    <tr>
      <td>handler</td>
     <td><?php echo $h_re[0]['total']-$h_re[0]['failed'];?></td>
      <td><?php echo $h_re[0]['failed']?$h_re[0]['failed']:0;?></td>
      <td><?php echo $h_re[0]['total']?$h_re[0]['total']:0;?></td>
    </tr>
    </tbody>
</table>