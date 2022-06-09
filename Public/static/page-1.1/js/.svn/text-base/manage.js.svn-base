// JavaScript Document
$(function(){
	$(".edit").click(function(){//内容管理页面点击编辑按钮联动效果
	   var $edit= $(this).parent().siblings(".edit_box");
	   var txt= $edit.text();
       $edit.html("");
	   $edit.append("<input class='edit_text' type='text' value='" + txt + "'>");
       $(".edit_text").focus();
	   $(this).hide();
	   $(this).next().show();
	});
	$(".define").click(function(){
	   var $edit= $(this).parent().siblings(".edit_box");
	   var $editval= $edit.children().val();
	     $edit.html("");
		 $edit.html($editval);
		 $(this).hide();
		 $(this).prev().show();
        var target;
        if ((target = $(this).attr('href')) || (target = $(this).attr('url')) ) {
            target = target + $edit.html();
            $.get(target);
        }
		});
	$(".input_t_w").click(function(){
		$(this).val("");
		});
	
})
	