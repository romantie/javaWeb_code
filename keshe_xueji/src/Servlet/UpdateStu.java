package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StuDao;
import Dao.adminDao_stu;
import entity.Students;

/**
 * Servlet implementation class UpdateStu
 */
@WebServlet("/UpdateStu")
public class UpdateStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		Students stu = new Students();
		stu.setSt_no(request.getParameter("st_no"));
		stu.setSt_name(request.getParameter("st_name"));
		stu.setSt_birthday(request.getParameter("st_birthday"));
		stu.setSt_Email(request.getParameter("st_Email"));
		stu.setSt_phone(request.getParameter("st_phone"));
		stu.setSt_classno(request.getParameter("st_classno"));
		stu.setSt_roll(request.getParameter("st_roll"));
		StuDao dao = new StuDao();
		int rs=dao.xiugai(stu);
		if(rs!=0) {
			System.out.println("修改成功");
			response.sendRedirect("AdminCourseQu.jsp");
		}
		else {
			System.out.println("修改失败");
			response.sendRedirect("AdminCourseQu.jsp");
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
