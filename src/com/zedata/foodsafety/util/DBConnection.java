package com.zedata.foodsafety.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private final String driver="com.mysql.jdbc.Driver";
	private final String url="jdbc:mysql://localhost:3306/foodsafety";
	private final String user="root";
	private final String password="root";
	private Connection conn;
    public DBConnection(){
    	try {
			Class.forName(driver);
			conn=	DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    		
    }
    
    public Connection getConnection(){
    	return this.conn;
    }
    
}
