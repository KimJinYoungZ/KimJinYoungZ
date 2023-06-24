<%@page import="student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reservation.CheckDAO" %>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="reservation.Reservation" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>전남대학교 운동 게시판</title>
</head>
<body>
  <%
  	String studentID = null;
  	
  	if (session.getAttribute("studentID") != null) {
  		studentID = (String) session.getAttribute("studentID");
  	}
  	if (studentID == null) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('로그인을 하세요.')");
  		script.println("location.href = 'login.jsp'");
  		
  		script.println("</script>");
  	} 
  	
  	else
  	{
  		CheckDAO checkDAO = new CheckDAO();
  		ReservationDAO reservationDAO = new ReservationDAO();
  		String cid = reservationDAO.loadcid(studentID);
  		int result = checkDAO.delete(cid);
  		if(result==-1)
  		{
  	  		PrintWriter script = response.getWriter();
  	  		script.println("<script>");
  	  		script.println("alert('예약 취소에 실패하였습니다.')");
  	  		script.println("location.href = 'index.jsp'");
  	  		
  	  		script.println("</script>");
  		}
  		else
  		{
  	  		PrintWriter script = response.getWriter();
  	  		script.println("<script>");
  	  		script.println("alert('예약 취소 되었습니다.')");
  	  		script.println("location.href = 'index.jsp'");
  	  		
  	  		script.println("</script>");
  		}
  	}
	
  			
  %>
</body>
</html>