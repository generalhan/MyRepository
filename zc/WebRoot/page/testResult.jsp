<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>测试结果查询</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/main.css">
</head>
<body>
<div class="test-result">
	<form class="searchDiv" action="testResult" method="get">
		<div>
			<input style="  float: left;  margin-right: 10px;" type="button"  name="btnAll" id='btnAll' value="显示所有">	
			<label for="searchOrder">订单编号</label>
			<div class="inputSearch">
				<input id="searchOrder"  type="text" name="orderNum">	
				<span class="errortip"></span>			
			</div>			
			
			<input type="button" name="btnstate" id='btnstate' value="修改状态">
			<input type="button"  name="btn" id='btn' value="检索">						
		</div>
	</form>
	<table  class="table">
		<thead>
			<tr id="flag" name="all">
				<td>订单编号</td>
				<td>应用名称</td>
				<td>服务名称</td>
				<td>交易时间</td>
				<td>测试状态</td>
				<td>测试结果报告</td>
			</tr>
		</thead>
		<tbody id="box">
			<tr>
				<td colspan="6">暂无数据</td>
			</tr>
		</tbody>
	</table>
	<ul id="pageBox"></ul>
	<%
	        		String tishi=(String)request.getAttribute("tip");
	        		if(tishi==null){
	        			tishi="";
	        		}else{	
	        			if(tishi=="ok"){
	        				out.println("<script>");
		        			out.println("alert('更新文档状态成功')");	           			
		        			out.println("</script>");
	        			}else if(tishi=="error"){
	        				out.println("<script>");
		        			out.println("alert('更新文档状态失败。')");	        			
		        			out.println("</script>");
	        			}else if(tishi=="null"){
	        				out.println("<script>");
		        			out.println("alert('收件人没填写')");	        			
		        			out.println("</script>");
	        			}
	        			
	        		}
					
	        	%>
</div>
</body>
<script type="text/javascript">

