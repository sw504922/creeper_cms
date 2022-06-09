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
<button class="btn btn-info" type="button" style="margin-bottom:10px;float:left;" id='c_add'>添&nbsp;&nbsp;加</button> 
<div style="margin-bottom:10px;width:100px;float:right;">
<button type="button" class="btn btn-primary btn-submit" style="" id='search'>导&nbsp;出</button>
</div>
<div style="clear:both;margin-right:30px;float:right;">
<form enctype='multipart/form-data'>
<input type="text" id="txt" name="txt" class="input_m input" style="margin-bottom:0px;"><input type="button" onmousemove="i_paths.style.pixelLeft=event.x-60;i_paths.style.pixelTop=this.offsetTop;" value="浏览" size="30" onclick="i_paths.click()" class="btn btn-primary btn-xs input_m liulan">
<input type="file" onchange="txt.value=this.value" id='i_paths' name='i_paths' style="height:26px;" class="input_m files"  size="1" hidefocus>
<button type="button" class="btn btn-primary btn-submit" style="" id='file_in'>导&nbsp;入</button>
</form>
</div>
  <table class="table table-bordered" style="clear:both;">
    <thead>
      <tr>
        <th width="3%">编号</th>
        <th width="10%">Redis名称</th>
        <th width="10%">时间间隔</th>
        <th width="30%">操作</th>
      </tr>
    </thead>
    <tbody>
      <?php  $i = 0; foreach($re as $k => $val){ $i++; ?>
      <tr>
        <td><?php echo $i;?></td>
        <td><?php echo $k;?></td>
        <td><?php echo $val;?></td>
        <td>
       <button type="button" class="btn btn-primary btn-xs" onclick="c_edit('<?php echo $k;?>')">编辑</button>
       <button type="button" class="btn btn-success btn-xs" onclick="c_del('<?php echo $k;?>')">删除</button>
      </tr>
      <?php }?>
    </tbody>
  </table>
</div>

<script type="text/javascript">
$('#c_add').click(function(){
  location.href='./index.php?m=&c=Redis&a=add'
})
function c_edit(key){
  location.href='./index.php?m=&c=Redis&a=edit&key='+key;
}
function c_del(key){
  var r = confirm("确定删除？");
  if(r==true){
    location.href='./index.php?m=&c=Redis&a=del&key='+key;
  }
}
$('#search').live('click',function(){
	location.href='./index.php?m=&c=Redis&a=txt_out';
})
$('#file_in').live('click',function(){
  if(!$('#i_paths').val()){
    alert('请选择上传文件');
    return false;
  }
  $.ajaxFileUpload({
    url: 'index.php?m=&c=Upload&a=upload',
    secureuri: false,
    fileElementId: 'i_paths',
    dataType: 'json',
    success: function (data) {
        if(data.status==1){
          var r = confirm("确定导入覆盖现有数据？");
          if(r==true){
            var info = '&path='+data.msg
             $.get('./index.php?m=&c=Redis&a=fileIn', info,
                    function(data){
                      if(data.status == 1){
                        location.href = './index.php?m=&c=Redis&a=index';
                      }else{
                        alert(data.msg);
                      }
                  });
          }
        }else{
          alert(data.msg);
        }
    },
    error: function (data) {
        alert("error");
    }
  });
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