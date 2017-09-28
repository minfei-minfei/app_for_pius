$(function(){
    //判断是否第一次登录
    if(localStorage.getItem("firstLogin")==null){
        $("#protocolModal").modal({
            backdrop: "static",/*���û����ģ̬���ⲿʱ����ر�ģ̬��*/
            show: true
        });
        $("#not-agree").on("click",function(){
            history.go(-1);
        });
        $("#agree").on("click",function(){
            localStorage.setItem("firstLogin","true");
        });
    }
//            localStorage.clear();

});