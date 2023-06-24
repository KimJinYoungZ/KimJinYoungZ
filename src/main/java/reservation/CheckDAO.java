package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckDAO {

	private Connection conn;

	private ResultSet rs;
	
	
	public CheckDAO()
	{
		try 
		{
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1230";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String loadfid(String cid) {
	    String fid = null;
	    String SQL = "SELECT fid FROM reservation WHERE cid = ?";
	    PreparedStatement pstmt;
	    
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, cid);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            fid = rs.getString("fid");
	        }
	        
	        return fid;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return null;
	}
	public String loadDates(String cid) {
	    String dates = null;
	    String SQL = "SELECT Dates FROM reservation WHERE cid = ?";
	    PreparedStatement pstmt;
	    
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, cid);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            dates = rs.getString("Dates");
	        }
	        
	        return dates;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return null;
	}
	public String loadTimes(String cid) {
	    String Times = null;
	    String SQL = "SELECT times FROM reservation WHERE cid = ?";
	    PreparedStatement pstmt;
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, cid);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            Times = rs.getString("times");
	        }
	        return Times;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return null;
	}
	public String loadfName(String fid) {
	    String fName = null;
	    String SQL = "SELECT fName FROM exercisefacility WHERE fid = ?";
	    PreparedStatement pstmt;
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, fid);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            fName = rs.getString("fName");
	        }
	        return fName;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return null;
	}
	public boolean checking(String cid)
	{
		String SQL = "SELECT * FROM reservation WHERE cid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cid);
			
			rs= pstmt.executeQuery();
			if(rs.next()) 
			{
				return false;
						
			}
					
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return true;
	}
	public int delete(String cid)
	{
		String SQL ="DELETE FROM reservation WHERE cid = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, cid);
			return pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}