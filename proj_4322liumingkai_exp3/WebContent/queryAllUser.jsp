<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function del(id){
		var flag = window.confirm("是否真的删除");
		if(flag){
			window.location.href = "doDeleteUser.jsp?id="+id;
		}
	}
	
	function update(id){
		window.location.href="doUpdateUsers.jsp?id="+id;
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center" border="0" width="750px" cellspacing="0">
		<tr>
			<td align="center" style="font-family:'黑体'; font-size:28px;">登陆成功！欢迎[<%=session.getAttribute("username") %>]访问新闻管理系统！</td>	
		</tr>
		<tr style="font-family:'宋体'; font-size:24px;">
			<td align="right"><a href="addUsers.jsp"><b>增加用户</b></a>
			<a href="mlogout.jsp"><b>安全退出</b></a>
			&nbsp;&nbsp;</td>
			
		</tr>
	</table>
	
	<table align = "center" border="1" width="750px"  cellspacing="0">
		<tr>
			<th width="320px">登录ID</th>
			<th width="120px">真实姓名</th>
			<!-- <th width="600px">内容</th> -->
			<th width="110px">登录密码</th>
			<th width="50px">性别</th>
			<th width="150px">Email</th>
			<th width="150px">注册时间</th> 
			<th width="150px">管理员操作</th>
	    </tr>
	<%
	
			//分页
			String n = request.getParameter("pageNow");
			int pageSize = 5;
			int lineCount;
			int pageCount;
			int pageNow = 1;
			
			if(n != null){
				pageNow = Integer.parseInt(n);
			}
	
	
	
	
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/news19";
		String username = "root";
		String password= "root";
		Connection conn = DriverManager.getConnection(url, username, password);
		PreparedStatement pstm = conn.prepareStatement("select count(*) from t_user");
		ResultSet rs = pstm.executeQuery();
		rs.next();
		lineCount = rs.getInt(1);
		pageCount = lineCount%pageSize == 0 ? lineCount/pageSize:lineCount/pageSize+1;
		
		pstm = conn.prepareStatement("select * from t_user limit ?,?");
		pstm.setInt(1, pageSize*(pageNow-1));
		pstm.setInt(2, pageSize);
		
		rs = pstm.executeQuery();
		while(rs.next()){
	%>
		<tr>
    		<td><%=rs.getString("uid") %></td>
    		<td><%=rs.getString("uname") %></td>
    		<td><%=rs.getString("upassword") %></td>
    		<td><%=rs.getString("usex") %></td>
    		<td><%=rs.getString("uemail") %></td>
    		<td><%=rs.getDate("uregdate") %></td>
    		<td>
    			<a href="javascript:update(<%=rs.getInt("id")%>)">修改</a>
    			<a href="javascript:del(<%=rs.getInt("id")%>)">删除</a>
    		</td>
	    </tr>
		<%
			}
			
			rs.close();
			pstm.close();
			conn.close();
		%>	
	</table>	
	
	
	<div style="text-align:center ;margin-top: 20px;font-size:2em">
		<%
			for(int i =1; i <= pageCount; i++){
				%>
				[<a href="queryAllUser.jsp?pageNow=<%=i%>"><%= i %></a>]
				<% 
			}
		%>
		</div>
	
	
	
</body>
</html>