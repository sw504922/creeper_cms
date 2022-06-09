$(function(){
	
	function CurentTime(obj)
    { 
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
		if(obj == 1){
			return y;
		}else{
			return h;
		}
    } 
	
	$("#id-date-picker-1").val(CurentTime(1));
	$("#id-date-picker-2").val(CurentTime(2));
	
	$("#btn_submit_handler").click(function(){
		//获取时间，job名称，job_name,以及服务器ip端口
		var ip_port = $.trim($("#ip_port_handler").text());
		var job_name = $.trim($("#job_name_handler").text());
		var job_id = $.trim($("#job_id_handler").text());
		var start_day = $("#id-date-picker-1").val();
		var end_day = $("#id-date-picker-2").val();
		var start_clock =$("#timepicker1").val();
		var end_clock =$("#timepicker2").val();
		var start_time= start_day+" " +start_clock;
		var end_time= end_day+" " +end_clock;
		var time ="&start_time="+start_time+"&end_time="+end_time;
		//alert(end_day);
		if(end_day < start_day){
			$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束日期小于开始日期 </div>';
			$(".table").before(html);   
			return false
		}else{
			$(".alert").remove();
			
		}
		
	    if(end_day == start_day && start_clock > end_clock){
	    	$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束时间小于开始时间 </div>';
			$(".table").before(html); 
			return false
			}else{
			 $(".alert").remove();
			}
		refreshHandlerData(ip_port, job_name, job_id, time);
	});
	
	
	$("#btn_submit_fetcher").click(function(){
		//获取时间，job名称，job_name,以及服务器ip端口
		var ip_port = $.trim($("#ip_port_fetcher").text());
		var job_name = $.trim($("#job_name_fetcher").text());
		var job_id = $.trim($("#job_id_fetcher").text());
		var start_day = $("#id-date-picker-1").val();
		var end_day = $("#id-date-picker-2").val();
		var start_clock =$("#timepicker1").val();
		var end_clock =$("#timepicker2").val();
		var start_time= start_day+" " +start_clock;
		var end_time= end_day+" " +end_clock;
		var time ="&start_time="+start_time+"&end_time="+end_time;
//		alert("entry_indexjs");
		if(end_day < start_day){
			$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束日期小于开始日期 </div>';
			$(".table").before(html);   
			return false
		}else{
			$(".alert").remove();
			
		}
//		alert("midele index.js")
	    if(end_day == start_day && start_clock > end_clock){
	    	$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束时间小于开始时间 </div>';
			$(".table").before(html); 
			return false
			}else{
			 $(".alert").remove();
			}
//	    alert("over indexjs");
		refreshFetcherData(ip_port, job_name, job_id, time);
	});
	
	$("#btn_submit_dispatcher").click(function(){
		//获取时间，job名称，job_name,以及服务器ip端口
		var job_id = $.trim($("#job_id_dispatcher").text());
		var type = $.trim($("#type_dispatcher").text());
		var start_day = $("#id-date-picker-1").val();
		var end_day = $("#id-date-picker-2").val();
		var start_clock =$("#timepicker1").val();
		var end_clock =$("#timepicker2").val();
		var start_time= start_day+" " +start_clock;
		var end_time= end_day+" " +end_clock;
		var time ="&start_time="+start_time+"&end_time="+end_time;
		//alert(end_day);
		if(end_day < start_day){
			$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束日期小于开始日期 </div>';
			$(".table").before(html);   
			return false
		}else{
			$(".alert").remove();
			
		}
		
	    if(end_day == start_day && start_clock > end_clock){
	    	$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束时间小于开始时间 </div>';
			$(".table").before(html); 
			return false
			}else{
			 $(".alert").remove();
			}
		refreshDispatcherData(job_id, type, time);
	});
	
	$("#btn_submit_scheduler").click(function(){
		//获取时间，job名称，job_name,以及服务器ip端口
//		alert("entry1");
		var job_id = $.trim($("#job_id_scheduler").text());
		var type = $.trim($("#type_scheduler").text());
		var start_day = $("#id-date-picker-1").val();
		var end_day = $("#id-date-picker-2").val();
		var start_clock =$("#timepicker1").val();
		var end_clock =$("#timepicker2").val();
		var start_time= start_day+" " +start_clock;
		var end_time= end_day+" " +end_clock;
		var time ="&start_time="+start_time+"&end_time="+end_time;
		//alert(end_day);
		if(end_day < start_day){
			$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束日期小于开始日期 </div>';
			$(".table").before(html);   
			return false
		}else{
			$(".alert").remove();
			
		}
	    if(end_day == start_day && start_clock > end_clock){
	    	$(".alert").remove();
			var html='<div class="alert alert-warning alert-dismissible" role="alert">'+
				  '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
				  '<strong>Warning!</strong>结束时间小于开始时间 </div>';
			$(".table").before(html); 
			return false
			}else{
			 $(".alert").remove();
			}
//	    alert("entry2");
		refreshSchedulerData(job_id, type, time);
		
	});
	/*var targetid = $("#tab");
	pagination(targetid);*/
});
/*function pagination(targetid)(
	    targetid.each(function() {
	    var currentPage = 0;
	    var numPerPage = 2;
	    var $table = $(this);
	    $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	    $table.bind('repaginate', function() {
	        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	    });
	    var numRows = $table.find('tbody tr').length;
	    var numPages = Math.ceil(numRows / numPerPage);
	    var $pager = $(".pagination");
	    var $ul = $('<ul></ul>');
	    var $prev = $('<span class="prev"><a href="#"><i class="icon-double-angle-left"></i></a></span>');
	    var $next = $('<span class="next"><a href="#"><i class="icon-double-angle-right"></i></a></span>');
	    for (var page = 0; page < numPages; page++) {
	    	$('<li><a href="#">'+(page+1)+'</a></li>')
	         .bind('click', { newPage: page }, function(event) {
	             currentPage = event.data['newPage'];
	             $table.trigger('repaginate');
	             $(this).addClass('active').siblings().removeClass('active');
	         }).appendTo($ul);
	    }
	    $ul.prepend($prev);
	    $ul.append($next);
	    $ul.appendTo($pager);
	    $pager.insertAfter($table);
	    $table.trigger('repaginate');
	    $pager.find('li:first').addClass('active');
	    var numli = $(".pagination li").length;
	    $('.prev').click(function(){
	    	$('.active').prevAll("li:first").click();
	    });
	    $('.next').click(function(){
	    	$('.active').nextAll("li:first").click();
	    });
	    if(numli >=7){
	 	     var nummid = Math.round((numli-2)/2);
	 	     $pager.find('li:first').after('<span>...</span>');
	 	     $pager.find('li:last').before('<span>...</span>');	
	 	     $pager.find('li').hide();
	 	     $pager.find('li:first').show();
	 	     $pager.find('li:last').show();
	 	     $pager.find('li:eq("'+nummid+'")').show();
	 	     $pager.find('li:eq("'+nummid+'")').next().show();
	 	     $pager.find('li:eq("'+nummid+'")').prev().show();
	 	     $("li:gt(0)").bind('click',function(){
	 	    	 $pager.find('li').hide();
	 	    	 $pager.find('li:first').show();
		 	     $pager.find('li:last').show();
		 	     $(this).show();
	        	 $(this).next().show();
	        	 $(this).prev().show();
	         })
 	         
	    }
	    	
	    })
)
*/
