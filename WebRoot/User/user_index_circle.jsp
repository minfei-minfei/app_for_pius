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
String seleStr="SELECT * from userarticle order by time desc";
ResultSet rs=stmt.executeQuery(seleStr);
String ls=null;
%>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>用户首页_圈子界面_文章</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/index_circle.css"/>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a href="user_login.jsp" class="navbar-brand login-link"></a>
            <div id="circle-nav" class="navbar-title">
                    <ul class="pagination">
                        <li class="active"><a href="user_index_circle.jsp">文章</a></li>
                        <li><a href="user_index_topic.jsp">话题</a></li>
                    </ul>
            </div>
            <a href="user_publish.html" class="navbar-brand glyphicon glyphicon-send pull-right"></a>
        </div>
    </div>
</nav>
<ul id="filter" class="nav nav-tabs">
    <li class="active"><a href="javascript:;">发表时间</a></li>
    <li><a href="javascript:;">浏览量</a></li>
    <li><a href="javascript:;">转发量</a></li>
    <li class="pull-right"><a href="user_index_circle.jsp" class="glyphicon glyphicon-refresh"></a>
</ul>

<div class="article">
<%while(rs.next()){ %>
    <div class="container">
    <h4 class="article-header">
        <a href="#"><img class="publisher" src="../img/nurse_portrait_default.png" alt="头像"/></a>
       <%out.print(rs.getString("atcTit")); %>
    </h4>
        <small><%out.print(rs.getString("time")); %></small><br>
        <small class="article-info">浏览：转发：评论：</small>
    <div onClick="self.location='user_articleDetail.jsp?pram_atcTit=<%=rs.getString("atcTit")%>'">
        <p class="article-content"><%out.print(rs.getString("atcCont")); %>
        </p>
    </div>
    </div>
    <a href="user_articleDetail.jsp" class="row">
        <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
        <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
        <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
    </a>
<%} %>
</div>

<ul id="bottom-nav" class="pager">
    <li><a href="user_index.html"><span class="glyphicon glyphicon-home"></span>首页</a></li>
    <li><a href="user_index_nurse.jsp"><span class="glyphicon glyphicon-leaf"></span>护工</a></li>
    <li class="active"><a href="user_index_circle.jsp"><span class="glyphicon glyphicon-globe"></span>圈子</a></li>
    <li><a href="user_index_order.jsp"><span class="glyphicon glyphicon-list-alt"></span>订单</a></li>
    <li><a href="user_index_me.html"><span class="glyphicon glyphicon-user"></span>我的</a></li>
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