<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
String check(String uid, String upassword){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String uname = "";
	try{
		//1.加载数据库
		Class.forName("com.mysql.jdbc.Driver");

		//2.连接数据库
		String url = "jdbc:mysql://localhost:3306/news19";
		String user = "root";
		String password = "root";
		conn = DriverManager.getConnection(url,user,password);
		
		//3.获取数据库元素
		String sql = "select * from t_manager where  mid=? and mpassword=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, uid);
		pstm.setString(2, upassword);
		
		rs = pstm.executeQuery();
		
		if(rs.next()){
			uname = rs.getString("mname");
		}
	}catch (ClassNotFoundException e) {
		 System.out.print(e.getMessage());
	 }catch (SQLException e) {
		 System.out.print(e.getMessage());
	 }finally{
		if(rs != null){ 
			try{
			   	rs.close(); 
			}catch(SQLException e){
				System.out.print(e.getMessage());
			}
		}
		if(pstmt != null){ 
			try{
				pstmt.close(); 
			}catch(SQLException e){
				System.out.print(e.getMessage());
			} 
		}
		if(conn != null){ 
			try{
				conn.close(); 
			}catch(SQLException e){
				System.out.print(e.getMessage());
			} 
		}
		return uname;
	}
}
%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	String name = null;
	String remember = request.getParameter("remember");

	
	//名字不为空则说明匹配成功了。
	if(!((name=check(id, pwd)).equals(""))){
		session.setAttribute("username", name);
		response.sendRedirect("queryAllUser.jsp");
	}else{
		response.sendRedirect("login_fail.jsp");
	}

%>

</body>
</html>