package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ZipcodeDAO {
	
	Connection con;
    PreparedStatement psmt;
    ResultSet rs;
    
    public ZipcodeDAO(){
		try {
			Context ctx = new InitialContext(); 
			
			DataSource source = 
					(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle"); 
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		}catch(Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
	}
    
    public void close() {
    	  try {
    		  //연결을 해제하는 것이 아니고 풀에 다시 반납한다.
    	     if(rs!=null) rs.close();
    	     if(psmt!=null) psmt.close();
    	     if(con!=null) con.close();
    	  }
    	  catch(Exception e) {
    	     System.out.println("자원반납시 예외발생");
    	     e.printStackTrace();
    	  }
    }
    
    //우편번호 테이블에 시/도 가져오기
    public ArrayList<String> getSido() {
        
        ArrayList<String> sidoAddr =
        		new ArrayList<String>();
        
        String sql = " SELECT distinct sido FROM zipcode "
        		+ " WHERE 1=1 "
		        + " ORDER BY sido ASC ";
       
//        String sql = " SELECT sido FROM zipcode "
//        		+ " WHERE 1=1 "
//        		+ " GROUP BY sido "
//		        + " ORDER BY sido ASC ";
        
        try {
       
           psmt = con.prepareStatement(sql);
           rs = psmt.executeQuery();
           //실행결과를 가져오기 위해 next()를 호출한다.
           while(rs.next()) {
        	   sidoAddr.add(rs.getString(1));
           }
        }
        catch(Exception e ) {  
        }
        return sidoAddr;
     }
    
    public ArrayList<String> getGugun(String sido) {
        
        ArrayList<String> gugunAddr =
        		new ArrayList<String>();
        
        String sql = " SELECT distinct gugun FROM zipcode "
        		+ " WHERE sido=? "
		        + " ORDER BY gugun DESC ";
        
        try {
       
           psmt = con.prepareStatement(sql);
           psmt.setString(1, sido);
           rs = psmt.executeQuery();
           //실행결과를 가져오기 위해 next()를 호출한다.
           while(rs.next()) {
        	  gugunAddr.add(rs.getString(1));
           }
        }
        catch(Exception e ) {
        	e.printStackTrace();
        }
        return gugunAddr;
     }
}
