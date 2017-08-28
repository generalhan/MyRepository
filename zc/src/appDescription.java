import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.bcel.classfile.Constant;


public class appDescription extends HttpServlet {


  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	  	
    	request.setCharacterEncoding("utf-8");  
		response.setCharacterEncoding("utf-8");  
		
		
	
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String fileName="";
		String WordName="";
		String userEmail=(String)request.getSession().getAttribute("userEmail");
		String num =  (String)request.getSession().getAttribute("num");
		String [] Array=num.split(",");
		String appid =  (String)request.getSession().getAttribute("appID");
		String cols="";
		String values="";
		String documentationName="";//说明文档的文件名
		 myjavabean appDesDBO=new myjavabean();
		  String allInsert ="";
		  String userOrderInsert ="";	
		  String url="";
		  String savePath="";
		  
//        生成订单编号
        Date time = new Date(System.currentTimeMillis());
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String current = sdf.format(time);
	    String p2=current.replaceAll(":", "");
	    String p3=p2.replaceAll("-", "");
	    p3=p3.replaceAll(" ", "");
	    String orderNum=p3+appid;
	    String payState="0";
	    String price="0";
	    
	    
	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");  
        String ymd = sdf1.format(time); 
        
        url=appDesDBO.url(appid);
        savePath = this.getServletContext().getRealPath("\\"); 
        url=url.replace("_", "\\");
	   
	    String apkName=(String)request.getSession().getAttribute("apkName");
	    String oldPath=savePath+url+"\\"+apkName;
	    String newPath=this.getServletContext().getRealPath("/upload/"+ymd+"/"+orderNum+"/");
	    String orderNumPath=newPath;
	    File uploadDir = new File(newPath);  
        if (!uploadDir.exists()) {  
            System.out.println("上传目录不存在。"); 
            uploadDir.mkdirs();          
        }
        newPath=newPath+"\\"+apkName;
	    int bytesum = 0; 
        int byteread = 0; 
        File oldfile = new File(oldPath); 
        if (oldfile.exists()) { //文件存在时 
           InputStream inStream = new FileInputStream(oldPath); //读入原文件 
           FileOutputStream fs = new FileOutputStream(newPath); 
           byte[] buffer = new byte[1444]; 
           int length; 
           while ( (byteread = inStream.read(buffer)) != -1) { 
               bytesum += byteread; //字节数 文件大小 
               System.out.println(bytesum); 
               fs.write(buffer, 0, byteread); 
           } 
           inStream.close(); 
        }else{
        	System.out.println("文件不存在");
        }
	    
	    
		  
		  
        //1、创建一个DiskFileItemFactory工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2、创建一个文件上传解析器  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //解决上传文件名的中文乱码  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 1024*1000);//设置内存的临界值为500K  
        File linshi = new File("E:\\linshi");//当超过500K的时候，存到一个临时文件夹中  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 1000);//设置上传的文件总的大小不能超过1G  
        try {  
            // 1. 得到 FileItem 的集合 items  
            List<FileItem> /* FileItem */items = upload.parseRequest(request);  
  
            // 2. 遍历 items:  
            for (FileItem item : items) {  
                // 若是一个一般的表单域, 打印信息  
                if (item.isFormField()) {  
                    String name = item.getFieldName();  
                    String value = item.getString("utf-8");  
                    
//                    System.out.println(name + ": " + value);  
                    cols=cols+name+",";
                    values = values+"'"+value+"'"+",";
                      
                }  
                // 若是文件域则把文件保存到 e:\\files 目录下.  
                else {  
                     WordName = item.getName();
                     WordName = WordName.substring(WordName.lastIndexOf("\\")+1);
                     if(WordName==null||"".equals(WordName)){
                         System.out.print("没上传文档");
                     }else{                                           
                    	long sizeInBytes = item.getSize();  
                        System.out.println(WordName);  
                        System.out.println(sizeInBytes);  
                       
                        //fileName= uuid +"_"+WordName;
                        documentationName=WordName;
                        java.io.InputStream in = item.getInputStream();  
                        byte[] buffer = new byte[1024];  
                        int len = 0;  
                        
                        fileName = orderNumPath +"\\" +WordName;//文件最终上传的位置  
                        System.out.println(fileName);  
                        OutputStream out = new FileOutputStream(fileName);  
      
                        while ((len = in.read(buffer)) != -1) {  
                            out.write(buffer, 0, len);  
                        }  
      
                        out.close();  
                        in.close();  
                    }

                }  
            }

		    
		    
		    
		    for(int i=0;i<Array.length;i++){

				  allInsert+="insert into user_test ("+cols+"id_type,id_app,id_user,order_num) VALUES ("+values+"'" +Array[i]+ "',"+appid+","+"(select id from user where email='"+userEmail+"')"+","+orderNum+")";  		 
				  allInsert+="&";	
			  }
			  userOrderInsert+="insert into user_order (gmt_create,app_id,user_id,price,state,order_num,documentation) values ('"+current+"',"+appid+","+"(select id from user where email='"+userEmail+"')"+","+price+","+payState+","+orderNum+",'"+documentationName+"' )";
			  allInsert=allInsert.substring(0,allInsert.length()-1);
			  String message =appDesDBO.appDescription(allInsert);	
			  String message1 =appDesDBO.appOrder(userOrderInsert);	

			  appDesDBO.close();
			  
			  if("0".equals(message)&&"0".equals(message1)){
				  response.sendRedirect("submit.jsp");
			  }else{
				  String b="出现异常";
				  request.setAttribute("a", b);
				  request.getRequestDispatcher("appDescription.jsp").forward(request, response);
			  }
			  request.getSession().removeAttribute("appID");
			  
      } catch (FileUploadException e) {  
            e.printStackTrace();  
        }
         
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        doGet(request, response);  
    }  

}
