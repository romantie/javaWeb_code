<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entity.Course,java.util.*,Dao.CourseDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="InsertCourseServlet" method="post">
 <p>课程编号：<input type="text" name="course_no" ></p>
 <p>课程名：<input type="text" name="course_name" ></p>
 <p>课程时间：<input type="text" name="course_time" ></p>
 <p>课程地点：<input type="text" name="course_site" ></p>
 <p>课程学分：<input type="text" name="course_credit" ></p>
 <p>任课教师：<input type="text" name="course_teacher" ></p>
 <p>课程类型：<input type="text" name="course_type" ></p>

 <p><input type="submit" value="提交">
    <input type="reset" value="重置">
 </p>
</form>
</body>
</html>