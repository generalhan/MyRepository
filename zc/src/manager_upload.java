import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.zsl.cn.ReadUtil;


public class manager_upload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public manager_upload() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
		
	
    	//1、创建一个DiskFileItemFactory工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2、创建一个文件上传解析器  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //解决上传文件名的中文乱码  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 1024 * 1000);//设置内存的临界值为500K  
        File linshi = new File("E:\\linshi");//当超过500K的时候，存到一个临时文件夹中  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 1000);//设置上传的文件总的大小不能超过1G  
        
        int formDataLength=0;
        String WordName="";
        String urlfile="";
        String fileName="";
        String text="";
        String a="";  //app id  type id
        String arr1 [];
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
                    a=value;
                    
            		
                }  
                // 若是文件域则把文件保存到 e:\\files 目录下.  
                else {  
                     WordName = item.getName();
                     if(WordName==null||WordName==""){
                         System.out.print("没上传文档");
                     }else{                                           
                    	long sizeInBytes = item.getSize();  
                    	formDataLength =(int) sizeInBytes;
                        System.out.println(WordName);  
                        System.out.println(sizeInBytes);  
                        myjavabean appDesDBO=new myjavabean();
                        arr1=a.split(",");
               		 String url=appDesDBO.url(arr1[0].toString());
               		 if("0".equals(url)){
            			 System.out.println("error");
            		 }else{
            			 url=url.replace("_","\\");
            			 System.out.println(url);
            			 
            		 }
               		 text=arr1[2].substring(0,4).toString()+"\\"+arr1[2].substring(4,6).toString()+"\\"+arr1[2].substring(6,8).toString();
               		
                        java.io.InputStream in = item.getInputStream();  
                        byte[] buffer = new byte[1024];  
                        int len = 0;  
                        String savePath = this.getServletContext().getRealPath("\\upload");
                        savePath=savePath+"\\"+text+"\\"+arr1[2]+"\\";
                        System.out.println(savePath);
                        fileName="upload"+"\\"+text+"\\"+arr1[2];
                        System.out.println(fileName);
                        urlfile=savePath+WordName;
                        System.out.println(urlfile);
//                        fileName = savePath +"/" + WordName;//文件最终上传的位置  
                        System.out.println(savePath);  
                        File uploadDir = new File(savePath);  
                        if (!uploadDir.exists()) {  
                            System.out.println("上传目录不存在。"); 
                            uploadDir.mkdirs();          
                        }
                        
                        OutputStream out = new FileOutputStream(urlfile);  
      
                        while ((len = in.read(buffer)) != -1) {  
                            out.write(buffer, 0, len);  
                        }  
      
                        out.close();  
                        in.close();  
                    }


                }  
            }
            
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        } 
        
        fileName=fileName.replace("\\", "_");
		String arr [];
		arr=a.split(",");
		System.out.println(a);
		
        
        String sql="update user_test set file_url='"+fileName+"',state='2',file_name='"+WordName+"'  ";
        		sql+= "where id="+arr[0];
		myjavabean dao=new myjavabean();
		String message =dao.updateUser(sql);
		System.out.println(sql);
		dao.close();
		if("0".equals(message)){
			request.setAttribute("tip","ok");
			request.getRequestDispatcher("page/testResult.jsp").forward(request, response);
		}else{
			request.setAttribute("tip","error");
			request.getRequestDispatcher("page/testResult.jsp").forward(request, response);
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
