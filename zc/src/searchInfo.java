//import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;


public class searchInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public searchInfo() {
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
		
		response.setContentType("text/html; charset=utf-8");
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		String way=request.getParameter("way");
		String info=request.getParameter("info");
		info=new String(info.getBytes("ISO-8859-1"),"utf-8");
		ArrayList list=new ArrayList();
		List list3=new ArrayList();
		List list4=new ArrayList();
		myjavabean kk=new myjavabean();
		String message=kk.check(way,info);
		if("1".equals(message)){
			list= (ArrayList) kk.search(way,info,pageNum);
			list4= (List) list.get(0);
			List list2=(List) kk.a(list4);
			list3.add(list);
			list3.add(list2);
		}else{
			System.out.println("查询的内容在数据库中不纯在");
		}
		JSONArray ja=JSONArray.fromObject(list3);
		PrintWriter out=response.getWriter();
		out.print(ja);
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
