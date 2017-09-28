/*定义一个Alert类*/
function Alert(settings){
    this.$alert = $('<div class="alert alert-dismissable"></div>');
    this.$close = $('<button class="close" data-dismiss="alert">&times;</button>');
    this.$strong = $('<strong>警告！</strong>');
    this.$span = $('<span>网络连接错误</span>');
    this.defaultSettings = {
        selector: "body",
        type: "alert-warning",
        content: "网络连接错误"
    };
    $.extend(this.defaultSettings,settings);
}
Alert.prototype.init = function(){
    this.$alert.append(this.$close).append(this.$strong).append(this.$span);
    $(this.defaultSettings.selector).append(this.$alert);
    this.$span.html(this.defaultSettings.content);
    this.$alert.addClass(this.defaultSettings.type);
};
Alert.prototype.close = function(){
    this.$close.trigger("click");
};
/*-----------------------------------*/
$(function(){
    //切换标签页
    $("#filter li").on("click",function(){
        $(this).addClass("active").siblings().removeClass("active");
    });
    /*输入框获得失去焦点*/
    //:input选择所有 input, textarea, select 和 button 元素.
    var $input = $(":input");
    $input.on("focus",function(){
        //获得焦点的时候，输入框是默认值，表示没有输入值，则设空
        if(this.value==this.defaultValue){
            this.value="";
        }
        $(this).css("color","inherit");
    });
    $input.on("blur",function(){
        //失去焦点的时候，输入框为空，表示没有输入值，则重新设为默认值
        if(this.value==""){
            this.value = this.defaultValue;
            $(this).css("color","lightgray");
        }else{
            $(this).css("color","inherit");
        }
    });
    /*返回上一页*/
    $(function(){
        var $back = $(".glyphicon-chevron-left");
        $back.on("click",function(){
            history.back();
        });
    });
    /*激活tooltip工具*/
    $("[data-toggle='tooltip']").tooltip();
    /*切换下拉菜单*/
    //定义标志位down，false表示折叠
    $(".glyphicon-chevron-down").prop("down","false").on("click",function(){
        if($(this).prop("down")){
            $(this).removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
        }else{
            $(this).removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
        }
        $(this).prop("down",!$(this).prop("down"));
    });
    /*切换label标签组*/
    $(".label-group .label").on("click",function(){
        $(this).removeClass("label-default").addClass("label-info").siblings(".label").removeClass("label-info").addClass("label-default");
    });
    /*多项筛选：重置&完成按钮*/
    $("#multiple-filter button[type=reset]").on("click",function(){
        $(".label-group .label").removeClass("label-info").addClass("label-default");
    });
    $("#multiple-filter button[type=submit]").on("click",function(){
        $("#filter-icon a").trigger("click");

    });
//  console.log($.cookie("username"));
    //设置nav头像
    if($.cookie("username")!=null){
    	$(".login-link").css({
    		background : "url(../img/user_portrait_default.png) no-repeat center",
    		backgroundSize : "contain"
    	});
    	$("#index-name").html($.cookie("username"));
    }
    if($.cookie("nursename")!=null){
    	$(".login-link").css({
    		background : "url(../img/nurse_portrait_default.png) no-repeat center",
    		backgroundSize : "contain"
    	});
    	$("#index-name").html($.cookie("nursename"));
    }
    
  //错误弹出框
    if($.cookie("error")!=null){
    	$("#errorModal .modal-title").html($.cookie("error"));
    	$("#errorModal").modal({
            backdrop: "static",
            show: true
        });
    	//销毁cookie
    	$.cookie("error",null);
    }
});