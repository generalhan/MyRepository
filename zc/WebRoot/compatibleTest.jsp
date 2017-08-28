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
    <title>兼容测试</title>
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
                    <li  class="active"><a href="compatibleTest.jsp">兼容测试</a></li>
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
<div class="chen-compatible">
    <div class="compatible-top">
        <div class="container">
            <h3>完美兼容&nbsp;&nbsp;适配所有机型</h3>
            <p>在大量机型上安装、启动、运行、卸载等，记录测试过程中完整日志、截图、录像<br>
                捕获CPU、内存、流量、电量等性能数据助您定位闪退、crash、ANR等问题。</p>
        </div>
    </div>
    <div class="compatible-mid">
        <div class="container">
            <span></span><span>执行过程</span>
            <img src="images/way.png" class="img-responsive" alt="">
        </div>
    </div>
    <div class="compatible-bot">
        <div class="container">
            <div class="top">
                <span></span><span>功能优势</span>
            </div>
            <div class="row">
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-mobile fa-2x"></i>
                            <span>机型多，覆盖广</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>3000+部手机,覆盖98%的主流机型参考各大渠道数据，确保95%的主流人群覆
                            盖率热门机型及时更新,实时紧随市场变化</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-database"></i>
                            <span>测试深，速度快</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>简单提交APP测试包，无需提供脚本深入应用内部测试，遍历每个功能点，2
                            4小时快速反馈完整测试报告</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-area-chart "></i>
                            <span>报告全，定位准</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>完美的在线测试报告，更好的交互体验长达200页的详细内容，丰富的截图和
                            日志记录全过程多维度筛选细分，强大的联动分析，快速定位问题，有图有真
                            相</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="items">
                    <div class="col-md-3 col-sm-4 col-xs-4">
                        <div class="descript">
                            <i class="fa fa-credit-card-alt "></i>
                            <span>省成本，少流失</span>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-8 col-xs-8">
                        <p>减少至少10万+的购机、维护和折旧成本提升测试效率，加速产品上线，避免市
                            场机会成本损失显著减少用户流失率15%+</p>
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