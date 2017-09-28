package com.dh.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletNumber extends HttpServlet {
	int number=0;
    public ServletNumber() {}
    //doGet()调用doPost()
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		//ͬ
		synchronized(this){
			number++;
			out.println("<h1>您是第"+number+"个访问该页面的用户！</h1>");
		}
		out.println("</html>");
		out.println("</body>");
	}

}
