<%@page import="demo.user"%>
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
    <title>关于我们</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
</head>
<body>
<div class="navbar-fixed-top">
    <div class="chen-header">
        <div class="container">
        <% 
        	String userEmail=(String)request.getSession().getAttribute("userEmail");
        	if(userEmail==null){
        		out.print("<div class='header-bar'>");
        		out.print("<a href='login.jsp'>登录</a>");
        		out.print("<a href='register.jsp'>注册</a>");
        		out.print("</div>");
        	}else{
        		out.print("<div class='header-login'>");
        		out.print("<a href='mytest?pageNum=1'>我的测试</a>");
  				out.print("<a href='userCenter'>您好，"+userEmail+"</a>");
        		out.print("<a href='loginOut'>退出</a>");
        		out.print("</div>");
        	}
        %>
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
<div class="chen-contact">
    <div class="contact-expert">
        <p>为您打造更高品质的APP</p>
        <p>WE'RE  EXPERT</p>
    </div>
    <div class="nav">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-2 col-sm-2"></div>
                <div class="col-md-3 col-sm-3 col-xs-4"><a href="aboutUs.jsp">关于我们</a></div>
                <div class="col-md-2 col-sm-3 col-xs-4"><a href="serviceAgreement.jsp">服务协议</a></div>
                <div class="col-md-3 col-sm-3 col-xs-4"><a href="contactUs.jsp">联系我们</a></div>
                <div class="col-md-2 col-sm-2"></div>
            </div>
        </div>
    </div>
    <div class="aboutUs">
        <div class="container">
            <h2>关于我们</h2>
            <h3>深圳市前海运通技术有限公司</h3>
            <p>ShenZhen Qianhaiyuntong Technology limited company</p>
            <p>深圳市前海运通技术有限公司是前海运通集团的全资子公司，是EMC、华为、阿里云、招银云等产品的代理商，在深圳、北京、
                上海、广州、成都设有分公司及办事处，核心团队是来自于国际知名存储及备份企业的专业化人士,目前有近80名员工，研发超
                过50%。</p>
            <p>公司致力于绿色数据中心建设，为金融、证券、互联网金融等行业数据中心建设和成长提供咨询、开发、集成、测试、基础设施
                建设、运维管理、数据分析等一站式服务。</p>
            <p>公司为用户提供传统IT基础架构建设，阿里云、亚马逊、招银云等公有云服务，提供传统IT基础架构向公有云、私有云迁移的技
                术咨询及实施服务，帮助客户打造完整的生态环境，提供商业化Hadoop大数据环境构建及基于SPLUNK/SPARK的数据分析、
                数据挖掘等解决方案。</p>
        </div>
        <img src="images/city.jpg" alt="">
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

</script>
</body>
</html>