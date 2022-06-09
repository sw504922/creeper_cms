// JavaScript Document
$(function(){
	    $(".manage_limit").click(function(){  //左侧菜单收起
		 var $udis = $(this).siblings("ul");
	     var flas = $(this).siblings("ul").is(":hidden");
		 if(flas){
			 $udis.slideDown();
			}
		  else{
			 $udis.slideUp();
		    }
		});
		$(".fb_img img").removeAttr("height");//页面上传小图片高度自适应
		$(".fb_img img").bind("click",function(){//点击上传图片放大
		
			var flas =$(this).parent().next().show().is(":visible");
			var $imga =$(this).parent().next();
			if(flas){//放大后图片宽度控制，高度自适应
				var $imgw = $imga.find("img").attr("width")
				if($imgw >= 738){
					$imga.find("img").attr("width","738");
					$imga.find("img").removeAttr("height");
					}
					else{
					$imga.find("img").attr("width","$imgw");
					}
				
				}
			$(this).parent().next().show();
			$(this).parent().hide();
			
			});
		$(".retract,.img_big img").bind("click",function(){//点击大图片还原
			$(this).parent().prev().show();
			$(this).parent().hide();
			});
		$(".return_top").click(function(){//返回顶部
			scroll(0,0);
			});
		$(".no_success,.success").bind({//完成和未完成弹出提示
		mouseover:function(){$(this).children().show();},
		mouseout:function(){$(this).children().hide();}
		})
		$(".close_WholeBypass").bind({//完成和未完成弹出提示
		mouseover:function(){$(this).children().show();},
		mouseout:function(){$(this).children().hide();}
		});
		$('.noComplete').click(function(){
		var removeId = $(this).attr('remove-id');
		var url = $(this).attr('href');
		var shtml='<p class="p_2">系统将于2日后重复推送该条投诉</p>'+
          '<span class="open_btn onPush corner" removeId="'+ removeId +'" url="'+url+'&next_push=1" >继续推送</span>'+
	   '<span class="cancel_btn notPush corner" removeId="'+ removeId +'" url="'+url+'">不再推送</span>';
	    $.loadMsgDialog({data:shtml,boxnum:"1"});
		$(".notPush").click(ajaxGetClick);
		$(".onPush").click(ajaxGetClick);
		});
		
	
})



	