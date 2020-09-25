<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<style>
	body{
		
	}
</style>
<body>
<form action="admin_stuServlet" method="post">
 <p>学号：<input type="text" name="st_no"></p>
 <p>姓名：<input type="text" name="st_name"></p>
 <p>出生日期：<input type="text" name="st_birthday"></p>
 <p>电子邮件：<input type="text" name="st_Email"></p>
 <p>联系方式：<input type="text" name="st_phone"></p>
 <p>班级：<input type="text" name="st_classno"></p>
 <p>学籍状态：<input type="text" name="st_roll"></p>
 <p><input type="submit" value="提交">
    <input type="reset" value="重置">
 </p>
</form>
</body>
</html>