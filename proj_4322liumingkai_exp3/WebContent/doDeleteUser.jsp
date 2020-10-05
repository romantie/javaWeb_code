<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/news19";
	String username = "root";
	String password = "root";
	Connection conn = DriverManager.getConnection(url,username,password);
	
	String sql = "delete from t_user where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,id);
	
	int n = pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	if(n>0) {
		//删除成功，则直接刷新页面
		response.sendRedirect("queryAllUser.jsp"); 
	}else {
		response.getWriter().println("删除失败！");
	}	  



%>
</body>
</html>