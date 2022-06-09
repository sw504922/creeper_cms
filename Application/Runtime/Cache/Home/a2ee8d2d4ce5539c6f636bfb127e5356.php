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
	  	<div class="table_box">
 <div class="cur_box">
  <span class='cur' id='c_total'>汇总</span><span id='c_detail'>详情</span>
 </div>
  <input type='hidden' name='id' id='id' value='<?php echo $id?>'>
  <div class="table-responsive table_box" id='total'>
    <form role="form" action='/creeper_cms/index.php?m=&c=Job&a=jobList&id=10039&sign=1'>
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
	    <div  class="btn btn-primary" id="sub_click" style="margin-top:25px;">确&nbsp;定</div>
     </form>
     <div id='table'>
      <table class="table table-bordered">
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
    </div>
    <div id='quxiantu_fetcher'></div>
    <div id='quxiantu_handler'></div>
  </div>
  <div id='detail'  class="form_box_1" style='display:none;'>
  <div class="form-group">
    <label>job名称：</label><span><?php echo $re['job_name'];?></span>
  </div>
  <div class="form-group">
    <label>job描述：</label><span><?php echo $re['job_comment'];?></span>
  </div>
  <div class="form-group">
    <label>上传文件：</label><span><?php echo $re['urls_file_path'];?></span>
  </div>
<div class="form-group">
  <label>是否分期：</label><span><?php echo $re['is_period']==1?'是':'否';?></span>
</div>
<div class="form-group" id='show_num' style='display:<?php echo $re['is_period']==1?'':'none';?>;'>
    <label>分期数：</label><span><?php echo $re['period_num'];?></span>
</div>
<div class="form-group" id='show_interval' style='display:<?php echo $re['is_period']==1?'':'none';?>;'>
    <label>分期间隔(分钟)：</label><span><?php echo $re['period_interval'];?></span>
</div>
  <div class="form-group">
  <label >优先级：</label><span><?php echo $re['suggest_priority'];?></span>
</div>
 <div class="form-group">
  <label >状态：</label><span><?php echo $status[$re['status']];?></span>
</div>
<div class="form-group">
    <label>fetcher_id：</label><span><?php echo $re['fetcher_id'];?></span>
</div>
<div class="form-group">
  <label>代理：</label><span><?php echo $re['need_proxy']==0?'不使用':'使用';?></span>
  </div>
<div class="form-group">
  <label>cookies：</label><span>
  <?php echo $re['cookies'];?></span>
</div> <div class="form-group">
  <label>重复抓取：</label><span><?php echo $re['crawl_repeat']==1?'使用':'不使用';?></span>
</div>
<div class="form-group" id='show_time' style='display:<?php echo $re['crawl_repeat']==1?'':'none';?>;'>
    <label>间隔时间(分钟)：</label><span><?php echo $re['repeat_interval'];?></span>
</div>
  <div class="form-group">
    <label>handler配置文件名称：</label><span><?php echo $re['handler_conf'];?></span>
  </div>
  <div class="form-group">
    <label>fetcher_route：</label><span><?php echo $re['fetcher_route'];?></span>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">重抓次数：</label><span><?php echo $re['error_retry'];?></span>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">超时时间：</label><span><?php echo $re['timeout'];?></span>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">handler_id：</label><span><?php echo $re['handler_id'];?></span>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">queue_name：</label><span><?php echo $re['queue_name'];?></span>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">valid_time(分钟)：</label><span><?php echo $re['valid_time'];?></span>
  </div>
</div>
   <a style="" href='javascript:history.go(-1)'>返回上一页</a>
</div>

<script type="text/javascript">
  $().ready(function(){
    var id = $('#id').val();
    refreshFetcherData('','','-1',id);
    refreshHandlerData('','','-1',id);
  }) 
    $('#c_total').live('click',function(){
    $('#total').css('display','');
    $('#detail').css('display','none');
    $('#c_total').attr('class','cur');
    $('#c_detail').attr('class','');
   })
   $('#c_detail').live('click',function(){
    $('#total').css('display','none');
    $('#detail').css('display','');
    $('#c_total').attr('class','');
    $('#c_detail').attr('class','cur');
   })
   $('#sub_click').live('click',function(){
    var id = $('#id').val();
    var time_s = $('#id-date-picker-1').val();
    var time_s1 = $('#timepicker1').val();
    var time_e = $('#id-date-picker-2').val();
    var time_e1 = $('#timepicker2').val();
    var address = $("form").attr("action");
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
    refreshFetcherData(time_s+time_s1,time_e+time_e1,'-1',id);
    refreshHandlerData(time_s+time_s1,time_e+time_e1,'-1',id);
    var info = '&id='+id+'&start='+time_s+ time_s1+'&end='+time_e+time_e1+'&sign=1';
    $.get('index.php?m=&c=Job&a=ajaxList',info, function(data){
        if(data.status == 1){
          $('#table').html(data.content);
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