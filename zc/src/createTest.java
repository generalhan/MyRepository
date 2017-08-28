import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class createTest extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public createTest() {
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
		String url="";
		myjavabean createTestDBO=new myjavabean();
		String [][] message =createTestDBO.createTest();
		createTestDBO.close();
		if("0".equals(message[0][0])||"-1".equals(message[0][0])){
			String [][] b=new String[1][1];
			b[0][0]="0";
			request.setAttribute("a[][]", b);
			request.getRequestDispatcher("createTest.jsp").forward(request, response);
//			url="createTest.jsp";
		}
		else{
			String [][] b=message;
			int cd=b.length;
			String [][] a=new String[cd][];
			request.setAttribute("a[][]", b);
			request.getRequestDispatcher("createTest.jsp").forward(request, response);
//			url="createTest.jsp";
		}
//		url=new String(url.getBytes("GBK"),"ISO-8859-1"); 
//		response.sendRedirect(url);
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
