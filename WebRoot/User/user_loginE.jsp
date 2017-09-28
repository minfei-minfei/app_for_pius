<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%! String className=null;%>
	<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
Statement stmt=con.createStatement();
String s_username=request.getParameter("userName");
String s_password=request.getParameter("userPsd");
String seleStr="SELECT * FROM user where username='"+s_username+"'";
ResultSet rs=stmt.executeQuery(seleStr);
if(rs.next()){
	if(s_password.equals(rs.getString("password"))){
		className=s_username;
		session.putValue("username",className);
		// 编码，解决中文乱码   
		   String str = URLEncoder.encode(className,"utf-8");  
		   // 设置 name 和 url cookie 
		   Cookie userCookie = new Cookie("username",str);
		   userCookie.setMaxAge(60*60*24);
		   response.addCookie( userCookie );
			response.sendRedirect("user_index.html");
	}else{
		String error ="密码错误，请重新登录！";
		// 编码，解决中文乱码   
		   String str = URLEncoder.encode(error,"utf-8");  
		   // 设置 name 和 url cookie 
		   Cookie errorCookie = new Cookie("error",str);
		   errorCookie.setMaxAge(60*60*24);
		   response.addCookie( errorCookie );
		   response.sendRedirect("user_login.jsp");
	}
}
else{
	String error ="用户不存在，请注册！";
	// 编码，解决中文乱码   
	   String str = URLEncoder.encode(error,"utf-8");  
	   // 设置 name 和 url cookie 
	   Cookie errorCookie = new Cookie("error",str);
	   errorCookie.setMaxAge(60*60*24);
	   response.addCookie( errorCookie );
	   response.sendRedirect("user_register.jsp");
}
con.close();
stmt.close();
%>
</body>
</html>