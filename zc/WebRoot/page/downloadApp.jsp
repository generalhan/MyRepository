<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>安装包下载</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
</head>
<body>
<div class="download">
	<form class="searchDiv" action="" method="get">
		<div>
			<label for="searchOrder">订单编号</label>
			<div class="inputSearch">
				<input id="searchOrder" type="text" name="orderNum">	
				<span class="errortip"></span>			
			</div>
			<input type="button" name="btn" value="检索" id="btnOK">
		</div>
		<div id="error" style='color:red; text-align:center; visibility:hidden'>温馨提示：订单编号必须是数字</div>
	</form>
	<div class="box">
		<span style="display:block; width:100%; margin:30px auto; text-align:center; color:#cccccc">请输入订单编号进行查询并下载</span>
	</div>	
</div>
<script type="text/javascript">
	window.onload=function(a){
		var btnOK=document.getElementById("btnOK");
		var searchOrder=document.getElementById("searchOrder");
		var error=document.getElementById("error");
		function download(a){
			var xmlHttp = new XMLHttpRequest();
			   xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4&&xmlHttp.status==200) {

							var messageJson = xmlHttp.responseText;
							var obj=JSON.parse(messageJson);
							var box=document.getElementsByClassName("box")[0];
							console.log(obj);
							var str="";
							if(obj.length>0){
								
								str+="<p><span class='label'>订单编号： </span>"+obj[0]+"</p>";
								str+="<p><span class='label'>应用名称： </span>"+obj[2].substring(obj[2].indexOf("_")+1,obj[2].length)+"</p>";
								str+="<div>";
								str+="<span class='label detail'>应用详情： </span>";
								str+="<div class='detail-app'>";
								if(obj[3]==null){
									str+="<p><span class='label'>应用描述名称：</span>未填写</p>";
								}else{
									str+="<p><span class='label'>应用描述名称：</span>"+obj[3]+"</p>";
								}			
								str+="<p><span class='label'>包名：</span>"+obj[4]+"</p>";
								str+="<div>";
								str+="<span class='label detail'>应用介绍：</span>";
								if(obj[5]==null){
									str+="<textarea cols='45' rows='10' placeholder='未填写'></textarea>";
								}else{
									str+="<textarea cols='45' rows='10'>"+obj[5]+"</textarea>";
								}
								
								str+="</div>";
								if(obj[6]==null||obj[6]==""){
									str+="<p><span class='label'>应用截图： </span><a class='main-color' href='javascript:void(0)'>点击下载</a></p>";
								}else{
									str+="<p><span class='label'>应用截图： </span><a class='main-color' href='${pageContext.request.contextPath}/downloadFile?id="+obj[7]+"&fileName="+obj[6]+"&state=1&ordernum="+obj[0]+"'>点击下载</a></p>";
								}
								str+="</div>";
								str+="</div>";
								str+="<p><span class='label'>下载安装包： </span><a class='main-color' href='${pageContext.request.contextPath}/downloadFile?id="+obj[7]+"&fileName="+obj[2]+"&state=2&ordernum="+obj[0]+"'>点击下载</a></p>";
								if(obj[1]==null||obj[1]==""){
									str+="<p><span class='label'>应用说明文档： </span><a class='main-color' href='javascript:void(0)'>点击下载</a></p>";
								}else{
									str+="<p><span class='label'>应用说明文档： </span><a class='main-color' href='${pageContext.request.contextPath}/downloadFile?id="+obj[7]+"&fileName="+obj[1]+"&state=3&ordernum="+obj[0]+"'>点击下载</a></p>";
								}
								
								box.innerHTML=str;
							}else{
								str="<span style='display:block; width:100%; margin:30px auto; text-align:center; color:#cccccc'>您输入的是无效的订单编号</span>";
								box.innerHTML=str;
							}
							
					}
				};
				var url =a;
				xmlHttp.open("GET", url, true);
				xmlHttp.send(null);
		}
		btnOK.onclick=function(){
			error.style.visibility="hidden";
			var con=searchOrder.value;
			var reg=/\d/g;
			if(reg.test(con)){
				download("${pageContext.request.contextPath}/downloadApp?orderNum="+con);
			}else{
				error.style.visibility="visible";
			}
		}
	}
</script>
</body>
</html>