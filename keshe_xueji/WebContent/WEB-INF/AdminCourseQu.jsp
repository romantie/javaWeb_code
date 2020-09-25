<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entity.Course,java.util.*,Dao.CourseDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  CourseDao dao = new CourseDao();
  List<Course> list= new ArrayList();
  list = dao.SelectStus();
  Iterator<Course> iter=list.iterator();//list里面接受了多条数据，所以使用迭代器一条一条取出来
%>
<table border='1' align="center">
<tr>
	<td>课程号</td>
	<td>课程名</td>
	<td>上课时间</td>
	<td>上课地点</td>
	<td>课程学分</td>
	<td>任课教师</td>
	<td>课程类型</td>
	<td>其他操作</td>
</tr>
<%
  while(iter.hasNext()){
	  Course course = iter.next();//每迭代一次拿出来一条新闻放入news对象中
	  out.println("<tr>");
	  out.println("<td>");
	  out.println(course.getCourse_no());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(course.getCourse_name());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(course.getCourse_time());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(course.getCourse_site());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(course.getCourse_credit());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(course.getCourse_teacher());
	  out.println("</td>");
	  
	  out.println("<td>");
	  out.println(course.getCourse_type());
	  out.println("</td>");
	  
	  out.println("<td>");
  
%>
   <a href="DeleteCourseServlet?id=<%= course.getId()%>">删除课程</a>
   <a href="updatecourse.jsp?id=<%= course.getId()%>">修改课程</a>

<%
 out.println("</td>");
 out.println("<tr>");
  }
%>

</table>
</body>
</html>