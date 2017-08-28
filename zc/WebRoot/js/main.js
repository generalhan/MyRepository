function changeImg(){
    // 验证码组成库
    var arrays=new Array(
        '1','2','3','4','5','6','7','8','9','0',
        'a','b','c','d','e','f','g','h','i','j',
        'k','l','m','n','o','p','q','r','s','t',
        'u','v','w','x','y','z',
        'A','B','C','D','E','F','G','H','I','J',
        'K','L','M','N','O','P','Q','R','S','T',
        'U','V','W','X','Y','Z'
    );
    // 重新初始化验证码
    code ='';
    // 随机从数组中获取四个元素组成验证码
    for(var i = 0; i<4; i++){
        // 随机获取一个数组的下标
        var r = parseInt(Math.random()*arrays.length);
        code += arrays[r];
    }
    // 验证码写入span区域
    document.getElementById('code').innerHTML = code;

}
function getEmail(){
	var xmlHttp = new XMLHttpRequest();
	   xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var messageJson = xmlHttp.responseText;
					if(messageJson=='false'){
						document.getElementById('errorTips1').innerHTML="该用户还未注册";
					}else{
						console.log("fdaf");
					}
					
					
				}
			}
		};
		var url = "emailTest?email="+this.value;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
}
function check1(){
    var error;
    var reg5 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;//验证邮箱
    var emailInput=document.getElementById("emailInput").value;
    if(emailInput.toLowerCase()==""){
        error="邮箱不能为空";
        document.getElementById('errorTips1').innerHTML=error;
     
    }else if(!reg5.test(emailInput)){
	    	error="邮箱格式不正确";
			document.getElementById('errorTips1').innerHTML=error;
	    	
    
    }else{  
    	var xmlHttp = new XMLHttpRequest();
 	   xmlHttp.onreadystatechange = function() {
 			if (xmlHttp.readyState == 4) {
 				if (xmlHttp.status == 200) {
 					var messageJson = xmlHttp.responseText;
 					if(messageJson=='false'){
 						document.getElementById('errorTips1').innerHTML="该用户还未注册";
 					}else{
 						document.getElementById('errorTips1').innerHTML="";
 					}		 					
 				}
 			}
 		};
 		var url = "emailTest?email="+emailInput;
 		xmlHttp.open("GET", url, true);
 		xmlHttp.send(null);
			
    }
    
}
// 验证验证码
function check(){
    var error;
    var button=document.getElementById('forget-button');
    // 获取用户输入的验证码
    var codeInput = document.getElementById('codeInput').value;
    if(codeInput.toLowerCase() == code.toLowerCase()){
        document.getElementById('errorTips').innerHTML ="";
        button.style.backgroundColor="#018a78";
		button.removeAttribute("disabled");
        
    }else if(codeInput==""){
        error = '请输入验证码';
        document.getElementById('errorTips').innerHTML = error;
        button.style.backgroundColor="#aaa";
		button.setAttribute("disabled","disabled");
      
    }else{
    	error = '验证码错误，重新输入';
        document.getElementById('errorTips').innerHTML = error;
        button.style.backgroundColor="#aaa";
		button.setAttribute("disabled","disabled");
       
    }
}
function forgetButton(){
	 var button=document.getElementById('forget-button');
	document.getElementById('codeInput').onblur=function(){
    	if(check()==true&&check1()==true){
    		button.style.backgroundColor="#018a78";
    		button.removeAttribute("disabled");
    	}else{
    		button.style.backgroundColor="#aaa";
    		button.setAttribute("disabled","disabled");
    	}
    }
}
function registerCheck(){
    var email=document.getElementById("email"),
        emailAlert=document.getElementById("email-alert"),
        password=document.getElementById("password"),
        passwordCheck=document.getElementById("password-check"),
        submit1=document.getElementById("submit1"),
        phone=document.getElementById("phone"),
        phoneCheck=document.getElementById("phone-check"),
		service=document.getElementById("service"),
    	code=document.getElementById("code");
    var reg1=/[^\w]/g;  //搜索所有非字符
    var reg2=/[^\d]/g;     //表示所有非数字
    var reg3=/[^a-zA-Z]/g;//表示所有非字母
    var reg4=/^0?1[3|4|5|8][0-9]\d{8}$/;  //这个可以验证电话号码必须是11位，且要以13, 14, 15, 18这几个号段开头
    var reg5 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;//验证邮箱
	submit1.onclick=function(){
        if(!service.checked){
            layer.msg("请勾选服务协议",{icon: 5, anim: 6});
            return false;
        }
        if(code.value==""){
        	layer.msg("请输入验证码",{icon:5,anim:6});
        	return false;
        }
	}
    // 用户名验证
    email.onblur=function(){
        if(this.value==""){
            emailAlert.innerHTML="用户名不能为空";
            submit1.disabled=true;
        }else if(!reg5.test(this.value)) {
            emailAlert.innerHTML="邮箱格式不正确";
            submit1.disabled=true;
        } else{
            emailAlert.innerHTML="";
            submit1.disabled=false;
        }
    }
    // 密码验证
    password.onfocus=function(){
        passwordCheck.style.visibility="visible";
        passwordCheck.innerHTML="请输入6-18个字符的密码";

    }
    password.onblur=function(){
        if(reg1.test(this.value)){
            passwordCheck.innerHTML="输入中含有非字符";
            submit1.disabled=true;
        }else if(this.value==""){
            passwordCheck.innerHTML="密码不能为空";
            submit1.disabled=true;
        }else if(this.value.length<6||this.value.length>18){
        passwordCheck.innerHTML="请输入6-18个字符的密码";
        submit1.disabled=true;
        }else{
            passwordCheck.style.visibility="hidden";
            submit1.disabled=false;
        }
    }
    // 手机验证
    phone.onblur=function(){
        if(!reg4.test(this.value)){
            phoneCheck.style.visibility="visible";
            phoneCheck.innerHTML="手机号码格式不对";
            submit1.disabled=true;
        }else{
            phoneCheck.style.visibility="hidden";
            submit1.disabled=false;
        }
    }
//    if(!service.checked){
//        submit1.disabled=true;
//	}
}

