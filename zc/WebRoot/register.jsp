<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>register</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
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
                <li><a href="login.jsp">登录</a></li>
                <li><a href="register.jsp">注册</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <form class="chen-form-register" action="register" method="post">
        <h3 class="text-center">填写注册信息</h3>
        <div>
            <input type="email" name="email" class="form-control input-lg" id="email" placeholder="请输入有效的邮箱地址">
            <i class="fa fa-envelope"></i>
        </div>
        <p>该邮箱将作为登录网站的帐号
	          <span id="email-alert">
	        	<%
	        		String tishi="";
	        		if((String)request.getAttribute("a")=="1"){
	        			tishi="用户名已存在";
	        		}else if((String)request.getAttribute("a")=="2"){
	        			out.println("<script>");
	        			out.println("po()");
	        			out.println("</script>");
	        		}else{
	        			tishi="";
	        		}
	        	%>
	        	<%=tishi %>
	        </span>
        </p>
        <!--<span id="emailError" name="emailError"></span>-->
        <div>
            <input type="password" name="password" class="form-control input-lg" id="password" placeholder="请设置登录密码">
            <i class="fa fa-key"></i>
            <p id="password-check">password-check</p>
        </div>
        <div class="form-group chen-phone">
            <div class="input-group">
                <input type="tel" name="mobile" class="form-control input-lg" id="phone" placeholder="请填写11位手机号码">
                <div class="input-group-addon chen-code">获取验证码</div>
                <div id="mask"></div>
            </div>
            <i class="fa fa-mobile"></i>
            <p id="phone-check">phone-check</p>
        </div>
        <div>
            <input type="text" class="form-control input-lg" id="code" placeholder="请输入验证码">
            <i class="fa fa-th-large"></i>
            <span class="fa fa-times" id="code-check1"></span>
            <span class="fa fa-check" id="code-check2"></span>
            
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" id="service">
                阅读并同意
                <span><a href="serviceAgreement.jsp">&lt;&lt;运通测试服务协议&gt;&gt;</a></span>
            </label>
        </div>
        <input type="submit" name="submit" class="form-control chen-submit" id="submit1" value="注册" disabled  >
    </form>
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
<script src="js/main.js"></script>
<script src="js/layer/layer.js"></script>
<script>
window.onload=function(){
	registerCheck();
	getCode();
	function po(){
		var codeCheck1=document.getElementById("code-check1");
		var codeCheck2=document.getElementById("code-check2");
		codeCheck1.style.display="block";
		codeCheck2.style.display="none";
	}
}
</script>
</body>
</html>