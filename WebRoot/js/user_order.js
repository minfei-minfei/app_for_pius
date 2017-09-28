$(function () {
    var $fullText = $("#full-text");
    var $psIntro = $("#order-info .personal-intro");
    //计算个人简介的文本行数
    function countLine(elem){
        var $height = parseInt(elem.css("height"));
        var $lineHeight = parseInt(elem.css("lineHeight"));
        return Math.ceil($height/$lineHeight);
    }
    //当文本行数大于3时只显示3行
    if(countLine($psIntro)<=3){
        $fullText.hide();
    }else{
        $psIntro.css("display","-webkit-box");
    }
    $fullText.prop("full",false);//标志位full，false表示不是全文
    /*显示全文&收起全文*/
    $fullText.on("click",function(){
        if(!$(this).prop("full")){
            $(this).text("收起全文");
            $psIntro.css("display","block");
        }else{
            $(this).text("显示全文");
            $psIntro.css("display","-webkit-box");
        }
        $(this).prop("full",!$fullText.prop("full"));
    });
    /*服务后支付*/
    //标志位flag，false表示没选中
    $("#service").prop("flag",false).on("click",function(){
        if(!$(this).prop("flag")){
            $("#service .pull-right").css("backgroundPosition","-48px -8px");
        }else{
            $("#service .pull-right").css("backgroundPosition","-16px -8px");
        }
        $(this).prop("flag",!$(this).prop("flag"));
    });
    /*立即支付*/
    $("#pay").hide();
    //标志位flag，false表示隐藏
    $("#pay-now").prop("flag",false).on("click",function(){
        if(!$(this).prop("flag")){
            $("#pay").show();
            //禁止滚动条
            $("body").css("overflow","hidden");
        }else{
            $("#pay").hide();
            //取消禁止滚动条
            $("body").css("overflow","scroll");
        }
        $(this).prop("flag",!$(this).prop("flag"));
    });
    $("#mask").on("click",function(){
        $("#pay").hide();
        $("body").css("overflow","scroll");
        $("#pay-now").prop("flag",false);
    });
    /*支付方式*/
    $("#pay .pay-way").on("click",function(){
        //注意：遇到checked属性只能用prop而不能用attr
        $(this).find("input").prop("checked","checked");
        $(this).siblings(".pay-way").find("input").removeAttr("checked");
    });
    /*地理定位*/
    var $address = $("#address");

    $address.on("click",function(){
        if(navigator.geolocation){
            $address.html("搜索中...");
            navigator.geolocation.getCurrentPosition(showPosition,showError);
        }else{
            var settings = {
                type: "alert-warning",
                content: "该浏览器不支持地理位置!"
            };
            var myAlert = new Alert(settings);
            myAlert.init();
        }
    });

    function showPosition(position){
        var lat=position.coords.latitude;
        var lng=position.coords.longitude;
        $address.html("纬度:"+parseInt(lat)+","+"经度:"+parseInt(lng));
    }
    function showError(error){
        var settings;
        var myAlert;
        switch(error.code)
        {
            case error.PERMISSION_DENIED:
                settings = {
                    type: "alert-warning",
                    content: "用户拒绝对获取地理位置的请求。"
                };
                myAlert = new Alert(settings);
                myAlert.init();
                break;
            case error.POSITION_UNAVAILABLE:
                settings = {
                    type: "alert-warning",
                    content: "位置信息是不可用的。"
                };
                myAlert = new Alert(settings);
                myAlert.init();
                break;
            case error.TIMEOUT:
                settings = {
                    type: "alert-warning",
                    content: "请求用户地理位置超时。"
                };
                myAlert = new Alert(settings);
                myAlert.init();
                break;
            case error.UNKNOWN_ERROR:
                settings = {
                    type: "alert-warning",
                    content: "未知错误。"
                };
                myAlert = new Alert(settings);
                myAlert.init();
                break;
        }
        $address.html("请选择地址");
    }
    /*日期校验*/
    //转换时间类型为 yyyy-mm-dd
    function FormatDate (strTime) {
        var date = new Date(strTime);
        var formatedMonth = ("0" + (date.getMonth() + 1)).slice(-2);
        var formatedDate = ("0" + (date.getDate())).slice(-2);
        return date.getFullYear()+"-"+formatedMonth+"-"+formatedDate;
    }

//开始时间
    /*$("#keyword_time_min").change(function(){
        var d1=new Date($(this).val());            //获取当前时间
        var d2=new Date(d1);
        // d2.setFullYear(d2.getFullYear()+1);      //当前时间+1年
        d2.setDate(d2.getDate()+7);             //当前时间+7天
        d2=FormatDate(d2);                      //转换d2为YYYY-MM-DD格式

        $("#keyword_time_max").attr("max",d2); //最大时间为d2
        $("#keyword_time_max").attr("min",$(this).val()); //最小时间为当前时间

    });*/

//终止时间
    /*$("#keyword_time_max").change(function(){
        var d3=new Date($(this).val());
        var d4=new Date(d3);
        // d4.setFullYear(d4.getFullYear()-1);
        d4.setDate(d4.getDate()-7);             //当前时间-7天
        d4=FormatDate(d4);

        $("#keyword_time_min").attr("min",d4);
        $("#keyword_time_min").attr("max",$(this).val());
        console.log($(this).val());
    });*/
    
    //提交表单
    $("#pull-cart").on("click",function(){
    	$("#order-form").submit();
    });
});