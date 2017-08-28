<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>消息推送</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
</head>
<body>
<div class="message-push">
	<div class="contacts">
		<p><span>账号列表</span><span onclick='javascript:change(this);return false'>所有人</span></p>
		<div align="center" style="border-top: 1px solid #aaa;"><input type="text" class="search-box"  placeholder="查找账号"><span id="icon-search" class="search-btn" ><i class="fa fa-search"></i></span></div>
		<dl id="dl">
			<dt>A</dt>
			<dd>
				<ul>
					<li><a href=""> 阿莉  589746523@qq.com</a></li>
				</ul>
			</dd>
			<dt>B</dt>
			<dd>
				<ul>
					<li><a href=""> 阿莉  589746523@qq.com</a></li>
				</ul>
			</dd>
			<dt>C</dt>
			<dd>
				<ul>
					<li><a href=""> 阿莉  589746523@qq.com</a></li>
				</ul>
			</dd>
			<dt>B</dt>
			<dd>
				<ul>
					<li><a href=""> 阿莉  589746523@qq.com</a></li>
				</ul>
			</dd>
			<dt>C</dt>
			<dd>
				<ul>
					<li><a href=""> 阿莉  589746523@qq.com</a></li>
				</ul>
			</dd>
			
		</dl>
	</div>
	<div class="content">
		<p>消息内容</p>
		<form method="post" action="${pageContext.request.contextPath}/messagePush">	
			<div><label>收件人</label><input style="   width:440px;" type="text" id="user-email" name="userEmail"></div>
			<div>
				<label>主题</label>
				<input  style="    margin-left: -5px;" type="text" name="title">
				<label style="    width: 71px;    margin-left: 20px;">消息类型</label>
				<select style="  height:21px ;" name="select">
					<option value="系统通知">系统通知</option>
					<option value="活动消息">活动消息</option>
					<option value="通知消息">通知消息</option>
				</select>
			</div>
			<div><label  style="    vertical-align: top;">正文</label><textarea cols="60" name="content" rows="30" ></textarea></div>
			<div><input type="submit" name="submit" value="推送"></div>			
		</form>
		<%
	        		String tishi=(String)request.getAttribute("tip");
	        		if(tishi==null){
	        			tishi="";
	        		}else{	
	        			if(tishi=="Ok"){
	        				out.println("<script>");
		        			out.println("alert('成功推送消息')");	        			
		        			out.println("</script>");
	        			}else if(tishi=="error"){
	        				out.println("<script>");
		        			out.println("alert('您输入的收件人有误。')");	        			
		        			out.println("</script>");
	        			}else if(tishi=="null"){
	        				out.println("<script>");
		        			out.println("alert('收件人没填写')");	        			
		        			out.println("</script>");
	        			}
	        			
	        		}
					
	        	%>
	</div>
