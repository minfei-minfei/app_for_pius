<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBK","root","root");
Statement stmt=con.createStatement();
String s_orderNumber=request.getParameter("param_order");
//查询订单号，修改订单状态
String seleStr="SELECT * FROM userorder where ordernumber='"+s_orderNumber+"'";
ResultSet rs=stmt.executeQuery(seleStr);
if(rs.next()){
	int s_orderState = rs.getInt("orderstate")+1;
	String uptsql= "update userorder set orderstate = "+ s_orderState +" where ordernumber = '"+ s_orderNumber+"'";
	stmt.executeUpdate(uptsql);
}
response.sendRedirect("nurse_index_order.jsp");
rs.close();
stmt.close();
con.close();
%>

