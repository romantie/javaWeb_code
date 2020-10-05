<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>删除新闻</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id")); 
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/news19";
    String username = "root";
    String password = "root";
    Connection conn = DriverManager.getConnection(url,username,password);

    String sql = "delete from t_news where id=?";

    PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setInt(1, id);

	int n = pstmt.executeUpdate();

	pstmt.close();	// 关闭PreparedStatement
	conn.close();	// 关闭Connection
	
	if(n>0) {
		//删除成功，则直接刷新页面
		response.sendRedirect("queryAllNews.jsp"); 
	}else {
		response.getWriter().println("删除失败！");
	}	  

%>

</body>
</html>