<%@page import="student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="reservation.Reservation" %>
<%@ page import="reservation.ExerciseFacility" %>
<%@ page import="reservation.CheckDAO" %>
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
    <meta charset="UTF-8">
    <title>개인 예약 내역</title>
    <link rel="stylesheet" href="css/index.css" />
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
        }
        h1 {
            text-align: center;
            margin-top: 30px;
        }
        .reservation-card {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .reservation-card h2 {
            font-size: 18px;
            margin-top: 0;
            margin-bottom: 10px;
        }
        .reservation-card p {
            margin: 0;
            font-size: 14px;
        }
        .cancel-button {
            display: inline-block;
            padding: 5px 10px;
            background-color: #ff0000;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <h1>개인 예약 내역</h1>
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
	  			CheckDAO checkDAO = new CheckDAO();
	  			String clubID = reservationDAO.loadcid(studentID);
	  			if(checkDAO.checking(clubID))
	  			{
		  			PrintWriter script = response.getWriter();
		  			script.println("<script>");
		  			script.println("alert('예약 내역이 없습니다.')");
		  			script.println("location.href = 'index.jsp'");
		  			
		  			script.println("</script>");
	  			}
	  			else
	  			{
		  			String fid = checkDAO.loadfid(clubID);
		  			String Dates = checkDAO.loadDates(clubID);
		  			String Times = checkDAO.loadTimes(clubID);
		  			String fName = checkDAO.loadfName(fid);
	  				%>
	  				<div class="reservation-card">
                    <h2>예약 정보</h2>
                    <p><strong>예약 일자:</strong><%=Dates%></p>
                    <p><strong>예약 시간:</strong><%=Times %> </p>
                    <p><strong>예약 시설:</strong><%=fName %></p>
                    <p><strong>예약자 학번:</strong><%=studentID %> </p>
                
                </div>
                <% 
	  			}
	  		}
	  		%>
					<a href ="deletereserve.jsp" class= "navyBtn">예약취소</a>
       
    </div>
</body>
</html>
