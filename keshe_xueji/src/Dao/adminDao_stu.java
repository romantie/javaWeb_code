package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Conn.Conn;
import entity.Students;


public class adminDao_stu {
	 public int Insertadminstu(Students stu) {
		  int rs=0;
		  try {
			  Conn dbc=new Conn();
			  Connection conn=dbc.getConn();
			  String sql_insert="insert into student(st_no,st_name,st_birthday,st_Email,st_phone,st_classno,st_roll) values(?,?,?,?,?,?,?)";
			  PreparedStatement pst=conn.prepareStatement(sql_insert);
			  pst.setString(1,stu.getSt_no());
			  pst.setString(2,stu.getSt_name());
			  pst.setString(3,stu.getSt_birthday());
			  pst.setString(4,stu.getSt_Email());
			  pst.setString(5,stu.getSt_phone());
			  pst.setString(6,stu.getSt_classno());
			  pst.setString(7,stu.getSt_roll());
			  rs = pst.executeUpdate();
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		  return rs;
	  }
}
