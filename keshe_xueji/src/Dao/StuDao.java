package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import Conn.Conn;
import entity.Students;

public class StuDao {
	 public List<Students> SelectStus() {//selectDao层把数据从数据库中拿到
		  List<Students> list=new ArrayList<Students>();//News是指News.java
		  ResultSet rs=null;
		  try {
			  Conn dbc=new Conn();
			  Connection conn=dbc.getConn();
			  String sql_select="select * from student limit 30";
			  PreparedStatement pst=conn.prepareStatement(sql_select);//准备执行SQL语句
			  rs = pst.executeQuery();//记得这句话是添加数据库
			  while(rs.next()) {
				  Students stu=new Students(rs.getString("st_no"),rs.getString("st_name"),
						  rs.getString("st_birthday"),rs.getString("st_Email"),rs.getString("st_phone"),
						  rs.getString("st_classno"),rs.getString("st_roll"));
				  list.add(stu);
			  }
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
	     return list;
	  }
	 public int delete(Students stu) {
		 int rs=0;
		Conn dbc = new Conn();
		Connection conn = dbc.getConn();
	    String delete_sql = "delete from student where st_no=?";
	    PreparedStatement pst;
		try {
			pst = conn.prepareStatement(delete_sql);
			pst.setString(1, stu.getSt_no());
			rs = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    return rs;
	 }
	 
	 
public Students dushuju(String st_no) {
	Students stu=new Students();
	ResultSet rs=null;
	Conn dbc=new Conn();
	Connection conn=dbc.getConn();
	  String sql_select="select * from student where st_no=?";
	  
	  try {
	    PreparedStatement pst=conn.prepareStatement(sql_select);//准备执行SQL语句
	    pst.setString(1, st_no);
		rs = pst.executeQuery();//从数据库里面查询出来还不确定是否查出来，结果未知
		if(rs.next()) {
			stu=new Students(rs.getString("st_no"),rs.getString("st_name"),
					  rs.getString("st_birthday"),rs.getString("st_Email"),rs.getString("st_phone"),
					  rs.getString("st_classno"),rs.getString("st_roll"));
			
		}else {
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}//记得这句话是添加数据库
	return stu;
}

public int xiugai(Students stu) {
	int rs=0;
	  try {
		  Conn dbc=new Conn();
		  Connection conn=dbc.getConn();
		  String sql_insert="update student set st_no=?,st_name=?,st_birthday=?,st_Email=?,st_phone=?,st_classno=?,st_roll=?"
		  		+ " where st_no=?";
		  PreparedStatement pst=conn.prepareStatement(sql_insert);
		  pst.setString(1,stu.getSt_no());
		  pst.setString(2,stu.getSt_name());
		  pst.setString(3,stu.getSt_birthday());
		  pst.setString(4,stu.getSt_Email());
		  pst.setString(5,stu.getSt_phone());
		  pst.setString(6,stu.getSt_classno());
		  pst.setString(7,stu.getSt_roll());
		  pst.setString(8,stu.getSt_no());
		  rs = pst.executeUpdate();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return rs;
}
}
