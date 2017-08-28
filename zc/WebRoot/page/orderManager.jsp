<%@ page language="java" import="java.util.*,chen.allMess,demo.page" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  %>
<!DOCTYPE html>
<html>
<head>
	<title>订单管理</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<div class="order-manager">
	<form action="" method="post">
		<div>
			订单日期：从
			<input type="date" name="startTime" value="2017-04-18" id="start" >
			到
			<input type="date" name="endTime" value="2017-04-20" id="end" >
			<input type="button" class="btnSearch" name="" id="btnOK" value="检索" >
			
		</div>
	</form>
	<table id="table">
		<caption>订单信息
		<span style="display:inline-block;  height:30px; float:right; font-size:12px; line-height:30px; padding:0 10px;  cursor:pointer; border:1px solid #cccccc; background-color:#cccccc ">显示当前状态下的所有订单</span>
		</caption>
		<thead>
			<tr>
				<td>订单编号</td>
				<td>服务数量</td>
				<td>订单金额</td>
				<td>付款状态</td>
				<td>交易时间</td>
				<td>更新</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="6">暂无数据</td>
			</tr>
		</tbody>
	</table>
	<div id="page" style="text-align:center"></div>            
</div>
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
	}
	function sureDel(event){
		var event=event||window.event;
		var name=confirm("你确定要删除这条订单吗");
		if(!name){
			if(event.preventDefault){
                event.preventDefault();
            }else{
                event.returnValue = false;
            }
		}
	}
	function payed(urls,way){
		var xmlHttp = new XMLHttpRequest();
		   xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4&&xmlHttp.status==200) {

						var messageJson = xmlHttp.responseText;
						var obj=JSON.parse(messageJson);
						if(obj[0].length>0){
							console.log(obj);
							var str="";
							var str1="";
							var oBody=document.getElementsByTagName("tbody")[0];
							for(var i=0;i<obj[0].length;i++){
							str+="<tr>";
								str+="<td>"+obj[0][i].orderNum+"</td>";
								str+="<td>"+obj[0][i].testTypeId+"</td>";
								str+="<td>"+obj[0][i].price+"</td>";
								if(obj[0][i].state==1){
									str+="<td><span class='payState1'>已付款</span></td>";
								}else{
									str+="<td><span class='payState1'>未付款</span></td>";
								}
								str+="<td>"+obj[0][i].time+"</td>";
								str+="<td>"
								str+="<a href='${pageContext.request.contextPath}/updateOrder?orderID="+obj[0][i].id+"&currentState="+getQueryString('state')+"'><button>修改</button></a>"
								str+="<a href='${pageContext.request.contextPath}/deletesOrder?orderID="+obj[0][i].id+"&currentState="+getQueryString('state')+"' onclick='sureDel(event)'}><button>删除</button></a>";
								str+="</td>";
							str+="</tr>";
							}
							oBody.innerHTML=str;
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
									str1+="<li><a href=javascript:payed('${pageContext.request.contextPath}/orderManager_backstage?k="+obj[0][0].state+"&curPage="+pre+"','GET');>&laquo;</a></li>";
								}
								
								for(var i=1;i<obj[1][len-1].pageCount+1;i++){
									str1+="<li><a href=javascript:payed('${pageContext.request.contextPath}/orderManager_backstage?k="+obj[0][0].state+"&curPage="+i+"','GET');>"+i+"</a></li>";
								}
								if(next>=obj[1][len-1].pageCount+1){
									str1+="<li><a href='javascript:void(0)');>&raquo;</a></li>";
								}else{
									str1+="<li><a href=javascript:payed('${pageContext.request.contextPath}/orderManager_backstage?k="+obj[0][0].state+"&curPage="+next+"','GET');>&raquo;</a></li>";
								}
								str1+="</ul>";
								str1+="</div>";
								page.innerHTML=str1;
							}
						}
						
				}
			};
			var url =urls;
			xmlHttp.open(way, url, true);
			xmlHttp.send(null);
	}
	/*0是未付款，1是已付款*/
	window.onload=function(){

		if (getQueryString('state')=='1') {	
			payed("${pageContext.request.contextPath}/orderManager_backstage?k=1&curPage=1","GET");
		}else if(getQueryString('state')=='0'){
			payed("${pageContext.request.contextPath}/orderManager_backstage?k=0&curPage=1","GET");
		}
		/*获取路径的参数*/
		function getPara(url){
			var p;
			for(var i=url.length-1;i>0;i--){
				if(url[i]=="="){
					p=url.substring(i+1, url.length);
					break;
				}
			}
			return p;
		}
		var caption=document.getElementsByTagName("caption")[0];
		var oSpan=caption.getElementsByTagName("span")[0];
		oSpan.onclick=function(){
			console.log(location.href);
			var p;
			p=getPara(location.href);
			if(p==0){
				payed("${pageContext.request.contextPath}/orderManager_backstage?k=0&curPage=1","GET");
				console.log("0");
			}else{
				payed("${pageContext.request.contextPath}/orderManager_backstage?k=1&curPage=1","GET");
				console.log("1");
			}
		}
		/*提交表单*/
		var btnOK=document.getElementById("btnOK");
		btnOK.onclick=function(){
			var startTime=document.getElementById("start").value;
			var endTime=document.getElementById("end").value;
			var p=getPara(location.href);
			var url="${pageContext.request.contextPath}/mohu?startTime="+startTime+"&endTime="+endTime+"&currentState="+p+"&curPage=1";
			payed(url,"GET");
		}

	}
</script>
</html>