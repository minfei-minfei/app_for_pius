<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
Statement stmt=con.createStatement();
String seleStr="SELECT * FROM nurse order by serviceLevel desc";
ResultSet rs=stmt.executeQuery(seleStr);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>用户首页_护工界面</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/index_nurse.css"/>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a href="user_login.jsp" class="navbar-brand login-link"></a>
            <span class="navbar-brand navbar-title">护工</span>
            <a href="user_search.jsp" class="navbar-brand pull-right" id="search"></a>
        </div>
    </div>
</nav>

<ul id="filter" class="nav nav-tabs">
    <li><a href="user_index_nurse_age.jsp">服务年龄</a></li>
    <li><a href="user_index_nurse_pri.jsp">价格最低</a></li>
    <li class="active"><a href="user_index_nurse_ser.jsp">服务级别</a></li>
    <li id="filter-icon"><a href="javascript:;" data-toggle="collapse" data-target="#multiple-filter"
            class="glyphicon glyphicon-chevron-down"></a>
</ul>
<div id="multiple-filter" class="collapse">
    <div class="container">
        <p class="label-group">距离:
            <span class="label label-default">3km以内</span>
            <span class="label label-default">3-10km</span>
            <span class="label label-default">10km以上</span>
        </p>
        <p class="label-group">价格:
            <span class="label label-default">500/天以内</span>
            <span class="label label-default">500~800/天</span>
            <span class="label label-default">800/天以上</span>
        </p>
        <p class="label-group">性别:
            <span class="label label-default">男</span>
            <span class="label label-default">女</span>
        </p>
        <div class="btn-group btn-group-sm pull-right">
            <button type="reset" class="btn btn-default">重置</button>
            <button type="submit" class="btn btn-info">完成</button>
        </div>
    </div>
</div>

<ul id="nurse-list" class="media-list">
<%  while(rs.next()){ %>
   <li class="media" onClick="self.location='user_nurseDetail.jsp?pram_nurseName=<%=rs.getString("nurseName")%>'">
        <div class="container">
            <a class="media-left" href="#">
                <img class="media-object" src="../img/nurse_portrait_default.png"
                     alt="张三">
            </a>
            <div class="media-body">
                <h4 class="media-heading"><%out.print(rs.getString("nurseName_"));%>
                    <span class="star pull-right small">(0人)</span>
                </h4>
                <small>级别：<%out.print(rs.getString("serviceLevel"));%>&nbsp;&nbsp;&nbsp;护龄：<%out.print(rs.getString("workAge"));%></small>
                <p style="color: gray">
                    <%out.print(rs.getString("personalIntro"));%>
                </p>
                <span class="price">￥<%out.print(rs.getString("servicePrice"));%>/天</span>
                <span class="distance glyphicon glyphicon-map-marker pull-right"><%out.print(rs.getString("address"));%></span>
            </div>
        </div>
    </li>
<% } %>
</ul>

<ul id="bottom-nav" class="pager">
    <li><a href="user_index.html"><span class="glyphicon glyphicon-home"></span>首页</a></li>
    <li class="active"><a href="user_index_nurse.jsp"><span class="glyphicon glyphicon-leaf"></span>护工</a></li>
    <li><a href="user_index_circle.jsp"><span class="glyphicon glyphicon-globe"></span>圈子</a></li>
    <li><a href="user_index_order.html"><span class="glyphicon glyphicon-list-alt"></span>订单</a></li>
    <li><a href="user_index_me.html"><span class="glyphicon glyphicon-user"></span>我的</a></li>
</ul>

<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>

</body>
</html>