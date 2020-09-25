package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CourseDao;
import Dao.TeaDao;
import entity.Course;
import entity.Teachers;

/**
 * Servlet implementation class InsertCourseServlet
 */
@WebServlet("/InsertCourseServlet")
public class InsertCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCourseServlet() {
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
		Course course = new Course();
		course.setCourse_no(request.getParameter("course_no"));
		course.setCourse_name(request.getParameter("course_name"));
		course.setCourse_time(request.getParameter("course_time"));
		course.setCourse_site(request.getParameter("course_site"));
		course.setCourse_credit(request.getParameter("course_credit"));
		course.setCourse_teacher(request.getParameter("course_teacher"));
		course.setCourse_type(request.getParameter("course_type"));
		CourseDao coursedao = new CourseDao();
		int rs=coursedao.Insert(course);
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
