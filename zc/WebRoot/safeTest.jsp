<%@ page language="java" import="java.util.*,demo.applist" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
    <title>安全测试</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
</head>
<body>
<div class="navbar-fixed-top">
    <div class="chen-header">
        <div class="container">
            <div class="header-bar">
                <a href="login.jsp">登录</a>
                <a href="register.jsp">注册</a>
            </div>
            <div class="header-login">
                	<a href="mytest?pageNum=1">我的测试</a>
                	<a href="userCenter">您好，<%=(String)request.getSession().getAttribute("userEmail")%></a>
                	<a href="loginOut">退出</a>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-default chen-index" role="navigation">
        <div class="container" id="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand test-list" href="index.jsp">
                    <img src="images/logo.png" alt="Logo">
                </a>
            </div>
            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="compatibleTest.jsp">兼容测试</a></li>
                    <li><a href="funTest.jsp">功能测试</a></li>
                    <li><a href="collapseTest.jsp">崩溃收集</a></li>
                    <li><a href="phoneCheck.jsp">真机调试</a></li>
                    <li class="active"><a href="safeTest.jsp">安全测试</a></li>
                    <li><a href="ABTest.jsp">A/B测试</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="h103"></div>
<div class="chen-abTest">
    <div class="abTest-top">
        <div class="container">
            <h3>专注App安全</h3>
            <p>支持多种平台，一键上传，全方位自动检测测试快速，分析深入，报告专业</p>
        </div>
    </div>
    <div class="abTest-mid">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="top">
                        <p>WEB应用安全检测服务</p>
                        <p>移动应用安全检测服务</p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6" id="chen-safe">
                    <img src="images/safe.png" class="img-responsive"  alt="">
                </div>
            </div>
            <h3>服务内容</h3>
            <div class="service">
                <p>移动应用安全检测服务 - 渗透测试覆盖：环境安全、应用安全、用户操作安全、业务安全、数据安全、
                    通信安全、服务器端安全等7个方面</p>
                <p>WEB应用安全检测服务 - 渗透测试覆盖：配置管理类、认证管理类、会话管理类、输入验证类、文件
                    操作类、不安全URL类、服务器端敏感信息安全等7个方面</p>
            </div>
            <h3>执行过程</h3>
            <div class="row">
                <div class="list">
                    <div class="col-md-1 col-sm-1 col-xs-2">
                        <span class="arrow"><img src="images/arrow.png" class="img-responsive" alt=""></span>
                    </div>
                    <div class="col-md-11 col-sm-11 col-xs-10">
                        <h3 class="getInfo">信息获取</h3>
                        <p>获取目标服务器信息及域名等资产</p>
                    </div>
                </div>
                <div class="list">
                    <div class="col-md-1 col-sm-1 col-xs-2">
                        <span class="arrow"><img src="images/arrow.png" class="img-responsive" alt=""></span>
                    </div>
                    <div class="col-md-11 col-sm-11 col-xs-10">
                        <h3 class="getInfo">自动安装</h3>
                        <p>在设备上自动安装运行APP或访问WEB站点</p>
                    </div>
                </div>
                <div class="list">
                    <div class="col-md-1 col-sm-1 col-xs-2">
                        <span class="arrow"><img src="images/arrow.png" class="img-responsive" alt=""></span>
                    </div>
                    <div class="col-md-11 col-sm-11 col-xs-10">
                        <h3 class="getInfo">渗透测试</h3>
                        <p>通过模拟黑客攻击操作系统、服务、应用、不当配置或者用户行为等方式，测试安全问题
                            寻找突破口、取得权限、扩大攻击成果</p>
                    </div>
                </div>
                <div class="list">
                    <div class="col-md-1 col-sm-1 col-xs-2">
                        <span class="arrow"><img src="images/arrow.png" class="img-responsive" alt=""></span>
                    </div>
                    <div class="col-md-11 col-sm-11 col-xs-10">
                        <h3 class="getInfo">生产报告</h3>
                        <p>生成渗透测试报告，对发现的漏洞进行整理及补充，编写修复建议</p>
                    </div>
                </div>
                <div class="list">
                    <div class="col-md-1 col-sm-1 col-xs-2">
                        <span class="arrow"><img src="images/circle.png" class="img-responsive" alt=""></span>
                    </div>
                    <div class="col-md-11 col-sm-11 col-xs-10">
                        <h3 class="getInfo">信息获取</h3>
                        <p>获取目标服务器信息及域名等资产</p>
                    </div>
                </div>
            </div>
            <h3 class="skill">功能特性</h3>
            <div class="row">
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-sitemap"></i>
                            <span>专业服务</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>由专业人员检测并提供安全检
                            测报告和问题解决建议</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-desktop"></i>
                            <span>多平台覆盖</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>覆盖Android、iOS、Web等多
                            平台</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-dot-circle-o "></i>
                            <span>高度对标</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>按国内外标准规范进行针对性检
                            测，服务内容全面</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-group "></i>
                            <span>高效协作</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>对产品进行自动化检测，协助
                            解决并进行知识转移
                        </p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="h90"></div>
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
    <script src="js/adaptive.js"></script>
    <script>
    window['adaptive'].desinWidth = 1400;
    window['adaptive'].baseFont = 16;
    window['adaptive'].maxWidth = 1400;
    window['adaptive'].init();
    var headerBar=document.getElementsByClassName("header-bar")[0];
    var headerLogin=document.getElementsByClassName("header-login")[0];
    var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
    if(userName=="null"){
    	headerBar.style.display="block";
    	headerLogin.style.display="none";
    }else{
    	headerBar.style.display="none";
    	headerLogin.style.display="block";
    }
    </script>
</body>
</html>