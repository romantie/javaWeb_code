package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conn.Conn;
import entity.Students;
import entity.Teachers;

public class TeaDao {
	 public int Insertadmintea(Teachers tea) {
		  int rs=0;
		  try {
			  Conn dbc=new Conn();
			  Connection conn=dbc.getConn();
			  String sql_insert="insert into teacher(t_no,t_name,t_sex) values(?,?,?)";
			  PreparedStatement pst=conn.prepareStatement(sql_insert);
			  pst.setString(1,tea.getT_no());
			  pst.setString(2,tea.getT_name());
			  pst.setString(3,tea.getT_sex());
			  rs = pst.executeUpdate();
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		  return rs;
	  }
	 
	 public List<Teachers> SelectTeas() {//selectDao层把数据从数据库中拿到
		  List<Teachers> list=new ArrayList<Teachers>();//News是指News.java
		  ResultSet rs=null;
		  try {
			  Conn dbc=new Conn();
			  Connection conn=dbc.getConn();
			  String sql_select="select * from teacher limit 30";
			  PreparedStatement pst=conn.prepareStatement(sql_select);//准备执行SQL语句
			  rs = pst.executeQuery();//记得这句话是添加数据库
			  while(rs.next()) {
				  Teachers tea=new Teachers();
				  tea.setId(rs.getString("id"));
				  tea.setT_no(rs.getString("t_no"));
				  tea.setT_name(rs.getString("t_name"));
				  tea.setT_sex(rs.getString("t_sex"));
				  list.add(tea);
			  }
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
	     return list;
	  }
	 
	 public Teachers dushuju(String id) {
		 Teachers tea=new Teachers();
			ResultSet rs=null;
			Conn dbc=new Conn();
			Connection conn=dbc.getConn();
			  String sql_select="select * from teacher where id=?";
			  
			  try {
			    PreparedStatement pst=conn.prepareStatement(sql_select);//准备执行SQL语句
			    pst.setString(1, id);
				rs = pst.executeQuery();//从数据库里面查询出来还不确定是否查出来，结果未知
				if(rs.next()) {
					tea=new Teachers();
					tea.setId(rs.getString("id")); 
					tea.setT_no(rs.getString("t_no"));
					tea.setT_name(rs.getString("t_name"));
					tea.setT_sex(rs.getString("t_sex"));
					
				}else {
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return tea;
		}
	 
	 public int xiugai(Teachers tea) {
			int rs=0;
			  try {
				  Conn dbc=new Conn();
				  Connection conn=dbc.getConn();
				  String sql_insert="update teacher set t_no=?,t_name=?,t_sex=? where id=?";
				  PreparedStatement pst=conn.prepareStatement(sql_insert);
				  pst.setString(1,tea.getT_no());
				  pst.setString(2,tea.getT_name());
				  pst.setString(3,tea.getT_sex());
				  pst.setString(4,tea.getId());
				  System.out.println(pst);
				  rs = pst.executeUpdate();
			  }catch(Exception e) {
				  e.printStackTrace();
			  }
			  return rs;
		}
	 public int delete(Teachers tea) {
		 int rs=0;
		Conn dbc = new Conn();
		Connection conn = dbc.getConn();
	    String delete_sql = "delete from teacher where id=?";
	    PreparedStatement pst;
		try {
			pst = conn.prepareStatement(delete_sql);
			pst.setString(1, tea.getId());
			rs = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    return rs;
	 }
	 
	
}
