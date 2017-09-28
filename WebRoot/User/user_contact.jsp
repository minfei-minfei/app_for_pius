<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBK","root","root");
Statement stmt=con.createStatement();
String seleStr="SELECT * FROM usercontact";
ResultSet rs=stmt.executeQuery(seleStr);
String contact_choose = "";
if(request.getParameter("pram_choose")!=null){
	contact_choose = request.getParameter("pram_choose");
}
%>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>联系人管理</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/user_contact.css"/>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        <a href="#" class="navbar-brand glyphicon glyphicon-chevron-left">联系人管理</a>
        <a href="user_add.html" class="navbar-brand glyphicon glyphicon-plus pull-right"></a>
    </div>
</nav>

<div class="container">
<%while(rs.next()){ %>
    <div class="media">
        <a class="media-left" href="#">
            <img class="media-object" src="../img/old_portrait_default.png"
                 alt="老人">
        </a>
        <div class="media-body">
            <h4 class="media-heading"><%out.print(rs.getString("contactName")); %></h4>
            <p style="color: gray">
                住址：<span><%out.print(rs.getString("contactHome")); %></span><br>
                详细地址：<span><%out.print(rs.getString("contactAddress")); %></span><br>
                联系电话：<span><%out.print(rs.getString("contactTel")); %></span>
            </p>
            <%if(contact_choose.equals("true")){%>
            <a class="btn btn-sm btn-danger contact-choose" href="user_order.jsp?pram_contact=<%=rs.getString("contactName")%>">选择</a>
            <%} %>
        </div>
        <a href="user_add.html" class="glyphicon glyphicon-edit"></a>
    </div>
    <%} %>
</div>
<%	rs.close();
	stmt.close();
	con.close();%>
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/user_contact.js"></script>
</body>
</html>