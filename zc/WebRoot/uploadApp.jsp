<%@ page language="java" import="java.util.*,demo.applist" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>uploadApp</title>
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
					<li><span>3</span>应用描述</li>
					<li class="line"></li>
					<li><span>4</span>提交完成</li>
				</ul>
			</div>		
			<div class="naidi-main-container-uploadapp">
				<h1>上传安装包<span><a href="createTest.jsp" id="pre">上一步</a><a href="appDescription.jsp" id="next">下一步</a></span></h1>				
				<form action="uploadApp" method="POST" enctype="multipart/form-data" target="hideframe">
					<div class="choose-app">
						<h2>上传一个新的安装包</h2>
						<div class="choose-app-panel">
							<div class="upload-pak">
								<input type="text" name="" placeholder="请上传应用" id="name" disabled>
                                <span>
                                <label for="xfile"><i class="fa fa-folder"></i>选择安装包</label>
                                <input type="file" name="file-name" id="xfile"  />
                                </span>
							</div>
							<input type="submit" id="appSubmit" value="提交"/>
							<!--上传文件时显示-->
							<div class="upload-status">
							<div style='text-align:center;' id="img"></div>
								<span style=' line-height:130px;' class="upload-status-span"></span>
								
								<div id="topLoader"></div>
							<!--  	<span>点击按钮上传</span>-->
							
							</div>
							<!--未上传文件时显示-->
							<div class="upload-ts">
								<p>请上传您的APP进行测试</p>
							</div>
                            <span style=' display:inline-block; margin-top:50px; '>（ 支持.ipa或.apk文件，单个文件最大支持1G。目前标准兼容测试仅支持.apk文件 ）</span>
						</div>
					</div>
					<div class="version-details">
						<h2>或者选择一个已经上传的版本</h2>
						<div class="version-details-panel" id="list">
						</div>
					</div>
				</form>
				<iframe name="hideframe" style="display:none"></iframe>
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
                    <p>Email：service@expdatacloud.com</p>
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
	<script src="js/jquery.percentageloader-0.1.js"></script>
	<script src="js/layer/layer.js"></script>
	<script>
	function tishi(text){
		var img=document.getElementById("img");
		var statusspan=document.getElementsByClassName("upload-status-span")[0];
		statusspan.innerHTML="";
		if(text=="shibai"){
			img.innerHTML="解析安装包错误，请重新上传";
		}else{
			img.innerHTML="您已上传过相同的安装包";	
		}
		
	}
	function done(){
		var img=document.getElementById("img");
		var statusspan=document.getElementsByClassName("upload-status-span")[0];
		statusspan.innerHTML="";
		img.innerHTML="上传完成";
	}
		window.onload=function(){
			var oList=document.getElementById("list");
			var oLi=oList.getElementsByTagName("div");
			var oNext=document.getElementById("next");
			var button=document.getElementById("appSubmit");						
			getAppList();
			
		
			upload();
			messageAlert();
			getAppList();	
		}
	    var dropdown=document.getElementsByClassName("dropdown")[0];
		var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
	    if(userName=="null"){
	    	dropdown.style.display="none";
	    }else{
	    	dropdown.style.display="block";
	    }
	  
	</script>
</body>
</html>