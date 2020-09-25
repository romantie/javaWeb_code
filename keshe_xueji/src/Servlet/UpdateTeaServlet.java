package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StuDao;
import Dao.TeaDao;
import entity.Students;
import entity.Teachers;

/**
 * Servlet implementation class UpdateTeaServlet
 */
@WebServlet("/UpdateTeaServlet")
public class UpdateTeaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeaServlet() {
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
		Teachers tea = new Teachers();
		tea.setId(request.getParameter("id"));
		System.out.println(request.getParameter("id"));
		tea.setT_no(request.getParameter("t_no"));
		tea.setT_name(request.getParameter("t_name"));
		tea.setT_sex(request.getParameter("t_sex"));
		TeaDao dao = new TeaDao();
		int rs=dao.xiugai(tea);
		if(rs!=0) {
			System.out.println("修改成功");
			 response.sendRedirect("AdminTeaQu.jsp");
		}
		else {
			System.out.println("修改失败");
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
