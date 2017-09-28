(function(){
    /*上传照片*/
    function fileUpLoad(){
        var that = this;//that指代input
        var file = this.files[0];
        if(!FileReader){
            $("#myAlert span").html("你的浏览器不支持H5的FileReader");
            $("#myAlert").show();
            $(".upload").attr("disabled","disabled");
            return;
        }
        var fileReader = new FileReader();
        fileReader.readAsDataURL(file);//将文件读取为Data URL 读取结果放在result中
        fileReader.onload = function(){
            $(that).parent("a").siblings("img").attr("src",this.result);
            localStorage.setItem("nurse_portrait",this.result);
        }
    }
    function IdUpLoad(){
        var that = this;//that指代input
        var file = this.files[0];
        if(!FileReader){
            $("#myAlert span").html("你的浏览器不支持H5的FileReader");
            $("#myAlert").show();
            $(".upload").attr("disabled","disabled");
            return;
        }
        var fileReader = new FileReader();
        fileReader.readAsDataURL(file);//将文件读取为Data URL 读取结果放在result中
        fileReader.onload = function(){
            $(that).siblings("img").attr("src",this.result);
        }
    }
    $(".upload").on("change",fileUpLoad);
    $(".imgload").on("change",IdUpLoad);
    /*保存头像*/
    if(localStorage.getItem("nurse_portrait")){
        $(".upload-picture img").attr("src",localStorage.getItem("nurse_portrait"));
    }


    //电话号码错误提示：限11位
    $("input[name='telephone']").on("keyup",function(){
        if( $(this).val().length != 11){
            $(this).siblings(".checked").hide();
            $(this).siblings(".checked-false").show();
        }else{
            $(this).siblings(".checked-false").hide();
            $(this).siblings(".checked").show();
        };
        if( $(this).val() == ""){
            $(this).siblings(".checked").hide();
            $(this).siblings(".checked-false").hide();
        }
    });

    //身份证号提示：
    $("input[name='idCard']").on("keyup",function(){
        if( Identity($(this).val()) ){
            $(this).siblings(".checked-false").hide();
            $(this).siblings(".checked").show();
        }else{
            $(this).siblings(".checked-false").show();
            $(this).siblings(".checked").hide();
        };
        if( $(this).val() == ""){
            $(this).siblings(".checked").hide();
            $(this).siblings(".checked-false").hide();
        }
    });


    //身份证号验证：
    /*
     * 若返回true,身份证号正确；
     * 返回false,身份证号错误
     * */
    function Identity(code) {
        var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
        var pass= true;

        if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
            pass = false;
        }

        else if(!city[code.substr(0,2)]){
            pass = false;
        }
        else{
            //18位身份证需要验证最后一位校验位
            if(code.length == 18){
                code = code.split('');
                //加权因子
                var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                //校验位
                var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                var sum = 0;
                var ai = 0;
                var wi = 0;
                for (var i = 0; i < 17; i++)
                {
                    ai = code[i];
                    wi = factor[i];
                    sum += ai * wi;
                }
                if(parity[sum % 11] != code[17]){
                    pass =false;
                }
            }
        }
        return pass;
    }

    //服务内容多选：
    $(".range span").on("click",function(){
        if( $(this).hasClass("label-info")){
            $(this).removeClass("label-info").addClass("label-default");
        }else{
            $(this).removeClass("label-default").addClass("label-info");
        }
    });
  //提交控制
    var $regControl = $("#nurse-register-form :input");
    var regState = true;
    for(var i=1; i<15; i++){
    	if($regControl.eq(i).val()==""||$regControl.eq(i).val()==$regControl.eq(i).get(0).defaultValue){
    		regState = false;
    		console.log(i+":"+$regControl.eq(i).val());
    	}
    }
    $("button[type=submit]").on("click",function(){
    	console.log(regState);
    	for(var i=1; i<15; i++){
    		if($regControl.eq(i).val()==""||$regControl.eq(i).val()==$regControl.eq(i).get(0).defaultValue){
        		regState = false;
        		console.log("出错！"+i+":"+$regControl.eq(i).val());
        	}
        }
    	return false;
    });
    
    
    
 
})();












