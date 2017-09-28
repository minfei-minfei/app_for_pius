<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=UTF-8");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBK","root","root");
Statement stmt=con.createStatement();
String s_atcTit= new String(request.getParameter("pram_atcTit").getBytes("ISO-8859-1"),"utf-8");
String seleStr="SELECT * FROM userarticle where atcTit='"+s_atcTit+"'";
ResultSet rs=stmt.executeQuery(seleStr);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>文章详情页</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/circleArticleDetail.css"/>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <a href="user_index_circle.html" class="navbar-brand glyphicon glyphicon-chevron-left">文章详情</a>
    </div>
</nav>
<%if (rs.next()){ %>
<div class="article">
    <div class="container">
        <h4 class="article-header">
            <a href="#"><img class="publisher" src="../img/nurse_portrait_default.png" alt="头像"/></a>
            <%= rs.getString("username") %>
            <small><%= rs.getString("time") %></small>
        </h4>
        <div>
            <p class="article-title lead"> <%= rs.getString("atcTit") %> </p>
            <p class="article-content"> <%= rs.getString("atcCont") %> </p>
        </div>
    </div>
    <div class="row">
        <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
        <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
        <img class="col-xs-4" src="../img/article-img.png" alt="文章图片"/>
    </div>
    <div class="social-contact container row">
        <div>
            <button type="button" class="btn btn-default btn-sm number-click" aria-label="Left Align">
                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                <span></span>
            </button>
        </div>
        <div>
            <button type="button" class="btn btn-default btn-sm last-click" aria-label="Left Align">
                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                <span></span>
            </button>
        </div>
        <div>
            <button type="button" class="btn btn-default btn-sm last-click" aria-label="Left Align">
                <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>
                <span></span>
            </button>
        </div>
    </div>
</div>
<ul class="media-list">
    <li class="media small container article-comment">
        <a class="media-left" href="#">
            <img class="media-object" src="../img/old_portrait_default.png"
                 alt="头像">
        </a>
        <div class="media-body">
            <h5 class="media-heading">
                用户
                <small>评论时间</small>
                <span class="social-contact pull-right">
                <a href="#" class="glyphicon glyphicon-thumbs-up">10</a>
                <a href="#" class="glyphicon glyphicon-comment">10</a>
            </span>
            </h5>

            <p>文章评论文章评论文章评论文章评论文章评论文章评论文章评论文章评论
                （限40字）</p>
        </div>
    </li>

</ul>

<form id="comment-box" class="container" role="form">
    <div class="alert alert-danger" role="alert">
        <strong>请输入评论内容！</strong>
    </div>
    <div class="form-group">
        <label for="my-comment">我的评论:</label><br>
        <input type="text" class="form-control" id="my-comment" value="">
        <button type="button" class="btn btn-default">发送</button>
    </div>
</form>
<%	}
	rs.close();
	stmt.close();
	con.close();%>
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/circleArticleDetail.js"></script>
</body>
</html>