function identity(obj){
	obj.name="1"; //用来判断用户改变了哪条记录
}
function file(obj){
	
	var report=document.getElementById(obj.id);
	var form=document.getElementById("report-submit"+obj.id);
	console.log(obj.id+","+form);
      
        var pakName;
        var fileName=document.getElementById("fileName"+obj.id);
        console.log(fileName);
        if(obj.value==""||obj.value==null){
        	console.log("没有选择文件");
        	return false;
        }
        pakName=obj.value;
        //将选取的文件包只保留包名，把路径给截取掉
        for(var i=0;i<pakName.length;i++){
            if(pakName[i]=="\\"){
                var k=0;
                k=i;
            }
        }
        pakName=pakName.substring(k+1,pakName.length);//获得包名
        console.log(pakName);
    	fileName.textContent="稍等";
    	form.submit();
    	
	
}
function changeState(){
	var flag=document.getElementById("flag");
	var id=[],typeid=[],state=[];
	var tbody=document.getElementById("box");
	var tr=tbody.getElementsByTagName("tr");
	var select = tbody.getElementsByClassName("select");
	var page=document.getElementById("page").textContent;
	console.log("page:"+page);
	var test="";
	for(var i=0;i<select.length;i++){
		var td = tr[i].getElementsByTagName("td");
	
		if(select[i].getAttribute("name")){
			
			
			test=td[0].getAttribute("title");
			id.push(test);
			test=td[2].getAttribute("title");
			typeid.push(test);
			state.push(select[i].value);
			
		}
			
	}
	if(test==null||test==""){
		console.log("没有数据修改过,"+test);
		return false;
		
	}
	
	var s='[';
	for (var i=0;i<id.length;i++){
	  t=i==id.length-1?'':','
	  s +="{"+"'id':"+id[i]+","+"'typeid':'"+typeid[i]+"',"+"'state':'"+state[i]+"'}"+t
	}
	s+=']'
	var postData=eval(s);	
	postData=JSON.stringify(postData);
	console.log("postData :"+postData);
	var test="test="+postData;
	var xmlHttp = new XMLHttpRequest();
	
	   var data;
	   var temp;
	   
	   xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var messageJson = xmlHttp.responseText;
					if(messageJson=='true'){
						console.log("修改成功");
						alert("修改成功");
						if(flag.getAttribute("name")=="all"){
							getAppList(page,5);
						}else{
							splitPage(page,5);
						}
						
						console.log("完成修改执行的函数");
						
					}else{
						alert("修改失败");
					}
		
				}
	   		}
	   }
		var url = "${pageContext.request.contextPath}/testResult";
		
		xmlHttp.open("post", url, true);
		//xmlHttp.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		//xmlHttp.setRequestHeader('Content-Type', 'application/json;charset=utf-8'); 
		xmlHttp.send(test);
}
function getAppList(num,size){
	var xmlHttp = new XMLHttpRequest();
	   var dataTemp;
	   var temp;
	   var page=num?num:1;
	   var pageSize=size?size:5;
	   console.log("page-"+page+"typeof:"+typeof(page));
	   
	   
	   xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var messageJson = xmlHttp.responseText;
					if(messageJson=='false'){
						dataTemp=null;
					}else{
						var dataTemp=eval('('+messageJson+')');	
						
					}
				
					if (dataTemp==null) {
						console.log(dataTemp);
					}else{		
						console.log(dataTemp);
						//localStorage.clear();
						localStorage.allOrder=messageJson;
						var tbody = document.getElementById("box"); 
					    var tr=tbody.getElementsByTagName("tr");
					   // var demo=localStorage.getItem("allOrder");
					    var data=eval(messageJson);
					    console.log("data: "+data);
					 
					    var totalNums =  data.length; //总行数  
					    var totalPage = Math.ceil(totalNums / pageSize); //总页数 
					    var begin = (page - 1) * pageSize; //页起始位置(包括)  
					    var end = page * pageSize; //页结束位置(不包括)  
					    end  =  end  > totalNums  ?  totalNums  :  end;   
					 
					    //向tbody中写入数据   
					    var str="";
					    
					    for (var i = begin; i < end; i++) {  
					    	
							
								str+="<tr>";
								str+="<td title='"+data[i].id+"'>"+data[i].orderid+"</td>";
								str+="<td>"+data[i].appName+"</td>";
								str+="<td title='"+data[i].typeid+"'>"+data[i].reportName+"</td>";
								str+="<td>"+data[i].uploadTime+"</td>";
								str+="<td>";
								str+="<span class='statetext'>"+data[i].state+"</span>";
								str+="<select onchange='javascript:identity(this);' class='select' style='padding-bottom:3px; margin-right:5px;'>";
								if(data[i].state=="未测试"){
									str+="<option value='0'>未完成</option>";
									str+="<option value='1'>准备测试</option>";
									str+="<option value='2'>完成</option>";
								}else if(data[i].state=="准备测试"){
									str+="<option value='1'>准备测试</option>";
									str+="<option value='0'>未完成</option>";											
									str+="<option value='2'>完成</option>";
								}else if(data[i].state=="完成"){
									str+="<option value='2'>完成</option>";
									str+="<option value='0'>未完成</option>";
									str+="<option value='1'>准备测试</option>";											
								}else{
									console.log("..error");
								}
								str+="</select>";
								
								str+="</td>";
								str+="<td class='main-color'>";
								str+="<form id='report-submitreport"+i+"' action='${pageContext.request.contextPath}/manager_upload' method='post' enctype='multipart/form-data'>";
								if(data[i].wordName==""||data[i].wordName==null){
									str+="<label id='fileNamereport"+i+"' for='report"+i+"'>点击上传</label>";	
								}else{
									str+="<label id='fileNamereport"+i+"' for='report"+i+"'>"+data[i].wordName.substring(data[i].wordName.indexOf("_")+1)+"</label>";	
								}											
								str+="<input type='hidden' name='id' value='"+data[i].id+","+data[i].typeid+","+data[i].orderid+"'>";
								str+="<input type='file'  onchange='javascript:file(this);'  id='report"+i+"' class='report' name='report'>";							
								str+="</form>";
								str+="</td>";
								str+="</tr>";
						}
					   
					    tbody.innerHTML=str;
						var btnstate=document.getElementById("btnstate");
						var select=document.getElementsByClassName("select");								
						
						var statetext=document.getElementsByClassName("statetext");
						var flag = true;
						btnstate.onclick=function(){
							if(flag){
								for(var i=0;i<statetext.length;i++){
									statetext[i].style.display="none";
									select[i].style.display="inline-block";
									
								}
								btnstate.value="完成修改";
								flag = false;
							}else{
								for(var i=0;i<statetext.length;i++){
									statetext[i].style.display="inline-block";
									select[i].style.display="none";
								
								}
								btnstate.value="修改状态";
								flag = true;
								changeState();
							}	
						}  
						var pageBox=document.getElementById("pageBox");
						var pageBar="";
					    //生成分页工具条  
					    var pageBar  =  "<li>第<span id='page'>" + page +  "</span>页/共"  +  totalPage  +  "页"  +  "</li> ";  
					    if (page > 1) {  
					        pageBar  +=  "<li><a href='javascript:getAppList(" + 1 + ","  + pageSize + ");'>首页</a></li> ";   
					    } else {  
					        pageBar += "<li>首页</li> ";  
					    }  
					    if  (page  >  1)  {  
					        pageBar +=  "<li><a href='javascript:getAppList(" + (page - 1)  +  ","  + pageSize  + ");'>上一页</a></li> ";     
					    }   
					    else  {  
					        pageBar  += "上一页 ";  
					    }  
					    if (page < totalPage) {  
					        pageBar  +=  "<li><a href='javascript:getAppList(" + (parseInt(page) + 1) + ","  + pageSize  + ");'>下一页</a></li> ";     
					    }   
					    else  {  
					        pageBar  += "下一页";   
					    }     
					    if  (page  < totalPage) {  
					        pageBar  +=  "<li><a href='javascript:getAppList("  + (totalPage)  + ","  + pageSize + ");'>尾页</a></li> ";     
					    }   
					    else  {  
					        pageBar += "<li>尾页</li> ";     
					    }     
					    console.log("pageBar:"+pageBar);
					    pageBox.innerHTML = pageBar; 
					}
				}
				
			
		};
	   }
		var url = "${pageContext.request.contextPath}/testResult";
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
}	 
function splitPage(num, size) {  
	var value=document.getElementById("searchOrder").value;
	 if(value==""||value==null){
		 return false;
	 }
	var xmlHttp = new XMLHttpRequest();
	   var dataTemp;
	   var temp;
	   var data=[];
	   var page=num?num:1;
	   var pageSize=size?size:5;
	   console.log("page-"+page+"typeof:"+typeof(page));
	   
	   
	   xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var messageJson = xmlHttp.responseText;
					if(messageJson=='false'){
						dataTemp=null;
					}else{
						var dataTemp=eval('('+messageJson+')');	
						
					}
				
					if (dataTemp==null) {
						console.log(dataTemp);
					}else{		
						console.log(dataTemp);
						 
						
					  	for(var i=0;i<dataTemp.length;i++){
					  		if(value==dataTemp[i].orderid){
					  			data.push(dataTemp[i]);
					  		}
					  	}
						//localStorage.clear();
						localStorage.allOrder=messageJson;
						var tbody = document.getElementById("box"); 
					    var tr=tbody.getElementsByTagName("tr");
					   // var demo=localStorage.getItem("allOrder");
					    //var data=eval(messageJson);
					    console.log("data: "+data);
					 
					    var totalNums =  data.length; //总行数  
					    var totalPage = Math.ceil(totalNums / pageSize); //总页数 
					    var begin = (page - 1) * pageSize; //页起始位置(包括)  
					    var end = page * pageSize; //页结束位置(不包括)  
					    end  =  end  > totalNums  ?  totalNums  :  end;   
					 	
					    //向tbody中写入数据   
					    var str="";
					    for (var i = begin; i < end; i++) {  
					    	
					    	
								str+="<tr>";
								str+="<td title='"+data[i].id+"'>"+data[i].orderid+"</td>";
								str+="<td>"+data[i].appName+"</td>";
								str+="<td title='"+data[i].typeid+"'>"+data[i].reportName+"</td>";
								str+="<td>"+data[i].uploadTime+"</td>";
								str+="<td>";
								str+="<span class='statetext'>"+data[i].state+"</span>";
								str+="<select onchange='javascript:identity(this);' class='select' style='padding-bottom:3px; margin-right:5px;'>";
								if(data[i].state=="未测试"){
									str+="<option value='0'>未完成</option>";
									str+="<option value='1'>准备测试</option>";
									str+="<option value='2'>完成</option>";
								}else if(data[i].state=="准备测试"){
									str+="<option value='1'>准备测试</option>";
									str+="<option value='0'>未完成</option>";											
									str+="<option value='2'>完成</option>";
								}else if(data[i].state=="完成"){
									str+="<option value='2'>完成</option>";
									str+="<option value='0'>未完成</option>";
									str+="<option value='1'>准备测试</option>";											
								}else{
									console.log("..error");
								}
								str+="</select>";
								
								str+="</td>";
								str+="<td class='main-color'>";
								str+="<form id='report-submitreport"+i+"' action='${pageContext.request.contextPath}/manager_upload' method='post' enctype='multipart/form-data'>";
								if(data[i].wordName==""||data[i].wordName==null){
									str+="<label id='fileNamereport"+i+"' for='report"+i+"'>点击上传</label>";	
								}else{
									str+="<label id='fileNamereport"+i+"' for='report"+i+"'>"+data[i].wordName.substring(data[i].wordName.indexOf("_")+1)+"</label>";	
								}											
								str+="<input type='hidden' name='id' value='"+data[i].id+","+data[i].typeid+"'>";
								str+="<input type='file'  onchange='javascript:file(this);'  id='report"+i+"' class='report' name='report'>";							
								str+="</form>";
								str+="</td>";
								str+="</tr>";
							
								
						}
					    tbody.innerHTML=str;
						var btnstate=document.getElementById("btnstate");
						var select=document.getElementsByClassName("select");								
						
						var statetext=document.getElementsByClassName("statetext");
						var flag = true;
						btnstate.onclick=function(){
							if(flag){
								for(var i=0;i<statetext.length;i++){
									statetext[i].style.display="none";
									select[i].style.display="inline-block";
									
								}
								btnstate.value="完成修改";
								flag = false;
							}else{
								for(var i=0;i<statetext.length;i++){
									statetext[i].style.display="inline-block";
									select[i].style.display="none";
								
								}
								btnstate.value="修改状态";
								flag = true;
								changeState();
							}	
						}  
						var pageBox=document.getElementById("pageBox");
						var pageBar="";
					    //生成分页工具条  
					    var pageBar  =  "<li>第<span id='page'>" + page +  "</span>页/共"  +  totalPage  +  "页"  +  "</li> ";  
					    if (page > 1) {  
					        pageBar  +=  "<li><a href='javascript:splitPage(" + 1 + ","  + pageSize + ");'>首页</a></li> ";   
					    } else {  
					        pageBar += "<li>首页</li> ";  
					    }  
					    if  (page  >  1)  {  
					        pageBar +=  "<li><a href='javascript:splitPage(" + (page - 1)  +  ","  + pageSize  + ");'>上一页</a></li> ";     
					    }   
					    else  {  
					        pageBar  += "上一页 ";  
					    }  
					    if (page < totalPage) {  
					        pageBar  +=  "<li><a href='javascript:splitPage(" + (parseInt(page) + 1) + ","  + pageSize  + ");'>下一页</a></li> ";     
					    }   
					    else  {  
					        pageBar  += "下一页";   
					    }     
					    if  (page  < totalPage) {  
					        pageBar  +=  "<li><a href='javascript:splitPage("  + (totalPage)  + ","  + pageSize + ");'>尾页</a></li> ";     
					    }   
					    else  {  
					        pageBar += "<li>尾页</li> ";     
					    }     
					    console.log("pageBar:"+pageBar);
					    pageBox.innerHTML = pageBar; 
					}
				}
				
			
		};
	   }
		var url = "${pageContext.request.contextPath}/testResult";
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
   
}  
function searchOrder(){
	var flag=document.getElementById("flag");
	console.log("flag:"+flag);
	 var value=document.getElementById("searchOrder").value;
	 if(value==""||value==null){
		 return false;
	 }
	 flag.setAttribute("name",value);
	 console.log(value);
	 var demo=localStorage.getItem("allOrder");
	 var dataJson=eval(demo);
	 var data=[];
	 var tbody = document.getElementById("box"); 
	    var tr=tbody.getElementsByTagName("tr");
  	for(var i=0;i<dataJson.length;i++){
  		if(value==dataJson[i].orderid){
  			data.push(dataJson[i]);
  		}
  	}
  	localStorage.searchData=JSON.stringify(data);
  	splitPage(1,5);
  	console.log(data);
	   
}
window.onload=function(){	
	getAppList(1,5);
	var btnSearch=document.getElementById("btn");
	var btnAll=document.getElementById("btnAll");
	btnSearch.onclick=function(){
		var value=document.getElementById("searchOrder").value;
		var flag=document.getElementById("flag");
		 flag.setAttribute("name",value);
		splitPage(1,5);
	}
	btnAll.onclick=function(){
		var flag=document.getElementById("flag");
		 flag.setAttribute("name","all");
		getAppList(1,5);
	}
	
	//splitPage(1,5);
}
	


</script>
</html>