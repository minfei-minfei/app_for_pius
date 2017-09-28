package com.dh.db;

import java.sql.*;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class DBOpen {
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    //数据库链接
    public Connection getConn(String server,String dbname,String user,String pwd) throws ClassNotFoundException,SQLException,InstantiationException,IllegalAccessException{
    	Class.forName("com.mysql.jdbc.Driver"); 
    	conn= (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/ordercome?useUnicode=true&characterEncoding=utf-8","root","root");
    	return conn;
    }
    //释放链接
    public void closeAll(){
    	try{
    		if(rs!=null){
    			rs.close();
    		}
    	}catch (SQLException e){
    		e.printStackTrace();
    	}finally{
    		try{
    			if(pstmt!=null){
    				pstmt.close();
    			}
    		}catch (SQLException e){
    	    		e.printStackTrace();
    	    }finally{
    	    		try{
    	    			conn.close();
        			}catch (SQLException e){
        	    		e.printStackTrace();
        	    	}
	    	}
		}
	}
    //数据库查询
    public ResultSet executeQuery(String preparedSql,String[] param){
    	try{
    		pstmt = (PreparedStatement)conn.prepareStatement(preparedSql);
    		if(param!=null){
    			for(int i=0; i<param.length; i++){
    				pstmt.setString(i+1, param[i]);
    			}
    		}
    		rs = pstmt.executeQuery();
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return rs;
    }
    //数据库修改
    public int executeUpdate(String preparedSql, String[] param){
    	int num = 0;
    	try{
    		pstmt = (PreparedStatement)conn.prepareStatement(preparedSql);
    		if(param!=null){
    			for(int i=0; i<param.length; i++){
    				pstmt.setString(i+1, param[i]);
    			}
    		}
    		num = pstmt.executeUpdate();
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return num;
    }
}
