package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CourseDao;
import entity.Course;


/**
 * Servlet implementation class UpdateCourseServlet
 */
@WebServlet("/UpdateCourseServlet")
public class UpdateCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCourseServlet() {
        super();
        // TODO Auto-generated constructor Courseb
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method Courseb
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		Course course = new Course();
		course.setId(request.getParameter("id"));
		course.setCourse_no(request.getParameter("course_no"));
		course.setCourse_name(request.getParameter("course_name"));
		course.setCourse_time(request.getParameter("course_time"));
		course.setCourse_site(request.getParameter("course_site"));
		course.setCourse_credit(request.getParameter("course_credit"));
		course.setCourse_teacher(request.getParameter("course_teacher"));
		course.setCourse_type(request.getParameter("course_type"));
		CourseDao dao = new CourseDao();
		int rs=dao.xiugai(course);
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
		// TODO Auto-generated method Courseb
		doGet(request, response);
	}

}
