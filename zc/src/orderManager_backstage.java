import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.imap.protocol.ID;

import net.sf.json.JSONArray;
import chen.allMess;


public class orderManager_backstage extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public orderManager_backstage() {
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
		String k=request.getParameter("k");
		int num=Integer.parseInt(request.getParameter("curPage"));
		List list=new ArrayList();
		myjavabean allMessage=new myjavabean();
		list=allMessage.allOrder(k,num);
		allMessage.close();
		request.getSession().setAttribute("allMess", list);//存放订单数据
//		request.getSession().setAttribute("allMess1", list.get(0));//存放页面信息
//		System.out.println(list.get(1));
//		System.out.println(list.get(0));
		JSONArray ja = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
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

		response.setContentType("text/html; charset=utf-8");
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		List all=(List)request.getSession().getAttribute("allMess");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		List list=new ArrayList();
		try {
			java.util.Date date1=sdf.parse(startTime);
			java.util.Date date2=sdf.parse(endTime);
			System.out.println(date1.getTime()+"and"+date2.getTime());
//			比较date1和date2的大小，相等则返回0；date1大于date2则返回1，否则返回-1 
			int res=date1.compareTo(date2);
			
			if(res==0||res==-1){
				myjavabean timeMess=new myjavabean();
				for (int i = 0; i <all.size() ; i++) {
					allMess kAllMess=new allMess();
					kAllMess=(allMess) all.get(i);
					String t=kAllMess.getTime();
					java.util.Date date3=sdf.parse(t);
					int res2=date1.compareTo(date3); //这个值必须是0或者-1才行
					int res3=date2.compareTo(date3); //这个值必须是0或者1才行
					if(res2!=1&&res3!=-1){
						list.add(all.get(i));
					}
				}
			}else{
				System.out.println("选择的开始日期应该小于结束日期");
			}
			allMess kAllMess=new allMess();
			kAllMess=(allMess)list.get(1);
			String s=kAllMess.getState();
			request.getSession().setAttribute("allMess", list);
			if("0".equals(s)){
				response.sendRedirect("page/orderManager.jsp?state=0");
			}else{
				response.sendRedirect("page/orderManager.jsp?state=1");
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
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
