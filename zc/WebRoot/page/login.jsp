<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta name="keywords" content="scclui框架">
	<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
    <title>首页</title>
	
	<link rel="stylesheet" href="../common/layui/css/layui.css">
	<link rel="stylesheet" href="../common/css/sccl.css">
    
  </head>
  
  <body class="login-bg">
    <div class="login-box">
        <header>
            <h1>众测后台管理系统</h1>
        </header>
        <div class="login-main">
			<form action=""  method="post">
				<input name="__RequestVerificationToken" type="hidden" value="">                
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="text" name="userName" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input" id="userName">
				</div>
				<div class="layui-form-item">
					<label class="login-icon">
						<i class="layui-icon"></i>
					</label>
					<input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input" id="password">
				</div>
				<div class="layui-form-item">
					<div class="pull-left login-remember">
						<input type="checkbox" name="rememberMe" id="remember" value="true"  title="记住帐号" style="vertical-align:middle">
						<label for="remember">记住帐号？</label>
					</div>
					<div class="pull-right">
						<button class="layui-btn layui-btn-primary" type="button" id="btn">
							<i class="layui-icon"></i> 登录
						</button>
					</div>
					<div class="clear"></div>
				</div>
			</form>        
		</div>
        <footer>
            
        </footer>
    </div>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <script>
        function xml(){
          	$.ajax({
                  url:"${pageContext.request.contextPath}/adminLogin",
                  type:"post",
                  dataType: "json",
                  data:{
                     "userName":$('#userName').val(),
                     "password":$('#password').val(),
              	   },
              	 contentType:"application/x-www-form-urlencoded; charset=UTF-8",
              	success:function(val){
              		var jsonVal=JSON.parse(val);
              		console.log(jsonVal);
              		if(jsonVal=="0"||jsonVal=="2"){
              			layer.msg("帐号不存在",{icon:5,anim:5});
              		}else if(jsonVal=="1"){
              			layer.msg("密码错误",{icon:5,anim:5});
              		}else if(jsonVal=="3"){
              			layer.msg("登录成功",{icon:6,anim:5},function(){
                  			window.location.href="${pageContext.request.contextPath}/page/index.jsp";
                  		});
              		}else{
              			layer.msg("连接超时，请重新登录",{icon:5,anim:5});
              		}
              		
                },
                error:function(){
                	layer.msg("系统错误，请重新填写",{icon:5,anim:5});
                }
        	});
          }
		var btn=document.getElementById("btn");
		btn.onclick=function(){
			var userName=$('#userName').val();
			var password=$('#password').val();
			if(userName==""||password==""){
				layer.msg("帐号和密码不能为空 ",{icon:5,anim:5})
			}else{
				xml();
			}
		}
    </script>
  </body>
</html>
