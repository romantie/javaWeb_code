<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>修改新闻</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id")); 
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/news19";
    String username = "root";
    String password = "root";
    Connection conn = DriverManager.getConnection(url,username,password);

    String sql = "select * from t_news where id=?";

    PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setInt(1, id);

	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
%>
	<form action="updateNews.jsp" method="post">
		<input type="hidden" name="id" value="<%=rs.getInt("id") %>">
		<table align="center">
			<tr>
				<td>新闻题目</td>
				<td><input type="text" name="title" value="<%=rs.getString("title") %>"></td>
			</tr>
			<tr>
				<td>新闻作者</td>
				<td><input type="text" name="author" value="<%=rs.getString("author") %>"></td>
			</tr>
			<tr>
				<td>新闻内容</td>
				<td><textarea rows="5" cols="70" name="content"><%=rs.getString("content") %></textarea> </td>
			</tr>
			<tr>
				<td>新闻日期</td>
				<td><input type="date" name="enterdate" value="<%=rs.getDate("enterdate") %>"></td>
			</tr>
			<tr>
				<td>新闻热度</td>
				<td><input type="number" name="hot" value="<%=rs.getInt("hot") %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="保存修改">
				</td>
			</tr>
		</table>
	</form>
<%
	}
	pstmt.close();
	conn.close();
%>

<br>
<center>
	<a href="queryAllNews.jsp">返回</a>
</center>

</body>
</html>