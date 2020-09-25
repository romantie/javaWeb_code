package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.TeaDao;
import entity.Teachers;

/**
 * Servlet implementation class InsertteaServlet
 */
@WebServlet("/InsertteaServlet")
public class InsertteaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertteaServlet() {
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
		tea.setT_no(request.getParameter("t_no"));
		tea.setT_name(request.getParameter("t_name"));
		tea.setT_sex(request.getParameter("t_sex"));
		TeaDao tea1 = new TeaDao();
		int rs=tea1.Insertadmintea(tea);
		if(rs!=0) {
			System.out.println("插入成功");
		}
		else {
			System.out.println("插入失败");
		}
		response.sendRedirect("AdminTeaQu.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
