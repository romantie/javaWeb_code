<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
  <h2>恭喜，您登录成功！</h2>
  <h2>欢迎<font color="red">
             <%=request.getParameter("username")%>
          </font>光临！</h2>
</center>
</body>
</html>