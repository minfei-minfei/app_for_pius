$(function(){
    //评论
    $(".glyphicon-comment").on("click",function(){
        $("#comment-box").show();
        $("#comment-box button").on("click",function(){
            $("#comment-box").hide();
        });
    });
    /*屏幕滚动事件*/
    var $topicTitle = $("#topic-header .topic-title").html();
    $(window).scroll(function(){
        if($("body").scrollTop()>0){
            $(".navbar").css("background","#f8f8f8").css("color","#333333");
            $(".navbar .glyphicon").css("color","#333333");
            $(".navbar .navbar-title").html($topicTitle);
        }else{
            $(".navbar").css("background","transparent");
            $(".navbar .glyphicon").css("color","white");
            $(".navbar .navbar-title").html("");
        }
    });
    /*关注*/
    var $follow = $("#follow");
    //tooltip工具显示后延迟1s隐藏
    $follow.on("show.bs.tooltip", function () {
        setTimeout(function(){
            $(this).tooltip("hide");
        }.bind(this),1000);
    });
    //定义标志位flag，false表示未关注
    $follow.prop("flag",false).on("click",function(){
        if(!$(this).prop("flag")){
            $(this).removeClass("glyphicon-star-empty").addClass("glyphicon-star").attr("data-original-title","关注成功").tooltip("show");
        }else{
            $(this).removeClass("glyphicon-star").addClass("glyphicon-star-empty").attr("data-original-title","已取消").tooltip("show");
        }
        $(this).prop("flag",!$(this).prop("flag"));
    });
});