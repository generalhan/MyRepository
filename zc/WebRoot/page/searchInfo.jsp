<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>信息查询</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<div class="info-search">
	<form class="searchDiv" action="" method="get">
		<div>
			<select name="select" id="way">
				<option value="orderNum">订单编号</option>
				<option value="userName">客户姓名</option>
				<option value="phoneNum">手机号码</option>
			</select>
			<div class="inputSearch">
				<input id="searchOrder" type="text" name="orderNum">	
				<span class="errortip"></span>			
			</div>
			<input type="button" name="btn" id="btnOK" value="检索">
		</div>
	</form>
	<div class="box">
		<div class="wu">请选择检索条件，并输入内容</div>
	</div>
	<div id="page" style="text-align:center"></div>
</div>
<script>
function searchWay(){
	var way=document.getElementById("way");
	var b;
	if(way.value=="orderNum"){
		b=1;
	}else if(way.value=="userName"){
		b=2;
	}else{
		b=3;
	}
	return b;
}
function search(a){
	var xmlHttp = new XMLHttpRequest();
	   xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4&&xmlHttp.status==200) {
					var messageJson = xmlHttp.responseText;
					var obj=JSON.parse(messageJson);
					console.log(obj);
					if(obj.length>0){
						var str="";
						var str1="";
						var box=document.getElementsByClassName("box")[0];
						var page=document.getElementById("page");
						for(var i=0;i<obj[0][0].length;i++){
							var pp="";
							for(var j=0;j<obj[1].length;j++){
								if(obj[0][0][i].orderNum==obj[1][j].orderNum){
									pp+=obj[1][j].name+"、";
								}
							}
							str+="<div class='item'>";
							str+="<h2>";
							str+="<span>"+"订单编号："+obj[0][0][i].orderNum+"</span>";
							str+="<span>"+"交易时间："+obj[0][0][i].time+"</span>";
							str+="</h2>";
							str+="<div class='con'>";
							str+="<div class='box-left'>";
							str+="<p>"+"客户姓名："+obj[0][0][i].name+"</p>";
							str+="<p>"+"注册邮箱："+obj[0][0][i].email+"</p>";
							str+="<p>"+"联系方式："+obj[0][0][i].mobile+"</p>";
							str+="<p>"+"联系QQ或微信："+obj[0][0][i].qw+"</p>";
							str+="<p>"+"公司名称："+obj[0][0][i].company+"</p>";
							str+="</div>";
							str+="<div class='box-right'>";
							str+="<p>服务名称："+pp.substring(0,pp.length-1)+"</p>";
							str+="<p>"+"服务数量："+obj[0][0][i].sl+"</p>";
							str+="<p>"+"订单金额："+obj[0][0][i].price+"</p>";
							if(obj[0][0][i].state=="0"){
								str+="<p>"+"付款状态：未付款</p>";
							}else{
								str+="<p>"+"付款状态：付款</p>";
							}
							str+="</div>";
							str+="</div>";
							str+="</div>";
						}
						box.innerHTML=str;
						if(obj[0][1].length>0){
							var searchOrder=document.getElementById("searchOrder");
							var b=searchWay();
							var len=obj[0][1].length;
							var pre=obj[0][1][len-1].curPage-1;
							var next=obj[0][1][len-1].curPage+1;
							str1+="<div>";
							str1+="<ul class='pagination'>";
							if(pre<=0){
								str1+="<li><a href='javascript:void(0)'>&laquo;</a></li>";
							}else{
								str1+="<li><a href=javascript:search('${pageContext.request.contextPath}/searchInfo?way="+b+"&info="+searchOrder.value+"&pageNum="+pre+"');>&laquo;</a></li>";
							}
							
							for(var i=1;i<obj[0][1][len-1].pageCount+1;i++){
								str1+="<li><a href=javascript:search('${pageContext.request.contextPath}/searchInfo?way="+b+"&info="+searchOrder.value+"&pageNum="+i+"');>"+i+"</a></li>";
							}
							if(next>=obj[0][1].length){
								str1+="<li><a href='javascript:void(0)');>&raquo;</a></li>";
							}else{
								str1+="<li><a href=javascript:search('${pageContext.request.contextPath}/searchInfo?way="+b+"&info="+searchOrder.value+"&pageNum="+next+"');>&raquo;</a></li>";
							}
							str1+="</ul>";
							str1+="</div>";
							page.innerHTML=str1;
						}
						
					}
					
			}
		};
		var url =a;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
}
window.onload=function(){

	function prevent(event){
		var event=event||window.event;
		if(event.stopPropagation){
            event.stopropagation;
			}else{
                event.cancelBubble=true;
            }

	}
	var btnOK=document.getElementById("btnOK");
	btnOK.onclick=function(event){
		var searchOrder=document.getElementById("searchOrder");
		var b=searchWay();
		var url="${pageContext.request.contextPath}/searchInfo?way="+b+"&info="+searchOrder.value+"&pageNum=1";
		search(url);
		prevent(event);
	}
}
</script>
</body>
</html>