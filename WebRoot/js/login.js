$(function(){
    var code;//声明一个变量用于存储生成的验证码
    /*切换验证码*/
    $("#code").on("click",changeCode());
    $("#change-code").on("click",changeCode);
    function changeCode(){
        //alert("换图片");
        var arrays=[
            '1','2','3','4','5','6','7','8','9','0',
            'a','b','c','d','e','f','g','h','i','j',
            'k','l','m','n','o','p','q','r','s','t',
            'u','v','w','x','y','z',
            'A','B','C','D','E','F','G','H','I','J',
            'K','L','M','N','O','P','Q','R','S','T',
            'U','V','W','X','Y','Z'
        ];
        code='';//初始化验证码
        //alert(arrays.length);
        //随机从数组中获取四个元素组成验证码
        for(var i=0;i<4;i++){
            //随机获取一个数组的下标
            var r=parseInt(Math.random()*arrays.length);
            code+=arrays[r];
            //alert(arrays[r]);
        }
        //alert(code);
        $("#code").html(code);//将验证码写入指定区域
    }

    /*效验验证码(表单被提交时触发)*/
    $("#user-forgerPsd-form button[type=submit]").on("click",checkCode);
    var settings1 = {
        selector: "#forgetModal",
        type: "alert-danger",
        content: "请填写正确信息"
    };
    var submitAlert = new Alert(settings1);
    function checkCode(){
        //获取用户输入的验证码
        var $vcode = $("#user-forgerPsd-form input[name=vcode]");
        if($vcode.val().toLowerCase()==code.toLowerCase())
        {
            //先检查验证码，再检查用户信息
            if($userName.siblings(".checked").css("display")=="block"
                && $oUserPsd.siblings(".checked").css("display")=="block"
                && $oUserPsd.val() == $oUserPsd2.val()){
                return true;
            }else{//用户信息不正确，弹出警告框
                submitAlert.init();
                return false;
            }
        }
        //验证码不正确,表单不允许提交
        /*弹出警告框*/
        var settings2 = {
            selector: "#forgetModal",
            type: "alert-warning",
            content: "验证码不正确"
        };
        var codeAlert = new Alert(settings2);
        codeAlert.init();
        $vcode.val("");
        $vcode.trigger("blur");
        return false;
    }
    /*验证用户名*/
    var $userName = $("#user-forgerPsd-form input[name=userName]");
    $userName.on("keyup",function(){
        //console.log($userName.val().length);
        if($(this).val().length>0 && $(this).val().length<=8){
            $(this).siblings(".checked").show().siblings(".checked-false").hide();
        }else{
            $(this).siblings(".checked-false").show().siblings(".checked").hide();
        }
    }).on("blur",function(){
        if(this.value == this.defaultValue){
            $(this).siblings(".checked-false").hide().siblings(".checked").hide();
        }
    });
    /*验证密码*/
    var $oUserPsd = $("#user-forgerPsd-form input[name=userPsd]");
    var $oUserPsd2 = $("#user-forgerPsd-form input[name=userPsd2]");
    /*只验证第一个密码的长度*/
    $oUserPsd.on("keyup",function(){
        if($(this).val().length>=6 && $(this).val().length<=12){
            $(this).siblings(".checked").show().siblings(".checked-false").hide();
        }else{
            $(this).siblings(".checked-false").show().siblings(".checked").hide();
        }
    }).on("blur",function(){
        if(this.value == this.defaultValue){
            $(this).siblings(".checked-false").hide().siblings(".checked").hide();
        }
    });
    /*验证两次密码的一致性*/
    var settings3 = {
        selector: "#forgetModal",
        type: "alert-warning",
        content: "两次密码不一致"
    };
    var psdAlert = new Alert(settings3);
    $oUserPsd2.on("blur",function(){
        if($oUserPsd.val() != $oUserPsd2.val()){
            /*弹出警告框*/
            psdAlert.init();
        }else{
            //若两次密码一致则自动移除警告框
            psdAlert.close();
        }
    });
    /*小眼睛*/
    var $aUserPsd = $(".user-psd");
    $aUserPsd.on("focus",function(){
        //显示小眼睛
        $(this).siblings(".eye").css("display","block");
    }).on("blur",function(){
        //隐藏小眼睛
        if(this.value == this.defaultValue){
            $(this).attr("type","text");
            $(this).siblings(".eye").css("display","none");
        }
    });
    var $eye = $(".eye");
    $eye.on("click",function(){
        if($(this).attr("class").indexOf("glyphicon-eye-open")!=-1){
            //显示密码
            $(this).removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
            $(this).siblings(".form-control").attr("type","text");
        }else{
            //隐藏密码
            $(this).removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
            $(this).siblings(".form-control").attr("type","password");
        }
    });
    
});
