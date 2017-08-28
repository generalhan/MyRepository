import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;


public class messagePush extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public messagePush() {
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
		request.setCharacterEncoding("utf-8");  
		response.setCharacterEncoding("UTF-8");
		List message=new ArrayList(); 
		myjavabean dao=new myjavabean();		

		message=dao.getContacts();
		dao.close();
		if(message.isEmpty()){
			response.getWriter().print("false");
		}else{
			JSONArray json1=JSONArray.fromObject(message);
			response.getWriter().write(json1.toString());
	        System.out.print(json1.toString());
	        response.getWriter().flush();
	        response.getWriter().close();
		}
		
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
		
		String managerId=(String)request.getSession().getAttribute("userEmail");
		String email=request.getParameter("userEmail");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String type=request.getParameter("select");
		String sql="";
		String arrId [];  // 接受的邮箱数组
		String id [];	//存放 邮箱对应用户id的数组
		String idUser="";
		String message;
		
		Date time = new Date(System.currentTimeMillis());
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String current = sdf.format(time);
	    
		myjavabean dao=new myjavabean();
		arrId=email.split(";");
		if("".equals(email)||email==null){
			request.setAttribute("tip","null");
			request.getRequestDispatcher("page/messagePush.jsp").forward(request, response);
		}else{
			if("所有人".equals(arrId[0])){
				sql="insert into manager_message(id_user,gmt_create,title,content,manager_id,type,state) ";
				sql+="values("+0+",'"+current+"','"+title+"','"+content+"',"+"(select id from user where email='"+managerId+"')"+",'"+type+"','1')";
				message=dao.sqlInsert(sql);
				if("0".equals(message)){
					request.setAttribute("tip", "Ok");
					request.getRequestDispatcher("page/messagePush.jsp").forward(request, response);
				}else{
					System.out.print("插入有误");
				}	
			}else{
				for(int i=0;i<arrId.length;i++){
					sql="select id from user where email='"+arrId[i]+"'";
					message=dao.returnId(sql);
					if("abc".equals(message)){
						request.setAttribute("tip","error");
						request.getRequestDispatcher("page/messagePush.jsp").forward(request, response);
					}else{
						idUser+=message+",";
					}
					
				}
				id=idUser.split(",");
				if(id.length==arrId.length){
					int num=0;
					for(int i=0;i<id.length;i++){
						sql="insert into manager_message(id_user,gmt_create,title,content,manager_id,type,state) ";
						sql+="values('"+id[i]+"','"+current+"','"+title+"','"+content+"',"+"(select id from user where email='"+managerId+"')"+",'"+type+"','0')";
						message=dao.sqlInsert(sql);
						if("0".equals(message)){
							num++;
						}else{
							
						}
					}					
					if(num==id.length){
						request.setAttribute("tip", "Ok");
						request.getRequestDispatcher("page/messagePush.jsp").forward(request, response);
					}else{
						System.out.print("插入有误");
					}	
				}else{
					System.out.print("出错了，找找问题");
				}
				
			}
		}
		
//		for(int i=0;i<arrId.length;i++){
//			sql="select id from user where email='"+arrId[i]+"'";
//			message=dao.returnId(sql);
//			if("abc".equals(message)){
//				request.setAttribute("tip","error");
//				request.getRequestDispatcher("page/messagePush.jsp").forward(request, response);
//			}else{
//				idUser+=message+",";
//			}
//			
//		}
//		idUser=idUser.substring(0,idUser.length()-1);
//		sql="insert into manager_message(id_user,gmt_create,title,content,manager_id,type,state) ";
//		sql+="values('"+idUser+"','"+current+"','"+title+"','"+content+"',"+"(select id from user where email='"+managerId+"')"+",'"+type+"','0')";
//		message=dao.sqlInsert(sql);
//		if("0".equals(message)){
//			request.setAttribute("tip", "Ok");
//			request.getRequestDispatcher("page/messagePush.jsp").forward(request, response);
//		}else{
//			System.out.print("插入有误");
//		}		
		System.out.print(arrId);
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
