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
   Course course = new Course();
   CourseDao dao = new CourseDao();
   course = dao.dushuju(request.getParameter("id"));

%>
<form action="UpdateCourseServlet?id=<%=request.getParameter("id") %>" method="post">
 <p>课程编号：<input type="text" name="course_no" value="<%=course.getCourse_no() %>"></p>
 <p>课程名：<input type="text" name="course_name" value="<%=course.getCourse_name()%>"></p>
 <p>课程时间：<input type="text" name="course_time" value="<%=course.getCourse_time() %>"></p>
 <p>课程地点：<input type="text" name="course_site" value="<%=course.getCourse_site() %>"></p>
 <p>课程学分：<input type="text" name="course_credit" value="<%=course.getCourse_credit() %>"></p>
 <p>任课教师：<input type="text" name="course_teacher" value="<%=course.getCourse_teacher() %>"></p>
 <p>课程类型：<input type="text" name="course_type" value="<%=course.getCourse_type() %>"></p>

 <p><input type="submit" value="提交">
    <input type="reset" value="重置">
 </p>
</form>
</body>
</html>