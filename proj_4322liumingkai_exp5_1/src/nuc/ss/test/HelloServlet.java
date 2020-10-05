package nuc.ss.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	private String message;
	private String wel;
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd  hh:mm:ss");
	  public void init() throws ServletException
	  {
	      // 执行必需的初始化
	      message = "Hello World";
	      wel="热情好客的中国的欢迎你"; 
	  }
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置响应内容类型
	    resp.setContentType("text/html");
	    resp.setCharacterEncoding("UTF-8");

	    // 实际的逻辑是在这里
	   PrintWriter out = resp.getWriter();
	   out.println("<h1>" + message + "</h1>");
	   out.println("<h2>" + wel + "</h2>");
	   out.println("<h3>" +"当前时间：   "+ sdf.format(date) + "</h3>");
	}


}
