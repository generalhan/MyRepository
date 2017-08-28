import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class resetPassword extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public resetPassword() {
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

		String email= request.getParameter("email");
		String verificationCode= request.getParameter("verificationCode");
		String sql ="";
		String sql2="";
		
		sql="select id from user where email='"+email+"' and VerificationCode='"+verificationCode+"'";
		myjavabean dao=new myjavabean();		
		String message=dao.querySingle(sql);
		if("0".equals(message)){
			
			sql2="update user set VerificationCode='abc' where email='"+email+"'";
			String message2=dao.updateUser(sql2);
			if("0".equals(message2)){
				request.getSession().setAttribute("userEmail", email);
				response.sendRedirect("forget3.jsp");
			}else{
				System.out.print("system error ");
			}
			
		}else{
			response.sendRedirect("forget1.jsp");
		}
		dao.close();
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
