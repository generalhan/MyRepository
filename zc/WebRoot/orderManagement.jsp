<%@ page language="java" import="java.util.*,demo.demo,demo.page" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  if (session.getAttribute("list")== null ){%><jsp:forward page="paging?pageNum=1" ></jsp:forward><%   }%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>orderManagement</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/naidi-style.css">
</head>
<body class=" chen-user chen-test-content">
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
            <h3>订单记录</h3>
            <table>
                <thead>
                    <tr>
                        <td>订单编号</td>
                        <td>应用名称</td>
                        <td>交易时间</td>
                        <td>服务数量</td>
                        <td>订单金额</td>
                        <td>付款状态</td>
                    </tr>
                </thead>
                <tbody>
                  <%
		                	List list; 
		                	list = (List) session.getAttribute("list");                			
						if(list!=null&&list.size()>0){
		                	for (int i = 0; i < list.size(); i++) {
							demo p=new demo();		
							p=(demo)list.get(i);
							
														
				%>
				<tr class="orderDet">
					<td class="oID" name="<%=p.getOrderID() %>"><%=p.getOrderNum() %></td>
					<td><%=p.getAppName()%></td>
					<td><%=p.getCreateTime()%></td>
					<td><%=p.getName() %></td>
					<td><%=p.getPrice()%></td>
					<td>
						<% if(p.getState().equals("1")){ %>
						<% out.println("已付款");}else{ %>
						<% out.println("未付款");} %>
					</td>
				</tr>
				<%
							}
		                }else{
		                	out.print("<tr style='border-bottom:none; margin:0 auto;'><td colspan='6'>暂无数据</td></tr>");
		                }
						
				%>
                </tbody>
            </table>
            <%if(list!=null&&list.size()>0){
            	List list2 = (List) session.getAttribute("list2"); 
            	int pagesize=10;
            	page pp=new page(list.size(),pagesize);
            	pp=(page)list2.get(list2.size()-1);
            	int curPage=pp.getCurPage();
            	int total=pp.getPageCount();
            	int pre=curPage-1;
            	int next=curPage+1;
        		out.print("<div class='chen-page clearFix'>");
        		out.print("<ul class='pagination'>");
        		out.print("<li>");
        		%>
        		<% if(curPage==1){
        			out.print("<a href='javascript:void(0)'>");
            		out.print("&laquo;");
            		out.print("</a>");
        		}else{
        			out.print("<a href=paging?pageNum="+pre+">");
            		out.print("&laquo;");
            		out.print("</a>");
        		}
        		out.print("</li>");
            	for(int i=1;i<pp.getPageCount()+1;i++){	
            		String url="paging?pageNum="+i;
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
            	out.print("<a href=paging?pageNum="+next+">");
        		out.print("&raquo;");
        		out.print("</a>");
            }
        		out.print("</li>");
            	out.print("</ul>");
        		out.print("</div>");
            
            } %>
            
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
		messageAlert();
        var dropdown=document.getElementsByClassName("dropdown")[0];
    	var userName='<%=(String)request.getSession().getAttribute("userEmail")%>';
        if(userName=="null"){
        	dropdown.style.display="none";
        }else{
        	dropdown.style.display="block";
        }
        var orderDet=document.getElementsByClassName("orderDet");
        var len=orderDet.length;
        for(var i=0;i<len;i++){
        orderDet[i].onclick=function(){
        	var id=this.getElementsByClassName("oID")[0].getAttribute("name");
        	url="orderDetail?id="+id;
        	window.location=url;
        }
        }
	}
</script>
</body>
</html>