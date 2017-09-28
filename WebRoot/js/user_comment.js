(function(){
    /*评分*/
    var oStar = document.getElementById("user_scoring");/*星星栏目*/
    var aImg = oStar.getElementsByTagName("li");/*星星图片*/
    /*点击星星固定图片和后缀*/
    for(var i=0; i<aImg.length; i++){
        //flag表示是否打分，score表示分数
        var flag = false, score = 0;
        aImg[i].index = i;
        aImg[i].onclick = function(){
            flag = true;
            score = this.index + 1;
            /*前面的星星点亮，后面的星星熄灭*/
            for(var j=0; j<=this.index; j++){
                aImg[j].style.backgroundPositionY = "-96px";
            }
            for(var k=aImg.length-1; k>this.index; k--){
                aImg[k].style.backgroundPositionY = "0";
            }
        };
    }
})();
$(function(){
    //提交订单跳转至已完成订单界面
    $("button").on("click",function(){
        self.location = "user_index_order.html";
    });
});