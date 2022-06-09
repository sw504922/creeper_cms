// JavaScript Document

function ajaxGetClick(){
    var target;
    if ( $(this).hasClass('confirm') ) {
        if(!confirm('确认要执行该操作吗?')){
            return false;
        }
    }
    var refreshId = $('#'+$(this).attr('refresh-id'));
    var removeId = $('#'+$(this).attr('remove-id'));
    var removeLinkId = $('#'+$(this).attr('remove-link-id'));
    var removeClass = $(this).attr('remove-count-class');
    if ( (target = $(this).attr('href')) || (target = $(this).attr('url')) ) {
        $.get(target).success(function(data){
            if (data.status==1) {
                /*
                 if (data.url) {
                 updateAlert(data.info + ' 页面即将自动跳转~','alert-success');
                 }else{
                 updateAlert(data.info,'alert-success');
                 }
                 */

                if (data.url) {
                    location.href=data.url;
                }else if(refreshId != null && refreshId.length > 0){
                    //$('#top-alert').find('button').click();
                    refreshId.html(data.content);
                }else if(removeId != null && removeId.length > 0){
                    //$('#top-alert').find('button').click();
                	      removeId.slideUp("",function(){
                	    	  removeId.remove();
                	    	  retop();
                	    	  var num = $('.wb_Article').length;
                    	      var lastnum = $('.last_num').length;
                    	      if(num == 0 && lastnum == 1){
                    	      	location.reload();
                    	      }
                	      });
                	      
                    if(removeLinkId != null && removeLinkId.length > 0){
                        var leftNum = removeLinkId.find('.'+removeClass).length;
                        if(leftNum == 0){
                        	removeLinkId.slideUp("",function(){
                  	    	 removeId.remove();
                  	    	 retop();
                  	    	 var num = $('.wb_Article').length;
                   	         var lastnum = $('.last_num').length;
                   	         if(num == 0 && lastnum == 1){
                   	      	 location.reload();
                   	      }
                  	      });
                        }
                    }
                }else{
                    location.reload();
                }

            }else{
                //updateAlert(data.info);
                if (data.url) {
                    location.href=data.url;
                }else{
                    //$('#top-alert').find('button').click();
                    alert(data.info);
                }
            }
        });

    }
   
    return false;
    
}
function retop(){//返回顶部控制
var blogcommentheight=$(".blogcomment_list").height();
var winheight = $(window).height()-158;
var scrollTop = $(document).scrollTop();
//alert(scrollTop);
if(blogcommentheight > winheight && scrollTop > 0){
	$('.return_top').show();
	$('.last_num').show();

}else{
	$('.return_top').hide();
	$('.last_num').hide();
}
}
$(function(){
	retop();
	$(document).scroll(function(){
		   retop();
		})
	$.extend({//信息弹出层
     loadMsgDialog: function(options) {
		 var settings = $.extend({
				title: '',
				data: '',
				boxnum:''
			}, options);
	     var dialogStr = '<div class="alertlayer corner shadow">' +
					'<span class="close"></span>' +
					'<div class="box_'+settings.boxnum+'" >'+ settings.data +'</div>' +
						'</div>';
		$("body").append(dialogStr);
		var layer_w = $(".alertlayer").children('.box_'+settings.boxnum).width();
	    var half_w = layer_w/2;
		$(".alertlayer").css({marginLeft:'-'+half_w+'px'}).addClass("corner shadow");
		$(".close").click(function(){$("body").children(".alertlayer").remove();});		
		 }
     });
	$("tr:even").css("background","#f6f6f6");//表格隔行变色
	$("table tr").each(function (){
		$(this).children("td:last").css("border","0px");
		$(this).children("th:last").css("border","0px");
		 }) 
	$(".setting").hover(
		 function () {
          $(this).children().show();
		  $(this).addClass("set_h");
             },
         function () {
           $(this).children().hide();
		   $(this).removeClass("set_h");
		}
	);
    
	/**
	 *ajax get请求
	 *$(this).attr('href')：访问地址
	 *$(this).attr('refresh-id')：需要刷新的id
	 *$(this).attr('href')：访问地址
	 *$(this)包括class:comfirm则跳出确定框
	 *返回data字段包括：
	 *status(0,1)
	 *url:存在不为空('')则调整该url，不存在检查是否有需要更新的refresh-id，如果没有则刷新当前页面
	 *info:提示信息
	 */

    
	$('.ajax-get').click(ajaxGetClick);
	
	$("form .ajax-post").submit(function(){
	    if ( $(this).hasClass('confirm') ) {
	        if(!confirm('确认要执行该操作吗?')){
	            return false;
	        }
	    }
		var refreshId = $('#'+$(this).attr('refresh-id'));
		$.post($(this).attr("action"), $(this).serialize(), success, "json");
		return false;

		function success(data){
			if (data.status==1) {
				//window.location.href = data.url;
                if (data.url) {
                    location.href=data.url;
                }else if(refreshId != null && refreshId.length > 0){
                    //$('#top-alert').find('button').click();
                    refreshId.html(data.content);
                }else{
                    location.reload();
                }
			} else {
				$(this).find(".Validform_checktip").text(data.info);
				//刷新验证码
				//$(".reloadverify").click();
			}
		}
	});

/*	$('.more').click(function(){
	    var trigger = $(this);
	    trigger.prev('.last_num').remove();
	    trigger.next('.more_loader_spinner').css('display','block');
        trigger.css('display','none');
        var startClass = trigger.attr('start-count-class');
        if ((target = $(this).attr('href'))) {
        	var start = trigger.parent().children('.'+startClass).length;
        	if(target.indexOf('?') > 0){
        		target += ('&start='+start);
        	}else{
        		target += ('?start='+start);
        	}
	        $.get(target).success(function(data){
	            if (data.status==1) {
	                if (data.content) {
	                    trigger.css('display','block');
	                    trigger.before(data.content);
	                    trigger.next('.more_loader_spinner').css('display','none');
	                    $('.ajax-get').unbind("click", ajaxGetClick);
	                    $('.ajax-get').click(ajaxGetClick);
	                }else{
	                	//alert(data.info);
	                	trigger.css('display','block');
	                    trigger.before("<div class='last_num'>已到最后一条</div>");
	                	trigger.next('.more_loader_spinner').css('display','none');
	                }
	            }else{
	            	alert(data.info);
	            }
	        });
	    }
        return false;
        
	});*/
		   // if it's low enough, grab latest data
   $(window).scroll(function(){
	        if (this.ajaxRequest_ != undefined && this.ajaxRequest_.readyState < 4) {
	        	return false;
             }
		    var scrollval = levelReached();
		   		if (scrollval == 0){
		    	var trigger = $(".more");
		        var startClass = trigger.attr('start-count-class');
		        trigger.prev('.last_num').remove();
			    $('.more_loader_spinner').css('display','block');
		        if ((target = $(".more").attr('href'))) {
		        	var start = trigger.parent().children('.'+startClass).length;
		        	if(target.indexOf('?') > 0){
		        		target += ('&start='+start);
		        	}else{
		        		target += ('?start='+start);
		        	}
		       this.ajaxRequest_ = $.get(target).success(function(data){
			            if (data.status==1) {
			                if (data.content){
			                    trigger.before(data.content);
			                    $('.more_loader_spinner').css('display','none');
			                    $('.ajax-get').unbind("click", ajaxGetClick);
			                    $('.ajax-get').click(ajaxGetClick);
			                }else{
			                	//alert(data.info);
			                    trigger.before("<div class='last_num'>已到最后一条</div>");
			                	$('.more_loader_spinner').css('display','none');
			                }
			            }else{
			            	alert(data.info);
			            }
			        });
			    }
		        return false;
		   }
	});
    function levelReached(){
	    var pageHeight = $(document).height();
	    var viewportHeight = $(window).height();
	  	var scrollHeight = $(window).scrollTop();
	  	var scrollvalue = pageHeight - viewportHeight - scrollHeight;
	    return scrollvalue;
	  };
    function commentMoreClick(){
        var trigger = $(this);
        var startClass = trigger.attr('start-count-class');
        if ((target = $(this).attr('href'))) {
            var start = $('.comment-more').parent().children('.account_content').length;
            if(target.indexOf('?') > 0){
                target += ('&comment_offset='+start);
            }else{
                target += ('?comment_offset='+start);
            }
            $.get(target).success(function(data){
                if (data.status==1) {
                    if (data.content) {
                        trigger.before(data.content);
                        $('.ajax-get').unbind("click", ajaxGetClick);
                        $('.ajax-get').click(ajaxGetClick);
                    }
                }else{
                    alert(data.info);
                }
            });
        }
        trigger.unbind('click', commentMoreClick);
        trigger.addClass("comment-less");
		$('.Dashedlinearrow').addClass("Dashedlineabove");
        $('.comment-less').unbind('click', commentLessClick);
        $('.comment-less').bind('click', commentLessClick);
        trigger.removeClass(("comment-more"));
        return false;
    }

    function commentLessClick(){
        var trigger = $(this);
        var index = 1;
        var cur =trigger.parent().children(".account_content:first");
        var deleteItem = new Array();
        while(!(cur.next().length === 0) ) {
            if (index > 2) {
                deleteItem.push(cur);
            }
            index = index + 1;
            cur = cur.next(".account_content");
        }
        for (var item in deleteItem) {
            deleteItem[item].remove();
        }

        trigger.unbind('click', commentLessClick);
        trigger.addClass("comment-more");
		$('.Dashedlinearrow').removeClass("Dashedlineabove");
        $('.comment-more').unbind('click', commentMoreClick);
        $('.comment-more').bind('click', commentMoreClick);
        trigger.removeClass(("comment-less"));
        return false;
    };

    function submitClick(){
        var target;
        target = $(this).attr('href');
        if ( (target = $(this).attr('href')) || (target = $(this).attr('url')) ) {
            var words = $('.bad_word_input').val();
            target = target + "&word=" + words;
            $.get(target).success(function(data){
                if (data.status==1) {
                    if (data.url) {
                        location.href=data.url;
                    }else{
                        location.reload();
                    }
                }else{
                    //updateAlert(data.info);
                    if (data.url) {
                        location.href=data.url;
                    }else{
                        //$('#top-alert').find('button').click();
                        alert(data.info);
                    }
                }
            });
        }
        return false;
    }
	$('.Dashedlinearrow').parent().addClass("account_contentline");
    $('.comment-more').click(commentMoreClick);
    $('.comment-less').click(commentLessClick);
    $('.content_submit').click(submitClick);
})
	