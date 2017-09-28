<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBK","root","root");
Statement stmt=con.createStatement();
String s_orderNumber=request.getParameter("param_order");
String seleStr="SELECT * FROM userorder where ordernumber='"+s_orderNumber+"'";
ResultSet rs=stmt.executeQuery(seleStr);
%>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>订单详情</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/user_check.css"/>
</head>
<body>
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand glyphicon glyphicon-chevron-left">订单详情</a>
            </div>
        </div>
    </nav>
    <%while(rs.next()){%>
    <div class="container">
        <p>进度:</p>
        <div id="progress" class="progress progress-striped active">
            <div role="progressbar"
                 style="width: 40%;" data-toggle="tooltip" data-placement="top"
                 title="待支付" id="state1">
            </div>
            <div role="progressbar"
                 style="width: 30%;" data-toggle="tooltip" data-placement="top"
                 title="待受理" id="state2">
            </div>
            <div role="progressbar"
                 style="width: 20%;" data-toggle="tooltip" data-placement="top"
                 title="待评价" id="state3">
            </div>
            <div role="progressbar"
                 style="width: 10%;" data-toggle="tooltip" data-placement="top"
                 title="服务完成" id="state4">
            </div>
        </div>
    </div>

    <div class="well" id="order-info">
        总价：￥<%=rs.getString("price") %><br>
        订单号：<%=rs.getString("ordernumber") %><br>
        下单时间：<%=rs.getString("ordertime") %>
        <button type="button" class="btn btn-danger" id="order-cancel" data-toggle="modal" data-target="#orderCancel">取消订单</button>
    </div>
    <div class="media">
        <div class="container">
            <a class="media-left" href="#">
                <img class="media-object" src="../img/nurse_portrait_default.png"
                     alt="张三">
            </a>
            <div class="media-body">
                <h4 class="media-heading"><%=rs.getString("nursename") %></h4>
                
                <small>级别：&nbsp;护龄：</small>
                <p style="color: gray">
                    
                </p>
            </div>
            <div class="media-bottom">
                <p>类型</p>
                <p>时间</p>
            </div>
        </div>
    </div>
    
    <blockquote>
        服务对象
    </blockquote>
    <div class="media">
        <div class="container">
            <a class="media-left" href="#">
                <img class="media-object" src="../img/old_portrait_default.png"
                     alt="">
            </a>
            <div class="media-body">
                <h4 class="media-heading"><%=rs.getString("usercontact") %></h4>
                <small>身体情况：</small><br>
                <span class="glyphicon glyphicon-map-marker"></span>
            </div>
        </div>
    </div>
    <!-- 取消订单弹出框 -->
    <div class="modal fade" id="orderCancel" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    
                </div>
                <div class="modal-body">
                	<h4 class="modal-title">是否确认删除？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a href="user_orderDel.jsp?param_order=<%=rs.getString("ordernumber")%>" class="btn btn-primary" >确认</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    
    <%} %>

<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
<%  int s_orderState = 0;
	//再次执行查询语句
	rs=stmt.executeQuery(seleStr);
	if(rs.next()){
		s_orderState = rs.getInt("orderstate");
	}
%>
<script>

var $state = <%=s_orderState%>;
$(function(){
	switch ($state){
    case 1:
        $("#state1").addClass("progress-bar progress-bar-success");
        break;
    case 2:
    	$("#state1").addClass("progress-bar progress-bar-success");
    	$("#state2").addClass("progress-bar progress-bar-info");
    	break;
    case 3:
    	$("#state1").addClass("progress-bar progress-bar-success");
    	$("#state2").addClass("progress-bar progress-bar-info");
        $("#state3").addClass("progress-bar progress-bar-warning");
        break;
    case 4:
    	$("#state1").addClass("progress-bar progress-bar-success");
    	$("#state2").addClass("progress-bar progress-bar-info");
        $("#state3").addClass("progress-bar progress-bar-warning");
    	$("#state4").addClass("progress-bar progress-bar-danger");
    	break;
}
    $(".progress-bar").last().tooltip("show");
});

</script>
<%	rs.close();
	stmt.close();
	con.close();%>
</body>
</html>