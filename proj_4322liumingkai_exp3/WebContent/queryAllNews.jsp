<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page
    import="java.sql.*"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>显示所有新闻</title>
	<script type="text/javascript">
		function del(id){
			var flag = window.confirm("是否真的要删除？");
			if(flag){
				window.location.href = "doDeleteNews.jsp?id=" + id;
			}
		}
		function update(id){
			window.location.href = "doUpdateNews.jsp?id=" + id;
		}
		function query(id){
			window.location.href = "doQueryNews.jsp?id=" + id;
		}
	</script>
</head>
<body>
	<table align="center" border="0" width="750px" cellspacing="0">
		<tr>
			<td align="center" style="font-family:'黑体'; font-size:28px;">登陆成功！欢迎[<%=session.getAttribute("username") %>]访问新闻管理系统！</td>	
		</tr>
		<tr style="font-family:'宋体'; font-size:24px;">
			<td align="right"><a href="addNews.jsp"><b>增加新闻</b></a>&nbsp;&nbsp;</td>
			<td align="right"><a href="index.jsp"><b>安全退出</b></a>&nbsp;&nbsp;</td>
		</tr>
	</table>
	<table  align="center" border="1" width="750px" cellspacing="0">
			<tr>
				<th width="320px">标题</th>
				<th width="120px">作者</th>
				<!-- <th width="600px">内容</th> -->
				<th width="110px">日期</th>
				<th width="50px">热度</th>
				<th width="150px">操作</th>
		    </tr>
	    <%
	      Class.forName("com.mysql.jdbc.Driver");
	      String url = "jdbc:mysql://localhost:3306/news19";
	      String username = "root";
	      String password = "root";
	      Connection conn = DriverManager.getConnection(url,username,password);
	      Statement stmt = conn.createStatement();
	      String sql = "select * from t_news";
	      ResultSet rs = stmt.executeQuery(sql);

	      
	      
	      while(rs.next()){
	    %>
	    	<tr>
	    		<td><%=rs.getString("title") %></td>
	    		<td><%=rs.getString("author") %></td>
	    		<td><%=rs.getDate("enterdate") %></td>
	    		<td><%=rs.getInt("hot") %></td>
	    		<td>
	    			<a href="javascript:query(<%=rs.getInt("id")%>)">查询详情</a>
	    			<a href="javascript:update(<%=rs.getInt("id")%>)">修改</a>
	    			<a href="javascript:del(<%=rs.getInt("id")%>)">删除</a>
	    		</td>
	    	</tr>
	    <%
	    	}
	      
			rs.close();
			stmt.close();
			conn.close();
	    %>
	</table>
</body>
</html>