import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.eclipse.jdt.internal.compiler.lookup.VariableBinding;


public class createTest2 extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public createTest2() {
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
		String num=request.getParameter("id");
//		myjavabean createTest2DBO=new myjavabean();
//		String [][] message =createTest2DBO.createTest();
//		if(message[0][0]=="0"||message[0][0]=="-1"){
//			String [][] b=new String[1][1];
//			b[0][0]="0";
//			request.setAttribute("a[][]", b);
//			request.getRequestDispatcher("createTest.jsp").forward(request, response);
//			url="createTest.jsp";
//			url=new String(url.getBytes("GBK"),"ISO-8859-1"); 
//			response.sendRedirect(url);
//		}else{
//			int len=num.length();
////			int [] a=new int[len];//存放参数
//			String [][] b=new String[len][3];
////			a=num.split("");//将参数分割成数组
//			for(int i=0;i<len;i++){
//				for(int j=0;j<3;j++){
//					int c=num.charAt(i)-48;
//					b[i][j]=message[c][j];					
//				}
//			}
			request.getSession().setAttribute("num",num);
			
			System.out.print(request.getSession().getAttribute(num));
		
			request.getRequestDispatcher("showAppList").forward(request, response);
			url=new String(url.getBytes("GBK"),"ISO-8859-1"); 
		
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

		doGet(request, response);
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
