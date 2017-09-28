    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
        <html>
        <head>
        </head>
        <body>
            <%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
Statement stmt=con.createStatement();
String s_atcTit=request.getParameter("atcTit");
String s_atcCont=request.getParameter("atcCont");
String s_atcPic=request.getParameter("atcPic");
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date = formatter.format(currentTime);
String instsql = "insert into userArticle (atcTit,atcCont,atcPic,time) values ('"+s_atcTit+"','"+s_atcCont+"','"+s_atcPic+"','"+str_date+"')";
stmt.executeUpdate(instsql);
response.sendRedirect("nurse_index_circle.jsp");
con.close();
stmt.close();
%>
        </body>
        </html>
