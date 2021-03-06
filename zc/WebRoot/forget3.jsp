﻿<%@ page language="java" import="java.util.*,demo.applist" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
    <title>forget3</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/public.css">
</head>
<body class="chen-content">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">
                <img src="images/logo.png" alt="Logo">
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="login.jsp">登陆</a></li>
                <li><a href="register.jsp">注册</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
	<div class="chen-reset-pwd">
        <h3 class="text-center">
            <span class="badge chen-reset-pwd-step3">3</span>
            重新设置密码
        </h3>
        <form class="chen-form-forget4" action="updateForgetPassword" method="POST">
        	<%
	        		String error="";
	        		if((String)request.getAttribute("error")==null){
	        			error="";
	        		}else{
	        			error=(String)request.getAttribute("error");
	        		}
	        %>
        	<p id="error"><%=error%></p>
            <div>
                <input type="password" id="pwd1" class="form-control input-lg" name="pwd1" placeholder="密码">
                <i class="fa fa-lock"></i>
            </div>
            <div>
                <input type="password" id="pwd2" class="form-control input-lg" name="pwd2" placeholder="确认密码">
                <i class="fa fa-lock"></i>
            </div>
            <button id="savebutton" class="btn btn-block btn-lg">保存</button>
        </form>
    </div>
    
</div>
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
<script type="text/javascript">
	
	window.onload=function(){
		var pwd1=document.getElementById("pwd1");
		var pwd2=document.getElementById("pwd2");
		var btn=document.getElementById("savebutton");
		var error=document.getElementById("error");		
        var reg1=/[^\w]/g;  //搜索所有非字符
		error.style.textAlign="center";
		error.style.color="red";
		error.style.marginBottom=10+"px";
		btn.setAttribute("disabled", true);
		btn.style.backgroundColor="#aaa";
		
        pwd1.onblur=function(){
            if(pwd1.value.length==0){                
                error.innerHTML="密码不能为空";
                btn.setAttribute("disabled", true);
            }else if(reg1.test(this.value)){
                error.innerHTML="输入中含有非字符";
                btn.setAttribute("disabled", true);
            }else if(this.value.length<6||this.value.length>18){
                error.innerHTML="请输入6-18个字符的密码";
                btn.setAttribute("disabled", true);
            }else{
                error.innerHTML="";
            }
        }

		pwd2.onblur=function(){
			pwdCheck(pwd1.value,pwd2.value);
			
		};
		function pwdCheck(pwd1,pwd2){
            var error=document.getElementById("error");
            if(pwd1.length==0||pwd2.length==0){                
                error.innerHTML="密码不能为空";
                btn.setAttribute("disabled", true);
            }else{
                if(reg1.test(pwd2)){
                    error.innerHTML="输入中含有非字符";
                    btn.setAttribute("disabled", true);
                }else if(pwd2.length<6||pwd2.length>18){
                    error.innerHTML="请输入6-18个字符的密码";
                    btn.setAttribute("disabled", true);
                }else if(pwd1==pwd2){
                    btn.removeAttribute("disabled"); 
                    btn.style.backgroundColor="#018a78";
                    error.innerHTML="";
                }else{
                    btn.setAttribute("disabled", true);
                    btn.style.backgroundColor="#aaa";
                    error.innerHTML="两次密码输入不一致";
                }
            }

		}
	}
	
</script>
</body>
</html>