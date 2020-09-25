package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.adminDao_stu;
import entity.Students;

/**
 * Servlet implementation class admin_stuServlet
 */
@WebServlet("/admin_stuServlet")
public class admin_stuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_stuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		Students stu = new Students();
		stu.setSt_no(request.getParameter("st_no"));
		stu.setSt_name(request.getParameter("st_name"));
		stu.setSt_birthday(request.getParameter("st_birthday"));
		stu.setSt_Email(request.getParameter("st_Email"));
		stu.setSt_phone(request.getParameter("st_phone"));
		stu.setSt_classno(request.getParameter("st_classno"));
		stu.setSt_roll(request.getParameter("st_roll"));
		adminDao_stu stu1 = new adminDao_stu();
		int rs=stu1.Insertadminstu(stu);
		if(rs!=0) {
			System.out.println("插入成功");
		}
		else {
			System.out.println("插入失败");
		}
		response.sendRedirect("select.jsp");
	}

}
