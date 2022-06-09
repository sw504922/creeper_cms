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
	  	<form role="form" class="form_box" method='post' name='form1' action='/creeper_cms/index.php?m=&c=Redis&a=add'>
  <div class="form-group">
    <?php if($sign=='edit'){?>
    <input type='hidden' name='hide_key' id='hide_key' value='<?php echo $key;?>'>
    <?php }?>
    <label for="exampleInputEmail1">Redis_key：</label>
    <?php if($sign=='edit'){?>
    <span class=''><?php echo $key;?></span>
    <?php }else{?>
    <input type="text" class="span10 form-control" id="r_key" name='r_key' placeholder="" value=''>
    <?php }?>
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Redis_value：</label>
    <input type="text" class="span10 form-control" id="r_value" name='r_value' placeholder="" value='<?php echo $sign=='edit'?$val:'';?>' onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
  </div>

   <button type="button" class="btn btn-primary" id='i_button'>提&nbsp;&nbsp;&nbsp;交</button>
   <button type="button" class="btn btn-default" id='i_cancel'>取&nbsp;&nbsp;&nbsp;消</button>
</form>
<script type="text/javascript">
$('#i_button').click(function(){
  var key = $('#r_key').val();
  var val = $('#r_value').val();
  var hide_key = $('#hide_key').val();
  var formdata = $("form").serialize();
  if(hide_key){
     $.post('index.php?m=&c=Redis&a=edit', formdata,
        function(data){
          if(data.status == 1){
            location.href = 'index.php?m=&c=Redis&a=index';
          }else{
            alert(data.msg);
          }
      });
  }else{
    if(key==''){
      alert('请填写Redis_key');
      return false;
    }else if(val==''){
      alert('请填写Redis_value');
      return false;
    }else{
      $('form').submit();
    }
  } 
})
$('#i_cancel').click(function(){
  location.href='index.php?m=&c=Redis&a=index'
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