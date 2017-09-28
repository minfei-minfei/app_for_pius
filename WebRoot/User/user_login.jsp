    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <html>
        <head lang="en">
        <meta charset="UTF-8">
        <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
        <title>登录界面</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/common.css"/>
        <link rel="stylesheet" href="../css/user_login.css"/>
        </head>
        <body>

        <nav class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
        <a href="javascript:;" class="navbar-brand glyphicon glyphicon-chevron-left">用户登录</a>
        </div>
        </nav>
        <form id="user-login-form" class="container" role="form" action="user_loginE.jsp" method="post">
        <ul class="list-group">
        <li class="list-group-item">
        <span class="glyphicon glyphicon-user"></span>
        <input type="text" class="form-control" name="userName" value="请输入用户名"
        autocomplete="off"/>
        </li>
        <li class="list-group-item">
        <span class="glyphicon glyphicon-lock"></span>
        <input type="text" class="form-control" name="userPsd" value="请输入密码"
        autocomplete="off"/>
        </li>
        </ul>
        <div id="login-help">
        <a href="user_register.jsp" class="pull-left"><span class="glyphicon glyphicon-edit">还没注册</span></a>
        <a class="pull-right" data-toggle="modal" data-target="#forgetModal"><span class="glyphicon glyphicon-time">忘记密码</span></a>
        </div>
        <button type="submit" class="btn btn-default btn-lg btn-block">登录</button>
        </form>
        <!-- 忘记密码弹出框 -->
        <div class="modal fade" id="forgetModal" role="dialog">
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">忘记密码</h4>
        </div>
        <form id="user-forgerPsd-form" role="form" action="user_login.jsp" method="post">
        <div class="modal-body">
        <ul class="list-group">
        <li class="list-group-item">
        <span class="glyphicon glyphicon-user"></span>
        <input type="text" class="form-control" name="userName" value="请输入用户名"
        data-toggle="tooltip" title="用户名小于8位" autocomplete="off"/>
        <span class="checked"></span>
        <span class="checked-false"></span>
        </li>
        <li class="list-group-item">
        <span class="glyphicon glyphicon-lock"></span>
        <input type="text" class="form-control user-psd" name="userPsd" value="请输入新密码"
        data-toggle="tooltip" title="密码6~12位" autocomplete="off"/>
        <span class="glyphicon glyphicon-eye-close eye"></span>
        <span class="checked"></span>
        <span class="checked-false"></span>
        </li>
        <li class="list-group-item">
        <span class="user-psd2"></span>
        <input type="text" class="form-control user-psd" name="userPsd2" value="请再次输入新密码"
        data-toggle="tooltip" title="确认密码" autocomplete="off"/>
        <span class="glyphicon glyphicon-eye-close eye"></span>
        </li>
        <li class="list-group-item">
        <span class="vcode"></span>
        <input type="text" class="form-control" name="vcode" value="请输入验证码"
        data-toggle="tooltip" title="不区分大小写" autocomplete="off"/>
        </li>
        </ul>
        <div class="code">
        <span id="code" class="label label-default" title="看不清，换一张"></span>
        <span id="change-code">看不清？换一张</span>
        </div>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">提交更改</button>
        </div>
        </form>
        </div><!-- /.modal-content -->
        </div><!-- /.modal -->
        </div>
        
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
    
        <script src="../js/jquery-1.12.4.min.js"></script>
        <script src="../js/jquery.cookie.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/common.js"></script>
        <script src="../js/login.js"></script>
        </body>
        </html>