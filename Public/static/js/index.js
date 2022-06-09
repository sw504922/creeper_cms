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
	    $(".fb_img li img").live("click",function(){//点击上传图片放大
    	    var th_src =$(this).attr("src");
	    	var flas =$(this).closest(".fb_img").next().show().is(":visible");
	    	var $imga =$(this).closest(".fb_img").next();
	    	if(flas){//放大后图片宽度控制，高度自适应
	    	var $imgw = $imga.find("img");
	    	var $imgh = $imga.find("img").attr("width");
	    	if($imgh >= 438){
	    	$imgw.attr("width","438");
	    	$imgw.attr("src",th_src);
	    	$imgw.removeAttr("height");
	    	}
	    	else{
	    	$imgw.attr("width","$imgh");
	    	$imgw.attr("src",th_src);
	    	}
	    	}
	    	$(this).closest(".fb_img").next().show()
	    	$(this).closest(".fb_img").hide();
	    	});
	    	$(".retract,.scrollbox img").live("click",function(){//点击大图片还原
	    	$(this).closest(".scrollbox").prev().show();
	    	$(this).closest(".scrollbox").hide();
	    	}); 
		$(".return_top").click(function(){//返回顶部
			scroll(0,0);
			});
		$(".no_success,.success").bind({//完成和未完成弹出提示
		mouseover:function(){$(this).children().eq(0).show();},
		mouseout:function(){$(this).children().eq(0).hide();}
		})
		$(".close_WholeBypass").bind({//完成和未完成弹出提示
		mouseover:function(){$(this).children().show();},
		mouseout:function(){$(this).children().hide();}
		});
		$('.noComplete').live("click",function(){//推送提示
		var removeId = $(this).attr('remove-id'); 
		var url = $(this).attr('href');
		var shtml='<div class="alertlayer_l corner shadow">'+
		'<span class="close"></span>'+
		'<div class="box_1"><p class="p_2">系统将于2日后重复推送该条投诉</p>'+
		'<span class="open_btn onPush corner" remove-id="'+ removeId +'" url="'+url+'&next_push=1">继续推送</span>'+
		'<span class="cancel_btn notPush corner" remove-id="'+ removeId +'" url="'+url+'">不再推送</span></div></div>';
		$("body").append(shtml);
		$(".close,.open_btn,.cancel_btn").click(function(){$(".alertlayer_l").remove();});
		$(".notPush").click(ajaxGetClick);
		$(".onPush").click(ajaxGetClick);
	
		});
			
		$(".token_bind").click(function(){//token绑定
			var token_value=$(".input_t_w").val();
			$.ajax({
				type: "POST",
				url: "/opinion/index.php?m=&c=SearchToken&a=getToken",
				data: "vaules="+token_value,
				success: function(msg){
					 $(".input_t_w").val(msg[0]['token']);
					 $(".savetip").show(); 
					 var savetiphide = function(){
					 $(".savetip").hide(); 
					 }
					 setTimeout(savetiphide,3000);
				    }
			})		 
		});
		$(".Complaints_sel a").click( function (){ //只看负面checkbox状态切换
		      var flag =$(this).hasClass("current");
		      var hrefurl=$(this).attr('url');
		      var pattern = "&showNeg=1";
		      if(!flag){
		    		location.href=hrefurl+"&showNeg=1";
		    	    $(this).addClass("current");
		    	    
               }else{
            		location.href=hrefurl.replace(new RegExp(pattern), "");
            	    $(this).removeClass("current");
	    		}
         });
		 $(".Theme_title a").each(function(i){//负面评论给a添加删除参数
			 var pattern = "&showNeg=1";
			 var flag = $(".Complaints_sel a").hasClass("current");
			 var hrefurl=$(this).attr('href');
			 var delhrefurl = hrefurl.replace(new RegExp(pattern), "");
			 if(!flag){
	         $(this).attr('href',delhrefurl); 
			 }else{
			 $(this).attr('href',(hrefurl+'&showNeg=1'));
			 }
			     	  
	       });
		 $('.return_Whole,.wb_textoperate span a').each(function(i){//负面评论给return_Whole添加删除参数
	    	     var pattern = "&showNeg=1";
				 var flag = $(".Complaints_sel a").hasClass("current");
				 var returnurl = $(this).attr('href');
				 var delreturnurl = returnurl.replace(new RegExp(pattern), "");
				 if(!flag){
		         $(this).attr('href',delreturnurl);
				 }else{
				 $(this).attr('href',(returnurl+'&showNeg=1'));
				 }
	       })
	      var cururl = window.location.href;//筛选后历史投诉条数隐藏
		  if(cururl.indexOf('complainant_id')>0){
			$(".operate_bar").hide();  
		  }
		  else if(cururl.indexOf('SystemSetTime')>0 || cururl.indexOf('ObserverAccount')>0 || cururl.indexOf('BadWord')>0){
			$(".nav ul").hide();  
		  }
	       
	       
})

