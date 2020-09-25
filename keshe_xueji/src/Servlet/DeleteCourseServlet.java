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
 * Servlet implementation class DeleteCourseServlet
 */
@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCourseServlet() {
        super();
        // TODO Auto-generated constructor courseb
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method courseb
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Course course = new Course();
		 course.setId(request.getParameter("id"));
		   
		   CourseDao dao=new CourseDao();
		   int rs=dao.delete(course);
		   if(rs!=0){
			   System.out.println("É¾³ý³É¹¦");
			   response.sendRedirect("AdminCourseQu.jsp");
		   }
		   else {
			   System.out.print("É¾³ýÊ§°Ü");
		   }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method courseb
		doGet(request, response);
	}

}
