$(function(){

    /*根据上一页点击的是“编辑”或“添加”，修改本页状态*/
    if(localStorage.getItem("contact_next")=="edit"){
        $(".glyphicon-chevron-left").html("编辑联系人");
        //以下相关值应从数据库读取
        $("#upload-picture img").attr("src","../img/old_portrait_default.png");
        $("input[name=contactCall]").val("张三");
        $("input[name=contactAddress]").val("哈尔滨市医院");
        $("input[name=contactHome]").val("哈尔滨市香坊区和兴路");
    }
    if(localStorage.getItem("contact_next")=="add"){
        $(".glyphicon-chevron-left").html("新建联系人");
        $("#upload-picture img").attr("src","../img/user_portrait_default.png");
    }
    /*上传照片*/
    document.getElementById("upload").addEventListener("change",function(){
        var files = this.files;
        var reader = new FileReader();
        reader.readAsDataURL(files[0]);
        reader.onload = function(e){
            localStorage.setItem("user_add",e.target.result);
            document.getElementById("click").src = this.result;
        };
    });
    //收起显示折叠菜单
    var $collapse = $("[data-toggle='collapse']");
    $collapse.prop("show",true);//show为true表示展开，false表示折叠
    $collapse.on("click",function(){
        if($(this).prop("show")){
            $(this).html("显示");
        }else{
            $(this).html("收起");
        }
        $(this).prop("show",!$(this).prop("show"));
    });

    //身体状况：
    $(".list-group-item span").on("click",function(){
        $(this).addClass("selected").siblings().removeClass("selected");
        localStorage.setItem("span_select",$(this).index());
    });
    if( localStorage.getItem("span_select") ){
        $(".body-health span:eq("+ parseInt(localStorage.getItem("span_select" ))+")").addClass("selected").siblings().removeClass("selected");
    }
    //选择性别
    var $sex = $("#sex label");
    $("#sex label input").unbind("on").unbind("blur");
    $sex.on("click",function(){
    	$(this).children("input").attr("checked","checked");
    	$(this).siblings("label").children("input").removeAttr("checked");
    	console.log($(this).children("input").val());
    });
});














