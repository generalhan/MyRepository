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
    <title>applicationSettingt</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/naidi-style.css">
</head>
<body class="text-center">
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
							<a href="messageManagerment?id=2&pageNum=1">
                       			 <i class="fa fa-bell"></i>
		                        <span id="messageAjax" class="badge">3</span>
		                    </a>
		                    <div class="message-center" style="z-index:10;">
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
						<li><a href="createTest.jsp"><i class="fa fa-folder"></i>新建测试</a></li>
						<li class="active"><a href="appSetting?pageNum=1"><i class="fa fa-cog"></i>应用管理</a></li>
						<li><a href="paging?pageNum=1"><i class="fa fa-file-text"></i>订单管理</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
<main>
    <div class="container">
        <div class="chen-setting">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="chen-app-set text-left">应用设置</h3>
                </div>
                <div class="col-md-12">
                    <div class="col-md-9 col-sm-9 col-xs-9">
                    <% 
                    	applist itemInfo=new applist();
                    	itemInfo=(applist)session.getAttribute("appItem");
                    %>
                        <form class="form-horizontal chen-form-info" action="appDetail2" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="appName" class="col-md-2 col-sm-3 col-xs-2 control-label">应用名称</label>
                                <div class="col-md-10 col-sm-9 col-xs-10" >
                                    <input type="text" class="form-control" id="appName" placeholder="电视猫" name="app_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="appName1" class="col-md-2 col-sm-3 col-xs-2 control-label">包名</label>
                                <div class="col-md-10 col-sm-9 col-xs-10">
                                    <input type="text" class="form-control" id="appName1" placeholder="com.moretv.android" readonly="true" style="cursor:default" name="pack_name" value=<%=itemInfo.getPackName() %>>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="appName2" class="col-md-2 col-sm-3 col-xs-2 control-label">应用介绍</label>
                                <div class="col-md-10 col-sm-9 col-xs-10">
                                    <textarea rows="8" id="appName2" class="form-control" name="summary"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="files" class="col-md-2 col-sm-3 col-xs-2 control-label">应用截图</label>
                                <div class="col-md-10 col-sm-9 col-xs-10">
                                    <div class="chen-screenshot">
                                    	<div id="showPic">
                                        	<label for="files" class="pull-left" id="pic"><i class="fa fa-plus-square-o fa-4x" style="display:block;margin-top:50px;"></i></label>
                                        	<input type="file" id="files" name="image1_url">
                                        </div>
                                        <span id="fileInfo"><i class='fa fa-times fa' id='icon'></i><i id="info"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary pull-right chen-btn-ok" id="save" >保存</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <button class="btn btn-primary btn-sm chen-btn-del" style="margin-top: 30px; display:none">删除应用</button>
                    </div>
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
<script src="js/adaptive.js"></script>
<script src="js/main.js"></script>
<script src="js/image-file-visible.js"></script>
<script src="js/layer/layer.js"></script>
<script>
window.onload=function(){
    messageAlert();
   	setInterval(messageAlert,60000);
   	appDetail();
    var dropdown=document.getElementsByClassName("dropdown")[0];
	var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
    if(userName=="null"){
    	dropdown.style.display="none";
    }else{
    	dropdown.style.display="block";
    }
  //图片显示插件
    $.imageFileVisible({wrapSelector: "#showPic",
        fileSelector: "#files",
        width: 190,
        height: 160
    });
    
}
</script>
</body>
</html>