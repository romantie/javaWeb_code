<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <h1>欢迎登陆学生学籍管理系统</h1>
  <form method="POST" action="LoginServlet">
  	<p>用户名：<input type="text" name="username"/></p>
  	<p>密码：<input type="password" name="password"/></p>
  	<p>类别：<select name="type">
  		<option value="stu">学生</option>
  		<option value="tea">教师</option>
  		<option value="admin">管理员</option>
  	</select></p>
  	<p><input type="submit" value="登陆"></p>
  </form>
</body>
</html>