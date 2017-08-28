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
    <title>在线反馈</title>
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
<div class="chen-feedback">
    <div class="feedbackTop">
        <div class="container">
            <div class="row text-left">
                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="feedbackTop-l">
                        <h3 class="text-left">在线反馈</h3>
                        <p>客服随时准备为你服务,请提交详细的问题和想法给我们</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="feedbackTop-r">
                        <img src="images/chat.png" class="img-responsive" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <form method="post" action="feedback" class="form-horizontal" id="myform">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label text-center"><i>*</i>标题：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control input-lg" id="inputEmail3" placeholder="title" name="title">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label"><i>*</i>您的邮箱：</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control input-lg" id="inputPassword3" placeholder="your email" name="yourEmail">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">反馈内容：</label>
                <div class="col-sm-10">
                    <textarea rows="5" class="form-control" name="word" id="word"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-primary pull-right">提交</button>
                </div>
            </div>
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
<script src="js/main.js"></script>
<script src="js/adaptive.js"></script>
<script src="js/layer/layer.js"></script>
 <script>
  window['adaptive'].desinWidth = 1400;
  window['adaptive'].baseFont = 16;
  window['adaptive'].maxWidth = 1400;
  window['adaptive'].init();
  window.onload=function(){
  var form1=document.getElementsByClassName("form-horizontal")[0];
  var btn=document.getElementsByClassName("btn")[0];
  var inputEmail3=document.getElementById("inputEmail3");
  var inputPassword3=document.getElementById("inputPassword3");
  function xml(){
  	$.ajax({
          url:"feedback",
          type:"post",
          dataType: "json",
          data:{
             "title":$('#inputEmail3').val(),
             "yourEmail":$('#inputPassword3').val(),
             "word":$('#word').val()
      	   },
      	 contentType:"application/x-www-form-urlencoded; charset=UTF-8",
      	success:function(){
      		layer.msg("反馈成功",{icon:6,anim:5});
      		$('#myform')[0].reset()
        },
        error:function(){
        	layer.msg("反馈失败，请重新填写",{icon:5,anim:5});
        }
	});
  }
  btn.onclick=function(){ 
	  var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
  		if(inputEmail3.value==""||inputPassword3.value==""){
  			btn.disabled="true";
  			layer.tips('请填写必填字段','.btn',{
  				tips:[1,'#0FA6D8']
  			});
  		}else if(!reg.test(inputPassword3.value)){
  			btn.disabled="true";
  			layer.tips('邮箱格式不正确','.btn',{
  				tips:[1,'#0FA6D8']
  			});
  		}else{
  			btn.disabled=""; 
  		   console.log($("#inputEmail3").val());
  			xml();
  		}
  }
  inputEmail3.onkeyup=function(){
	btn.disabled="";
  }
  inputPassword3.onkeyup=function(){
  	btn.disabled="";
  }
  }
  </script>
</body>
</html>