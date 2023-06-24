package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDAO {

	private Connection conn;

	private ResultSet rs;
	
	
	public ReservationDAO()
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
	
	public int reserve(String cid, String fid, String dates, String times)
	{
		String SQL ="INSERT INTO RESERVATION VALUES (?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cid);
			pstmt.setString(2, fid);
			pstmt.setString(3, dates);
			pstmt.setString(4, times);
			return pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public String loadcid(String studentID) {
	    String clubID = null;
	    String SQL = "SELECT clubID FROM student WHERE studentID = ?";
	    PreparedStatement pstmt;
	    
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, studentID);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            clubID = rs.getString("clubID");
	        }
	        
	        return clubID;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return null;
	}
	public String loadfid(String fName)
	{
		String fid = null;
		
		String SQL = "SELECT fid FROM exercisefacility WHERE fName = ?";
		PreparedStatement pstmt;
		try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, fName);
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
	public boolean checking2(String fid, String dates, String times)
	{
		String SQL = "SELECT * FROM reservation WHERE fid = ? AND dates = ? AND times = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fid);
			pstmt.setString(2, dates);
			pstmt.setString(3, times);
			
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
	public void print(String cid)
	{
		
	}
}
