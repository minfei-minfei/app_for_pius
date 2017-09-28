<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBK","root","root");
Statement stmt=con.createStatement();
String s_nurseName=request.getParameter("pram_nurseName");
String seleStr="SELECT * FROM nurse where nurseName='"+s_nurseName+"'";
ResultSet rs=stmt.executeQuery(seleStr);
%>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>用户首页_护工详情页</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/nurseDetail.css"/>
</head>
<body>
<nav class="navbar navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <a href="javascript:;" class="navbar-brand glyphicon glyphicon-chevron-left"></a>
        <span class="navbar-brand navbar-title"></span>
        <a href="javascript:;" id="follow" class="navbar-brand glyphicon glyphicon-star-empty pull-right"
           data-toggle="tooltip" data-placement="left" ></a>
    </div>
</nav>
<%//out.print(request.getParameter("pram_nurseName"));
while(rs.next()){
//out.print(rs.next());%>
<div id="nurse_detail_header">
    <div class="media container">
        <a class="media-left" href="javascript:;">
            <img class="media-object" src="../img/nurse_portrait_default.png" alt="头像">
        </a>
        <div class="media-body">
            <h4 style="font-weight: bolder"><% out.print(rs.getString("nurseName_"));%></h4>
            <a class="glyphicon glyphicon-pencil" href="user_order.jsp?pram_nurseName=<%out.print(rs.getString("nurseName_"));%>">预约</a>
            <br>
            <small class="topic-info">级别：<% out.print(rs.getString("serviceLevel"));%>&nbsp;护龄：<% out.print(rs.getString("workAge"));%><br>
                用户评价：<span class="star">（0人）</span>
            </small>
        </div>
    </div>
</div>
<div id="nurse_detail_content">
    <blockquote>基本信息</blockquote>
    <div class="panel-body">
        <p>
            <span class="icon"></span>性别：<span><% out.print(rs.getString("sex"));%></span>&nbsp;&nbsp;&nbsp;
            <span class="glyphicon glyphicon-calendar"></span>生日：<span><% out.print(rs.getString("birth"));%></span>
        </p>
        <p><span class="icon"></span>认证情况：
            身份认证 <span class="icon"></span>
            资格认证 <span class="icon"></span>
        </p>
        <p><span class="glyphicon glyphicon-map-marker"></span>详细地址：<span><% out.print(rs.getString("address"));%></span></p>
        <p><span class="glyphicon glyphicon-phone"></span>联系电话：<span><% out.print(rs.getString("telephone"));%></span></p>
        <p><span class="glyphicon glyphicon-tag"></span>服务价格：<span><% out.print(rs.getString("servicePrice"));%></span>元/天</p>
        <p><span class="glyphicon glyphicon-info-sign"></span>个人简介：<br>
            <span><% out.print(rs.getString("personalIntro"));%>
            </span>
        </p>
    </div>
<% } %>
    <div class="well">发布的文章
        <span class="glyphicon glyphicon-chevron-down pull-right"
              data-toggle="collapse" data-target="#nurse_article"></span>
    </div>
    <div id="nurse_article" class="collapse">
        <div class="article">
            <div class="container">
                <h4 class="article-header">
                    <a href="#"><img class="publisher" src="../img/nurse_portrait_default.png" alt="头像"/></a>
                    文章标题
                    <small>发表时间</small>
                </h4>
                <small class="article-info">浏览：转发：评论：</small>
                <a href="circleArticleDetail.html">
                    <p class="article-content">文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容
                        文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容
                    </p>
                </a>
            </div>
            <a href="circleArticleDetail.html" class="row">
                <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
                <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
                <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
            </a>
        </div>
    </div>
    <div class="well">关注的话题
        <span class="glyphicon glyphicon-chevron-down pull-right"
              data-toggle="collapse" data-target="#nurse_topic"></span>
    </div>
    <div id="nurse_topic" class="collapse">
        <div class="topic">
            <div class="container">
                <a class="media-left" href="#">
                    <img class="media-object" src="../img/topic-img.png" alt="话题">
                </a>
                <div class="media-body">
                    <h4 class="topic-header">#<span>话题</span>#
                        <small>发表时间</small>
                    </h4>
                    <small class="topic-info">参与人数：</small>
                    <a href="circleTopicDetail.html">
                        <p class="topic-content">话题内容话题内容话题内容话题内容话题内容话题内容话题内容
                            话题内容话题内容话题内容话题内容话题内容话题内容话题内容话题内容话题内容话题内容
                        </p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="well">用户评价
        <span class="glyphicon glyphicon-chevron-down pull-right"
              data-toggle="collapse" data-target="#nurse_comment"></span>
    </div>
    <div id="nurse_comment" class="collapse">
        <ul class="media-list">
            <li class="media small container article-comment">
                <a class="media-left" href="#">
                    <img class="media-object" src="../img/user_portrait_default.png" alt="头像">
                </a>
                <div class="media-body">
                    <h5 class="media-heading">用户<small>评论时间</small>
                        <span class="star pull-right"></span>
                    </h5>
                    <p>用户评价用户评价用户评价用户评价用户评价用户评价用户评价用户评价
                        用户评价用户评价用户评价用户评价用户评价用户评价用户评价用户评价</p>
                </div>
            </li>
        </ul>
    </div>
</div>
<%	rs.close();
	stmt.close();
	con.close();%>
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/nurseDetail.js"></script>
</body>
</html>