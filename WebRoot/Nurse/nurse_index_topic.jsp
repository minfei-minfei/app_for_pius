<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>   
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBK","root","root");
Statement stmt=con.createStatement();
String seleStr="SELECT * from topic order by time desc";
ResultSet rs=stmt.executeQuery(seleStr);

%>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>用户首页_圈子界面_话题</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/index_circle.css"/>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a href="nurse_login.jsp" class="navbar-brand login-link"></a>
            <div id="circle-nav" class="navbar-title">
                <ul class="pagination">
                    <li><a href="nurse_index_circle.jsp">文章</a></li>
                    <li class="active"><a href="nurse_index_topic.jsp">话题</a></li>
                </ul>
            </div>
            <a href="nurse_publish.html" class="navbar-brand glyphicon glyphicon-send pull-right"></a>
        </div>
    </div>
</nav>
<ul id="filter" class="nav nav-tabs">
    <li class="active"><a href="javascript:;">发表时间</a></li>
    <li><a href="javascript:;">参与人数</a></li>
    <li class="pull-right"><a href="nurse_index_topic.jsp" class="glyphicon glyphicon-refresh"></a>
</ul>
<%while(rs.next()){ %>
<div class="topic">
    <div class="container">
        <div class="media-body">
            <h5 class="topic-header">
            	<span style="font-weight: bolder">#<%=rs.getString("tpcTit") %>#</span>
                <br><small><%=rs.getString("time") %></small>
                <br><small>浏览：转发：评论：</small>
            </h5>
            <a href="nurse_topicDetail.html">
                <p class="topic-content"><%=rs.getString("tpcCont") %></p>
            </a>
        </div>
    </div>
</div>
<%} %>
<ul id="bottom-nav" class="pager">
    <li><a href="nurse_index.html"><span class="glyphicon glyphicon-home"></span>首页</a></li>
    <li class="active"><a href="nurse_index_circle.jsp"><span class="glyphicon glyphicon-globe"></span>圈子</a></li>
    <li><a href="nurse_index_order.jsp"><span class="glyphicon glyphicon-list-alt"></span>订单</a></li>
    <li><a href="nurse_index_me.html"><span class="glyphicon glyphicon-user"></span>我的</a></li>
</ul>
<%	rs.close();
	stmt.close();
	con.close();%>
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
</body>
</html>