//user页面弹出修改密码弹框
function modifyPwd(){
	var modifyPwd=document.getElementById("modify-pwd"),
		modifyMobile=document.getElementById("modify-mobile"),
		mark=document.getElementsByClassName("chen-mark"),
        chenModifyPwd=document.getElementsByClassName("chen-modify-pwd"),
        chenModifyMobile=document.getElementsByClassName("chen-modify-mobile"),
        currentPwd=document.getElementById("current-pwd"),
		newPwd=document.getElementById("new-pwd"),
        newPwdSure=document.getElementById("new-pwd-sure"),
        submit2=document.getElementById("submit2"),
        errortip=document.getElementById("errortip"),
		error1=document.getElementById("error1"),
        error2=document.getElementById("error2"),
        error3=document.getElementById("error3"),
		error4=document.getElementById("error4"),
        error5=document.getElementById("error5"),
        mobile=document.getElementById("mobile"),
        submit3=document.getElementById("submit3"),
        code=document.getElementById("code"),
        gg=document.getElementById("gg"),
        getCode=document.getElementById("getCode");
        gg=document.getElementById("gg");
		close=document.getElementById("close");
		errortip=document.getElementById("errortip");
    var reg=/^0?1[3|4|5|8][0-9]\d{8}$/g;//检测手机的格式
    var reg1=/[^\w]/g;  //搜索所有非字符

	modifyPwd.onclick=function(){
		error1.innerHTML="";
		error2.innerHTML="";
		error3.innerHTML="";
		errortip.innerHTML="";
		currentPwd.value="";
		newPwd.value="";
		newPwdSure.value="";
		mark[0].style.display="block";
		chenModifyPwd[0].style.display="block";
	}
	close.onclick=function(){
        mark[0].style.display="none";
        chenModifyPwd[0].style.display="none";
        chenModifyMobile[0].style.display="none";
        return false;
	}
    mark[0].onclick=function(){
        mark[0].style.display="none";
        chenModifyPwd[0].style.display="none";
        chenModifyMobile[0].style.display="none";
	}
    modifyMobile.onclick=function(){
        mark[0].style.display="block";
        chenModifyMobile[0].style.display="block";
        mobile.value=gg.innerHTML;
		getCode.setAttribute("phoneNum",gg.innerHTML);
    }
//	currentPwd.onblur=function(){
//		if(currentPwd.value.length==0){
//			error1.style.visibility="visible";
//            error1.innerHTML="密码不能为空";
//		}else{
//            error1.style.visibility="hidden";
//		}
//	}
    /*newPwd.onblur=function(){
        if(newPwd.value.length==0){
            error2.style.visibility="visible";
            error2.innerHTML="密码不能为空";
        }else if(reg1.test(this.value)){
            error2.style.visibility="visible";
            error2.innerHTML="输入中含有非字符";            
        }else if(this.value.length<6||this.value.length>18){
            error2.style.visibility="visible";
            error2.innerHTML="请输入6-18个字符的密码";
        }else if(newPwd.value==currentPwd.value){
            error2.style.visibility="visible";
            error2.innerHTML="新密码不能与当前密码相同";
        }else{
            error2.style.visibility="hidden";
        }
	}
    newPwdSure.onblur=function(){
        if(newPwdSure.value.length==0){
            error3.style.visibility="visible";
            error3.innerHTML="密码不能为空";
        }else if(newPwd.value!=newPwdSure.value){
            error3.style.visibility="visible";
            error3.innerHTML="密码不相同";
		}else{
            error3.style.visibility="hidden";
        }
	}*/
    submit2.onclick=function() {
        if (currentPwd.value.length == 0||newPwd.value.length == 0||newPwdSure.value.length == 0) {
            errortip.innerHTML = "密码不能为空";
            return false;
        }else if(currentPwd.value.length<6||currentPwd.value.length>18||newPwd.value.length <6||newPwd.value.length >18||newPwdSure.value.length<6||newPwdSure.value.length>18){
        	errortip.innerHTML = "请输入6-18个字符的密码";
            return false;
        }else if(newPwd.value!=newPwdSure.value){
        	errortip.innerHTML="两次输入的重置密码不相同";
        	return false;
        }
      
    }
    mobile.onblur=function(){
    	if(!reg.test(this.value)){
    		error4.innerHTML="请输入以13, 14, 15, 18这几个号段开头的号码";
    		error4.style.visibility="visible";
		}else{
    	    error4.style.visibility="hidden";
        }
	}
    submit3.onclick=function(){
        if(!reg.test(mobile.value)){
            error4.innerHTML="请输入以13, 14, 15, 18这几个号段开头的号码";
            return false;
        }
        if(code.value.length==0){
            error5.innerHTML="请输入正确的验证码";
            error5.style.visibility="visible";
            return false;
        }
    }
}
// forget页面和index页面根据不同页面来设置font-size值
function fontSize(doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function () {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            if(clientWidth>=640){
                docEl.style.fontSize = '100px';
            }else{
                docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
            }
        };

    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
}
function login(){
	var prompt = document.getElementById('prompt');
	var loginEmail = document.getElementById('login-email');
	var loginPassword = document.getElementById('login-password');
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	var btn = document.getElementById('loginBtn');
	var a="";
	var b="";
	loginEmail.onblur=function(){
		if(loginEmail.value!=""){
			if(reg.test(loginEmail.value)){
				prompt.innerHTML="";
				a=true;
			}else{
				prompt.innerHTML="邮箱格式错误";
			}
		}else{
			prompt.innerHTML="账号不能为空";
		}
	}
	loginPassword.onblur=function(){
		if(loginPassword.value=="")		
			prompt.innerHTML="密码不能为空";
	}
	
}
function messageManagerment(){
	var tbody=document.getElementsByTagName('tbody')[0];
	var tr=tbody.getElementsByTagName('tr');
	for(var i=0;i<tr.length;i++){			
		if(tr[i].getElementsByTagName('td')[0].getElementsByTagName('i').length>0){
			continue;
		}else{
			tr[i].getElementsByTagName('td')[0].style.paddingLeft=20+"px";
		}
	}
}
// createTest.jsp页面
function createTest(){
    var oDiv=document.getElementsByClassName("list");
    var oPic=document.getElementsByClassName("pic");
    var oList=document.getElementById("list");
    var oLi=oList.getElementsByTagName("li");
    var oNext=document.getElementById("next");
    var a=[];
    var b=0;
    for(var j=0;j<oDiv.length;j++){
        a.push(0);
    }
    for(var i=0;i<oDiv.length;i++){
        oDiv[i].onclick=function(i){
            return function(){
                if(a[i]>0){
                    oDiv[i].style.backgroundImage="url(images/test2.png)";
                    oDiv[i].style.backgroundPositionX="center";
                    oDiv[i].style.backgroundPositionY="top";
                    oPic[i].style.color="#000000";
                    oLi[i].removeAttribute('name');
                    a[i]=a[i]-1;
                }else{
                    oDiv[i].style.backgroundImage="url(images/test.png)";
                    oDiv[i].style.backgroundPositionX="center";
                    oDiv[i].style.backgroundPositionY="top";
                    oPic[i].style.color="#018a78";
                    oLi[i].setAttribute("name","select");
                    a[i]=a[i]+1;
                }

            }
        }(i)
    }
    oNext.onclick=function(event){
        for(var z=0;z<oDiv.length;z++){
            if(a[z]>0){
                b+=1;
            }
        }
        if(b==0){
            layer.tips('您还没有选择测试类型', '#next', {
                tips: [1, '#0FA6D8'] //还可配置颜色
            });
            if(event.preventDefault){
                event.stopPropagation();
                event.preventDefault();
            }else{
                event.cancelBubble=true;
                event.returnValue=false;
            }
        }else{
            var Attr="UploadServlet?";
            var num="";
            for(var i=0;i<oLi.length;i++){
                if(oLi[i].getAttribute("name")=="select"){
                    num=num+i+",";
                }
            }
            num=num.substring(0, num.length-1);
            Attr+="id"+"="+num;
            oNext.setAttribute("href",Attr);
            b=0;
        }
    }
}
function a(num){
	
	var flag;
	var oList=document.getElementById("list");
	var oLi=oList.getElementsByTagName("div");
	var logoStr="";
	var text="";
	var span="";
	var last="";
	if(num==0){
		return false;
	}else if(oLi[num].getAttribute("title")=="select"){
		span=oLi[num].getElementsByTagName("span");
		last=span[span.length-1];
		if(span.length==5){
			oLi[num].removeChild(last);
		}
		oLi[num].style.backgroundColor="#fff";
		oLi[num].setAttribute("title","");
		return false;
	}
		for(var i=0;i<oLi.length;i++){
			if(i==num){
				oLi[i].style.backgroundColor="#018a78";
				oLi[i].setAttribute("title","select");
				logoStr="<span style='margin-left: 30px;  width: auto;'><i class='fa fa-check fa-2x'></i></span>";					
				oLi[i].innerHTML+=logoStr;
			}else{
				span=oLi[i].getElementsByTagName("span");
				last=span[span.length-1];
				if(span.length==5){
					oLi[i].removeChild(last);
				}
				oLi[i].style.backgroundColor="#fff";
				oLi[i].setAttribute("title","");
			}
		}
	
}

