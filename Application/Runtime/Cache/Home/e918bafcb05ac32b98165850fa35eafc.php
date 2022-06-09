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
<button class="btn btn-info" type="button" style="margin-bottom:10px;" id='c_add'>添&nbsp;&nbsp;加</button>
<div style="margin-bottom:10px;">
  <input type='hidden' name='page' id='page' value='<?php echo $h_page>1?$h_page:1;?>'>
  <div class="col-xs-3">
    <label>job名称：</label>
    <input type="text" class="form-control"  placeholder="" id='i_name' name='i_name' value='<?php echo $i_name?$i_name:'';?>'>
  </div>
  <!-- <div class="col-xs-3">
  <label >添加人：</label>
    <input type="text" class="form-control"  placeholder="" id='i_user' name='i_user' value=''>
  </div> -->
  <div class="dropdown" style="float:left;">
  <label >状态：</label>
  <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
    <span id='s_status'><?php echo $status[$i_status]?$status[$i_status]:'全部';?></span>
    <input type='hidden' id='i_status' value='<?php echo $i_status?$i_status:'-1';?>' name='i_status'>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id='show_status'>
    <li role="presentation" value='-1'><a role="menuitem" tabindex="-1" href="javascript:void(0)">全部</a></li>
    <li role="presentation" value='0'><a role="menuitem" tabindex="-1" href="javascript:void(0)">新任务</a></li>
    <li role="presentation" value='1'><a role="menuitem" tabindex="-1" href="javascript:void(0)">处理中</a></li>
    <li role="presentation" value='2'><a role="menuitem" tabindex="-1" href="javascript:void(0)">结束</a></li>
    <li role="presentation" value='3'><a role="menuitem" tabindex="-1" href="javascript:void(0)">删除</a></li>
    <li role="presentation" value='4'><a role="menuitem" tabindex="-1" href="javascript:void(0)">调整优先级</a></li>
    <li role="presentation" value='5'><a role="menuitem" tabindex="-1" href="javascript:void(0)">未开始</a></li>
    <li role="presentation" value='6'><a role="menuitem" tabindex="-1" href="javascript:void(0)">重置</a></li>
    <li role="presentation" value='7'><a role="menuitem" tabindex="-1" href="javascript:void(0)">定时任务</a></li>
  </ul>
</div>
<button type="button" class="btn btn-primary btn-submit" style="margin-top:25px;" id='search'>搜&nbsp;索</button>
</div>
<div id="table_job" style='display:inline;float:left;width:100%;'>
  
   <table class="table table-bordered">
    <thead>
      <tr>
        <th width="3%">id</th>
        <th width="10%">job名称</th>
        <th width="10%">job描述</th>
        <th width="10%">代理</th>
        <th width="8%">重复抓取</th>
        <th width="6%">优先级</th>
        <th width="6%">分期数</th>
        <th width="9%">修改时间</th>
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
        <td><?php echo $val['period_num']>1?$val['period_num']:'1';?></td>
        <td><?php echo $val['update_time'];?></td>
        <td>
       <button type="button" class="btn btn-primary btn-xs" onclick='c_edit(<?php echo $val['id']?>)'>编辑</button>
        <button type="button" class="btn btn-info btn-xs" onclick='c_list(<?php echo $val['id'];?>)'>列表</button>
        <button type="button" class="btn btn-success btn-xs" onclick='c_detail(<?php echo $val['id'];?>)'>详情</button>
      </td>
      </tr>
      <?php }?>
    </tbody>
  </table>
 <?php echo $show;?>
   
</div>
</div>
<script type="text/javascript"> 
$('#c_add').live('click',function(){
  location.href='index.php?m=&c=Job&a=add'
})
//状态
$(".open_d span").live('click',function(){
	$(this).next().show();
})
$(".icon-remove").live('click',function(){
	$(this).closest(".widget-box").hide();
})
$('#show_status li').click(function(){
  var str = $(this).attr('value');
  var val = $(this).text();
  $('#s_status').text(val);
  $('#i_status').val(str);
})
function c_edit(id){
  var r = confirm("编辑此处会修改job_master和job两个表的相关内容，\n如果分期数大于1请慎重编辑，确定编辑？");
  if(r==true){
    var page = $('#page').val();
    var status = $('#i_status').val();
    var name = $('#i_name').val();
    location.href='index.php?m=&c=Job&a=edit&id='+id+'&p='+page+'&status='+status+'&name='+name;
  } 
}
/*function c_status(id,status){
  $.post('index.php?m=&c=Job&a=setStatus', 'id='+id+'&status='+status+'&sign=1',
    function(data){
      if(data.status == 1){
        location.href = location.href;
      }else{
        alert(data.msg);
      }
  });
}
function edit_status(id){
  var status = $('#e_status_'+id).val();
   $.post('index.php?m=&c=Job&a=setStatus', 'id='+id+'&status='+status+'&sign=1',
    function(data){
      if(data.status == 1){
        location.href = location.href;
      }else{
        alert(data.msg);
      }
  });
}*/
function c_list(id){
  location.href='index.php?m=&c=Job&a=indexList&id='+id;
}
function c_detail(id){
  location.href='index.php?m=&c=Job&a=jobList&id='+id+'&sign=1';
}
$('#search').live('click',function(){
  var i_name = $('#i_name').val();
  var i_status = $('#i_status').val();
  var i_user = $('#i_user').val();
  var info = '&i_name='+i_name+'&i_status='+i_status+'&p=1';
  location.href = 'index.php?m=&c=Job&a=index'+info;
})
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