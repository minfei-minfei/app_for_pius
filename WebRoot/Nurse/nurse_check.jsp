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
    <link rel="stylesheet" href="../css/nurse_check.css"/>
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
                 title="待接单" id="state1">
            </div>
            <div role="progressbar"
                 style="width: 30%;" data-toggle="tooltip" data-placement="top"
                 title="待服务" id="state2">
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
        
    </div>
    <div class="container" >
	        
    </div>
    <blockquote id="orderUser">
       <img src="../img/user_portrait_default.png" alt="下单用户" >
	   <span><%=rs.getString("username") %></span>
    </blockquote>
    <%  Statement stmt2=con.createStatement();
    	String seleStr2="SELECT * FROM usercontact where userName='"+rs.getString("username")+"' AND ContactName='"+rs.getString("usercontact")+"'";
    	ResultSet rs2=stmt2.executeQuery(seleStr2); 
    	while(rs2.next()){%>
    <div class="media container">
        <a class="media-left" href="#">
            <img class="media-object" src="../img/old_portrait_default.png"
                 alt="老人">
        </a>
        <div class="media-body">
            <h4 class="media-heading"><%=rs2.getString("contactName") %></h4>
            <p >
                年龄：<span><%out.print(rs2.getString("contactAge")); %></span><br>
                详细地址：<span><%out.print(rs2.getString("contactAddress")); %></span><br>
                联系电话：<span><%out.print(rs2.getString("contactTel")); %></span>
            </p>
        </div>
    </div>

<%} rs2.close();stmt2.close();%>
    
    <!-- 接单 -->
    <div class="modal fade" id="orderAccept" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                	<h4 class="modal-title">确认接单？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a href="nurse_orderInsert.jsp?param_order=<%=s_orderNumber%>" class="btn btn-primary" >确认</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 拒绝接单 -->
    <div class="modal fade" id="orderRefuse" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                	<h4 class="modal-title">拒绝接单？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a href="nurse_orderDel.jsp?param_order=<%=s_orderNumber%>" class="btn btn-primary" >确认</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    
    <%} %>

	<nav id="user-order-footer" class="navbar navbar-default navbar-fixed-bottom" role="navigation">
        <div class="navbar-header row">
        	<a id="not-accept" class="navbar-brand col-xs-6 bg-danger" data-toggle="modal" data-target="#orderRefuse">拒绝接单</a>
            <a id="accept" class="navbar-brand col-xs-6" data-toggle="modal" data-target="#orderAccept">接单</a>
        </div>
    </nav>
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
<%	
	rs.close();
	stmt.close();
	con.close();%>
</body>
</html>