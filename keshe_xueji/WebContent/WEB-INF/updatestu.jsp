<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entity.Students,java.util.*,Dao.StuDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
   Students stu = new Students();
   StuDao dao = new StuDao();
   stu = dao.dushuju(request.getParameter("id"));

%>
<form action="UpdateStu" method="post">
 <p>学号：<input type="text" name="st_no" value="<%=stu.getSt_no() %>"></p>
 <p>姓名：<input type="text" name="st_name" value="<%=stu.getSt_name() %>"></p>
 <p>出生日期：<input type="text" name="st_birthday" value="<%=stu.getSt_birthday() %>"></p>
 <p>电子邮件：<input type="text" name="st_Email" value="<%=stu.getSt_Email() %>"></p>
 <p>联系方式：<input type="text" name="st_phone" value="<%=stu.getSt_phone() %>"></p>
 <p>班级：<input type="text" name="st_classno" value="<%=stu.getSt_classno() %>"></p>
 <p>学籍状态：<input type="text" name="st_roll" value="<%=stu.getSt_roll() %>"></p>
 <p><input type="submit" value="提交">
    <input type="reset" value="重置">
 </p>
</form>
</body>
</html>