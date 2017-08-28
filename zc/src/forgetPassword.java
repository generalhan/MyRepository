import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
 
public class forgetPassword extends HttpServlet{
	
	public void doGet(HttpServletRequest request,
            HttpServletResponse response)
    throws ServletException, IOException{
		doPost(request,response);
	}
	
  public void doPost(HttpServletRequest request,HttpServletResponse response)
  throws ServletException, IOException{
//    所有候选组成验证码的字符，可以用中文
      String Ajax="0";
      if(request.getParameter("Ajax")!=null){
    	  Ajax=request.getParameter("Ajax");
      }
    	  
	  String userEmail=request.getParameter("emailLogin");	
	  String sql="";
	 
		  sql="select id from user where email='"+userEmail+"'";
		  myjavabean search = new myjavabean();
		  String message1 = search.querySingle(sql);
		  search.close();
		  if("0".equals(message1)){
			  String myEmailAccount = "zc@expdatacloud.com";
			  String myEmailPassword = "abcABC123";
			  String myEmailSMTPHost = "smtp.mxhichina.com";
			  String receiveMailAccount = userEmail;
			  String content="";
			  String sql1="";
			  String verificationCode = "";
			  String[] verificationCodeArrary={"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
			             "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
			             "A","B","C","D","E","F","G","H","I","J", "K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
			             };
		      Random random = new Random();
		      //此处是生成验证码的核心了，利用一定范围内的随机数做为验证码数组的下标，循环组成我们需要长度的验证码，做为页面输入验证、邮件、短信验证码验证都行
		      for(int i=0;i<6;i++){
		    	  verificationCode += verificationCodeArrary[random.nextInt(verificationCodeArrary.length)];
		      }
			  
			  
			  sql1="update user set VerificationCode='"+verificationCode+"' where email='"+userEmail+"'";
			  myjavabean mytest3=new myjavabean();		
			  String updatemessage=mytest3.updateUser(sql1);
			  mytest3.close();
		 
			  content="要重设您的众测平台账户"+userEmail+"的密码，请<a href='http://192.168.1.231:8080/zc/resetPassword?email="+userEmail+"&verificationCode="+verificationCode+"'>点击链接重置密码</a><br>";
			  content+="如果无效，请点击<a href='http://192.168.1.231:8080/zc/forgetPassword?emailLogin="+userEmail+"'>链接</a>重新发送";
			  
			  Properties props = new Properties();                    // 参数配置
		      props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
		      props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
		      props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
		      Session session = Session.getDefaultInstance(props);
		      session.setDebug(true);                
		      try{
		         // 创建默认的 MimeMessage 对象
		         MimeMessage message = new MimeMessage(session);

		    	  message.setFrom(new InternetAddress(myEmailAccount));

		          // 3. To: 收件人（可以增加多个收件人、抄送、密送）
		          message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMailAccount));

		          // 4. Subject: 邮件主题
		          message.setSubject("众测平台  密码帮助");

		          // 5. Content: 邮件正文（可以使用html标签）
		          message.setContent(content, "text/html;charset=UTF-8");

		          // 6. 设置发件时间
		          message.setSentDate(new Date());

		          // 7. 保存设置
		          message.saveChanges();
		          Transport transport = session.getTransport();
		          transport.connect(myEmailAccount, myEmailPassword);

		          // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
		          transport.sendMessage(message, message.getAllRecipients());

		          // 7. 关闭连接
		          transport.close();
		          request.setAttribute("email", userEmail);
		          if(Ajax.equals("1")){
		        	  response.getWriter().print("true");
		          }else{
		        	  request.getRequestDispatcher("forget2.jsp").forward(request, response);  
		          }
		      	  
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
		  }else{
			  request.setAttribute("errorMess", "false");
			  request.getRequestDispatcher("forget1.jsp").forward(request, response);
		  }
	 	  
	  
	  
   }
} 