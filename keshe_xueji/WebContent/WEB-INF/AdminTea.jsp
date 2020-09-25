<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="InsertteaServlet" method="post">
 <p>工号：<input type="text" name="t_no"></p>
 <p>教师姓名：<input type="text" name="t_name"></p>
 <p>性别：<input type="radio" name="t_sex" value="men">男
        <input type="radio" name="t_sex" value="women">女
 </p>
 <p><input type="submit" value="提交">
    <input type="reset" value="重置">
 </p>
</form>
</body>
</html>