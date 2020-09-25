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
  StuDao dao = new StuDao();
  List<Students> list= new ArrayList();
  list = dao.SelectStus();
  Iterator<Students> iter=list.iterator();//list里面接受了多条数据，所以使用迭代器一条一条取出来
%>
<table border='1' align="center">
<tr><td>学号</td><td>姓名</td><td>出生日期</td><td>邮箱</td><td>电话</td>
<td>班级</td><td>学籍状态</td><td>其他操作</td></tr>
<%
  while(iter.hasNext()){
	  Students stu=iter.next();//每迭代一次拿出来一条新闻放入news对象中
	  out.println("<tr>");
	  out.println("<td>");
	  out.println(stu.getSt_no());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(stu.getSt_name());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(stu.getSt_birthday());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(stu.getSt_Email());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(stu.getSt_phone());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(stu.getSt_classno());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(stu.getSt_roll());
	  out.println("</td>");
	  
	  out.println("<td>");
  
%>
   <a href="DeleteStuServlet?id=<%= stu.getSt_no()%>">删除用户</a>
   <a href="updatestu.jsp?id=<%= stu.getSt_no()%>">修改用户</a>

<%
 out.println("</td>");
 out.println("<tr>");
  }
%>

</table>
</body>
</html>