import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import net.sf.json.JSONObject;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.eclipse.jdt.internal.compiler.lookup.VariableBinding;

import chen.p;


public class phoneCheck extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public phoneCheck() {
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

		String mobile=request.getParameter("phoneNum");
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
				String m=r.main(mobile,num);
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
		String message="";    
		String p=request.getParameter("codeCon");
		Object o=request.getSession().getAttribute("jiaobin");
		Object m=request.getSession().getAttribute("time");
		String title=String.valueOf(o);
//		点击时获取的时间
		String b=String.valueOf(m);
//		验证码十分钟后过期
		Long f=Long.valueOf(b)+600000;
//		输入验证码时获取的时间
		Date time=new Date();
		Long g=time.getTime();
//		测试输出
		System.out.println(o);
		System.out.println(g);
		System.out.println(f);
		if(g<=f){
			if(p.equals(title)){
				message="1";
			}else{
				message="0";
			}
		}else{
			message="2";
		}	
		response.getWriter().print(message);
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
