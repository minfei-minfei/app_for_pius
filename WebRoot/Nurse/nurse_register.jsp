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
String s_nurseName=request.getParameter("nurseName");
String s_nursePsd=request.getParameter("nursePsd");
String s_nurseName_=request.getParameter("nurseName_");
String s_sex=request.getParameter("sex");
String s_birth=request.getParameter("birth");
String s_address=request.getParameter("address");
String s_telephone=request.getParameter("telephone");
String s_idCard=request.getParameter("idCard");
String s_workAge=request.getParameter("workAge");
String s_serviceLevel=request.getParameter("serviceLevel");
String s_servicePrice=request.getParameter("servicePrice");
String s_personalIntro=request.getParameter("personalIntro");
String seleStr="SELECT * FROM nurse where nurseName='"+s_nurseName+"'";
ResultSet rs=stmt.executeQuery(seleStr);
if(rs.next()){
	out.println("<script language='javascript'>alert('该账号已经存在，请重新注册！');"
	+"window.location.href='nurse_regisG.jsp';</script>");
}
else{
String instsql= "insert into nurse (nurseName,nursePsd,nurseName_,sex,birth,address,telephone,idCard,workAge,serviceLevel,servicePrice,personalIntro) values ('"+s_nurseName+"','"+s_nursePsd+"','"+s_nurseName_+"','"+s_sex+"','"+s_birth+"','"+s_address+"','"+s_telephone+"','"+s_idCard+"','"+s_workAge+"','"+s_serviceLevel+"','"+s_servicePrice+"','"+s_personalIntro+"')";
stmt.executeUpdate(instsql);
response.sendRedirect("nurse_logWeb.jsp");
con.close();
stmt.close();
}
%>
        </body>
        </html>