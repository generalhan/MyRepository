<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>appDescription</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/naidi-style.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/public.css">
	<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<header>
		<div class="naidi-header">
			<div class="naidi-header-top">
				<div class="naidi-header-top-container">
					<a href="index.jsp">
						<img src="images/logo.png" alt="logo"/>
					</a>
					<ul>
						<li><a href="contactUs.jsp">支持</a></li>
						<li>
							<a href="#">
                       			 <i class="fa fa-bell"></i>
		                        <span id="messageAjax" class="badge">3</span>
		                    </a>
		                    <div class="message-center">
		                        <p class="clearFix">
		                            <span>消息中心</span><a href="messageManagerment?id=2&pageNum=1">查看全部</a>
		                        </p>
		                        <ul id="messageAjaxContent"></ul>
		                    </div>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								 <% 
		                    	String email=(String)request.getSession().getAttribute("userEmail");
		                    	%>
		                        <%=email %>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu item-drop">
								<li><a href="userCenter">个人中心</a></li>
								<li class="divider"></li>
								<li><a href="loginOut">退出</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="naidi-header-nav">
				<div class="naidi-header-nav-container">
					<ul>
						<li><a href="mytest?pageNum=1"><i class="fa fa-clock-o"></i>我的测试</a></li>
						<li class="active"><a href="createTest.jsp"><i class="fa fa-folder"></i>新建测试</a></li>
						<li><a href="appSetting?pageNum=1"><i class="fa fa-cog"></i>应用管理</a></li>
						<li><a href="paging?pageNum=1"><i class="fa fa-file-text"></i>订单管理</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<main>
		<div class="naidi-main">
			<div class="naidi-main-step">
				<ul>
					<li class="main-color"><span class="main-bgcolor">1</span>选择服务</li>
					<li class="line"></li>
					<li class="main-color"><span class="main-bgcolor">2</span>上传应用</li>
					<li class="line"></li>
					<li class="main-color"><span  class="main-bgcolor">3</span>应用描述</li>
					<li class="line"></li>
					<li><span>4</span>提交完成</li>
				</ul>
			</div>
			<div class="naidi-main-container-appdescription">
				<h1>填写测试信息<span><a href="uploadApp.jsp">上一步</a></span></h1>
				<form name="f1" action="appDescription" id="f1" method="post"  enctype="multipart/form-data">
					<div class="requirement">
						<label for="textarea">需求描述</label><textarea id="textarea" name="description" placeholder="请输入您的需求描述" rows="10" cols="90"></textarea>
					</div>
					<div class="contact-info">
						<span>联系方式</span>
						<div class="contact-info-form">
							<div>
								<label for="name">姓名</label>
								<input type="text" id="name"  name="name">
							</div>
							<div>
								<label for="company">公司</label>
								<input type="text" id="company" name="company">
							</div>
							<div>
								<label for="phonenum">电话</label>
								<input type="text" id="phonenum" name="mobile">
							</div>
							<div>
								<label for="email">邮箱</label>
								<input type="text" id="email"  name="email">
							</div>
							<div>
								<label for="qq">QQ</label>
								<input type="text" id="qq" name="qq">
							</div>
						</div>
					</div>
					<div class="upload-word">
						<span>上传产品说明文档</span>
						<div id="upFile">
							<label for="word"><i class="fa fa-upload fa-2x"></i>上传</label>
							<input type="file" name="file" id="word">
						</div>
						<span id="fireName"></span>
						<p><input type="submit" id="wordSubmit" value="提交测试"/></p>
					</div>
				</form>
			</div>
		</div>
	</main>
	<div class="chen-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-headphones"></i>帮助中心</h3>
                    <p>如果您在使用过程中遇到哪些问题，包
                        括应用描述、使用方法、报告解读等，
                        都可以随时联系我们。</p>
                    <a href="aboutUs.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-commenting-o"></i>错误反馈</h3>
                    <p>如果您在使用过程中遇到错误信息，包
                        括报告无法下载、信息错误、提交错误
                        等，都可以随时反馈给我们。</p>
                    <a href="feedback.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-user"></i>服务咨询</h3>
                    <p>如果您在使用过程中对于我们的服务
                        不明白，都可以随时联系我们。随时
                        为您解答。</p>
                    <a href="contactUs.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-phone"></i>联系我们</h3>
                    <p>用心服务，时刻等待您的电话，谢谢
                        您的来电。</p>
                    <a href="contactUs.jsp">立即进入&gt;&gt;</a>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="com-md-6 col-sm-6 col-xs-6 text-left">
                <div class="footer-left">
                    <h3>联系我们</h3>
                    <p>电 话：0755-86313688</p>
                    <p>Email：zc@expdatacloud.com</p>
                    <p>地 址：深圳市福田区福华一路138号深圳国际商会大厦B座1706</p>
                </div>
            </div>
            <div class="com-md-6 col-sm-6 col-xs-6 text-right">
                <div class="footer-right">
                    <img src="images/erweima.jpg" alt="">
                    <p>© Copyright 2015-2016. 深圳市前海运通技术有限公司 粤ICP备16028168号</p>
                </div>
            </div>
        </div>
    </div>
</div>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>	
	<script>
	window.onload=function(){
		descript();
		messageAlert();
       	var dropdown=document.getElementsByClassName("dropdown")[0];
		var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
        if(userName=="null"){
        	dropdown.style.display="none";
        }else{
        	dropdown.style.display="block";
        }
	}
	</script>
</body>
</html>