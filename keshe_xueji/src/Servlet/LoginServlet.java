package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.LoginDao;
import User.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User(request.getParameter("username"),
				request.getParameter("password"),
				request.getParameter("type"));
		LoginDao dao = new LoginDao();
		int rs=0;
		try {
			rs = dao.userlogin(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs!=0) {
			if("admin".equals(user.getType())) {
				response.setHeader("Refresh","0;URL=guanliyuanshouye.jsp");
			}
			else if("tea".equals(user.getType())) {
				response.setHeader("Refresh","0;URL=jiaoshishouye.jsp");
			}
			else if("stu".equals(user.getType())) {
				response.setHeader("Refresh","0;URL=xueshenshouye.jsp");
			}
		}else {
			response.getWriter().append("用户名密码错误，请重新登陆");
			response.setHeader("Refresh","3;URL=index.jsp");
		}
		
	}

}
