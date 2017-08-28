<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>在线反馈-未解决</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<div class="feed-back">
	<table id="table">
		<thead>
			<tr>
				<td>账号</td>
				<td>标题</td>
				<td>提交时间</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>123456</td>
				<td><div class="con">上传APP出现错误，服务无法提交，订单查询不到</div></td>
				<td>2017-04-07</td>
				<td>
					<a class="btn1">查看详情</a>
					<a class="btn2">完成</a>
				</td>
			</tr>
		</tbody>
	</table>
	<div id="page" style="text-align:center"></div>
</div>
</body>
<script type="text/javascript">
	function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
	} 
	function feedback(urls){
		var xmlHttp = new XMLHttpRequest();
		   xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4&&xmlHttp.status==200) {
						var messageJson = xmlHttp.responseText;
						var obj=JSON.parse(messageJson);
						var oBody=document.getElementsByTagName("tbody")[0];
						if(obj[0].length>0){
							console.log(obj);
							if(getQueryString('state')=="0"){
							var str="";
							var str1="";
							for(var i=0;i<obj[0].length;i++){
							str+="<tr>";
								str+="<td>"+obj[0][i].email+"</td>";
								str+="<td><div class='con'>"+obj[0][i].title+"</div></td>";
								str+="<td>"+obj[0][i].time+"</td>";
								str+="<td>";
								str+="<a href='${pageContext.request.contextPath}/feedBackDetail?feedBackID="+obj[0][i].id+"&currentState="+getQueryString('state')+"' class='btn1'>查看详情</a>"
								str+="<a href='${pageContext.request.contextPath}/feedBackComplete?feedBackID="+obj[0][i].id+"' class='btn2'>完成</a>";
								str+="</td>";
							str+="</tr>";
							}
							oBody.innerHTML=str;
						  }else{
								var str="";
								var str1="";
								for(var i=0;i<obj[0].length;i++){
								str+="<tr>";
									str+="<td>"+obj[0][i].email+"</td>";
									str+="<td><div class='con'>"+obj[0][i].title+"</div></td>";
									str+="<td>"+obj[0][i].time+"</td>";
									str+="<td>";
									str+="<a href='${pageContext.request.contextPath}/feedBackDetail?feedBackID="+obj[0][i].id+"&currentState="+getQueryString('state')+"' class='btn1'>查看详情</a>"
									str+="</td>";
								str+="</tr>";
								} 
								oBody.innerHTML=str;
						  }
							if(obj[1].length>0){
								var page=document.getElementById("page");
								var len=obj[1].length;
								var pre=obj[1][len-1].curPage-1;
								var next=obj[1][len-1].curPage+1;
								str1+="<div>";
								str1+="<ul class='pagination'>";
								if(pre<=0){
									str1+="<li><a href='javascript:void(0)'>&laquo;</a></li>";
								}else{
									str1+="<li><a href=javascript:feedback('${pageContext.request.contextPath}/allFeedBack?k="+obj[0][0].state+"&curPage="+pre+"');>&laquo;</a></li>";
								}
								
								for(var i=1;i<obj[1][len-1].pageCount+1;i++){
									str1+="<li><a href=javascript:feedback('${pageContext.request.contextPath}/allFeedBack?k="+obj[0][0].state+"&curPage="+i+"');>"+i+"</a></li>";
								}
								if(next>=obj[1][len-1].pageCount+1){
									str1+="<li><a href='javascript:void(0)');>&raquo;</a></li>";
								}else{
									str1+="<li><a href=javascript:feedback('${pageContext.request.contextPath}/allFeedBack?k="+obj[0][0].state+"&curPage="+next+"');>&raquo;</a></li>";
								}
								str1+="</ul>";
								str1+="</div>";
								page.innerHTML=str1;
							}
						}else{
							var str="";
							str+="<tr><td colspan='4'>暂无数据</td></tr>";
							oBody.innerHTML=str;
						}
				}
			};
			var url =urls;
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
	}
	window.onload=function(){

		if (getQueryString('state')=='1') {
			feedback("${pageContext.request.contextPath}/allFeedBack?k=1&curPage=1");
		}else if(getQueryString('state')=='0'){
			feedback("${pageContext.request.contextPath}/allFeedBack?k=0&curPage=1");
		}
	}
</script>
</html>