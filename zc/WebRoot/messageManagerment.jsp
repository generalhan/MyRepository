<%@ page language="java" import="java.util.*,demo.message,demo.page" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  if (request.getSession().getAttribute("messageList") == null ){%><jsp:forward page="messageManagerment?id=2&pageNum=1" ></jsp:forward><%   }%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>messageManagerment</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" type="text/css" href="css/naidi-style.css">
</head>
<body class=" chen-user chen-test-content">
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
            <li><a href="userCenter"><i class="fa fa-user-o"></i>账号管理</a></li>
            <li class="active"><a href="messageManagerment?id=2&pageNum=1"><i class="fa fa-envelope-o"></i>消息管理</a></li>
            <li><a href="mytest?pageNum=1"><i class="fa fa-reply"></i>返回</a></li>
        </ul>
    </div>
</nav>
<main>
    <div class="container">
        <div class="chen-messagesManagerment">
        <div class="chen-message-title">
            <i class="fa fa-envelope-o"></i>
            <span>消息管理</span>
        </div>
        <div class="chen-message">
            <h3>订单记录</h3>
            <div class="chen-btn-message">
                <div class="btn-group">
                    <a href="messageManagerment?id=2&pageNum=1" class="btn btn-default">全部消息</a>
                    <a href="messageManagerment?id=0&pageNum=1" class="btn btn-default">未读消息</a>
                    <a href="messageManagerment?id=1&pageNum=1" class="btn btn-default">已读消息</a>
                </div>
                <div class="chen-notice">
                    <table>
                        <thead>
                            <tr>
                                <td style="padding-left: 10px;">标题内容</td>
                                <td>时间</td>
                                <td>消息内容</td>
                            </tr>
                        </thead>
                        <tbody>
                           <%
                           List list;
                           list = (List) session.getAttribute("messageList");                  		
	                         if(list.size()>0){
	                 			
                         	for(int i=0;i<list.size();i++){
	                				message m = new message();
	                				m=(message)list.get(i);
                         			out.println("<tr>");
	                				out.println("<td>");
	                				if((m.getState()).equals("0")){
	                				out.println("<i></i>");	           	
	                				}else{
	                				out.println("<span></span>");
	                				}
	                				if("".equals(m.getTitle())){
	                				%>
	                				<a href="messageDetail?message_id=<%=m.getMessage_id()%>&state=<%=m.getState()%>">无标题</a>
	                				<% } else{%>
	                				<a href="messageDetail?message_id=<%=m.getMessage_id()%>&state=<%=m.getState()%>"><%=m.getTitle()%></a>
	                				<% } %>
	                				<%
	                				out.println("</td>");
	                				out.println("<td>");
	                				%>
	                				<%=m.getGmt_create() %>
	                				<%
	                				out.println("</td>");
	                				out.println("<td>");
	                				%>
	                				<%=m.getType()%>
	                				<%
	                				out.println("</td>");
	                				out.println("</tr>");
	                				
	                			}
	                 		}else{
	                 			out.println("<tr><td colspan='3' style='text-align:center'>暂无数据</td></tr>");
	                 		}
	                		
                       	 %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="chen-message-page clearFix">
                <div class="chen-btn-clear">
                    <button class="btn btn-default" id="btn1">全部标记已读</button>
                    <button class="btn btn-default" id="btn2">清空</button>
                </div>
                <%if(list!=null&&list.size()>0){
            	List list2 = (List) session.getAttribute("messageList1"); 
            	List list3 = (List) session.getAttribute("messageList");
            	String messageState=(String)session.getAttribute("messageState");
            	int pageSize=10;
            	page pp=new page(list.size(),pageSize);
            	pp=(page)list2.get(list2.size()-1);
            	int curPage=pp.getCurPage();
            	int total=pp.getPageCount();
            	int pre=curPage-1;
            	int next=curPage+1;
        		out.print("<div class='chen-page1 clearFix'>");
        		out.print("<ul class='pagination'>");
        		out.print("<li>");
        		%>
        		<% if(curPage==1){
        			out.print("<a href='javascript:void(0)'>");
            		out.print("&laquo;");
            		out.print("</a>");
        		}else{
        			if(messageState.equals("0")){
        				out.print("<a href=messageManagerment?id=0&pageNum="+pre+">");
        			}else if(messageState.equals("1")){
        				out.print("<a href=messageManagerment?id=1&pageNum="+pre+">");
        			}else{
        				out.print("<a href=messageManagerment?id=2&pageNum="+pre+">");
        			}
            		out.print("&laquo;");
            		out.print("</a>");
        		}
        		out.print("</li>");
            	for(int i=1;i<pp.getPageCount()+1;i++){	
            		String url="";
            		if(messageState.equals("0")){
            			url="messageManagerment?id=0&pageNum="+i;
        			}else if(messageState.equals("1")){
        				url="messageManagerment?id=1&pageNum="+i;
        			}else{
        				url="messageManagerment?id=2&pageNum="+i;
        			}
            		out.print("<li>");
            		out.print("<a href="+url+">");
            		out.print(i);
            		out.print("</a>");
            		out.print("</li>");
            	}
            	out.print("<li>");
            %>
            <% if(curPage==total){
            	out.print("<a href='javascript:void(0)'>");
        		out.print("&raquo;");
        		out.print("</a>");
            }else{
            	if(messageState.equals("0")){
    				out.print("<a href=messageManagerment?id=0&pageNum="+next+">");
    			}else if(messageState.equals("1")){
    				out.print("<a href=messageManagerment?id=1&pageNum="+next+">");
    			}else{
    				out.print("<a href=messageManagerment?id=2&pageNum="+next+">");
    			}
        		out.print("&raquo;");
        		out.print("</a>");
            }
        		out.print("</li>");
            	out.print("</ul>");
        		out.print("</div>");
            
            } %>
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
<script src="js/main.js" ></script>
<script>
	
	window.onload=function(){
		var btn1=document.getElementById("btn1");
		var btn2=document.getElementById("btn2");
		function clear(what){
			var url="messageManagerment?id="+what+"&pageNum=1";
			location.href=url;
		}
		btn1.onclick=function(){
			clear(3);
		}
		btn2.onclick=function(){
			clear(4);
		}
		messageAlert();
       	setInterval(messageAlert,60000);
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