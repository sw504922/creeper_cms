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
<div class="title">dispatecher模块的日志展示</div>
  <div style="margin-bottom:10px;">
  	<form>
      <input type='hidden' id='job_id' name='job_id' value='<?php echo $job_id;?>'>
      <input type='hidden' id='type' name='type' value='<?php echo $type_id;?>'>
	    <div class="col-xs-2">
	      <label>开始时间：</label>
	      <div class="input-append date" style="width:160px;float:left;">
	      <input name="start_time" type="text" data-date-format="yyyy-mm-dd" value="" id="id-date-picker-1" class="form-control date-picker">
	      <span class="add-on"> <i class="icon-calendar"></i> </span>
	      </div>
	      <div class="input-append bootstrap-timepicker" style="width:70px;float:left;">
	      <input type="text" class="input-small" id="timepicker1">
	      <span class="add-on"><i class="icon-time"></i></span>
	      </div>
	    </div>
	    <div class="col-xs-2">
	      <label>结束时间：</label>
	       <div class="input-append date" style="width:160px;float:left;">
	      <input name="end_time" type="text" data-date-format="yyyy-mm-dd" value="" id="id-date-picker-2" class="form-control date-picker">
	      <span class="add-on"> <i class="icon-calendar"></i> </span>
	      </div>
	      <div class="input-append bootstrap-timepicker" style="width:70px;float:left;">
	      <input type="text" class="input-small" id="timepicker2">
	      <span class="add-on"><i class="icon-time"></i></span>
	      </div>
	    </div>
	   <div  class="btn btn-primary" id="btn_submit" style="margin-top:25px;">确&nbsp;定</div>
     </form>
 </div>
  
  <div id = 'tab_list'>
    <table class="table table-bordered">
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
<table class="table table-bordered">
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
    <?php foreach($re as $key=>$value){?>
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

  </div>
</div>
</body>
<script type="text/javascript">
$('#btn_submit').live('click',function(){
    var time_s = $('#id-date-picker-1').val();
    var time_s1 = $('#timepicker1').val();
    var time_e = $('#id-date-picker-2').val();
    var time_e1 = $('#timepicker2').val();
    var type = $('#type').val();
    var job_id = $('#job_id').val();
    if(time_e < time_s){
      $(".alert").remove();
      var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
          '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
          '<strong>Warning!</strong>结束日期小于开始日期 </div>';
      $(".table").before(html);   
      return false
    }else{
      $(".alert").remove();
      
    }
      if(time_e == time_s && time_s1 > time_e1){
        $(".alert").remove();
      var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
          '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
          '<strong>Warning!</strong>结束时间小于开始时间 </div>';
      $(".table").before(html); 
      return false
      }else{
       $(".alert").remove();
      }
    var info = '&start='+time_s+time_s1+'&end='+time_e+time_e1+'&job_id='+job_id+'&type='+type;
    $.get('./index.php?m=&c=Log&a=getDataDispatcherList',info, function(data){
      //console.log(data.curve);
        if(data.status == 1){
          $('#tab').html(data.content);
        }else{
          alert(data.msg);
        }
     })
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