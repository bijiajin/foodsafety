package com.zedata.foodsafety.util;

import java.sql.Connection;



public class Factory {
    public static Connection getDBConnection(){
    	DBConnection db=new DBConnection();
    	
    	return db.getConnection();
    }
    
   
}
