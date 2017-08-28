import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.omg.CORBA.portable.InputStream;


public class uploadTest extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public uploadTest() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");  
			response.setCharacterEncoding("utf-8");  
		
			String userEmail=(String)request.getSession().getAttribute("userEmail");
			String num =  (String)request.getSession().getAttribute("num");
			String [] Array=num.split(",");
			String appid =  (String)request.getSession().getAttribute("appID");
			String cols="";
			String values="";
			 myjavabean appDesDBO=new myjavabean();
			  String allInsert ="";
			  
				
		 	
	        //1、创建一个DiskFileItemFactory工厂  
	        DiskFileItemFactory factory = new DiskFileItemFactory();  
	        //2、创建一个文件上传解析器  
	        ServletFileUpload upload = new ServletFileUpload(factory);  
	        //解决上传文件名的中文乱码  
	        upload.setHeaderEncoding("UTF-8");   
	        factory.setSizeThreshold(1024 * 500);//设置内存的临界值为500K  
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
	                    
	                    System.out.println(name + ": " + value);  
	                    cols=cols+name+",";
	                    values = values+"'"+value+"'"+",";
	                      
	                }  
	                // 若是文件域则把文件保存到 e:\\files 目录下.  
	                else {  
	                    String fileName = item.getName();  
	                    long sizeInBytes = item.getSize();  
	                    System.out.println(fileName);  
	                    System.out.println(sizeInBytes);  
	  
	                    java.io.InputStream in = item.getInputStream();  
	                    byte[] buffer = new byte[1024];  
	                    int len = 0;  
	                    String savePath = this.getServletContext().getRealPath("/WEB-INF/upload/"); 
	                    fileName = savePath + fileName;//文件最终上传的位置  
	                    System.out.println(fileName);  
	                    OutputStream out = new FileOutputStream(fileName);  
	  
	                    while ((len = in.read(buffer)) != -1) {  
	                        out.write(buffer, 0, len);  
	                    }  
	  
	                    out.close();  
	                    in.close();  
	                }  
	            }
	            for(int i=0;i<Array.length;i++){
					  allInsert+="insert into user_test ("+cols+"id_type,id_app,id_user) VALUES ("+values+"'" +Array[i]+ "',"+"(SELECT id FROM app_information WHERE id ='"+appid+"' )"+","+"(select id from user where email='"+userEmail+"')"+")";  		 
					  allInsert+="-";
				  }
				  allInsert=allInsert.substring(0,allInsert.length()-1);
				  String message =appDesDBO.appDescription(allInsert);	
				  appDesDBO.close();
				  if("0".equals(message)){
					  response.sendRedirect("submit.jsp");
				  }else{
					  String b="出现异常";
					  request.setAttribute("a", b);
					  request.getRequestDispatcher("appDescription.jsp").forward(request, response);
				  }
	            
	  
	        } catch (FileUploadException e) {  
	            e.printStackTrace();  
	        }  
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
