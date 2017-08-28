import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class updateForgetPassword extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updateForgetPassword() {
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
	
		String email= (String)request.getSession().getAttribute("userEmail");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String error="";
		String sql="";
		if(pwd1.isEmpty()||pwd2.isEmpty()){
			error="密码不能为空";
			request.setAttribute("error",error);
			request.getRequestDispatcher("forget3.jsp").forward(request, response);
		}else{
			if(pwd1.equals(pwd2)){
				
				myjavabean dao = new myjavabean();
                sql="select password from user where email='"+email+"'and password='"+pwd2+"'";
                String message2=dao.querySingle(sql);
                if("0".equals(message2)){
                    error="新密码不能和旧密码相同";
                    request.setAttribute("error",error);
                    request.getRequestDispatcher("forget3.jsp").forward(request, response);
                }else{
                    sql="update user set password='"+pwd2+"' where email='"+email+"'";
                    
                    String message= dao.updateUser(sql);
                    if("0".equals(message)){
                        response.sendRedirect("forget4.jsp");
                    }else{
                        System.out.print("errorba");
                    }
                }
                dao.close();

			}else{
				error="两次密码输入不一致";
				request.setAttribute("error",error);
				request.getRequestDispatcher("forget3.jsp").forward(request, response);
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
