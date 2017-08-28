import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class appDetail2 extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public appDetail2() {
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
	
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String fileName="";
		String WordName="";
		String userEmail=(String)request.getSession().getAttribute("userEmail");
		String appid =  (String)request.getSession().getAttribute("cID");
		String cols="";
		String values="";
		 myjavabean appDesDBO=new myjavabean();
		 String url=appDesDBO.url(appid);
		 if("0".equals(url)){
			 System.out.println("error");
		 }else{
			 url=url.replace("_","\\");
			 System.out.println(url);
			 
		 }
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
                    
//                    System.out.println(name + ": " + value);  
                    cols=cols+name+",";
                    values = values+value+",";
                      
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
                        
//                        fileName= uuid +"_"+fileName;
                        java.io.InputStream in = item.getInputStream();  
                        byte[] buffer = new byte[1024];  
                        int len = 0;  
                        String savePath = this.getServletContext().getRealPath("\\"); 
                        fileName = savePath +url+"\\"+ WordName;//文件最终上传的位置  
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
            request.getSession().setAttribute("fileRoute", fileName);
            Date time = new Date(System.currentTimeMillis());
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String current = sdf.format(time);
		    String payState="0";
		    String price="0";
		     String [] arr=cols.split(",");
		     String [] arr2=values.split(",");
		     String sql1="";
		     String message2="";
		     for(int i=0;i<arr.length;i++){
		    	 sql1="update app_information set "+arr[i]+"="+"\'"+arr2[i]+"\'"+" ,gmt_modified='"+current+"'"+" ,image1_url='"+WordName+"'"+" where id='"+appid+"'";
		    	 message2 =appDesDBO.appDestail(sql1);
		     }
			  appDesDBO.close();
			  
			  if("0".equals(message2)){
				  System.out.println("添加 失败");
				  response.sendRedirect("applicationSetting.jsp");
			  }else{
				  System.out.println("添加成功");
				  response.sendRedirect("appSetting.jsp");
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
