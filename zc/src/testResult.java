import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.report;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class testResult extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public testResult() {
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

		message=dao.returnAllOrder();
		dao.close();
		if(message.isEmpty()){
			response.getWriter().print("false");
		}else{
			JSONArray json1=JSONArray.fromObject(message);
			response.getWriter().write(json1.toString());
	        System.out.println(json1.toString());
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
		myjavabean dao = new myjavabean();
        String sql="";
        String message="";
        int num=0;    
		String test=request.getParameter("test");		
		JSONArray json=JSONArray.fromObject(test);
		
		List list = (List)JSONArray.toList(json, report.class);
		
		System.out.println(test);
		Iterator it = list.iterator();
		while(it.hasNext()){
			report p = (report)it.next();
			System.out.println(p.getTypeid());
			sql="UPDATE user_test "; 
			sql+="SET state='"+p.getState()+"' "; 		
			sql+="WHERE id="+p.getId();		
			System.out.println(sql);
			message = dao.sqlInsert(sql);
			if("0".equals(message)){
				num++;
			}else{
				System.out.println("插入错误");
			}
			
		}
		if(num==list.size()){
			response.getWriter().print("true");
			
		}else{
			response.getWriter().print("false");
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
