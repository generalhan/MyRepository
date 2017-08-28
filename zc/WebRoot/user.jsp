<%@ page language="java" import="java.util.*,demo.applist,demo.user" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  if (request.getSession().getAttribute("userList") == null ){%><jsp:forward page="userCenter" ></jsp:forward><%   }%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>user</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/public.css">
	<link rel="stylesheet" type="text/css" href="css/naidi-style.css">
</head>
<body class="chen-user chen-test-content">
<nav class="navbar navbar-default" role="navigation">
    <div class="naidi-header-top">
				<div class="naidi-header-top-container clearFix">
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
</nav>
<nav class="chen-user-nav">
    <div style="width:1000px; margin:0 auto">
        <ul class="clearFix">
            <li class="active"><a href="userCenter"><i class="fa fa-user-o"></i>账号管理</a></li>
            <li><a href="messageManagerment?id=2&pageNum=1"><i class="fa fa-envelope-o"></i>消息管理</a></li>
            <li><a href="mytest?pageNum=1"><i class="fa fa-reply"></i>返回</a></li>
        </ul>
    </div>
</nav>
<main>
    <div class="chen-user-info clearFix">
        <span class="user-img">
            <i class="fa fa-user-circle"></i>
        </span>
        <span class="user-count"><%=email %></span>
        <span class="user-active">
            <a href="javascript:void(0)" id="modify-pwd">修改密码</a>
            <i></i>
            <a href="javascript:void(0)" id="modify-mobile" >
            <%
            List list;
        	list = (List) session.getAttribute("userList");
            user p1= new user();		
			p1=(user)list.get(0);
            %>
            <%
            	if(p1.getMobile()!=null){
            		out.print("已绑定");
            		out.print("<b id='gg'>"+p1.getMobile()+"</b>");
            		
            	}else{
            		out.print("您还没绑定手机号");
            	}
            %>
        	</a>
        </span>
    </div>
    <div class="chen-user-modify">
        <form action="updateUser" method="post">
       
        	<%
        		
        		if(list!=null&&list.size()>0){
        			for(int i = 0; i < list.size(); i++){
        				user p= new user();		
						p=(user)list.get(i);
						String userName=p.getName();
						String userEmail=p.getEmail();
						String company=p.getCompany();
						String industry=p.getIndustry();
						String personSize=p.getPersonSize();
						String contact=p.getContact();
						String QQorWexin=p.getQQorWexin();
						if(userName==null){
							userName="";
						}
						if(userEmail==null){
							userEmail="";
						}
						if(company==null){
							company="";
						}
						if(industry==null){
							industry="";
						}
						if(personSize==null){
							personSize="";
						}
						if(contact==null){
							contact="";
						}
						if(QQorWexin==null){
							QQorWexin="";
						}
        	%>
        			<div class="item">
		                <span>姓名</span>
		                <input type="text" name="userName" value="<%=userName%>">
		            </div>
		            <div class="item">
		                <span>您的工作邮箱</span>
		                <input type="text" name="userEmail" value="<%=userEmail%>">
		            </div>
		            <div class="item">
		                <span>贵公司产品名称</span>
		                <input type="text" name="company" value="<%=company%>">
		            </div>
		            <div class="item">
		                <span>所属行业</span>
		                <input type="text" name="industry" value="<%=industry%>">
		            </div>
		            <div class="item">
		                <span>人员规模</span>
		                <input type="text" name="personSize" value="<%=personSize%>">
		            </div>
		            <div class="item">
		                <span>联系方式</span>
		                <input type="text" name="contact" value="<%=contact%>">
		            </div>
		            <div class="item">
		                <span>联系QQ或微信</span>
		                <input type="text" name="QQorWexin" value="<%=QQorWexin%>">
		            </div>
            <%
        			}
        		}else{
        	%>
            <div class="item">
                <span>姓名</span>
                <input type="text" name="userName">
            </div>
            <div class="item">
                <span>您的工作邮箱</span>
                <input type="text" name="userEmail">
            </div>
            <div class="item">
                <span>贵公司产品名称</span>
                <input type="text" name="productName">
            </div>
            <div class="item">
                <span>所属行业</span>
                <input type="text" name="industry">
            </div>
            <div class="item">
                <span>人员规模</span>
                <input type="text" name="personSize">
            </div>
            <div class="item">
                <span>联系方式</span>
                <input type="text" name="contact">
            </div>
            <div class="item">
                <span>联系QQ或微信</span>
                <input type="text" name="QQorWexin">
            </div>
             
             <%
        		}             
             %>
             
            <input type="submit" id="btnSave" name="submit" value="保存">
        </form>
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
<!--遮罩层-->
<div class="chen-mark"></div>
<!--弹出修改密码弹框-->
				
