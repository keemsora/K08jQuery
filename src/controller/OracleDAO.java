package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OracleDAO {
	
	Connection con;
    PreparedStatement psmt;
    ResultSet rs;
    
    public OracleDAO(){
		try {
			Context initctx = new InitialContext(); 
			Context ctx = (Context)initctx.lookup("java:comp/env"); 
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle"); 
			con = source.getConnection();
		}catch(Exception e) {
			System.out.println("DB연결실패");
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
    	      }
    }
    
    public boolean isMember(String id, String pass) {
        
        //쿼리문 작성
        String sql = "SELECT COUNT(*) FROM member "
              + "WHERE id=? AND pass=?";
        int isMember = 0;
        
        try {
       
           psmt = con.prepareStatement(sql);
           //쿼리문의 인파라미터 설정(DB의 인덱스는 1부터 시작)
           psmt.setString(1, id);
           psmt.setString(2, pass);
           //쿼리문 실행 후 결과는 ResultSet객체를 통해 반환받는다.
           rs = psmt.executeQuery();
           //실행결과를 가져오기 위해 next()를 호출한다.
           rs.next();
           
           //select절의 첫 번째 결과값을 얻어오기 위해 getInt()를 사용한다.
           isMember = rs.getInt(1);
           System.out.println("affected:"+isMember);
           if(isMember==0) //회원이 아닌 경우
              return false;
        }
        catch(Exception e ) {
        	e.printStackTrace();
           return false;
           
        }
        return true;
     }	

}
