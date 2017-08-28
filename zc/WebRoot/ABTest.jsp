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
    <title>A/B测试</title>
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
                    <li><a href="safeTest.jsp">安全测试</a></li>
                    <li  class="active"><a href="ABTest.jsp">A/B测试</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="h103"></div>
<div class="chen-abTest">
    <div class="abTest-top">
        <div class="container">
            <h3>A/B测试</h3>
            <p>用科学实验和数据分析驱动产品演进</p>
        </div>
    </div>
    <div class="abTest-mid">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="top">
                        <p>提升留存、转化、点击率</p>
                        <p>降低产品迭代风险</p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <img src="images/result.png" class="img-responsive" alt="">
                </div>
            </div>
            <h3>服务内容</h3>
            <div class="service">
                <p>生成试验版本：节省开发时间，科学准确的确定最优版本</p>
                <p>流量分割：一键控制版本流量，操作灵活，数据精准</p>
                <p>数据分析：采用大数据挖掘技术进行统计分析，让产品优化更加科学可靠</p>
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
                        <p>通过假设、试验、分析和改进的
                            闭环，提供个性的服务</p>
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
                        <p>支持Android，iOS，Web，H5，
                            后台的A/B测试</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-line-chart "></i>
                            <span>驱动业务增长</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>A/B测试帮你验证不同方案优劣
                            ，获得确定性的业务增长</p>
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