package Conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conn {
  public Connection conn;
  public Connection getConn() {
	
	  try {
		  
		  Class.forName("com.mysql.jdbc.Driver");
		  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/xuejiguanli?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true", "root", "123456");
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return conn;
  }
}
