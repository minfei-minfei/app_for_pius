<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String s_nurseName = "";%>
<%! String s_nursePrice = ""; %>
<%! String s_contact = ""; %>
<%
request.setCharacterEncoding("utf-8");//读取编码方式
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shiminfei?useUnicode=true&characterEncoding=GBK","root","root");
Statement stmt=con.createStatement();
if(request.getParameter("pram_nurseName")!=null){
	s_nurseName = new String(request.getParameter("pram_nurseName").getBytes("ISO-8859-1"),"utf-8");
}
String seleStr="SELECT * FROM nurse where nurseName_='"+s_nurseName+"'";
ResultSet rs=stmt.executeQuery(seleStr);

%>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>用户下单</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/user_order.css"/>
</head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a href="javascript:;" class="navbar-brand glyphicon glyphicon-chevron-left">下单</a>
        </div>
    </nav>
    
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="glyphicon glyphicon-pencil"></span>
                预约内容
            </h3>
        </div>
        <div id="order-info" class="panel-body">
        	<%while(rs.next()){ 
        	s_nursePrice= rs.getString("servicePrice");%>
            <div class="media">
                <a class="media-left" href="javascript:;">
                    <img class="media-object" src="../img/nurse_portrait_default.png"
                         alt="媒体对象">
                </a>
                <div class="media-body">
                    <h4 class="media-heading" name="param_nurse"><%out.print(rs.getString("nurseName_")); %>
                    <small style="color: red">￥<%out.print(rs.getString("servicePrice")); %></small>
                    </h4>
                    <small>级别：<%out.print(rs.getString("serviceLevel")); %>&nbsp;护龄：<%out.print(rs.getString("workAge")); %>
                    <br>联系电话：<%out.print(rs.getString("telephone")); %>
                    </small>
                </div>
                <p class="personal-intro" style="color: gray"><%out.print(rs.getString("personalIntro")); %></p>
                <a id="full-text" href="javascript:;">显示全文</a>
            </div>
            <%} %>
            <br>
            <div class="label-group">预约时长:
                <span class="label label-default">日护</span>
                <span class="label label-default">周护</span>
                <span class="label label-default">月护</span>
            </div>
            <br>
            <div class="label-group">预约地点:
                <span class="label label-default">居家</span>
                <span class="label label-default">医院</span>
            </div>
            <br>
            护理需求:
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#help-meal" data-toggle="tab">助餐</a>
                </li>
                <li><a href="#help-cure" data-toggle="tab">助医</a></li>
                <li><a href="#help-clean" data-toggle="tab">助洁</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="help-meal">
                    <p>助餐说明...</p>
                </div>
                <div class="tab-pane fade" id="help-cure">
                    <p>助医说明...</p>
                </div>
                <div class="tab-pane fade" id="help-clean">
                    <p>助洁说明...</p>
                </div>
            </div>
        </div>
    </div>
    
    <ul class="list-group" id="order-choice">
        <li class="list-group-item">
            <span class="icon"></span>
            请选择开始时间:&nbsp;
            <input type="date" id="keyword_time_min" name="startTime" onChange="function(){
            }"/>

        </li>
        <li class="list-group-item">
            <span class="icon"></span>
            请选择结束时间:&nbsp;
            <input type="date" id="keyword_time_max" name="endTime"/>
        </li>
        <li class="list-group-item">
            <span class="icon"></span>
            <a href="#address" id="address">请选择地址</a>
            <span class="glyphicon glyphicon-chevron-right pull-right"></span>
        </li>
        <li class="list-group-item">
            <span class="icon"></span>
            <a href="javascript:;">请选择优惠券</a>
            <span class="glyphicon glyphicon-chevron-right pull-right"></span>
        </li>
    </ul>
   
    <ul class="list-group">
        <li class="list-group-item" style="color: gray">付款方式</li>
        <li class="list-group-item" id="service">
            <span class="icon"></span>
            服务后支付
            <span class="icon pull-right"></span>
        </li>
    </ul>
<%
if(request.getParameter("pram_contact")!=null){
	s_contact=new String(request.getParameter("pram_contact").getBytes("ISO-8859-1"),"utf-8");
}
String seleStr2="SELECT * FROM usercontact where contactName='"+s_contact+"'";
ResultSet rs2=stmt.executeQuery(seleStr2);
%>
    <ul class="list-group">
        <li class="list-group-item" style="color: gray">服务对象
        <a class="glyphicon glyphicon-plus pull-right" href="user_contact.jsp?pram_choose=true"></a>
        </li>
        <%while(rs2.next()){ %>
        <li class="list-group-item" id="old">
            <a class="media-left" href="#">
                <img class="media-object" src="../img/old_portrait_default.png" alt="">
            </a>
            <div class="media-body">
                <h4 class="media-heading" name="param_contact"><%out.print(rs2.getString("contactName")); %></h4>
                 住址：<span><%out.print(rs2.getString("contactHome")); %></span><br>
                详细地址：<span><%out.print(rs2.getString("contactAddress")); %></span><br>
                联系电话：<span><%out.print(rs2.getString("contactTel")); %></span>
                
            </div>
        </li>
        <%}%>
    </ul>
    <div id="pay">
        <div id="mask"></div>
        <ul class="list-group">
            <li class="list-group-item" style="background: gray;color: white">支付方式</li>
            <li class="list-group-item pay-way">
                <span class="alipay"></span>支付宝
                <label class="pull-right">
                    <input type="radio" name="payWay" id="alipay" >
                </label>
            </li>
            <li class="list-group-item pay-way">
                <span class="wechat"></span>微信
                <label class="pull-right">
                    <input type="radio" name="payWay" id="wechat" >
                </label>
            </li>
        </ul>

    </div>
    
    <nav id="user-order-footer" class="navbar navbar-default navbar-fixed-bottom" role="navigation">
        <div class="navbar-header">
            <span class="navbar-brand">应付款:￥100</span>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="pull-right"><a id="pull-cart" href='user_orderInsert.jsp?param_nurse=<%=s_nurseName%>&param_contact=<%=s_contact%>&param_price=<%=s_nursePrice%>'>加入购物车</a></li>
            <li class="pull-right"><a href="#pay" id="pay-now">立即付款</a></li>
        </ul>
    </nav>
    <!-- 错误弹出框 -->
    	<div class="modal fade" id="errorModal" role="dialog">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-body">
	                	<h4 class="modal-title"></h4>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-sm btn-primary" data-dismiss="modal">知道了</button>
	                </div>
	            </div><!-- /.modal-content -->
	        </div><!-- /.modal -->
        </div>
<%	rs.close();
	rs2.close();
	stmt.close();
	con.close();%>
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/user_order.js"></script>

</body>
</html>