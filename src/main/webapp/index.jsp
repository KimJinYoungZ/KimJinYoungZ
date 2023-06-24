<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>전남대학교 운동시설 예약 시스템</title>
        <link rel="stylesheet" href="css/index.css" />
    </head>
    <body>
    	
        <div id="header">
            <a href="https://sel.jnu.ac.kr" target="_blank"> 
                <img src="images/전남대학교 로고.png">
            </a>
            <div id="loginInfo">
                
            </div>
        </div>

        <br>
        <hr class="six">
        
        <h1>전남대학교 운동시설 예약 시스템</h1>

        <h3>Sports Facilities Reservation System</h3>

        <p><b>!예약은 매주 월요일 오전 00:00에 초기화됩니다!</b></p>
        <button type="button" class="navyBtn" onClick="location.href='reservation.jsp'">예약</button>
        <br>
        <br>
        <button type="button" class="navyBtn" onClick="location.href='check.jsp'">예약내역확인</button>
        <br> <br>
		<button type="button" class="navyBtn" onClick="location.href='list.jsp'">게시판</button>
        
    </body>      
</html>
