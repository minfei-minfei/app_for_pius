<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
Statement stmt=con.createStatement();
String s_ctName=request.getParameter("contactName");
String s_ctHome=request.getParameter("contactHome");
String s_ctAddress=request.getParameter("contactAddress");
String s_ctSex=request.getParameter("contactSex");
String s_ctAge=request.getParameter("contactAge");
String s_ctTel=request.getParameter("contactTel");
String s_ctNotes=request.getParameter("contactNotes");
String s_userName = (String)session.getAttribute("username");
//out.print(s_ctSex);
//插入数据库
String instsql= "insert into usercontact (userName,contactName,contactHome,contactAddress,contactSex,contactAge,contactTel,contactNotes) values ('"+s_userName+"','"+s_ctName+"','"+s_ctHome+"','"+s_ctAddress+"','"+s_ctSex+"','"+s_ctAge+"','"+s_ctTel+"','"+s_ctNotes+"')";
stmt.executeUpdate(instsql);
response.sendRedirect("user_contact.jsp");
con.close();
stmt.close();

%>
</body>
</html>