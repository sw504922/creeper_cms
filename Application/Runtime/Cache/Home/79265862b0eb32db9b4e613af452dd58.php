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
	  	<form role="form" class="form_box" method='post' name='form1' enctype='multipart/form-data' action='/creeper_cms/index.php?m=&c=Job&a=add'>
  <input type='hidden' id='id' name='id' value='<?php echo $id;?>'>
  <input type='hidden' name='page' id='page' value='<?php echo $h_page>1?$h_page:1;?>'>
  <input type='hidden' name='status_g' id='status_g' value='<?php echo $status_g?$status_g:'';?>'>
  <input type='hidden' name='name_g' id='name_g' value='<?php echo $name_g?$name_g:'';?>'>
  <div class="form-group">
    <label for="exampleInputEmail1">job名称：</label>
    <input type="text" class="span10 form-control" id="i_name" name='i_name' placeholder="" value='<?php echo $sign=='edit'?$re['job_name']:'';?>'>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">job描述：</label>
    <input type="text" class="span10 form-control" id="i_comment" name='i_comment' placeholder="" value='<?php echo $sign=='edit'?$re['job_comment']:'';?>'>
  </div>
  <div class="form-group">
    <label for="exampleInputFile">上传文件：</label>
    <span id='show_file'><?php if($sign == 'edit'){ ?><input type='button' id='c_up' value='重新上传' name='c_up'><input type="hidden" id="i_paths" value='<?php echo $re['urls_file_path'];?>' name='i_paths'><?php echo $re['urls_file_path']; }else{?><input type="text" id="txt" name="txt" class="input_m input" style="margin-bottom:0px;"><input type="button" onmousemove="i_paths.style.pixelLeft=event.x-60;i_paths.style.pixelTop=this.offsetTop;" value="浏览" size="30" onclick="i_paths.click()" class="btn btn-primary btn-xs input_m liulan"><input type="file" onchange="txt.value=this.value" id='i_paths' name='i_paths' style="height:26px;" class="input_m files"  size="1" hidefocus><?php }?></span>

  </div>
  <input type = 'hidden' id = 'hide_path' name = 'hide_path' value = '<?php echo $sign=='edit'?$re['urls_file_path']:'';?>'>
  <div id='show_period' <?php if($sign == 'edit'){ ?>style='display:none;'<?php }?>>
  <label for="exampleInputPassword1" style="margin-top:10px;">是否分期：</label>
  <div class="checkbox" style="padding-left:0px;">
    <label style="display:inline-block;">
      <input type="radio" name="i_period" id="i_period1" value="0" checked>
      <span class="lbl">否</span>
    </label>
    <label style="display:inline-block">
      <input type="radio" name="i_period" id="i_period2" value="1">
      <span class="lbl">是</span>
    </label>
    </div>
    <div class="form-group" id='show_num_p' style='display:none'>
    <label for="exampleInputPassword1">分期数：</label>
    <input type="text" class="span10 form-control" id="i_period_num" placeholder="" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='' name='i_period_num'>
  </div>
  <div class="form-group" id='show_interval_p' style='display:none'>
    <label for="exampleInputPassword1">分期间隔(分钟)(只能输入数字)：</label>
    <input type="text" class="span10 form-control" id="i_interval" placeholder="" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='' name='i_p_interval'>
  </div>
  <div class="dropdown">
  <label>状态：</label></br>
  <button class="btn btn-info dropdown-toggle"  style="margin-bottom:10px;" type="button" data-toggle="dropdown">
    <span id='s_status'><?php echo $sign=='edit'?$status[$re['status']]:'未开始';?></span>
    <input type='hidden' id='i_status' value='<?php echo $sign=='edit'?$re['status']:5;?>' name='i_status'>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id='show_status'>
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
</div>
  <div class="dropdown">
  <label >优先级：</label></br>
  <button class="btn btn-info dropdown-toggle"  style="margin-bottom:10px;" type="button" data-toggle="dropdown">
    <span id='s_priority'><?php echo $sign=='edit'?$re['suggest_priority']:0;?></span>
    <input type='hidden' id='i_s_priority' value='<?php echo $sign=='edit'?$re['suggest_priority']:0;?>' name='i_s_priority'>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id='show_priority'>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">0</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">1</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">2</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">3</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">4</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">5</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">6</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">7</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">8</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0)">9</a></li>
  </ul>
