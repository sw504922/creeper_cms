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
<div class="title">fetcher模块的日志展示</div>
  <div style="margin-bottom:10px;">
  	<form>
       <div class="dropdown" style="float:left;">
        <label >选项：</label>
        <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
          <span id='s_status'>job_name</span>
          <input type='hidden' id='i_status' name='i_status' value='2'>
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id='show_status'>
          <li role="presentation" value='1'><a role="menuitem" tabindex="-1" href="javascript:void(0)">fetcher_name</a></li>
          <li role="presentation" value='2'><a role="menuitem" tabindex="-1" href="javascript:void(0)">job_name</a></li>
          <li role="presentation" value='3'><a role="menuitem" tabindex="-1" href="javascript:void(0)">job_id</a></li>
        </ul>
      </div>
       <div class="col-xs-3">
        <label>名称：</label>
        <input type="text" class="form-control"  placeholder="" id='i_name' name='i_name' value=''>
       </div>		
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
      <div  class="btn btn-primary" id="sub_log" style="margin-top:25px;">昨日日志</div>
	    <div  class="btn btn-primary" id="btn_submit_fetcher1" style="margin-top:25px;">确&nbsp;定</div>
      
     </form>
 </div>
 <table class="table table-bordered">
  <thead>
      <tr id='ss_port' style="display:none">
        <th>fetcher_name</th>
        <th>成功解析数</th>
        <th>失败解析数</th>
        <th>解析总数</th>
        <th>成功率</th>
      </tr>
      <tr id='ss_name'>
        <th>job_name</th>
        <th>job_id</th>
        <th>成功解析数</th>
        <th>失败解析数</th>
        <th>解析总数</th>
        <th>成功率</th>
      </tr>
    </thead>
    <tbody id="table_fetcher">
    	<?php if($sign==1){?>
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

    </tbody>
    <div id='quxiantu_fetcher'></div>
    </table>
  </div>
</div>
</body>
<script type="text/javascript">

 $().ready(function(){
    refreshFetcherData('','','','');
 }) 
  $('#show_status li').click(function(){
    var str = $(this).attr('value');
    var val = $(this).text();
    $('#s_status').text(val);
    $('#i_status').val(str);
    $('#i_name').val('');
  })
   $('#btn_submit_fetcher1').live('click',function(){
    var time_s = $('#id-date-picker-1').val();
    var time_s1 = $('#timepicker1').val();
    var time_e = $('#id-date-picker-2').val();
    var time_e1 = $('#timepicker2').val();
    var status = $('#i_status').val();
    var name = $('#i_name').val();
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
    var info = '&status='+status+'&name='+name+'&start='+time_s+time_s1+'&end='+time_e+time_e1;
    refreshFetcherData(time_s+time_s1,time_e+time_e1,status,name);
    $.get('./index.php?m=&c=Log&a=getDataFecther',info, function(data){
      //console.log(data.curve);
        if(data.status == 1){
          $('#table_fetcher').html(data.content);
          if(status==1){
            $('#ss_port').css('display','');
            $('#ss_name').css('display','none');
          }else{
            $('#ss_port').css('display','none');
            $('#ss_name').css('display','');
          }
        }else{
          alert(data.msg);
        }
     })
   })
$('#sub_log').live('click',function(){
  var now = new Date();
  var time = now.getTime()-86400000;
  var y_now = new Date(time);
  var year = now.getFullYear();       //年
  var month = now.getMonth() + 1;     //月
  if(month<10){
    month = '0'+month;
  }
  var day = now.getDate();         //日
  if(day<10){
    day = '0'+day;
  }
  var y_year = y_now.getFullYear();       //年
  var y_month = y_now.getMonth() + 1;     //月
  if(y_month<10){
    y_month = '0'+y_month;
  }
  var y_day = y_now.getDate();         //日
   if(y_day<10){
    y_day = '0'+y_day;
  }
  var h = year+'-'+month+'-'+day;
  var y = y_year+'-'+y_month+'-'+y_day;
  var time_s = $('#id-date-picker-1').val(y);
  var time_s1 = $('#timepicker1').val('00:00:00');
  var time_e = $('#id-date-picker-2').val(h);
  var time_e1 = $('#timepicker2').val('00:00:00');
  var time_s = $('#id-date-picker-1').val();
  var time_s1 = $('#timepicker1').val();
  var time_e = $('#id-date-picker-2').val();
  var time_e1 = $('#timepicker2').val();
  var status = $('#i_status').val();
  var name = $('#i_name').val();
  var info = '&status='+status+'&name='+name+'&start='+time_s+time_s1+'&end='+time_e+time_e1;
  refreshFetcherData(time_s+time_s1,time_e+time_e1,status,name);
  $.get('./index.php?m=&c=Log&a=getDataFecther',info, function(data){
      if(data.status == 1){
        $('#table_fetcher').html(data.content);
        if(status==1){
          $('#ss_port').css('display','');
          $('#ss_name').css('display','none');
        }else{
          $('#ss_port').css('display','none');
          $('#ss_name').css('display','');
        }
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