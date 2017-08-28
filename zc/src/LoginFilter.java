import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginFilter implements Filter {
 @Override
 public void init(FilterConfig filterConfig) throws ServletException {
  // TODO Auto-generated method stub
 }
 @Override
 public void doFilter(ServletRequest request, ServletResponse response,
   FilterChain chain) throws IOException, ServletException {
  // 获得在下面代码中要用的request,response,session对象
  HttpServletRequest servletRequest = (HttpServletRequest) request;
  HttpServletResponse servletResponse = (HttpServletResponse) response;
  HttpSession session = servletRequest.getSession();
  // 获得用户请求的URI
  String path = servletRequest.getRequestURI();
  //System.out.println(path);
  // 从session里取员工工号信息
  String empId = (String) session.getAttribute("userEmail");
  String adminEmail=(String)session.getAttribute("adminEmail");
  /*创建类Constants.java，里面写的是无需过滤的页面
  for (int i = 0; i < Constants.NoFilter_Pages.length; i++) {
   if (path.indexOf(Constants.NoFilter_Pages[i]) > -1) {
    chain.doFilter(servletRequest, servletResponse);
    return;
   }
  }*/
  // 登陆页面无需过滤
  if((path.indexOf("/login") > -1)||(path.indexOf("/index")>-1)||(path.indexOf("/aboutUs")>-1)
		  ||(path.indexOf("/ABTest")>-1)||(path.indexOf("/collapseTest")>-1)||(path.indexOf("/compatibleTest")>-1)
		  ||(path.indexOf("/contactUs")>-1)||(path.indexOf("/feedback")>-1)||(path.indexOf("/forget1")>-1)
		  ||(path.indexOf("/forget2")>-1)||(path.indexOf("/forget3")>-1)||(path.indexOf("/forget4")>-1)
		  ||(path.indexOf("/funTest")>-1)||(path.indexOf("/phoneCheck")>-1)||(path.indexOf("/register")>-1)
		  ||(path.indexOf("/safeTest")>-1)||(path.indexOf("/serviceAgreement")>-1)) {
   chain.doFilter(servletRequest, servletResponse);
   return;
  }
  // 判断如果没有取到员工信息,就跳转到登陆页面
  if(path.indexOf("page")>-1){
	  if(adminEmail==null||"".equals(adminEmail)){
		// 跳转到登陆页面
			  servletResponse.sendRedirect("./login.jsp");
	  }else{
		// 已经登陆,继续此次请求
		   chain.doFilter(request, response);
	  }
  }else{
	  if (empId == null || "".equals(empId)) {
		   // 跳转到登陆页面
			  if(path.indexOf(".jsp")>-1){
				  servletResponse.sendRedirect("./login.jsp");
			  }else{
				  servletResponse.sendRedirect("./index.jsp");
			  }
		  }else {
		   // 已经登陆,继续此次请求
		   chain.doFilter(request, response);
		  }
  }
  
 }
 @Override
 public void destroy() {
  // TODO Auto-generated method stub
 }
}