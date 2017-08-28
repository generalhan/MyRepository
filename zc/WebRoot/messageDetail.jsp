<%@page import="java.awt.Window"%>
<%@ page language="java" import="java.util.*,demo.message" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>messageManagerment</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" type="text/css" href="css/naidi-style.css">
</head>
<body class=" chen-user chen-test-content">
<nav class="navbar navbar-default" role="navigation">
    <div class="naidi-header-top">
				<div class="naidi-header-top-container clearFix">
					<a href="index.jsp">
						<img src="images/logo.png" alt="logo"/>
					</a>
					<ul>
						<li><a href="contactUs.jsp">支持</a></li>
						<li>
							<a href="messageManagerment?id=2&pageNum=1">
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
</nav>
<nav class="chen-user-nav">
    <div style="width:1000px; margin:0 auto">
        <ul class="clearFix">
            <li><a href="userCenter"><i class="fa fa-user-o"></i>账号管理</a></li>
            <li class="active"><a href="messageManagerment?id=2&pageNum=1"><i class="fa fa-envelope-o"></i>消息管理</a></li>
            <li><a href="mytest?pageNum=1"><i class="fa fa-reply"></i>返回</a></li>
        </ul>
    </div>
</nav>
<main>
    <div class="container">
        <div class="chen-messagesManagerment">
	        <div class="chen-message-title">
	            <i class="fa fa-envelope-o"></i>
	            <span>消息管理</span>
	        </div>
	        <div class="chen-message">
	        	<h3>消息详情</h3> 
	        <% 
	        	List c=new ArrayList();
	        	c=(List)session.getAttribute("messageInfo");
	        	if(c.size()>0){
	        %>
	        <div class="messageDetail">
		        <p><%=c.get(0) %></p>
		        <p><%=String.valueOf(c.get(1)).substring(0,String.valueOf(c.get(1)).lastIndexOf(".")) %></p>
	        </div>
	        <div class="messageCon"><%=c.get(2) %></div>
	        <% }else{%>
	         <div class="messageCon"></div>
	       <%} %>
	            <div class="back">
	            	<button class="btn btn-primary btn-sm" id="btn1">返回</button>
	            	<button class="btn btn-default btn-sm pull-right" id="btn3">下一条</button>
	            	<button class="btn btn-default btn-sm pull-right" id="btn2">上一条</button>
	            </div>
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
	var btn1=document.getElementById("btn1");
	var btn2=document.getElementById("btn2");
	var btn3=document.getElementById("btn3");
	btn1.onclick=function(){
		window.location="messageManagerment?id=2&pageNum=1";
	}
	btn2.onclick=function(){
		window.location="articlePage?message_id="+<%=c.get(3)%>+"&way=0";	
	}
	btn3.onclick=function(){
		window.location="articlePage?message_id="+<%=c.get(3)%>+"&way=1";
	}
	messageAlert();
   	setInterval(messageAlert,60000);
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