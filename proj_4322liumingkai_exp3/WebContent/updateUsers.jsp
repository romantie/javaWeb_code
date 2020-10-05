<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DateFormat,java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>保存修改结果</title>
</head>
<body>
<%
   	request.setCharacterEncoding("utf-8");

	int id = Integer.parseInt(request.getParameter("id"));
   	String uid = request.getParameter("uid");
   	String uname = request.getParameter("name");
   	String upassword = request.getParameter("password");
   	String usex = request.getParameter("usex");
   	String uemail = request.getParameter("uemail");
   	
  
	
    Class.forName("com.mysql.jdbc.Driver");
	//String url = "jdbc:mysql://localhost:3306/user2?useUnicode=true&characterEncoding=utf-8";
    String url = "jdbc:mysql://localhost:3306/news2019";
    String username = "root";
    String password = "root";
    Connection conn = DriverManager.getConnection(url,username,password);

    String sql = "update t_user set uid=?,upassword=?,usex=?,uemail=?,uname=? where id=?";

    PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, uid);
	pstmt.setString(2, upassword);
	pstmt.setString(3, usex);
	pstmt.setString(4,uemail);
	pstmt.setString(5,uname);
	pstmt.setInt(6, id);
	
	int n = pstmt.executeUpdate();	  

	pstmt.close();	// 关闭PreparedStatements
	conn.close();	// 关闭Connection 

	if(n >0) {
		//修改成功
		response.sendRedirect("queryAllUser.jsp"); 
	}else {
		//修改失败
		response.sendRedirect("doUpdateUsers.jsp"); 	
	}
%>

</body>
</html>