</div>
 
  <div class="form-group">
    <label for="exampleInputPassword1">fetcher_id(只能输入数字)：</label>
    <input type="text" class="span10 form-control" id="i_f_id" placeholder="" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='<?php echo $sign=='edit'?$re['fetcher_id']:'';?>' name='i_f_id'>
  </div>
  <label for="exampleInputPassword1">代理：</label>
  <div class="checkbox" style="padding-left:0px;">
    <label style="display:inline-block">
      <input type="radio" name="i_need" id="i_need1" value="0" <?php echo $sign=='edit'?($re['need_proxy']==0?'checked':''):'checked';?>>
      <span class="lbl"> 不使用代理</span>
    </label>
    <label style="display:inline-block">
      <input type="radio" name="i_need" id="i_need2" value="1" <?php echo $sign=='edit'?($re['need_proxy']==1?'checked':''):'';?>>
      <span class="lbl">使用代理</span> 
    </label>
  </div>
  <label for="exampleInputPassword1">cookies：</label>
  <textarea class="span10 form-control" rows="3" id='i_cookie' name='i_cookie'><?php echo $sign=='edit'?$re['cookies']:'';?></textarea>
  <label for="exampleInputPassword1" style="margin-top:10px;">重复抓取：</label>
  <div class="checkbox" style="padding-left:0px;">
    <label style="display:inline-block;">
      <input type="radio" name="i_repeat" id="i_repeat1" value="0" <?php echo $sign=='edit'?($re['crawl_repeat']==0?'checked':''):'checked';?>>
      <span class="lbl">不使用</span>
    </label>
    <label style="display:inline-block">
      <input type="radio" name="i_repeat" id="i_repeat2" value="1" <?php echo $sign=='edit'?($re['crawl_repeat']==1?'checked':''):'';?>>
      <span class="lbl">使用</span>
    </label>
  </div>
   <div class="form-group" id='show_time' style='display:<?php echo $sign=='edit'?($re['crawl_repeat']==1?'':'none'):'none';?>;'>
    <label for="exampleInputPassword1">间隔时间(分钟)(只能输入数字)：</label>
    <input type="text" class="span10 form-control" id="i_interval" placeholder="" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='<?php echo $sign=='edit'?$re['repeat_interval']:'';?>' name='i_interval'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">handler配置文件名称：</label>
    <input type="text" class="span10 form-control" id="i_h_config" placeholder="" value='<?php echo $sign=='edit'?$re['handler_conf']:'';?>' name='i_h_config'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">fetcher_route：</label>
    <input type="text" class="span10 form-control" id="i_route" placeholder="" value='<?php echo $sign=='edit'?$re['fetcher_route']:'';?>' name='i_route'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">重抓次数：</label>
    <input type="text" class="span10 form-control" id="i_error_retry" placeholder="" value='<?php echo $sign=='edit'?$re['error_retry']:'';?>' name='i_error_retry'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">超时时间：</label>
    <input type="text" class="span10 form-control" id="i_timeout" placeholder="" value='<?php echo $sign=='edit'?$re['timeout']:'';?>' name='i_timeout'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">handler_id：</label>
    <input type="text" class="span10 form-control" id="i_h_id" placeholder="" value='<?php echo $sign=='edit'?$re['handler_id']:'';?>' name='i_h_id'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">queue_name：</label>
    <input type="text" class="span10 form-control" id="i_q_name" placeholder="" value='<?php echo $sign=='edit'?$re['queue_name']:'';?>' name='i_q_name'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">valid_time(分钟)(只能输入数字)：</label>
    <input type="text" class="span10 form-control" id="i_valid" placeholder="" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='<?php echo $sign=='edit'?$re['valid_time']:'';?>' name='i_valid'>
  </div>
   <button type="button" class="btn btn-primary" id='i_button'>提&nbsp;&nbsp;&nbsp;交</button>
   <button type="button" class="btn btn-default" id='i_cancel'>取&nbsp;&nbsp;&nbsp;消</button>
