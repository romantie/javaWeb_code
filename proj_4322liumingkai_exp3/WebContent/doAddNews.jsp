<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DateFormat,java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加结果</title>
</head>
<body>
<%
   	request.setCharacterEncoding("utf-8");

   	String title = request.getParameter("title");
   	String author = request.getParameter("author");
   	String content = request.getParameter("content");
   	
   	String enterdate_str = request.getParameter("enterdate");
   	// String-->Util.Date
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date enterdate = df.parse(enterdate_str);   	

	int hot = Integer.parseInt(request.getParameter("hot"));
	
    Class.forName("com.mysql.jdbc.Driver");
	//String url = "jdbc:mysql://localhost:3306/user2?useUnicode=true&characterEncoding=utf-8";
    String url = "jdbc:mysql://localhost:3306/news19";
    String username = "root";
    String password = "root";
    Connection conn = DriverManager.getConnection(url,username,password);

    String sql = "insert into t_news(title,author,content,enterdate,hot) values (?,?,?,?,?)";

    PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, title);
	pstmt.setString(2, author);
	pstmt.setString(3, content);
	pstmt.setDate(4, new java.sql.Date(enterdate.getTime())); 
	pstmt.setInt(5, hot);
	
	int n = pstmt.executeUpdate();	  

	pstmt.close();	// 关闭PreparedStatement
	conn.close();	// 关闭Connection 

	if(n >0) {
		//添加成功
		response.sendRedirect("queryAllNews.jsp"); 
	}else {
		//添加失败
		response.sendRedirect("addNews.jsp"); 	
	}
%>

</body>
</html>