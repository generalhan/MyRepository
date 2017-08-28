import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;

import demo.message;


public class articlePage extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public articlePage() {
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

		String email = (String) request.getSession().getAttribute("userEmail");
		String message_id = request.getParameter("message_id");
		String way=request.getParameter("way");
		List list1=new ArrayList();
		list1=(List) request.getSession().getAttribute("messageList");
		int cs=0;
		for (int i = 0; i < list1.size(); i++) {
			message h=new message();
			h=(message) list1.get(i);
			String k=String.valueOf(h.getMessage_id());
			if(k.equals(message_id)){
				cs=i;
				break;
			}
		}
		if("0".equals(way)){
			if(cs==0){
				cs=0;
			}else {
				cs=cs-1;
			}
		}else{
			if(cs==list1.size()-1){
				cs=list1.size()-1;
			}else{
				cs=cs+1;
			}
		}
		message demo=new message();
		demo=(message) list1.get(cs);
		String id=String.valueOf(demo.getMessage_id());
		String state=demo.getState();
		String sql="";
		List list=new ArrayList();
		myjavabean updateState=new myjavabean();
		if(state.equals("0")){
			sql="update manager_message set state = '1' where id_user=(select id from user where email='"+email+"') ";
			sql+="and id = '"+id+"'";
			String message =updateState.updateUser(sql);
		}
		list=updateState.messageDetail(id);
     	request.getSession().setAttribute("messageInfo", list);
		updateState.close();
     	response.sendRedirect("messageDetail.jsp");
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
