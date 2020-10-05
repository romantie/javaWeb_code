package nuc.ss.text;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class inputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setHeader("content-type","text/html;charset=UTF-8");
		resp.setCharacterEncoding("utf-8");
		String name = req.getParameter("name").toString();
		String psw = req.getParameter("password").toString();
		PrintWriter out=resp.getWriter();
		out.print("<h1><br>"+name+"</h1><br>");
		out.print("<b>&nbsp;&nbsp;&nbsp;&nbsp;<br>"+psw+"</b><br>");
		out.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}
