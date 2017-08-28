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
    <title>首页</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
</head>
<body class="index">
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
                	<a href="loginOut?state=0">退出</a>
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
                        <li><a href="ABTest.jsp">A/B测试</a></li>
                    </ul>
                </div>
            </div>
    </nav>
</div>
<div class="h103"></div>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="images/banner1.jpg" alt="...">
        </div>
        <div class="item">
            <img src="images/banner2.jpg" alt="...">
        </div>
        <div class="item">
            <img src="images/banner3.jpg" alt="...">
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="h60"></div>

<div class="container chen-main">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 text-center">
            <p>WE'RE EXPERT</p>
            <p>为什么选择我们</p>
            <p>Why did you choose us</p>
        </div>
    </div>
    <div class="chen-item">
        <div class="item1 item">
            <h3>专业测试人员</h3>
            <p>专注于做评测的团队，专业评测流程和工具具备国家权威测试认证资质</p>
            <div class="triangle"></div>
        </div>
        <div class="item2 item">
            <h3>简单四步搞定您的测试</h3>
            <p>注册成为网站会员→ 提交需要测试安装包→ 选
                择服务套餐，下单→ 48小时内获得测试报告。</p>
            <div class="triangle"></div>
        </div>
        <div class="item3 item">
            <h3>海量测试机型</h3>
            <p>4000+款测试机型，50000+部终端设备，覆
                盖98%活跃。瞬间拥有万部手机帮您测试，解
                决一切问题</p>
            <div class="triangle"></div>
        </div>
        <div class="item4 item">
            <h3>低成本</h3>
            <p>享有整套软硬件设备服务支持、享有专业评测专
                家团队支持。</p>
            <div class="triangle"></div>
        </div>
    </div>
    <div class="h40"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 text-center">
            <p>WE'RE EXPERT</p>
            <p>我们的服务</p>
            <p>Our service</p>
        </div>
    </div>
    <div class="chen-service-list">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="list1 list">
                <i class="fa fa-bug fa-2x"></i>
                <h3>BUG探索</h3>
                <p>不同挡位的专家团队，为
                    您挖掘出更深层次的应用
                    BUG。</p>
                <a href="createTest.jsp">More</a>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="list1 list">
                <i class="fa fa-server fa-2x"></i>
                <h3>方案设计</h3>
                <p>全面分析您的应用，包含
                    全部模块功能与逻辑顺序。</p>
                <a href="createTest.jsp">More</a>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="list1 list">
                <i class="fa fa-check-square fa-2x"></i>
                <h3>执行方案</h3>
                <p>由专业的团队全面为应用
                    分析，保障应用各数据到
                    位。</p>
                <a href="createTest.jsp">More</a>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="list1 list">
                <i class="fa fa-search fa-2x"></i>
                <h3>标准兼容测试</h3>
                <p>自动化实现app安装、运
                    行，快速发现app兼容性
                    问题。</p>
                <a href="createTest.jsp">More</a>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="list1 list">
                <i class="fa fa-spinner fa-2x"></i>
                <h3>深度兼容测试</h3>
                <p>大量主流机型执行脚本，
                    人工参与审查核心功能及
                    UI适配。</p>
                <a href="createTest.jsp">More</a>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="list1 list">
                <i class="fa fa-apple fa-2x"></i>
                <h3>IOS兼容测试</h3>
                <p>针对IOS应用，在大量机型
                    上测试，人工参与审查核心
                    功能及UI适配.</p>
                <a href="createTest.jsp">More</a>
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