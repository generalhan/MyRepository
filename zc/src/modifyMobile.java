import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import chen.p;


public class modifyMobile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public modifyMobile() {
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


		String mobile=request.getParameter("newNum");
		String mobile1=request.getParameter("oldNum");
		String a="";
		myjavabean mobileDBO=new myjavabean();
		String message =mobileDBO.phone(mobile);
		mobileDBO.close();
		if("0".equals(message)){
			 a="0";
		}else if("1".equals(message)){
			try {
				int max=8;
				String num="";
				Date q=new Date();
				long seconds=q.getTime();
				Random random = new Random();
			     for(int i=0; i<6;i++){
			    	 int s = random.nextInt(max)+1;
			    	 num+=s;
			     }
				p r=new p();
				String m=r.main(mobile1,num);
				JSONObject jsonObject = JSONObject.fromObject(m);
				String name = jsonObject.getString("code");
//				测试输出
				System.out.println(num);
				request.getSession().setAttribute("jiaobin", num);
				request.getSession().setAttribute("time", seconds);
				if("0".equals(name)){
					a="1";
				}else{
					a="3";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else{
			a="2";
		}
        response.getWriter().print(a);
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
