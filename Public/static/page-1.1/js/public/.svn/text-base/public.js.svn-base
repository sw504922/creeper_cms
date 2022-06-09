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
                    removeId.remove();
                    if(removeLinkId != null && removeLinkId.length > 0){
                        var leftNum = removeLinkId.find('.'+removeClass).length;
                        if(leftNum == 0){
                            removeLinkId.remove();
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

$(function(){
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

	$('.more').click(function(){
		
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
        
	});
    $('.comment-more').click(function(){

        var trigger = $(this);
        //trigger.prev('.last_num').remove();
        //trigger.next('.more_loader_spinner').css('display','block');
        trigger.css('display','none');
        var startClass = trigger.attr('start-count-class');

        if ((target = $(this).attr('href'))) {
            var start = $('.more').parent().children('.'+startClass).length;
            if(target.indexOf('?') > 0){
                target += ('&start='+start);
            }else{
                target += ('?start='+start);
            }

            $.get(target).success(function(data){
                if (data.status==1) {

                    if (data.content) {
                        //trigger.css('display','block');
                        trigger.before(data.content);
                       // trigger.next('.more_loader_spinner').css('display','none');
                        $('.ajax-get').unbind("click", ajaxGetClick);
                        $('.ajax-get').click(ajaxGetClick);
                    }else{
                        //alert(data.info);
                       // trigger.css('display','block');
                        //trigger.before("<div class='last_num'>已到最后一条</div>");
                        //trigger.next('.more_loader_spinner').css('display','none');
                    }

                }else{
                    alert(data.info);
                }
            });

        }

        return false;

    });
    function submitClick(){
        var target;
        target = $(this).attr('href');
        alert(target);
        if ( (target = $(this).attr('href')) || (target = $(this).attr('url')) ) {
            var words = $('.bad_word_input').val();
            target = target + "&word=" + words;
            alert(target);
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
    $('.content_submit').click(submitClick);
})
	