</div>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js "></script>
<script type="text/javascript">
function change(obj){
	var email=document.getElementById('user-email');
	if(obj.innerHTML=="所有人"){
		email.value=obj.innerHTML.substring(obj.innerHTML.indexOf(',')+1)+";";
	}else{
		if(email.value.length==0){
			email.value=obj.innerHTML.substring(obj.innerHTML.indexOf(',')+1)+";";
		}else{
			if(email.value=="所有人;"){
				email.value=obj.innerHTML.substring(obj.innerHTML.indexOf(',')+1)+";";
			}else{
				console.log(obj.innerHTML.substring(obj.innerHTML.indexOf(',')+1));
				if(email.value.indexOf(obj.innerHTML.substring(obj.innerHTML.indexOf(',')+1))>-1){
					
					return false;
				}else{
					email.value+=obj.innerHTML.substring(obj.innerHTML.indexOf(',')+1)+";";	
				}	
			}		
			
		}
	}
	
	
}
window.onload=function(){
	var icon=document.getElementById('icon-search');
	var searchBox=document.getElementsByClassName('search-box');
	
	function search(){
		var text=document.getElementsByClassName("search-box");
		var temp=text[0].value;		
		console.log(temp);
		var dl=document.getElementById('dl');
		var data =localStorage.getItem("contacts");
		var str="";
			
		data = eval(data);
		if(temp.length==0){
			getAppList();
		}else{
			str+="<dt>查询结果</dt>";
			str+="<dd><ul>";
			for(var i=0;i<data.length;i++){
				for(var j=0;j<data[i].data.length;j++){
					if(data[i].data[j].indexOf(temp)>=0){			
						if(data[i].data[j].indexOf(',')==0){
							str+="<li><a href='#' onclick='javascript:change(this);return false'>"+data[i].data[j].substring(data[i].data[j].indexOf(',')+1)+"</a><li>";				
						}else{
							str+="<li><a href='#' onclick='javascript:change(this);return false'>"+data[i].data[j]+"</a><li>";
						}				
					}	
				}
			}
			if(str=="<dt>查询结果</dt><dd><ul>"||str==null){
				str+="<li>没有查询结果</li>";
				console.log("fads");
			}
			str+="</ul></dd>";
			dl.innerHTML=str;
			console.log(data);
		}
		
	}
	function getAppList(){
		var xmlHttp = new XMLHttpRequest();
		   var data;
		   var temp;
		   
		   xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					if (xmlHttp.status == 200) {
						var messageJson = xmlHttp.responseText;
						if(messageJson=='false'){
							data=null;
						}else{
							var data=eval('('+messageJson+')');	
							
						}
					
						if (data==null) {
							console.log(data);
						}else{
							console.log(data);
							var dl=document.getElementById('dl');
							var dt=dl.getElementsByTagName('dt');
							var arr=[];
						for(var i=0;i<data.length;i++){
							arr.push((data[i].name+","+data[i].email));
						}
							console.log(arr);
							temp=eval(JSON.stringify(pySegSort(arr)));
							console.log("temp"+temp);						
							localStorage.setItem("contacts",JSON.stringify(temp));
							var str="";
							for(var j=0;j<temp.length;j++){
								str+="<dt>"+temp[j].letter+"</dt>";
								str+="<dd><ul>";							
								for(var k=0;k<temp[j].data.length;k++){
									if(temp[j].data[k].indexOf(',')==0){
										str+="<li><a href='#' onclick='javascript:change(this);return false'>"+temp[j].data[k].substring(temp[j].data[k].indexOf(',')+1);+"</a><li>";
									}else{
										str+="<li><a href='#' onclick='javascript:change(this);return false'>"+temp[j].data[k]+"</a><li>";	
									}
								}
								str+="</ul></dd>";
							}
							dl.innerHTML=str;
						}
					}
				}
			};
			var url = "${pageContext.request.contextPath}/messagePush";
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);
	}
	getAppList();
	function pySegSort(arr,empty) {
		if(!String.prototype.localeCompare)
		return null;

		var letters ="*ABCDEFGHJKLMNOPQRSTWXYZ".split('');
		var zh ="啊把差大额发噶哈级卡啦吗那哦爬器然啥他哇西呀咋".split('');

		var segs = [];
		var curr;
		$.each(letters, function(i){
			
			curr = {
					letter: this,
					data:[]
			};	
			$.each(arr, function() {
				if((!zh[i-1] || zh[i-1].localeCompare(this) <= 0) && this.localeCompare(zh[i]) == -1) {				
					curr.data.push(this);
				}
			});
			if(empty || curr.data.length) {
				segs.push(curr);
				curr.data.sort(function(a,b){
					return a.localeCompare(b);
				});
			}
		});
		return segs;
		}
		//console.log(JSON.stringify(pySegSort(["我","不","懂","爱","啊","按","已","呀","选","县"])));
		icon.onclick=search;
		searchBox[0].onkeyup=search;
}
</script>
</body>
</html>