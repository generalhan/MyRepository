<%@ page language="java" import="java.util.*,chen.feedInfo" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>反馈详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
  </head>
  
  <body class="feedDetail">
  		<h3>反馈详情</h3>
  		<%
  			List list=(List)request.getAttribute("a");
  		%>
  		<%
  			if(list==null){
  				out.print("<div style='text-align:center'></div>");
  			}else{
  		%>
    	<form action='feedBackComplete?feedBackID=<%=list.get(0) %>' method="post" >
    		<table>
    		    <tr>
    				<td>标题</td>
    				<td><%=list.get(2) %></td>
    			</tr>
    			<tr>
    				<td>帐号</td>
    				<td><%=list.get(1) %></td>
    			</tr>
    			<tr>
    				<td>提交时间</td>
    				<td><%=list.get(4) %></td>
    			</tr>
    			<tr>
    				<td>反馈内容</td>
    				<td><%=list.get(3) %></td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<input type="submit" value="完成" id="tj">
    					<a href="javascript:void(0)" onclick="window.history.back()">返回</a>
    				</td>
    			</tr>
    		</table>
    	</form>
    	<% } %>
  </body>
  <script>
  	window.onload=function(){
  		function getQueryString(name) { 
  			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
  			var r = window.location.search.substr(1).match(reg); 
  			if (r != null) return unescape(r[2]); return null; 
  			}
  		if(getQueryString("currentState")=="1"){
  			var tj=document.getElementById("tj");
  			tj.style.display="none";
  		}
  	}
  </script>
</html>
