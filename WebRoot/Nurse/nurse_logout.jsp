<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//销毁cookie
Cookie cookie = null;
   Cookie[] cookies = null;
   // 获取当前域名下的cookies，是一个数组
   cookies = request.getCookies();
   if( cookies != null ){
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];
         if((cookie.getName( )).compareTo("nursename") == 0 ){
            cookie.setMaxAge(0);
            response.addCookie(cookie);
         }
         
      }
  }else{
	  out.println("<script language='javascript'>alert('没有找到cookie!');"
				+"history.go(-1); </script>");
  }
  //销毁session
  session.invalidate();
  response.sendRedirect("nurse_logWeb.jsp");
%>
