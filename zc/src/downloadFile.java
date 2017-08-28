import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zsl.cn.*;


public class downloadFile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public downloadFile() {
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
	 private static final long serialVersionUID = 1L;  
	   
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		
//		获得请求文件名
		String aFileName = request.getParameter("fileName"); 
		String state=request.getParameter("state");
		String appid=request.getParameter("id");
		String ordernum=request.getParameter("ordernum");
		String fileUrl=request.getParameter("fileUrl");
		
		
		myjavabean dao =new myjavabean();
		String url=dao.url(appid); 
		//String url1=dao.url1(appid,typeid);
		dao.close();
        url=url.replace("_", "\\");
        fileUrl=fileUrl.replace("_", "\\");
		String fileDir="";
//		获取目标文件的的绝对路径
		if("1".equals(state)){  //下载应用截图的绝对位置
			fileDir =this.getServletConfig().getServletContext().getRealPath("\\"+url+"\\"+aFileName); 
		}else if("2".equals(state)){ //下载安装包的绝对位置
			fileDir =this.getServletConfig().getServletContext().getRealPath("\\"+url+"\\"+aFileName);
		}else if("3".equals(state)){ //下载说明文档的绝对路径
			String text=ordernum.substring(0,4).toString()+"\\"+ordernum.substring(4,6).toString()+"\\"+ordernum.substring(6,8).toString();
			fileDir =this.getServletConfig().getServletContext().getRealPath("\\upload"+"\\"+text+"\\"+ordernum+"\\"+aFileName);
		}else if("4".equals(state)){
			fileDir =this.getServletConfig().getServletContext().getRealPath("\\"+fileUrl+"\\"+aFileName);
		}else{
			fileDir="";
		}
				
        String online = request.getParameter("online");  
        FileInputStream in = null;   
        ServletOutputStream out = null;   
        boolean isOnLine = online != null ? true : false ;  
        try {  
          
//             在线打开方式 
            if(isOnLine){   
                URL u = new URL("file:///"+fileDir);  
                response.setContentType(u.openConnection().getContentType());  
                response.setHeader("Content-Disposition", "inline; filename="+aFileName);     
             }  
            else{   
//            	纯下载方式
                response.setContentType("application/x-msdownload");   
                response.setHeader("Content-Disposition", "attachment; filename=" + aFileName);   
            }  
          
            in = new FileInputStream(fileDir);   
            out = response.getOutputStream();  
            out.flush();  
            int aRead = 0;  
            while ((aRead = in.read()) != -1 & in != null) {  
                out.write(aRead);  
             }  
            out.flush();  
              
        } catch (Throwable e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                in.close();  
                out.close();  
            } catch (Throwable e) {  
                e.printStackTrace();  
            }  
        }  
    }  
  
    
  
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        doGet(request, response);  
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
