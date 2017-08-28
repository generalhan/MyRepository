<%@ page language="java" import="java.util.*,demo.applist,chen.orderDetail" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
    <title>Document</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/naidi-style.css">
</head>
<body class="orderDetail">
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
                    <li><a href="createTest.jsp"><i class="fa fa-folder"></i>新建测试</a></li>
                    <li><a href="appSetting?pageNum=1"><i class="fa fa-cog"></i>应用管理</a></li>
                    <li class="active"><a href="paging?pageNum=1"><i class="fa fa-file-text"></i>订单管理</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<main>
    <div class="container">
        <div class="chen-order-title">
            <i class="fa fa-file-text"></i>
            <span>订单管理</span>
        </div>
        <div class="chen-record">
            <h3>订单详情
            	<span style="float:right; font-size:16px; color:#00cec2; margin-right:20px; line-height:20px; cursor:pointer">
            		<i class="fa fa-reply"></i>
            	    <a href="paging?pageNum=1" style="color:#00cec2;">返回</a>
            	</span>
            </h3>
            <div class="info">
            <% List list;
            	List list2;
               list=(List)session.getAttribute("orderDetailList");
               list2=(List)session.getAttribute("orderService");
            	if(list.size()>0&&list2.size()>0){
            		
            %>
                <div class="user-info">
                    <h4>客户信息</h4>
                    <% if(list.get(0)==null){
                    	out.print("<p>公司名称：<span>未填写</span></p>");
                    } else{
                    	out.print("<p>公司名称：<span>");
                    %>
                    <%=list.get(0) %>
                    <% out.print("</span></p>");}%>
                    <p>邮箱地址：<span><%=list.get(2) %></span></p>
                    <p>联系电话：<span><%=list.get(1) %></span></p>
                </div>
                <div class=order-info">
                    <h4>订单信息</h4>
                    <p>订单编号：<span><%=list.get(4) %></span></p>
                    <p>交易时间：<span><%=list.get(3) %></span></p>
                    
                        <table>
                        <% 
                        	String u="";
                        	out.print("<tr>");
                        	out.print("<td>服务名称</td>");
                        	out.print("<td>");
                        	for(int i=0;i<list2.size();i++){
                        		orderDetail oo=new orderDetail();
                            	oo=(orderDetail)list2.get(i);
                            	u+=oo.getServeName()+"、";
                        	}
                        	out.print(u.substring(0,u.length()-1));
                        	out.print("</td>");
                        	out.print("</tr>");
                        	out.print("<tr>");
                        	out.print("<td>服务数量</td>");
                        	out.print("<td>"+list2.size()+"</td>");
                        	out.print("</tr>");
                        	orderDetail pp=new orderDetail();
                        	pp=(orderDetail)list2.get(0);
                        	out.print("<tr>");
                        	out.print("<td>付款状态</td>");
                        	if("0".equals(pp.getPayState())){
                        		out.print("<td>未付款</td>");
                        	}else{
                        		out.print("<td>已付款</td>");
                        	}
                        	out.print("</tr>");
                        	out.print("<tr>");
                        	out.print("<td>总金额</td>");
                        	out.print("<td>"+"￥"+pp.getServePrice()+"</td>");
                        	out.print("</tr>");
                        %>
                        </table>
                    
                </div>
                <%}else{%>
                	<div class="user-info">
                    <h4>客户信息</h4>
                    <p>公司名称：<span></span></p>
                    <p>邮箱地址：<span></span></p>
                    <p>联系电话：<span></span></p>
                </div>
                <div class=order-info">
                    <h4>订单信息</h4>
                    <p>订单编号：<span></span></p>
                    <p>交易时间：<span></span></p>
                        <table>
                            <tr>
                            	<td>服务名称</td>
                            	<td>暂无数据</td>
                            </tr>
                            <tr>
                            	<td>服务数量</td>
                            	<td>暂无数据</td>
                            </tr>
                            <tr>
                            	<td>付款状态</td>
                            	<td>暂无数据</td>
                            </tr>
                            <tr>
                            	<td>总金额</td>
                            	<td>暂无数据</td>
                            </tr>
                        </table>
                </div>
                <%} %>
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
<script src="js/main.js" ></script>
<script>	
	window.onload=function(){		
		messageAlert();
        var dropdown=document.getElementsByClassName("dropdown")[0];
    	var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
        if(userName=="null"){
        	dropdown.style.display="none";
        }else{
        	dropdown.style.display="block";
        }
	}
</script>
</body>
</html>