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
    <title>功能测试</title>
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
                    <li class="active"><a href="funTest.jsp">功能测试</a></li>
                    <li><a href="collapseTest.jsp">崩溃收集</a></li>
                    <li><a href="phoneCheck.jsp">真机调试</a></li>
                    <li><a href="safeTest.jsp">安全测试</a></li>
                    <li><a href="ABTest.jsp">A/B测试</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="h103"></div>
<div class="chen-fun">
    <div class="funTop">
        <div class="container">
            <div class="row text-left">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="funTop-l">
                        <h3 class="text-left">功能测试</h3>
                        <p>专业测试团队帮你设计测试用例，完美补充测试力量，并按照您
                            的真实需求开展测试</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="fun-mid">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-1 col-md-7 col-xs-7">
                    <p>全面覆盖应用功能及异常分支</p>
                    <p>模拟真实场景测试</p>
                    <p>结合多样化操作行为，生成自动化测试脚本</p>
                </div>
                <div class="col-md-5 col-md-5 col-xs-5">
                    <img src="images/teamWork.png" class="img-responsive" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="phoneCheck-bot">
        <div class="container">
            <h3>功能特性</h3>
            <div class="row">
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-bug"></i>
                            <span>快速定位每一个BUG</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>按功能模块分区，高效判断bug所
                            在位置</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-pencil-square-o "></i>
                            <span>快速精准沟通</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>匹配测试专家分析应用，关注重点
                            模块拆分功能点，并设计用例</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-rocket"></i>
                            <span>高效按步执行</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>专业测试者分模块团队作业，按照
                            用例探索应用，及时提交所有问题</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
            <h3>使用步骤</h3>
            <div class="fun-process clearfix">
                <div class="list1 list">
                    <img src="images/person2.png" alt="" style="vertical-align: middle">
                    <p class="list-title">选择调试设备</p>
                    <p class="list-content">点击进入设备列表，选择需要调试的设备</p>
                </div>
                <div class="list2 list">
                    <p id="arrow1"></p>
                    <p id="arrow2"></p>
                    <img src="images/person2.png" alt="">
                    <p class="list-title">选择调试设备</p>
                    <p class="list-content">点击进入设备列表，选择需要调试的设备</p>
                </div>
                <div class="list3 list">
                    <p id="arrow3"></p>
                    <img src="images/person2.png" alt="">
                    <p class="list-title">选择调试设备</p>
                    <p class="list-content">点击进入设备列表，选择需要调试的设备</p>
                </div>
                <div class="list4 list">
                    <img src="images/person2.png" alt="">
                    <p class="list-title">选择调试设备</p>
                    <p class="list-content">点击进入设备列表，选择需要调试的设备</p>
                </div>
            </div>
        </div>
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