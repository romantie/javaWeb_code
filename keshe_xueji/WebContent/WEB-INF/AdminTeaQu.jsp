<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entity.Teachers,java.util.*,Dao.TeaDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  TeaDao dao = new TeaDao();
  List<Teachers> list= new ArrayList();
  list = dao.SelectTeas();
  Iterator<Teachers> iter=list.iterator();//list里面接受了多条数据，所以使用迭代器一条一条取出来
%>
<table border='1' align="center">
<tr><td>工号</td><td>教师姓名</td><td>性别</td><td>其他操作</td></tr>
<%
  while(iter.hasNext()){
	  Teachers tea=iter.next();
	  out.println("<tr>");
	  out.println("<td>");
	  out.println(tea.getT_no());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(tea.getT_name());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(tea.getT_sex());
	  out.println("</td>");
	  out.println("<td>");
  
%>
   <a href="DeleteTeaServlet?id=<%= tea.getId()%>">删除用户</a>
   <a href="updatetea.jsp?id=<%= tea.getId()%>">修改用户</a>

<%
 out.println("</td>");
 out.println("<tr>");
  }
%>

</table>
</body>
</html>