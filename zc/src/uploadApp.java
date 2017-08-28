import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.io.OutputStream;
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



public class uploadApp extends HttpServlet {

	
    protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		   	
    	request.setCharacterEncoding("utf-8");  
		response.setCharacterEncoding("utf-8");  
		String uuid = UUID.randomUUID().toString().replace("-", "");	
    	//1、创建一个DiskFileItemFactory工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2、创建一个文件上传解析器  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //解决上传文件名的中文乱码  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 1024 *1000);//设置内存的临界值为500K  
        File linshi = new File(this.getServletContext().getRealPath("/linshi/"));//当超过500K的时候，存到一个临时文件夹中  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 1000);//设置上传的文件总的大小不能超过1G  
        String kind="";
        String fileName="";
        String WordName="";
        String packageName="";
        String versionName="";
        String versionCode="";
        String delPath="";
        int formDataLength=0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");  
        String ymd = sdf.format(new Date()); 
        String fileurl="";
        String savePath =this.getServletContext().getRealPath("/upload/"+ymd+"/"+uuid+"/");
        String tempPath=this.getServletContext().getRealPath("/lishi/");
        File uploadDir = new File(savePath);  
        if (!uploadDir.exists()) {  
            System.out.println("上传目录不存在。"); 
            uploadDir.mkdirs();          
        }
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
                    
                }  
                // 若是文件域则把文件保存到 e:\\files 目录下.  
                else {  
                     WordName = item.getName();
                     WordName = WordName.substring(WordName.lastIndexOf("\\")+1);
                     if(WordName==null||WordName==""){
                         System.out.print("没上传文档");
                     }else{                                           
                    	long sizeInBytes = item.getSize();  
                    	formDataLength =(int) sizeInBytes;                       
                        kind = WordName.substring(WordName.lastIndexOf(".")+1);
                        //fileName= uuid+"_"+ WordName;
                        java.io.InputStream in = item.getInputStream(); 
                        java.io.InputStream in1 = item.getInputStream(); 
                        byte[] buffer = new byte[1024];  
                        int len = 0;      
                        savePath=savePath+"\\"+WordName;
                        tempPath=tempPath+"\\"+WordName;
                        delPath=savePath;
                        OutputStream out = new FileOutputStream(tempPath);  
                        File lishi1=new File(tempPath);
                        while ((len = in.read(buffer)) != -1) {  				//存放到lishi文件夹里，用于后面对比。
                            out.write(buffer, 0, len);  
                        } 
                        out.close();
                        in.close(); 
                        File uploadDir1 = new File(savePath);  
                        if (!uploadDir1.exists()) {  							//目录不存在，则目录里不存在相同文件名，直接写入存放
                            System.out.println("不存在相同。"); 
                            System.out.println(savePath);  
                            OutputStream out1 = new FileOutputStream(savePath);  
          
                            while ((len = in1.read(buffer)) != -1) {  
                                out1.write(buffer, 0, len);  
                            } 
                            out1.close();  
                            in1.close(); 
                        }else{
                        	System.out.println("存在相同");						//目录相同，则判断文件内容是否相同，相同则返回，否则再说。
                        	myjavabean dao=new myjavabean();
                        	boolean message=dao.isSameFile(tempPath, savePath);
                        	dao.close();
                        	if(message){
                        		System.out.println("相同");
                        		response.getWriter().write("<script>window.parent.getAppList(); window.parent.tishi(); </script>");
                        		return;
                        	}else{
                        		System.out.println("不相同");
                        		 OutputStream out1 = new FileOutputStream(savePath);  
                                 
                                 while ((len = in1.read(buffer)) != -1) {  
                                     out1.write(buffer, 0, len);  
                                 } 
                                 out1.close();  
                                 in1.close(); 
                        	}
                        }
                        lishi1.delete();
                    }


                }  
            }
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        } 
    	if("apk".equals(kind)){
    		String fileDir2=savePath;
    		//String fileDir2 =(String)this.getServletConfig().getServletContext().getRealPath("/upload/"+fileName);
    		System.out.println(fileDir2);
    		Map<String,Object> mapApk = ReadUtil.readAPK(fileDir2);
    		for (String key : mapApk.keySet()) {
    			if("error".equals(key)){
    				File del=new File(delPath);
    				del.delete();
    				response.getWriter().write("<script>window.parent.getAppList(); window.parent.tishi('shibai'); </script>");
    				return;
    			}
    			System.out.println(key + ":" + mapApk.get(key));
    			if("package".equals(key)){
    				packageName=(String) mapApk.get(key);
    			}else if("versionName".equals(key)){
        			versionName=(String) mapApk.get(key);       			
    			}
    			else if("versionCode".equals(key)){
    				versionCode=(String) mapApk.get(key);       			
    			}
    		}
    	}else if("ipa".equals(kind)){
    		String fileDir1=savePath;
    		//String fileDir1 =this.getServletConfig().getServletContext().getRealPath("/upload/"+fileName); 
    		Map<String,Object> mapIpa = ReadUtil.readIPA(fileDir1);
    		for (String key : mapIpa.keySet()) {
    			if("error".equals(key)){
    				File del=new File(delPath);
    				del.delete();
    				response.getWriter().write("<script>window.parent.getAppList(); window.parent.tishi('shibai'); </script>");
    				return;
    			}
    			System.out.println(key + ":" + mapIpa.get(key));
    			if("package".equals(key)){
    				packageName=(String) mapIpa.get(key);
    			}else if("versionName".equals(key)){
    				versionName=(String) mapIpa.get(key);       			
    			}
    			else if("versionCode".equals(key)){
    				versionCode=(String) mapIpa.get(key);       			
    			}
    		}
    	}else{
    		System.out.print("jiexi error");
    	}
    	
		
		versionName=versionName+" Build "+versionCode;
		savePath=(savePath.substring(savePath.indexOf("zc\\")+3,savePath.indexOf(WordName)-1)).replace("\\", "_");
    	String size=String.valueOf(Double.valueOf(formDataLength)/(1024*1024));
    	System.out.println(size);
    	size=size.substring(0,size.indexOf(".")+3);
    	System.out.println(size);
    	String email=(String)request.getSession().getAttribute("userEmail");
		myjavabean upAppDBO=new myjavabean();
		String message =upAppDBO.appUpload(WordName,savePath,email,kind,size,packageName,versionName);
		upAppDBO.close();
		if("0".equals(message)){
			System.out.print("server error");
		}else{	
			System.out.println(message);
			request.getSession().setAttribute("appID",message);	
			request.getSession().setAttribute("apkName",WordName);	
			response.getWriter().write("<script>window.parent.getAppList(); window.parent.done(); </script>");
		}
}
}

