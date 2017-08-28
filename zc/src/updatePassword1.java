import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class updatePassword1 extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updatePassword1() {
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

		String Email=(String)request.getSession().getAttribute("userEmail");
		String pwd1=request.getParameter("pwd1");
		String pwd2=request.getParameter("pwd2");
		String pwd3=request.getParameter("pwd3");
		String sql = "";
		String message="";
		myjavabean dao=new myjavabean();
		if(pwd1.isEmpty()||pwd2.isEmpty()||pwd3.isEmpty()){
			request.setAttribute("state","empty");
			request.getRequestDispatcher("user.jsp").forward(request, response);
		}else{
			if(pwd2.equals(pwd3)){
				sql="select id from user where password='"+pwd1+"' and email='"+Email+"'";
				message=dao.querySingle(sql);
			
				if("0".equals(message)){
					sql="update user set password='"+pwd3+"' where email='"+Email+"'";
					message=dao.updateUser(sql);	
					dao.close();
					if("0".equals(message)){
						request.setAttribute("state","true");
						request.getRequestDispatcher("user.jsp").forward(request, response);
					}else{
						request.setAttribute("state","false3");
						request.getRequestDispatcher("user.jsp").forward(request, response);
					}
					
				}else{
					request.setAttribute("state","false2");
					request.getRequestDispatcher("user.jsp").forward(request, response);
				}
			}else{
				request.setAttribute("state","false");
				request.getRequestDispatcher("user.jsp").forward(request, response);
			}
			
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
