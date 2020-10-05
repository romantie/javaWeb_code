<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String sex = request.getParameter("usex");
	String email = request.getParameter("password");
	
	if(id==null||name==null||password==null||sex==null||email==null){
		response.sendRedirect("addUsers.jsp");
	}
	
	Date date = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String today = df.format(date);


	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/news19";
	String username = "root";
	String upassword = "root";
	Connection conn = DriverManager.getConnection(url, username, upassword);
	
	String sql = "insert into t_user(uid,uname,upassword,usex,uemail,uregdate) values(?,?,?,?,?,?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,id);
	pstmt.setString(2,name);
	pstmt.setString(3,password);
	pstmt.setString(4,sex);
	pstmt.setString(5,email);
	pstmt.setString(6,today);
	
	int n = pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	if(n >0) {
		//添加成功
		response.sendRedirect("queryAllUser.jsp"); 
	}else {
		//添加失败
		response.sendRedirect("addUsers.jsp"); 	
	}
	
%>
</body>
</html>