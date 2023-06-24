<%@page import="student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="reservation.Reservation" %>
<%@ page import="reservation.ExerciseFacility" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reservation" class="reservation.Reservation" scope="page" />
<jsp:useBean id="exercisefacility" class="reservation.ExerciseFacility" scope="page" />
<jsp:setProperty name="reservation" property="fid" />
<jsp:setProperty name="exercisefacility" property="fName" />
<jsp:setProperty name="reservation" property="dates" />
<jsp:setProperty name="reservation" property="times" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>예약 처리 결과</title>
    <link rel="stylesheet" href="css/reservation.css">
</head>
<body>
    <div class="container">
        <h2>예약 처리 결과</h2>
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
	  			ReservationDAO reservationDAO = new ReservationDAO();
	  			String cid = reservationDAO.loadcid(studentID);
	  			String fid = reservationDAO.loadfid(exercisefacility.getfName());
	  			if(!reservationDAO.checking(cid))
	  			{
		  			PrintWriter script = response.getWriter();
		  			script.println("<script>");
		  			script.println("alert('이미 하나의 운동시설을 예약하였습니다.')");
		  			script.println("location.href = 'index.jsp'");
		  			
		  			script.println("</script>");
	  			}
	  			else if(!reservationDAO.checking2(fid,reservation.getDates(),reservation.getTimes()))
	  			{
		  			PrintWriter script = response.getWriter();
		  			script.println("<script>");
		  			script.println("alert('이미 예약된 장소, 시간입니다.')");
		  			script.println("location.href = 'reservation.jsp'");
		  			
		  			script.println("</script>");
	  			}
	  			else
	  			{
	  				int result = reservationDAO.reserve(cid,fid,reservation.getDates(),reservation.getTimes());
	  				if(result == -1)
	  				{

			  			PrintWriter script = response.getWriter();
			  			script.println("<script>");
			  			script.println("alert('예약에 실패하였습니다.')");
			  			script.println("location.href = 'index.jsp'");
			  			
			  			script.println("</script>");
	  				}
	  				else
	  				{
			  			PrintWriter script = response.getWriter();
			  			script.println("<script>");
			  			script.println("alert('예약이 완료되었습니다.')");
			  			script.println("location.href = 'index.jsp'");
			  			
			  			script.println("</script>");
	  				}
  					
	  			}
	  		}
		
		%>	
			
    </div>
</body>
</html>