<div class="chen-modify-pwd">
<%
	        		String tishi=(String)request.getAttribute("state");
	        		if(tishi==null){
	        			tishi="";
	        		}else{
	        			if(tishi=="true"){
		        			tishi="修改成功";
		        		}else if(tishi=="false"){
		        			tishi="重置密码不相同";
		        		}else if(tishi=="empty"){
		        			tishi="修改密码不能为空";
		        		}else if(tishi=="false2"){
		        			tishi="原密码错误";
		        		}else{
		        			tishi="修改失败";
		        		}
	        			out.println("<script>");
	        			out.println("var mark=document.getElementsByClassName(\"chen-mark\");");
	        			out.println("var chenModifyPwd=document.getElementsByClassName(\"chen-modify-pwd\");");
	        			out.println("mark[0].style.display=\"block\";");
	        			out.println("chenModifyPwd[0].style.display=\"block\";");	        			
	        			out.println("</script>");
	        		}
					
	        	%>
    <h3>修改密码<a id="close" style="display:inline-block; padding-right:50px; margin-top:-10px; float:right;" href="#"><i  class="fa fa-2x fa-close"></i></i></a></h3>
    <form action="updatePassword1" method="post">
    	<p id="errortip"><%=tishi %></p>
        <label for="current-pwd">当前密码</label>
        <input type="password" name="pwd1"   id="current-pwd">
        <p id="error1">error</p>
        <label for="new-pwd">新密码</label>
        <input type="password" name="pwd2" id="new-pwd">
        <p id="error2">error</p>
        <label for="new-pwd-sure">确认密码</label>
        <input type="password" name="pwd3" id="new-pwd-sure">
        <p id="error3">error</p>
        <input type="submit" name="submit2" id="submit2" value="修改">
    </form>
</div>
<div class="chen-modify-mobile">
    <h3>修改绑定手机</h3>
    <form action="changePhone" method="POST">
        <label for="mobile">手机号码</label>
        <input type="tel" name="phoneNum" id="mobile">
        <div class="cDiv">
       		 <span id="getCode">获取验证码</span>
       		 <i id="mask"></i>
        </div>
        <p id="error4">error</p>
        <div class="sDiv">
	        <label for="code">验证码</label>
	        <input type="text" name="code" id="code">
	        <p id="error5">error</p>
        	<i class="fa fa-times" id="code-check1"></i>
            <i class="fa fa-check" id="code-check2"></i>
        </div>
     
        <input type="submit" name="submit3" id="submit3" value="修改" disabled>
        <input type="button" name="reset" id="reset" value="退出">
    </form>
