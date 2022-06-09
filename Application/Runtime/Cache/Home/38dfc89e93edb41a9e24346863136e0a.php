<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>爬虫管理系统</title>
<link rel="stylesheet" href="/creeper_cms/Public/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="/creeper_cms/Public/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="/creeper_cms/Public/css/ace.min.css" type="text/css" />
<link rel="stylesheet" href="/creeper_cms/Public/css/datepicker.css" type="text/css" />
<link rel="stylesheet" href="/creeper_cms/Public/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="/creeper_cms/Public/css/page.css" type="text/css" />
<script type="text/javascript" src="/creeper_cms/Public/js/lib/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/creeper_cms/Public/js/lib/highcharts.js"></script>
<script type="text/javascript" src="/creeper_cms/Public/js/lib/exporting.js"></script>
<script type="text/javascript" src="/creeper_cms/Public/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/creeper_cms/Public/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/creeper_cms/Public/js/bootstrap-timepicker.js"></script>
<script type="text/javascript" src="/creeper_cms/Public/js/ajaxfileupload.js"></script>

</head>
<body>
<div class="header">
<div class="minheader">
<div class="logo"><span class="icon-tasks"></span>后台管理系统</div>
<ul class="nav" id='nav'>
<li>Job管理<span class="icon-caret-down1"></span>
<ul>
<li><a href='./index.php?m=&c=Job&a=index'>Job列表</a></li>
<li><a href='./index.php?m=&c=Job&a=add'>Job添加</a></li>
</ul>
</li>
<li>分块日志<span class="icon-caret-down1"></span>
<ul>
<li><a href='./index.php?m=&c=Log&a=indexScheduler'>scheduler日志</a></li>
<li><a href='./index.php?m=&c=Log&a=indexDispatcher'>dispatcher日志</a></li>
<li><a href='./index.php?m=&c=Log&a=indexFetcher'>fetcher日志</a></li>
<li><a href='./index.php?m=&c=Log&a=indexHandler'>handler日志</a></li>
</ul></li>
<li>Redis管理<span class="icon-caret-down1"></span>
<ul>
<li><a href='./index.php?m=&c=Redis&a=index'>Redis列表</a></li>
<li><a href='./index.php?m=&c=Redis&a=add'>Redis添加</a></li>
</ul>
</li>
<li>操作日志<span class="icon-caret-down1"></span>
<ul>
<li><a href='./index.php?m=&c=Operatelog&a=index'>操作日志</a></li>
</ul>
</li>
</ul>
</div>
</div>
	<!-- /头部 -->
		 <!-- 模板填充 -->
	  	<div class="table-responsive table_box">
<div style="margin-bottom:10px;">
  <div class="col-xs-3">
    <label>名称：</label>
    <input type="text" class="form-control"  placeholder="" id='i_name' name='i_name' value='<?php echo $i_name?$i_name:'';?>'>
  </div>
  <div class="col-xs-3">
  <label >添加人：</label>
    <input type="text" class="form-control"  placeholder="" id='i_user' name='i_user' value=''>
  </div>
<button type="button" class="btn btn-primary btn-submit" style="margin-top:25px;" id='search'>搜&nbsp;索</button>
</div>
<div style="clear:both"></div>
<div id="table_job" style='width:1000px;'>
  
   <table class="table table-bordered">
    <thead>
      <tr>
        <th width="10%">id</th>
        <th width="30%">名称</th>
        <th width="10%">controller</th>
        <th width="10%">action</th>
        <th width="10%">操作者</th>
        <th width="20%">操作时间</th>
        <th width="10%">操作</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($re as $val){?>
      <tr>
        <td><?php echo $val['id'];?></td>
        <td><?php echo $val['name'];?></td>   
        <td><?php echo $val['controller'];?></td>
        <td><?php echo $val['action'];?></td>
        <td><?php echo $val['username'];?></td>
        <td><?php echo $val['create_time'];?></td>
        <td>
       <button type="button" class="btn btn-primary btn-xs" onclick='c_edit(<?php echo $val['id']?>)'>详情</button></td>
      </tr>
      <?php }?>
    </tbody>
  </table>
 <?php echo $show;?>
   
</div>
</div>
<script type="text/javascript">
$('#search').click(function(){
  var i_name = $('#i_name').val();
  var i_user = $('#i_user').val();
  var info = '&i_name='+i_name+'&i_user='+i_user+'&p=1';
  $.get('index.php?m=&c=Operatelog&a=logAjax',info, function(data){
        if(data.status == 1){
          $('#table_job').html(data.content);
        }else{
          alert(data.msg);
        }
     })
})
function click_page(page){
  var i_name = $('#i_name').val();
  var i_user = $('#i_user').val();
  var info = '&i_name='+i_name+'&i_user='+i_user+'&p='+page;
  $.get('index.php?m=&c=Operatelog&a=logAjax',info, function(data){
        if(data.status == 1){
          $('#table_job').html(data.content);
        }else{
          alert(data.msg);
        }
     })
}
</script>
	  	<!-- 模板填充 -->

	<!-- /主体 -->

</body>
<script type="text/javascript" src="/creeper_cms/Public/js/index.js"></script>
<script type="text/javascript" src="/creeper_cms/Public/js/ajax.js"></script>
<script type="text/javascript">
$(function() {
	$(".nav li").click(function(e){
		e.stopPropagation();
		var flag = $(this).find("ul").is(":hidden");
		if(flag){
			$(this).find("ul").show();
			$(this).find("span").addClass("icon-caret-up1")
			$(this).siblings().find("span").removeClass("icon-caret-up1");
			
		}else{
			$(this).find("ul").hide();
			$(this).find("span").removeClass("icon-caret-up1")
			$(this).siblings().find("span").addClass("icon-caret-up1");;
			}
		$(this).siblings().find("ul").hide();
	});
	$(document).click(function(){
		$(".icon-caret-down1").next().hide();	
		$(".icon-caret-down1").removeClass("icon-caret-up1");
	});
	$('.date-picker').datepicker();
	$('.input-small').timepicker({
		minuteStep: 1,
		showSeconds: true,
		showMeridian: false
	});
})
</script>
</html>