﻿<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>submit</title>
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
					<li class="main-color"><span class="main-bgcolor">4</span>提交完成</li>
				</ul>
			</div>
			<div class="naidi-main-container-submit">
				<h1>系统将在<b id="countdown" class="main-color" >5</b>秒后跳转,如长时间未反应,请点击<a class="main-color" href="mytest?pageNum=1">此处</a><span><a class="main-color" href="mytest?pageNum=1">返回</a></span></h1>
				<div>
					<p><img src="images/check.png"></p>
					<p>恭喜，您的测试已提交！</p>
					<p>专家团队正在抓紧时间完成您的测试，请注意查收通知邮件</p>
					
				</div>
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
	<script src="js/main.js" ></script>
	<script>
	window.onload=function(){		
			messageAlert();
	        var dropdown=document.getElementsByClassName("dropdown")[0];
	    	var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
	        if(userName=="null"){
	        	dropdown.style.display="none";
	        }else{
	        	dropdown.style.display="block";
	        }
	        var count=document.getElementById("countdown");
	        var num=5;
	        var a=setInterval(settime,1000);
	        function settime(){
	        	if(num==0){
	        		clearTimeout(a);
	        		window.location.href="mytest?pageNum=1";
	        	}else{
	        		console.log(num);
	        		count.innerHTML=num;
	        		num--;
	        		
	        	}
	        }
		}
	</script>
</body>
</html>
