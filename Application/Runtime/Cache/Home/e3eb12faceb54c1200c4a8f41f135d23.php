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
    </tbody>
  </table>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>dispatcher</th>
        <th>来源</th>
        <th>数量</th>
      </tr>
    </thead>
    <tbody id="table_dispatcher">
    <?php foreach ($d_re as $key => $value) {?>
      <tr>
      <td><?php echo $key+1?></td>
      <td><?php echo $type_d[$value['type']];?></td>
      <td><?php echo $value['count'];?></td>
      </tr>
     <?php }?>
    </tbody>
  </table>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>scheduler</th>
        <th>来源</th>
        <th>数量</th>
      </tr>
    </thead>
    <tbody id="table_dispatcher">
    <?php foreach ($s_re as $key => $value) {?>
      <tr>
      <td><?php echo $key+1?></td>
      <td><?php echo $type_s[$value['type']];?></td>
      <td><?php echo $value['count'];?></td>
      </tr>
     <?php }?>
    </tbody>
  </table>