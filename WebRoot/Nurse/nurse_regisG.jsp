    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
        <title>护工注册</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/common.css"/>
        <link rel="stylesheet" href="../css/nurse_register.css"/>
        </head>
        <body>
        <!--页头-->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
        <a href="javascript:;" class="navbar-brand glyphicon glyphicon-chevron-left">护工注册</a>
        </div>
        </nav>
        <!--警告框-->
        <div class="alert alert-warning" id="myAlert">
        <a href="#" class="close" data-dismiss="alert">
        &times;
        </a>
        <strong>警告！</strong>
        <span>您的网络连接有问题。</span>
        </div>
        <!--表单提交-->
        <form id="nurse-register-form" class="form-horizontal" role="form" action="nurse_register.jsp" method="post">
        <!--头像-->
        <div class="upload-picture">
        <img src="../img/nurse_portrait_default.png" alt="上传照片" class="center-block img-circle"/>
        <a href="javascript:;" class="file">上传照片
        <input class="upload" type="file" name="" accept="image/*" multiple>
        </a>
        </div>
        <!--账号密码-->
        <div class="container" id="nurse-register">
        <ul class="list-group">
        <li class="list-group-item">
        <span>账号</span>
        <input type="text" class="form-control" name="nurseName" value="请输入用户名"
        data-toggle="tooltip" title="用户名小于8位" autocomplete="off"/>
        <span class="checked"></span>
        <span class="checked-false"></span>
        </li>
        <li class="list-group-item">
        <span>密码</span>
        <input type="text" class="form-control user-psd" name="nursePsd" value="请输入密码"
        data-toggle="tooltip" title="密码6~12位" autocomplete="off"/>
        <span class="glyphicon glyphicon-eye-close eye"></span>
        <span class="checked"></span>
        <span class="checked-false"></span>
        </li>
        <li class="list-group-item">
        <span>确认密码</span>
        <input type="text" class="form-control user-psd" name="nursePsd2" value="请再次输入密码"
        data-toggle="tooltip" title="确认密码" autocomplete="off"/>
        <span class="glyphicon glyphicon-eye-close eye"></span>
        </li>
        </ul>
        </div>
        <!--基本信息-->
        <div class="panel panel-info" id="nurse-basic-info">
        <div class="panel-heading">
        <h3 class="panel-title">基本信息</h3>
        </div>
        <ul class="list-group">
        <li class="list-group-item">
        <span class="glyphicon glyphicon-user"></span>
        <input type="text" class="form-control" name="nurseName_" value="请输入姓名" autocomplete="off"/>
        </li>
        <li class="list-group-item">
        <span class="icon sex"></span>
        <label class="radio-inline">
        <input type="radio" name="sex" value="男">男
        </label>
        <label class="radio-inline">
        <input type="radio" name="sex" value="女">女
        </label>
        </li>
        <li class="list-group-item">
        <span class="glyphicon glyphicon-calendar"></span>
        <input type="date" class="form-control" name="birth"/>
        </li>
        <li class="list-group-item">
        <span class="glyphicon glyphicon-map-marker"></span>
        <input type="text" class="form-control" name="address" value="请填写详细地址"/>
        </li>
        <li class="list-group-item">
        <span class="glyphicon glyphicon-phone"></span>
        <input type="text" class="form-control" name="telephone" value="请填写联系电话"/>
        </li>
        <li class="list-group-item">
        <span class="icon id-card"></span>
        <input type="text" class="form-control" name="idCard" value="请输入身份证号"
        id="id-card"/>
        </li>
        </ul>
        </div>
        <!--服务信息-->
        <div class="panel panel-success" id="nurse-service-info">
        <div class="panel-heading">
        <h3 class="panel-title">服务信息</h3>
        </div>
        <ul class="list-group">
        <li class="list-group-item">
        <span>工作年龄:&nbsp;</span>
        <select class="form-control" name="workAge">
        <option>1年</option>
        <option>2年</option>
        <option>3年</option>
        <option>4年</option>
        <option>5年及以上</option>
        </select>
        </li>
        <li class="list-group-item">
        <span>服务级别:&nbsp;</span>
        <select class="form-control" name="serviceLevel">
        <option>初级护工</option>
        <option>中级护工</option>
        <option>高级护工</option>
        </select>
        </li>
        <li class="list-group-item">
        <span>服务价格:</span>
        <div class="input-group col-xs-7" id="service-price">
        <input type="number" class="form-control" name="servicePrice">
        <span class="input-group-addon">元/天</span>
        </div>
        </li>
        <li class="list-group-item">
        <div class="label-group">服务时长:&nbsp;
        <span class="label label-default">日护</span>
        <span class="label label-default">周护</span>
        <span class="label label-default">月护</span>
        </div>
        </li>
        <li class="list-group-item">
        <div class="label-group">服务地点:&nbsp;
        <span class="label label-default">居家</span>
        <span class="label label-default">医院</span>
        </div>
        </li>
        <li class="list-group-item">
        <div class="label-group">护理范围:&nbsp;
        <span class="label label-default">助餐</span>
        <span class="label label-default">助医</span>
        <span class="label label-default">助洁</span>
        </div>
        </li>
        <li class="list-group-item">
        <div class="label-group">老人病症:&nbsp;
        <span class="label label-default">自理</span>
        <span class="label label-default">半自理</span>
        <span class="label label-default">不能自理</span>
        </div>
        </li>
        <li class="list-group-item">
        个人简介:&nbsp;
        <textarea class="form-control" rows="3" name="personalIntro">老人护理需求，固定电话等</textarea>
        </li>
        </ul>
        </div>
        <!--认证信息-->
        <div class="panel panel-primary">
        <div class="panel-heading">
        <h3 class="panel-title">认证信息</h3>
        </div>
        <div class="panel-body">
        <div class="container">
        <span>请上传身份证正面照</span>
        <div class="protector-upload thumbnail">
        <img src="../img/protector_front.png" alt="上传照片"/>
        <input class="upload" type="file" name="idFront" accept="image/*" multiple>
        </div>
        </div>
        <div class="container">
        <span>请上传身份证反面照</span>
        <div class="protector-upload thumbnail">
        <img src="../img/protector_back.png" alt="上传照片"/>
        <input class="upload" type="file" name="idBack" accept="image/*" multiple>
        </div>
        </div>
        <div class="container">
        <span>请上传资格证书</span>
        <div class="protector-upload thumbnail">
        <img src="../img/qualification.png" alt="上传照片"/>
        <input class="upload" type="file" name="author" accept="image/*" multiple>
        </div>
        </div>
        </div>
        </div>
        <!--提交-->
        <button type="submit" class="btn btn-default btn-lg btn-block">注册</button>
        </form>
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
        <script src="../js/nurse_register.js"></script>
        </body>
        </html>