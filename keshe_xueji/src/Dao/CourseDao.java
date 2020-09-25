package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conn.Conn;
import entity.Course;
import entity.Students;
import entity.Teachers;

public class CourseDao {
	public List<Course> SelectStus() {//selectDao层把数据从数据库中拿到
		  List<Course> list=new ArrayList<Course>();//News是指News.java
		  ResultSet rs=null;
		  try {
			  Conn dbc=new Conn();
			  Connection conn=dbc.getConn();
			  String sql_select="select * from course";
			  PreparedStatement pst=conn.prepareStatement(sql_select);//准备执行SQL语句
			  rs = pst.executeQuery();//记得这句话是添加数据库
			  while(rs.next()) {
				  Course course=new Course(
						  rs.getString("id"),
						  rs.getString("course_no"),
						  rs.getString("course_name"),
						  rs.getString("course_time"),
						  rs.getString("course_site"),
						  rs.getString("course_credit"),
						  rs.getString("course_teacher"),
						  rs.getString("course_type"));
				  list.add(course);
			  }
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
	     return list;
	  }
	
	public int delete(Course course) {
		 int rs=0;
		Conn dbc = new Conn();
		Connection conn = dbc.getConn();
	    String delete_sql = "delete from course where id=?";
	    PreparedStatement pst;
		try {
			pst = conn.prepareStatement(delete_sql);
			pst.setString(1, course.getId());
			rs = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    return rs;
	 }
	 
	 
public Course dushuju(String id) {
	Course course=new Course();
	ResultSet rs=null;
	Conn dbc=new Conn();
	Connection conn=dbc.getConn();
	  String sql_select="select * from course where id=?";
	  
	  try {
	    PreparedStatement pst=conn.prepareStatement(sql_select);//准备执行SQL语句
	    pst.setString(1, id);
		rs = pst.executeQuery();//从数据库里面查询出来还不确定是否查出来，结果未知
		if(rs.next()) {
			course=new Course(
					  rs.getString("id"),
					  rs.getString("course_no"),
					  rs.getString("course_name"),
					  rs.getString("course_time"),
					  rs.getString("course_site"),
					  rs.getString("course_credit"),
					  rs.getString("course_teacher"),
					  rs.getString("course_type")
					  );
			
		}else {
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}//记得这句话是添加数据库
	return course;
}

public int xiugai(Course course) {
	int rs=0;
	  try {
		  Conn dbc=new Conn();
		  Connection conn=dbc.getConn();
		  String sql_insert=
				  "update course set course_no=?,course_name=?,course_time=?,course_site=?,course_credit=?,course_teacher=?,course_type=?"
		  		+ " where id=?";
		  PreparedStatement pst=conn.prepareStatement(sql_insert);
		  pst.setString(1,course.getCourse_no());
		  pst.setString(2,course.getCourse_name());
		  pst.setString(3,course.getCourse_time());
		  pst.setString(4,course.getCourse_site());
		  pst.setString(5,course.getCourse_credit());
		  pst.setString(6,course.getCourse_teacher());
		  pst.setString(7,course.getCourse_type());
		  pst.setString(8,course.getId());
		  rs = pst.executeUpdate();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return rs;
}

public int Insert(Course course) {
	  int rs=0;
	  try {
		  Conn dbc=new Conn();
		  Connection conn=dbc.getConn();
		  String sql_insert="insert into teacher(course_no,course_name,course_time,course_site,course_credit,course_teacher,course_type) values(?,?,?,?,?,?,?)";
		  PreparedStatement pst=conn.prepareStatement(sql_insert);
		  pst.setString(1,course.getCourse_no());
		  pst.setString(2,course.getCourse_name());
		  pst.setString(3,course.getCourse_time());
		  pst.setString(4,course.getCourse_site());
		  pst.setString(5,course.getCourse_credit());
		  pst.setString(6,course.getCourse_teacher());
		  pst.setString(7,course.getCourse_type());
		  rs = pst.executeUpdate();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return rs;
}
}