function getAppList(){
	var xmlHttp = new XMLHttpRequest();
	   var data;
	  
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
						
					}else{
						console.log(data);
						var str="<div class='item'><span><i class='fa fa-android fa-lg'></i>应用名称</span>";
							str+="<span>包名</span><span>版本号</span><span>时间</span></div>"
						var oList=document.getElementById("list");
						var oLi=oList.getElementsByTagName("div");
						for(var i=0;i<data.length;i++){
							if(data[i].name.indexOf("apk")>=0){
								str+="<div class='item'><span id='"+data[i].ID+"'><i class='fa fa-android fa-lg'></i>";
							}else{
								str+="<div class='item'><span id='"+data[i].ID+"'><i class='fa fa-apple fa-lg'></i>";
							}							
							str+=data[i].name+"</span><span title="+data[i].size+">"+data[i].packName+"</span><span>"+data[i].version+"</span><span>";
							str+=data[i].time+"</span></div>";
							
						}
						oList.innerHTML=str;
						console.log(str);
						for(var i=0;i<oLi.length;i++){
							
							oLi[i].onclick=function(i){
								return function(){
									a(i);
								
							}}(i);
						}
						
						//document.getElementById("messageAjax").innerHTML=data.length;
//						var ul=document.getElementById("messageAjaxContent");
//						var li=ul.getElementsByTagName("li");
//						for(var i=0;i<li.length;i++){
//							li[i].innerHTML="<a href='messageDetail?message_id="+data[i].message_id+"&state="+data[i].state+"'>"+data[i].title+"</a>";
//							
//						}
					}
				}
			}
		};
		var url = "showAppList";
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
}
// uploadApp页面
function upload(){
    var xfile=document.getElementById("xfile");
    var name=document.getElementById("name");
    var pre=document.getElementById("pre");
    var next=document.getElementById("next");
    var status=document.getElementsByClassName("upload-status")[0];
    var statusspan=document.getElementsByClassName("upload-status-span")[0];
    var ts=document.getElementsByClassName("upload-ts")[0];
    var oP=ts.getElementsByTagName("p")[0];
    var topLoader=document.getElementById("topLoader");
    var appSubmit=document.getElementById("appSubmit");
    var oList=document.getElementById("list");
	var oLi=oList.getElementsByTagName("div");
	var img=document.getElementById("img");
    appSubmit.onclick=function(){
        if(name.value==""){
            layer.tips('您还没有上传安装包', '#appSubmit', {
                tips: [1, '#0FA6D8'] //还可配置颜色
            });
            return false;
        }else{
        	//setTimeout(getAppList,6000);
        	statusspan.innerHTML="应用上传中，请不要关闭浏览器";
        	img.innerHTML="<img style='max-width:100%;' src='images/timg.gif'>";
        }
    }
    xfile.onchange=function () {
        var arr;
        var pakName;
        pakName=this.value;
        img.innerHTML="";
        //将选取的文件包只保留包名，把路径给截取掉
        for(var i=0;i<pakName.length;i++){
            if(pakName[i]=="\\"){
                var k=0;
                k=i;
            }
        }
        pakName=pakName.substring(k+1,pakName.length);//获得包名
        arr=pakName.split(".");
        //每次更新安装包的时候先将之前的进度条清除掉
        $("#topLoader").remove();
        $("#appSubmit").removeAttr("name");
        if(arr[arr.length-1]=="apk"||arr[arr.length-1]=="ipa"){
        	if(arr[0].indexOf('_')>=0){
        		oP.innerHTML = "安装包名字带有'_'，请重新选择";
                oP.style.color="red";
        	}else{
        		$("#appSubmit").click(function() {
                    $("#appSubmit").attr("name","cl");
        	    });
        		statusspan.innerHTML="点击提交按钮上传应用";
	            //创建标签的作用是放环形进度条的
	            var newLabel=$("<div></div>");
	            newLabel.attr("id","topLoader");
	            $(".upload-status span:nth-of-type(1)").after(newLabel);
	            name.value = pakName;
	            status.style.display="block";
	//            statusspan.style.display="none";
	            ts.style.display="none";
	          
	           
	          
        	}
        }else{
            oP.innerHTML = "安装包格式有误，请重新选择。";
            oP.style.color="red";
        }
    }
    next.onclick=function(){ 	
    	var oList=document.getElementById("list");
		var oLi=oList.getElementsByTagName("div");
				var Attr="test1?";
				var flag=0;
				for(var i=0;i<oLi.length;i++){
					if(oLi[i].getAttribute("title")=="select"){
						flag=1;
						break;
					}
				}
				if(flag==1){
					for(var i=0;i<oLi.length;i++){									
						if(oLi[i].getAttribute("title")=="select"){
							var name=oLi[i].getElementsByTagName("span")[0];
							Attr=Attr+"realFileName"+"="+name.getAttribute("id")+"&apkName="+name.textContent;
							next.setAttribute("href",Attr);
							break;
						}
					}
				}else{
					if(appSubmit.getAttribute("name")!="cl"){
			            layer.tips('您还没有上传或提交安装包', '#next', {
			                tips: [1, '#0FA6D8'] //还可配置颜色
			            });
			            if(event.preventDefault){
			                event.stopPropagation();
			                event.preventDefault();
			            }else{
			                event.cancelBubble=true;
			                event.returnValue=false;
			            }
			        }
				}
				
    }
}
function descript() {
    var word=document.getElementById("word");
    var upFile=document.getElementById("upFile");
    var fireName=document.getElementById("fireName");
    word.onchange=function(){
        var arr;
        var pakName;
        pakName=this.value;
        //将选取的文件包只保留包名，把路径给截取掉
        for(var i=0;i<pakName.length;i++){
            if(pakName[i]=="\\"){
                var k=0;
                k=i;
            }
        }
        pakName=pakName.substring(k+1,pakName.length);
        fireName.innerHTML="您选择的文件是："+pakName;
    }
}
//获得手机验证码
function getCode(){
	var b=document.getElementsByClassName("chen-code")[0]; 
	var reg4=/^0?1[3|4|5|8][0-9]\d{8}$/;  //这个可以验证电话号码必须是11位，且要以13, 14, 15, 18这几个号段开头
	var oPhone=document.getElementById("phone");
	var mask=document.getElementById("mask");
	var code=document.getElementById("code");
	var codeCheck1=document.getElementById("code-check1");
	var codeCheck2=document.getElementById("code-check2");
	var submit1=document.getElementById("submit1");
	var jiaobin=document.getElementById("jiaobin");
	var second=60;
	var interval=null;
	b.onclick=po;
		function po(){
			if(!reg4.test(oPhone.value)){
				document.getElementById("phone-check").style.visibility="visible";
				document.getElementById("phone-check").innerHTML="手机号码格式不对";
			}else{
//				$(".chen-code").attr("dj","yes");
				var xmlHttp = new XMLHttpRequest();
				   xmlHttp.onreadystatechange = function() {
						if (xmlHttp.readyState == 4) {
							if (xmlHttp.status == 200) {
								var messageJson = xmlHttp.responseText;
								if (messageJson=="1") {
									mask.style.display="block";
									oPhone.setAttribute("readonly",true);
									oPhone.style.cursor="default";
									$(".chen-code").attr("dj","yes");
									interval=setInterval(time,1000);
								}else if(messageJson=="0"){
									document.getElementById("phone-check").style.visibility="visible";
									document.getElementById("phone-check").innerHTML="手机号已被注册过";
								}else if(messageJson=="3"){
									document.getElementById("phone-check").style.visibility="visible";
									document.getElementById("phone-check").innerHTML="获取验证码频率太高了";
								}else{
									document.getElementById("phone-check").style.visibility="visible";
									document.getElementById("phone-check").innerHTML="系统繁忙";
								}
							}
						}
					};
					var url = "phoneCheck?phoneNum="+oPhone.value;
					xmlHttp.open("GET", url, true);
					xmlHttp.send();
		}
		}
//		获取验证码显示倒计时
		function time(){
			 second--;
			 b.innerHTML="重新获取（"+second+"s)";
			 if(second==0){			 
				 mask.style.display="none";
				 oPhone.removeAttribute("readonly");
				 oPhone.style.cursor="default";			 
				 clearInterval(interval);
				 second=60;
				 b.innerHTML="重新获取";
			 }
		}
////		验证码失效时间
//		function time2(){
//			second2--;
//			if(second2==0){
//				clearInterval(interval2);
//				$(".chen-code").removeAttr("dj");
//				submit1.disabled=true;
//			}
//		}
		code.onkeyup=function(){
			if(b.getAttribute("dj")!="yes"){
				codeCheck1.style.display="block";
				codeCheck2.style.display="none";
				submit1.disabled=true;
			}else{
				var con="codeCon="+code.value;
				var xmlHttp = new XMLHttpRequest();
				xmlHttp.onreadystatechange = function() {
					if (xmlHttp.readyState == 4) {
						if (xmlHttp.status == 200) {
							var messageJson = xmlHttp.responseText;
							if(messageJson=="1"){
								codeCheck1.style.display="none";
								codeCheck2.style.display="block";
								submit1.disabled=false;
							}else{
								codeCheck1.style.display="block";
								codeCheck2.style.display="none";
								submit1.disabled=true;
							}
						}
					}
				}
				
				var url = "phoneCheck";
				xmlHttp.open("POST", url, true);
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
				xmlHttp.send(con);
			}
				
			}
				
		
}
function messageAlert(){
	   var xmlHttp = new XMLHttpRequest();
	   var data;
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
						document.getElementById("messageAjax").style.display="none";
						document.getElementsByClassName("message-center")[0].style.display="none";
					}else{
						document.getElementById("messageAjax").innerHTML=data.length;
						var ul=document.getElementById("messageAjaxContent");
						if(data.length>2){
							for(var i=0;i<2;i++){
								var oLi=document.createElement("li");
								ul.appendChild(oLi);
								oLi.innerHTML="<a href='messageDetail?message_id="+data[i].message_id+"&state="+data[i].state+"'>"+data[i].title+"</a>";
							}
							
						}else{
							for(var i=0;i<data.length;i++){
								var oLi=document.createElement("li");
								ul.appendChild(oLi);
								oLi.innerHTML="<a href='messageDetail?message_id="+data[i].message_id+"&state="+data[i].state+"'>"+data[i].title+"</a>";
							}
						}
					}
				}
			}
		};
		var url = "messageAjax";
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);

	}
