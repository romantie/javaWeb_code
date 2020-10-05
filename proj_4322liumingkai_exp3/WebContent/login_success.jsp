<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    if(session.getAttribute("username") == null)
    {
		response.sendRedirect("login.jsp"); 
    }
%>
    <h2>欢迎[<%=session.getAttribute("username")%>]</h2>
    <hr>
    
    <a href="login.jsp">登出</a>
</body>
</html>