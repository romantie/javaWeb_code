package Dao;

import java.sql.*;
import Conn.Conn;
import User.User;

public class LoginDao {
	public int userlogin(User user) throws SQLException {
		ResultSet res = null;
		try {
			Conn dbc = new Conn();
			Connection conn = dbc.getConn();
			String loginSql = "select * from user where username=? and password=? and type=?";
			PreparedStatement pst = conn.prepareStatement(loginSql);
			pst.setString(1,user.getUsername());
			pst.setString(2,user.getPassword());
			pst.setString(3,user.getType());
			res = pst.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(res.next()) {
			return 1;
		}
		else {
			return 0;
		}
	
	}
}
