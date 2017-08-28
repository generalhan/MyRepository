<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>文件上传</title>  
<script src="js/jquery.min.js" type="text/javascript"></script>  
<script type="text/javascript" src="js/jquery-form.js"></script>  
<script type="text/javascript">  
    function subimtBtn() {  
    	$("#img").attr("src","images/timg.gif");
        var form = $("form[name=fileForm]");  
        var options  = {    
            url:'${pageContext.request.contextPath}/pro',    
            type:'post',    
            success:function(data)    
            {    
            	 debugger;
                var jsondata = eval("("+data+")");  
                if(jsondata.error == "0"){  
                    var url = jsondata.url;  
                    alert(url);  
                    $("#img").attr("src","images/search.png");  
                }else{  
                    var message = jsondata.message;  
                    alert(message);
                    
                }  
            }    
        };    
        form.ajaxSubmit(options);  
        //$("#fileForm").submit();  
    }  
</script>  
</head>  
<body>  
            <div class="modal-body">  
                  
                <form action='${pageContext.servletContext.contextPath}/pro' enctype="multipart/form-data" method="post" id="fileForm" name="fileForm">  
                    <input type="file" name="filename">  
                </form>  
                  
            </div>  
  
            <div class="modal-footer">  
                <button class="btn btn-primary"  onclick="subimtBtn();">提交</button>  
            </div>  
  
    <div>  
     <img alt="img" src="" id="img">  
    </div>  
</body>  
</html>  