</div>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script>
<script src="js/main.js" ></script>
<script>
    window.onload=function(){       	
         messageAlert();
         /* var a=document.getElementById("current-pwd");
           a.onblur= function(){
        	   var xmlHttp = new XMLHttpRequest();
        	   xmlHttp.onreadystatechange = function() {
        			if (xmlHttp.readyState == 4) {
        				if (xmlHttp.status == 200) {
        					var isOK = xmlHttp.responseText;
        					if ("true" == isOK) {
        						document.getElementById("error1").style.visibility="visible";
        						document.getElementById("error1").innerHTML = "密码正确!";
        					} else if ("false" == isOK) {
        						document.getElementById("error1").style.visibility="visible";
        						document.getElementById("error1").innerHTML = "密码错误!";
        					}
        				}
        			}
        		};
        		var url = "updatePassword?username="+a.value;
         		xmlHttp.open("GET", url, true);
         		xmlHttp.send(null);
           }*/
        
    	 modifyPwd();
	    var dropdown=document.getElementsByClassName("dropdown")[0];
		var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
	    if(userName=="null"){
	    	dropdown.style.display="none";
	    }else{
	    	dropdown.style.display="block";
	    }
	    var errortip=document.getElementById("errortip");
	    errortip.style.marginLeft=0;
	    errortip.style.textAlign="center";
	    errortip.style.visibility="inherit";
	    var btn=document.getElementById("btnSave");
	    btn.onclick=function(){
	    	alert("修改成功");
	    }
	    //获取验证码
	    var getCode=document.getElementById("getCode");
	    var mobile=document.getElementById("mobile");
	    var mask=document.getElementById("mask");
	    var code=document.getElementById("code");
	    var codeCheck1=document.getElementById("code-check1");
	    var codeCheck2=document.getElementById("code-check2");
	    var submit3=document.getElementById("submit3");
	    var reset=document.getElementById("reset");
	    var gg=document.getElementById("gg");
	    var second=60;
	    reset.onclick=function(){
	    	var mark=document.getElementsByClassName("chen-mark"),
	        chenModifyPwd=document.getElementsByClassName("chen-modify-pwd"),
	        chenModifyMobile=document.getElementsByClassName("chen-modify-mobile");
	    	mark[0].style.display="none";
	        chenModifyPwd[0].style.display="none";
	        chenModifyMobile[0].style.display="none";
	    }
	    getCode.onclick=function(){
	    	var oldNum=getCode.getAttribute("phoneNum");
	    	var reg4=/^0?1[3|4|5|8][0-9]\d{8}$/;  //这个可以验证电话号码必须是11位，且要以13, 14, 15, 18这几个号段开头
	    	if(!reg4.test(mobile.value)){
				document.getElementById("error4").style.visibility="visible";
				document.getElementById("error4").innerHTML="手机号码格式不对";
			}else{
				var xmlHttp = new XMLHttpRequest();
				 xmlHttp.onreadystatechange=function(){
					 if(xmlHttp.readyState==4&&xmlHttp.status==200){
						 var messageJson=xmlHttp.responseText;
						 if (messageJson=="1") {
							    document.getElementById("error4").style.visibility="hidden";
								mask.style.display="block";
								mobile.setAttribute("readonly",true);
								mobile.style.cursor="default";
								interval=setInterval(time,1000);
								$("#getCode").attr("dj","yes");
								reset.disabled=true;
							}else if(messageJson=="0"){
								document.getElementById("error4").style.visibility="visible";
								document.getElementById("error4").innerHTML="手机号已被注册过";
							}else if(messageJson=="3"){
								document.getElementById("error4").style.visibility="visible";
								document.getElementById("error4").innerHTML="获取验证码频率太高了";
							}else{
								document.getElementById("error4").style.visibility="visible";
								document.getElementById("error4").innerHTML="系统繁忙";
							}
					 }
				 }
				 var url = "modifyMobile?oldNum="+oldNum+"&newNum="+mobile.value;
	         		xmlHttp.open("GET", url, true);
	         		xmlHttp.send(null);
			}
	    }
//		获取验证码显示倒计时
		function time(){
			 second--;
			 getCode.innerHTML=second+"s";
			 if(second==0){			 
				 mask.style.display="none";
				 mobile.removeAttribute("readonly");
				 mobile.style.cursor="default";			 
				 clearInterval(interval);
				 second=60;
				 getCode.innerHTML="重新获取";
				 reset.disabled="false";
			 }
		}
		code.onkeyup=function(){
			if(getCode.getAttribute("dj")!="yes"){
				codeCheck1.style.display="block";
				codeCheck2.style.display="none";
				submit3.disabled=true;
			}else{
				var con="codeCon="+code.value;
				var xmlHttp = new XMLHttpRequest();
				xmlHttp.onreadystatechange=function(){
					if(xmlHttp.readyState==4&&xmlHttp.status==200){
						var messageJson = xmlHttp.responseText;
						if(messageJson=="1"){
							codeCheck1.style.display="none";
							codeCheck2.style.display="block";
							submit3.disabled=false;
						}else{
							codeCheck1.style.display="block";
							codeCheck2.style.display="none";
							submit3.disabled=true;
						}
					}
					}
				var url = "phoneCheck";
				xmlHttp.open("POST",url,true);
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
				xmlHttp.send(con);
			}
			
		}
		submit3.onclick=function(){
			if(code.value==""){
				document.getElementById("error5").style.visibility="visible";
				document.getElementById("error5").innerHTML="验证码不能为空";
				return false;
			}
		}
	    
    }
</script>
</body>
</html>