</form>
<script type="text/javascript">
$('#c_up').live('click',function(){
  $('#show_file').html("<input type='text' id='txt' name='txt' class='input_m input' style='margin-bottom:0px;'><input type='button' onmousemove='i_paths.style.pixelLeft=event.x-60;i_paths.style.pixelTop=this.offsetTop;' value='浏览' size='30' onclick='i_paths.click()' class='btn btn-primary btn-xs input_m liulan'><input type='file' onchange='txt.value=this.value' id='i_paths' name='i_paths' style='height:26px;' class='input_m files'  size='1' hidefocus><input type='button' id='c_cancel' value='取消上传' name='c_cancel'>");
  $('#show_period').show();
})
$('#c_cancel').live('click',function(){
  var val = $('#hide_path').val();
  $('#show_file').html("<input type='button' id='c_up' value='重新上传' name='c_up'><input type='hidden' id='i_paths' value='"+val+"' name='i_paths'>"+val);
  $('#show_period').hide();
})
$('#i_button').click(function(){
  var page = $('#page').val();
  var id = $('#id').val();
  var name = $('#i_name').val();
  var status_g = $('#status_g').val();
  var name_g = $('#name_g').val();
  var i_path = $('#i_paths').val();
  var formdata = $("form").serialize();
  var address = $("form").attr("action");
  var hide_path = $('#hide_path').val();
  if(!name){
    alert('请填写Job名称');
    return false;
  }
  if(id){
    var r = confirm("确定修改？");
    if(r==true){
      if(i_path){
        if(i_path == hide_path){
          $.post('index.php?m=&c=Job&a=edit', formdata,
            function(data){
              if(data.status == 1){
                location.href = 'index.php?m=&c=Job&a=index&i_name='+name_g+'&i_status='+status_g+'&p=1';
              }else if(data.status == 3){
                location.href = 'index.php?m=&c=Job&a=index&i_name='+name_g+'&i_status='+status_g+'&p='+page;
              }else{
                alert(data.msg);
              }
          });
        }else{
          $.ajaxFileUpload({
            url: 'index.php?m=&c=Upload&a=upload',
            secureuri: false,
            fileElementId: 'i_paths',
            dataType: 'json',
            success: function (data) {
                if(data.status==1){
                  formdata += '&i_paths='+data.msg 
                   $.post('index.php?m=&c=Job&a=edit', formdata,
                      function(data){
                        if(data.status == 1){
                          location.href = 'index.php?m=&c=Job&a=index';
                        }else{
                          alert(data.msg);
                        }
                    });
                }else{
                  alert(data.msg);
                }
            },
            error: function (data) {
                alert("error");
            }
          });
        }
      }else{
        alert('请上传文件');
      }
    }
  }else{
    if(i_path){
      $.ajaxFileUpload({
          url: 'index.php?m=&c=Upload&a=upload',
          secureuri: false,
          fileElementId: 'i_paths',
          dataType: 'json',
          success: function (data) {
              if(data.status==1){
                formdata += '&i_paths='+data.msg;
                 $.post(address, formdata,
                    function(data){
                      if(data.status == 1){
                        location.href = 'index.php?m=&c=Job&a=index';
                      }else{
                        alert(data.msg);
                      }
                  });
              }else{
                alert(data.msg);
              }
          },
          error: function (data) {
              alert("error");
          }
      });
    }else{
      alert('请上传文件');
    }
  }
  
})
$('#i_cancel').click(function(){
  location.href='index.php?m=&c=Job&a=index'
})
//优先级
$('#show_priority li').click(function(){
  var str = $(this).text();
  $('#s_priority').text(str);
  $('#i_s_priority').val(str);
})
//状态
$('#show_status li').click(function(){
  var str = $(this).attr('value');
  var val = $(this).text();
  $('#s_status').text(val);
  $('#i_status').val(str);
})
$('#i_repeat1').click(function(){
  $('#show_time').hide();
})
$('#i_repeat2').click(function(){
  $('#show_time').show();
})
$('#i_period1').click(function(){
  $('#show_interval_p').hide();
  $('#show_num_p').hide();
})
$('#i_period2').click(function(){
  $('#show_interval_p').show();
  $('#show_num_p').show();
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