/*应用详情页面*/
function appDetail(){
	var files=document.getElementById("files");
    var fileInfo=document.getElementById("fileInfo");
    var pic=document.getElementById("pic");
    var info=document.getElementById("info");
    var save=document.getElementById("save");
    var appName=document.getElementById("appName");
    var appName2=document.getElementById("appName2");
    var k;
    files.onchange=function(){
    	save.disabled="";
    	var len=this.value;
    	if(len!=""){
        	
    		for(var i=0;i<len.length;i++){
        		if(len[i]=="\\"){
        			k=i;	
        		}
        	}
        	var realFile=len.substring(k+1,len.length);
        	for(var i=realFile.length-1;i>0;i--){
        		if(realFile[i]=="\."){
        			var p=realFile.substring(i+1,realFile.length);
        			if(p=="jpg"||p=="png"||p=="jpeg"){
        				fileInfo.style.display="inline-block";
        	        	info.innerHTML="您上传的文件是："+realFile;
        	        	save.disabled="";
        	        	break;
        			}
        		}else{
        			fileInfo.style.display="inline-block";
    	        	info.innerHTML="您上传的文件格式有误";
    	        	save.disabled="true";
        		}
        	}
        	
    	}else{
    		fileInfo.style.display="inline-block";
        	info.innerHTML="您还未选择图片";
    	}
    	
    	
    }
    var icon=document.getElementById("icon");
    var showPic=document.getElementById("showPic");
    icon.onclick=function(e){
    	var img=showPic.getElementsByTagName("img")[0];
    	files.value="";
    	fileInfo.style.display="none";
    	showPic.removeChild(img);
    }
    save.onclick=function(){
    	
    	if(appName.value==""||appName2.value==""){
    		layer.tips('请填写空白的字段','#save',{
				tips:[1,'#0FA6D8']
			});
    		save.disabled="true";
    	}
    }
    appName.onkeyup=function(){
    	save.disabled="";
    }
    appName2.onkeyup=function(){
    	save.disabled="";
    }
}
