<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>搜索页</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/search.css"/>
</head>
<body>
    <!--搜索-->
    <form action="user_searchE.jsp" method="post">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a href="javascript:;" class="navbar-brand glyphicon glyphicon-chevron-left"></a>
            <div id="search-group">
                <input type="text" value="可输入护工姓名，护工简介" name="search"/>
                <span class="glyphicon glyphicon-remove-circle"></span>
                <button type="submit" class="btn btn-info btn-xs">搜索</button>
            </div>
        </div>
    </nav>
    </form>
    <script src="../js/jquery-1.12.4.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/common.js"></script>
    <script src="../js/search.js"></script>
</body>
</html>