<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>查询新闻详情</title>
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
	//只有一条记录，所以不需要while循环了。
	if(rs.next()){
%>
		<table align="center">
		<tr>
			<td>新闻题目</td>
			
			<td><input type="text" readonly="readonly"  value="<%=rs.getString("title") %>"></td>
		</tr>
		<tr>
			<td>新闻作者</td>
			<td><input type="text" readonly="readonly"  value="<%=rs.getString("author") %>"></td>
		</tr>
		<tr>
		<td>新闻内容</td>
		<td><textarea rows="5" cols="70" readonly="readonly"><%=rs.getString("content") %></textarea> </td>
		</tr>
		<tr>
			<td>新闻日期</td>
			<td><input type="date" readonly="readonly"  value="<%=rs.getDate("enterdate") %>"></td>
		</tr>
		<tr>
			<td>新闻热度</td>
			<td><input type="number" readonly="readonly" value="<%=rs.getInt("hot") %>"></td>
		</tr>
	</table>
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