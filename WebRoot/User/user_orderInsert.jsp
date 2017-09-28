<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
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
String s_userName = (String) session.getAttribute("username");
String s_nurseName=new String(request.getParameter("param_nurse").getBytes("ISO-8859-1"),"utf-8");
String s_userContactName=new String(request.getParameter("param_contact").getBytes("ISO-8859-1"),"utf-8");
String s_nursePrice = request.getParameter("param_price");

if(s_userContactName.equals("")){
	String error ="请选择联系人！";
	// 编码，解决中文乱码   
	   String str = URLEncoder.encode(error,"utf-8");  
	   // 设置 name 和 url cookie 
	   Cookie errorCookie = new Cookie("error",str);
	   errorCookie.setMaxAge(60*60*24);
	   response.addCookie( errorCookie );
	   response.sendRedirect("user_order.jsp");
}else{
//获取当前时间，生成订单号
java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String curtime1 = formatter1.format(currentTime);
String curtime2 = formatter2.format(currentTime);
int rand = (int) Math.round(Math.random()*10000);
String s_ordernumber = curtime1 + rand;
String s_ordertime = curtime2;
int s_orderstate = 1;
String instsql= "insert into userorder (username,nursename,usercontact,price,ordernumber,ordertime,orderstate) values ('"+s_userName+"','"+s_nurseName+"','"+s_userContactName+"','"+s_nursePrice+"','"+s_ordernumber+"','"+s_ordertime+"','"+s_orderstate+"')";
stmt.executeUpdate(instsql);
response.sendRedirect("user_index_order.jsp");

stmt.close();
con.close();
}
%>
</body>
</html>