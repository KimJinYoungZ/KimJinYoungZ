package list;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import student.Student;

public class ListDAO {
	private Connection conn;

	private ResultSet rs;
	
	
	public ListDAO()
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
	
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			if(rs.next()) 
			{
				return rs.getString(1);
			}
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		String SQL = "SELECT listID FROM list ORDER BY listID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			if(rs.next()) 
			{
				return rs.getInt(1)+1;
			}
			return 1; //첫번째 게시물일 경우
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String listTitle, String studentID, String listContent)
	{
		String SQL ="INSERT INTO LIST VALUES (?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, listTitle);
			pstmt.setString(3, studentID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, listContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}

	
	public ArrayList<List> getList(int pageNumber)
	{
		String SQL = "SELECT * FROM LIST WHERE listID < ? AND listAvailable =1 ORDER BY listID DESC LIMIT 10";
		ArrayList<List> lists = new ArrayList<List>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()- (pageNumber -1 )*10);
			
			rs= pstmt.executeQuery();
			while(rs.next()) 
			{
				List list = new List();
				
				list.setListID(rs.getInt(1));
				list.setListTitle(rs.getString(2));
				list.setStudentID(rs.getString(3));
				list.setListDate(rs.getString(4));
				list.setListContent(rs.getString(5));
				list.setListAvailable(rs.getInt(6));
				lists.add(list);
				
			}
					
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return lists;
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "SELECT * FROM LIST WHERE listID < ? AND listAvailable =1 ORDER BY listID DESC LIMIT 10";
		ArrayList<List> lists = new ArrayList<List>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()- (pageNumber -1 )*10);
			
			rs= pstmt.executeQuery();
			if(rs.next()) 
			{

				return true;
			}
					
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public List getLists(int listID)
	{
		String SQL = "SELECT * FROM LIST WHERE listID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, listID);
			
			rs= pstmt.executeQuery();
			if(rs.next()) 
			{

				List list = new List();
				
				list.setListID(rs.getInt(1));
				list.setListTitle(rs.getString(2));
				list.setStudentID(rs.getString(3));
				list.setListDate(rs.getString(4));
				list.setListContent(rs.getString(5));
				list.setListAvailable(rs.getInt(6));
				
				return list;
						
			}
					
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public int update(int listID, String listTitle, String listContent)
	{
		String SQL = "UPDATE LIST SET listTitle = ?, listContent = ? WHERE listID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, listTitle);
			pstmt.setString(2, listContent);
			pstmt.setInt(3, listID);

			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public int delete(int listID)
	{
		String SQL ="UPDATE LIST SET listAvailable = 0 WHERE listID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, listID);
			return pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
