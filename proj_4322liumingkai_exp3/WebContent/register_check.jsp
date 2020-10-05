<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>登录程序之注册验证页面</title>
</head>
<body>
<%!  
 String check(String userid, String username, String userpwd, String userpwd2, String sex, String email,java.util.Date userregdate){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String uname = "";
	if("".equals(userid) || "".equals(username) || "".equals(userpwd) || "".equals(userpwd2) || "".equals(sex) || "".equals(email)){
		return "$$$$$$";
	}
	if(!(userpwd.equals(userpwd2))){
		return "******";
	}
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/news19";
		String user = "root";
		String password = "root";
		conn = DriverManager.getConnection(url,user,password);

		String sql = "select * from t_user where uid=?";
		pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, userid);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			return "######";
		}

		String sql2 = "insert into t_user values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql2);	
		pstmt.setString(1, userid);
		pstmt.setString(2, username);
		pstmt.setString(3, userpwd);
		pstmt.setString(4, sex);
		pstmt.setString(5, email);
		pstmt.setDate(6, new java.sql.Date(userregdate.getTime()));
		
		int n = pstmt.executeUpdate();
		
		//System.out.print("n=" + n);
		
		if(n>0){
			uname = username;
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
	}
	
	return uname;
 }
%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String sex = request.getParameter("usex");
	String email = request.getParameter("ueamil");
	java.util.Date regdate = new java.util.Date();
	
	String uname = check(id,name,password,password2,sex,email,regdate);

	if(!( "".equals(uname) || "######".equals(uname)
			|| "******".equals(uname)|| "$$$$$$".equals(uname))){  //注册成功，跳转到成功页
		session.setAttribute("info", uname);
		response.sendRedirect("reg_success.jsp");
		
	}else{              //注册失败，跳转到失败页
		String info = "";
		if("######".equals(uname)){
			info = "错误：登录ID已经存在！";
		}
		if("******".equals(uname)){
			info = "错误：两次输入密码不一致！";
		}
		if("$$$$$$".equals(uname)){
			info = "错误：所有信息都必须填写！";
		}		
		session.setAttribute("info", info);
		response.sendRedirect("reg_failure.jsp");
	}
%>
</body>