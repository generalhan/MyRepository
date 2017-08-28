import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class updateOrder extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updateOrder() {
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
		PrintWriter out = response.getWriter();
		String orderID=request.getParameter("orderID");
		String currentState=request.getParameter("currentState");
		myjavabean orderMess=new myjavabean();
		List mess=orderMess.selectOrder(orderID);
		orderMess.close();
		request.setAttribute("a", mess);
		request.setAttribute("b", currentState);
		request.getRequestDispatcher("page/updateOrder.jsp").forward(request, response);
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

		String orderPrice=request.getParameter("orderPrice");
		String orderState=request.getParameter("orderState");
		String orderID=request.getParameter("orderID");
		String currentState=request.getParameter("currentState");
		orderState=new String(orderState.getBytes("ISO-8859-1"),"utf-8");
		if("已付款".equals(orderState)){
			orderState="1";
		}else{
			orderState="0";
		}
		myjavabean p=new myjavabean();
		String message=p.updateOrder(orderPrice,orderState,orderID);
		p.close();
		if("1".equals(message)){
			System.out.println("更新成功");
		}else{
			System.out.println("更新失败");
		}
		if("1".equals(currentState)){
			response.sendRedirect("page/orderManager.jsp?state=1");
		}else{
			response.sendRedirect("page/orderManager.jsp?state=0");
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
