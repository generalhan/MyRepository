<%@ page language="java" import="java.util.*,demo.applist,demo.page" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  if (request.getSession().getAttribute("list") == null ){%><jsp:forward page="mytest?pageNum=1" ></jsp:forward><%   }%>
<!DOCTYPE html>
<html>
<head>
	<title>mytest</title>
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
			<div class="naidi-header-nav">
				<div class="naidi-header-nav-container">
					<ul>
						<li class="active"><a href="mytest?pageNum=1"><i class="fa fa-clock-o"></i>我的测试</a></li>
						<li><a href="createTest.jsp"><i class="fa fa-folder"></i>新建测试</a></li>
						<li><a href="appSetting?pageNum=1"><i class="fa fa-cog"></i>应用管理</a></li>
						<li><a href="paging?pageNum=1"><i class="fa fa-file-text"></i>订单管理</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<main>
		<div class="naidi-main-mytest">
		<!--数据库提取数据-->
			<%
		List list; 
			
    	list = (List) session.getAttribute("list");  
        String kind="";

        String packName="";

		if(list!=null&&list.size()>0){		
			for(int i=0;i<list.size();i++){
				applist p= new applist();		
				p=(applist)list.get(i);
				out.println("<div class='item'>");
				out.println("<div><img src='images/test.jpg'></div>");
				out.println("<div>");
				out.println("<h2>");
		%>
		<a href="mytest2?id=<%=p.getID() %>">
			<% if(p.getName().indexOf("_")<0){ %>
			<%=p.getName() %>
			<%}else{ %>
			<%=p.getName().split("_")[1] %>
			<%} %>
		</a>
		<%
	        if("apk".equals(p.getKind())||p.getKind()==null){
	            kind="Android";
	        }else{
	            kind="IOS";
	        }
			packName=p.getPackName();
			out.println("</h2>");

			out.println("<h3 style='width:100px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;' title=");
			out.println(packName);
			out.println(">");
            out.println(packName);
            out.println("</h3>");

            out.println("<span>");
            out.println(kind);
            out.println("</span>");
			out.println("</div>");
			out.println("<div>上传时间  "+p.getTime().substring(0,p.getTime().lastIndexOf("."))+"</div>");
			out.println("<div><span>0<br>查看</span><span>0<br>下载</span></div>");
			out.println("</div>");
		}
			%>
			<% if(list!=null&&list.size()>0){
            	List list2 = (List) session.getAttribute("list2"); 
            	int pageSize=6;
            	page pp=new page(list.size(),pageSize);
            	pp=(page)list2.get(list2.size()-1);
            	int curPage=pp.getCurPage();
            	int total=pp.getPageCount();
            	int pre=curPage-1;
            	int next=curPage+1;
        		out.print("<div style='text-align:center'>");
        		out.print("<ul class='pagination'>");
        		out.print("<li>");
        		%>
        		<% if(curPage==1){
        			out.print("<a href='javascript:void(0)'>");
            		out.print("&laquo;");
            		out.print("</a>");
        		}else{
        			out.print("<a href=mytest?pageNum="+pre+">");
            		out.print("&laquo;");
            		out.print("</a>");
        		}
        		out.print("</li>");
            	for(int i=1;i<pp.getPageCount()+1;i++){	
            		String url="mytest?pageNum="+i;
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
            	out.print("<a href=mytest?pageNum="+next+">");
        		out.print("&raquo;");
        		out.print("</a>");
            }
        		out.print("</li>");
            	out.print("</ul>");
        		out.print("</div>");
            
            } %>
		<% }else{
			out.println("<div class='naidi-main-mytest'><div class='item'><a href='createTest.jsp' style='display:block; width:100%; text-align:center; margin-top:34px; font-size:30px; color:#428bca; text-decoration:none'>请新建测试进行添加</a></div></div>");
		} %>		
		</div>
	</main>
	<div class="chen-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6  col-xs-6">
                <div class="footer-item">
                    <h3 class="text-center"><i class="fa fa-headphones"></i>帮助中心</h3>
                    <p>如果您在使用过程中遇到哪些问题，包括应用描述、使用方法、报告解读等，都可以随时联系我们。</p>
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
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript">
	</script>
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