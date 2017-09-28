<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
Statement stmt=con.createStatement();
String s_nursename = (String) session.getAttribute("nursename");
String seleStr="SELECT * FROM userorder WHERE nursename ='"+s_nursename+"'";
ResultSet rs=stmt.executeQuery(seleStr);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>用户首页_订单界面</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/index_order.css"/>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a href="nurse_logWeb.jsp" class="navbar-brand login-link"></a>
            <span class="navbar-brand navbar-title">订单</span>
        </div>
    </div>
</nav>
<ul id="filter" class="nav nav-tabs row">
    <li class="active col-xs-4">
        <a href="javascript:;">全部</a>
    </li>
    <li class="col-xs-4">
        <a href="javascript:;">未完成</a>
    </li>
    <li class="col-xs-4">
        <a href="javascript:;">已完成</a>
    </li>
</ul>
<%while(rs.next()){ %>
<div class="media">
    <div class="container">
        <a class="media-left" href="javasctipt:;">
            <img class="media-object" src="../img/user_portrait_default.png"alt="">
        </a>
        <div class="media-body" onClick="self.location='nurse_check.jsp?param_order=<%=rs.getString("ordernumber")%>'">
            <h4 class="media-heading"><%=rs.getString("username")%>
                <span class="pull-right small">待接单</span>
            </h4>
            <span>￥<%=rs.getString("price")%>&times;1天</span><span class="price lead pull-right">￥<%=rs.getString("price")%></span>
            <span class="glyphicon glyphicon-time">2017-09-01至2017-10-01</span>
        </div>
    </div>
</div>
<%} %>
<%	rs.close();
	stmt.close();
	con.close();%>
<ul id="bottom-nav" class="pager">
    <li><a href="nurse_index.html"><span class="glyphicon glyphicon-home"></span>首页</a></li>
    <li><a href="nurse_index_circle.jsp"><span class="glyphicon glyphicon-globe"></span>圈子</a></li>
    <li class="active"><a href="nurse_index_order.jsp"><span class="glyphicon glyphicon-list-alt"></span>订单</a></li>
    <li><a href="nurse_index_me.html"><span class="glyphicon glyphicon-user"></span>我的</a></li>
</ul>

<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
    
</body>
</html>