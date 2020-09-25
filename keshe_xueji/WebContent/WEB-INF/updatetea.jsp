<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entity.Teachers,java.util.*,Dao.TeaDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
   Teachers tea = new Teachers();
   TeaDao dao = new TeaDao();
   tea = dao.dushuju(request.getParameter("id"));

%>
<form action="UpdateTeaServlet?id=<%=request.getParameter("id")%>" method="post">
 <p>工号：<input type="text" name="t_no" value="<%= tea.getT_no() %>"></p>
 <p>教师姓名：<input type="text" name="t_name" value="<%=tea.getT_name() %>"></p>
 <p>性别：<input type="text" name="t_sex" value="<%=tea.getT_sex() %>"></p>
 <p><input type="submit" value="提交">
    <input type="reset" value="重置">
 </p>
</form>
</body>
</html>