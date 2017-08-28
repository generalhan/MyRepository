<%@ page language="java" import="java.util.*,chen.orderDetail" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>更新订单信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
  </head>
  
  <body class="updateOrder">
  <h3>更改订单信息</h3>
      <% List list=(List)request.getAttribute("a");
         String b=(String)request.getAttribute("b");
      %>
    <% if(list==null){
    	out.print("<div style='text-align:center'>暂时没有数据</div>");
    }else{ 
    	orderDetail detail=new orderDetail();
    	detail=(orderDetail)list.get(0);
    	%>
    <form action="updateOrder?orderID=<%=detail.getId() %>&currentState=<%=b %>" method="post">
    	<table cellspacing="0px">
    		<tr>
    			<td>订单编号</td>
    			<td><%=detail.getOrderNum() %></td>
    		</tr>
    		<tr>
    			<td>服务名称</td>
    			<%
    				out.print("<td>");
    				String p="";
    				for(int i=0;i<list.size();i++){
    					detail=(orderDetail)list.get(i);
    					p+=detail.getServeName()+"、";
    				}
    				out.print(p.substring(0,p.length()-1));
    				out.print("</td>");
    			%>
    		</tr>
    		<tr>
    			<td>订单金额</td>
    			<td><input type="number" style='text-align:center' name="orderPrice" value=<%=detail.getServePrice() %>></td>
    		</tr>
    		<tr>
    			<td>状态</td>
    			<td>
    				<select name="orderState">
    				<%if("0".equals(detail.getPayState())){
    					out.print("<option>未付款</option>");
    					out.print("<option>已付款</option>");
    				} else{
    					out.print("<option>已付款</option>");
    					out.print("<option>未付款</option>");
    				}%>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>交易时间</td>
    			<td><%=detail.getTime() %></td>
    		</tr>
    		<tr>
    			<td colspan="2"><input type="submit" value="确认修改"><a href='javascript:void(0)' onclick='window.history.back()' style='text-decoration:none; margin-left:10px; color:#999999'>返回</a></td>
    		</tr>
    	</table>
    </form>
     <% } %>
  </body>
</html>
