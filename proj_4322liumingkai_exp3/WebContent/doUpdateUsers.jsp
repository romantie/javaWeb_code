<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改用户信息</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/news2019";
	String uname = "root";
	String password = "root";
	Connection conn = DriverManager.getConnection(url, uname, password);

	String sql = "select * from t_user where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
%>
	<form action="updateUsers.jsp" method="post">
    <input type = "hidden" name = "id"  value ="<%=rs.getInt("id")%>">
    <table border="1">
      <tr>
        <td>登录ID：</td>
        <td><input type="text" name="uid" value="<%=rs.getString("uid")%>"></td>
      </tr>
        <td>真实姓名：</td>
        <td><input type="text" name="name" value="<%=rs.getString("uname")%>"></td>
      </tr>  
      <tr>
      	<td>性别</td>
      	<td>
      		<input type = "radio" name = "usex" value="男" checked="checked">男
      		<input type = "radio" name = "usex" value="女" >女
      	</td>
      </tr>  
      <tr>
        <td>Email：</td>
        <td><input type="text" name="uemail" value="<%=rs.getString("uemail")%>"></td>
      </tr>  
      <tr>
        <td>登录密码：</td>
        <td><input type="password" name="password" value="<%=rs.getString("upassword")%>"></td>
      </tr>
      <tr>
        <td colspan="2">
          &nbsp;&nbsp;<input type="submit" value="保存修改">&nbsp;&nbsp;
          <input type="reset" value="重置"> 
        </td>   
      </tr>
    </table>
  </form>
<%
	}
%>

</body>
</html>