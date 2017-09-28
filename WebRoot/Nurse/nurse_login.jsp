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
            <%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBk","root","root");
Statement stmt=con.createStatement();
String s_nurseName=request.getParameter("nurseName");//输入账号，如nurse_0
String s_nursePsd=request.getParameter("nursePsd");
String seleStr="SELECT * FROM nurse where nurseName='"+s_nurseName+"'";
ResultSet rs=stmt.executeQuery(seleStr);
if(rs.next()){
	String nursename = rs.getString("nurseName_");
	if(s_nursePsd.equals(rs.getString("nursePsd"))){
		session.putValue("nursename",nursename);
		// 编码，解决中文乱码   
		   String str = URLEncoder.encode(nursename,"utf-8");  
		   // 设置 name 和 url cookie 
		   Cookie nurseCookie = new Cookie("nursename",str);
		   nurseCookie.setMaxAge(60*60*24);
		   response.addCookie( nurseCookie );
		   response.sendRedirect("nurse_index.html");
	}else{
		String error ="密码错误，请重新登录！";
		// 编码，解决中文乱码   
		   String str = URLEncoder.encode(error,"utf-8");  
		   // 设置 name 和 url cookie 
		   Cookie errorCookie = new Cookie("error",str);
		   errorCookie.setMaxAge(60*60*24);
		   response.addCookie( errorCookie );
		   //out.print(nursename);
		   response.sendRedirect("nurse_logWeb.jsp");
	}
}else{

	String error ="用户不存在，请注册！";
	// 编码，解决中文乱码   
	   String str = URLEncoder.encode(error,"utf-8");  
	   // 设置 name 和 url cookie 
	   Cookie errorCookie = new Cookie("error",str);
	   errorCookie.setMaxAge(60*60*24);
	   response.addCookie( errorCookie );
	   //out.print("没找到");
	   response.sendRedirect("nurse_regisG.jsp");
}	
rs.close();
con.close();
stmt.close();
%>
        </body>
        </html>