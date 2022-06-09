$(function(){
	 $(".close_fl").live("click",function(){//全部未分流
		  $(".open_Bypass").attr("class","close_Bypass");
		  $(".push_status").attr("value","0");
		  $(".Bypass").text("未分流");
		  $(".alertlayer").hide();
		  $(".close_WholeBypass").attr("class","close_WholeBypass-1");
		  $(".open_WholeBypass-1").attr("class","open_WholeBypass");
          $(".close_WholeBypass").unbind("click");
		  });
	   $(".close_flopen").live("click",function(){//全部未分流
		  $(".close_Bypass").attr("class","open_Bypass");
		  $(".push_status").attr("value","1");
		  $(".Bypass").text("正在分流");
		  $(".alertlayer").hide();
		  $(".open_WholeBypass").attr("class","open_WholeBypass-1");
		  $(".close_WholeBypass-1").attr("class","close_WholeBypass");
		  $(".open_WholeBypass").unbind("click");
		  });
	 $(".Average_titlebox").delegate(".close_WholeBypass","click",function(){//全部关闭弹出层
	 var shtml='<p class="p_2">全部关闭后，信息将不会推送给任何客服</p>'+
     '<p class="p_3">适用于非工作日、节假日等情况</p>'+
    '<span class="open_btn close_fl corner">确定</span><span class="cancel_btn corner">取消</span>';
	    $.loadMsgDialog({data:shtml,boxnum:"1"});
		});	
	 $(".Average_titlebox").delegate(".open_WholeBypass","click",function(){//全部开启弹出层
	 var shtml='<p class="p_2">全部开启，信息将会推送给任何客服</p>'+
    '<span class="open_btn close_flopen corner">确定</span><span class="cancel_btn corner">取消</span>';
	    $.loadMsgDialog({data:shtml,boxnum:"1"});
		});
	$(".remove_detect").click(function(){//解除绑定弹出层
        var url = $(this).attr('url');
	    var shtml='<p class="p_2">解除绑定后，系统将无法推送<br/>官方账号收到的负面评论</p>'+
            '<span class="open_btn  corner ajax-get" url="'+ url +
            '">确定</span>' +
            '<span class="cancel_btn corner">取消</span>';
			
		$.loadMsgDialog({data:shtml,boxnum:"1"});
        $('.ajax-get').live('click', ajaxGetClick);
	 });

	  $(".close_Bypass").toggle(//分流状态的切换
		function () {
		  $(this).attr("class","open_Bypass");
		  $(this).parent().prev().text("正在分流")
		  $(this).parent().prev().prev().prev().attr("value","1")
		},
		function () {
		  $(this).attr("class","close_Bypass");
		  $(this).parent().prev().text("未分流")
		  $(this).parent().prev().prev().prev().attr("value","0")
		}
	  );
	  $(".open_Bypass").toggle(
		function () {
		  $(this).attr("class","close_Bypass");
		  $(this).parent().prev().text("未分流")
		  $(this).parent().prev().prev().prev().attr("value","0")
		},
		function () {
		  $(this).attr("class","open_Bypass");
		  $(this).parent().prev().text("正在分流")
		  $(this).parent().prev().prev().prev().attr("value","1")
		}
	  );
	 
	//分流初始化全部开启或关闭判断
			var statusnum = $(".push_status").attr("value");
			var tmpstr = "";
			$(".push_status").each(function(index, element) {
                   for(var i=0;i<statusnum.length;i++){
					var val =  $(this).attr("value");  
					tmpstr = tmpstr + val;
			   }
             });
               var arr=[];
			   var arr = tmpstr.split("");
			   $.each(arr, function(i){
			   if(arr[i]==0 || arr[i]==1){
					$(".open_WholeBypass").attr("class","open_WholeBypass");
			        $(".close_WholeBypass").attr("class","close_WholeBypass");
			     }
             });
   $(".cancel_btn").live("click",function(){$(".alertlayer").hide()});//关闭弹出层
   //日期选择栏
   var shtmlhour = "<div class='hour_box corner'><span>01</span><span>02</span><span>03</span><span>04</span><span>05</span><span>06</span><span>07</span><span>08</span><span>09</span><span>10</span><span>11</span><span>12</span><span>13</span><span>14</span><span>15</span><span>16</span><span>17</span><span>18</span><span>19</span><span>20</span><span>21</span><span>22</span><span>23</span><span>24</span></div>";
    var shtmlminute = "<div class='minute_box corner'><span>00</span><span>30</span></div>";	
	$(".hour").parent().append(shtmlhour);//添加小时选择框
	$(".minute").parent().append(shtmlminute);//添加分钟选择框
	$(".hour").bind("click",function(event){//获取焦点，弹出小时选择框
		event.stopPropagation();	
		$(this).next().show();	
		//$(this).val("");
		$(this).parent().siblings().children(".hour_box").hide();
		$(this).parent().siblings().children(".minute_box").hide();
		});
	$(document).click(function (event){ $(".hour_box").hide();});  	
	$(".hour_box span").die().live("click",function(event){//选择小时
	     event.stopPropagation();
		 var spantext = $(this).text();
	     $(this).parent().prev().val(spantext);
		$(this).parent().hide();
		
		}
		)
	$(".minute").bind({//获取焦点，弹出分钟选择框
		click:function(event){
		event.stopPropagation();	
		$(this).next().show();
		//$(this).val("");
	    $(this).parent().siblings().children(".hour_box").hide();
		$(this).parent().siblings().children(".minute_box").hide();
		}
		});
	$(document).click(function (event){ $(".minute_box").hide();});
	$(".minute_box span").die().live("click",function(e){//选择分钟
	     e.stopPropagation();
		 var spantext = $(this).text();
	     $(this).parent().prev().val(spantext);
		 $(this).parent().hide();
		}
		);
	$(".reject").click(function(){//驳回
        var userid=$(this).attr("id");
		var shtml='<input type="hidden" class="reject_cl" value="'+userid+'"><p class="p_2">该账号被驳回，系统已发送通知邮件</p>'+
		'<span class="open_btn close_reject corner">确定</span><span class="cancel_btn close_fl corner">取消</span>';
		$.loadMsgDialog({data:shtml,boxnum:"1"});
		});
	$(".halfreject").click(function(){//中途驳回
        var userid=$(this).attr("id");
		var shtml='<input type="hidden" class="reject_cl" value="'+userid+'"><p class="p_2">驳回后，该账号将无权使用本系统</p>'+
		'<span class="open_btn halfrejectjump corner">确定</span><span class="cancel_btn close_fl corner">取消</span>';
		$.loadMsgDialog({data:shtml,boxnum:"1"});
		});
	
	$(".agree_role").click(function(){//同意并分配角色弹出层
        var userid=$(this).attr("id");
		var shtml='<p class="p_4">角色分配</p>'+
		'<span class="linebar cur corner"><input class="user_role" type="hidden" value="1"><input class="user_id" type="hidden" value="'+userid+'">客服</span><span class="linebar corner">管理员</span>'+
		'<span class="open_btn sureEvent corner">确定</span><span class="cancel_btn close_fl corner">取消</span>';
		$.loadMsgDialog({data:shtml,boxnum:"1"});
		});
	$(".linebar").live("click",function(){//分配角色提交
	     $(this).addClass("cur");
		 $(this).siblings(".linebar").removeClass("cur");
         var ad =$('.user_role').attr("value");
         if(ad==1)
            $('.user_role').attr("value","0");
         else
            $('.user_role').attr("value","1");
		});	
    $(".sureEvent").live("click",function(){//分配角色提交
	   $(this).parent(".box_1").children().hide();
	   var shtml='<p class="p_2">角色分配成功，已发送通知邮件</p>'+
	   '<span class="fileimg"></span>';
		$(".box_1").append(shtml);
		   var adress =$('.user_role').attr("value");
           var uid=$('.user_id').attr("value");
		   location.href="index.html?val="+adress+"&uid="+uid;
	      setTimeout('$(".alertlayer").remove()',2000);
		});
   $(".halfrejectjump").live("click",function(){//确认中途驳回
	    $(this).parent(".box_1").children().hide();
	   var shtml='<p class="p_2">该账号被驳回，系统已发送通知邮件</p>'+
	   '<span class="fileimg"></span>';
		$(".box_1").append(shtml);
        var uid=$('.reject_cl').attr("value");
		location.href="reject.html?uid="+uid;
	     setTimeout('$(".alertlayer").remove()',2000);
		});
    $(".close_reject").live("click",function(){//分配角色提交
        var uid=$('.reject_cl').attr("value");
		location.href="reject.html?uid="+uid;
		});
    $(".user_del").live("click",function(){//清除
        var uid=$('.del_cl').attr("value");
		location.href="del.html?uid="+uid;
		});
	$(".save_btn").click(function(){
		$(".savetip").show();
		});
	
})

	
	
