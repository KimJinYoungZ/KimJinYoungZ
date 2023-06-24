<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전남대학교 운동시설 예약 시스템</title>
    <link rel="stylesheet" href="css/reservation.css">
    <style>
        .styled-select select {
            background: transparent;
            width: 100%;
            padding: 5px;
            font-size: 16px;
            line-height: 1;
            border: 0;
            border-radius: 0;
            height: 34px;
            -webkit-appearance: none;
            color: #555555;
            outline: none;
        }

        .styled-select {
            width: 100%;
            overflow: hidden;
            position: relative;
            border-radius: 0;
            border: 1px solid #ccc;
            background-color: #f2f2f2;
            background-image: linear-gradient(45deg, transparent 50%, #555555 50%),
                linear-gradient(135deg, #555555 50%, transparent 50%),
                linear-gradient(to right, #ccc, #ccc);
            background-position: calc(100% - 20px) calc(1em + 2px),
                calc(100% - 15px) calc(1em + 2px), 100% 0;
            background-size: 5px 5px, 5px 5px, 2.5em 2.5em;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>운동시설 예약 시스템</h2>
        <form method="post" action="reservationAction.jsp">
            <div class="styled-select">
                <label for="fName">운동시설:</label>
                <select name="fName" id="fName">
                    <option value="" disabled selected hidden>Choose Facility</option>
                    <option value="풋살장A">풋살장A</option>
                    <option value="풋살장B">풋살장B</option>
                    <option value="대운동장">대운동장</option>
                    <option value="테니스A">테니스A</option>
                    <option value="테니스B">테니스B</option>
                    <option value="배드민턴A">배드민턴A</option>
                    <option value="배드민턴B">배드민턴B</option>
                </select>
            </div>
            <div class="styled-select">
                <label for="dates">날짜:</label>
                <select name="dates" id="dates">
                    <option value="" disabled selected hidden>Choose Date</option>
                    <% 
                        java.time.LocalDate startDate = java.time.LocalDate.now().with(java.time.DayOfWeek.MONDAY);
                        for (int i = 0; i < 7; i++) {
                            String optionDate = startDate.plusDays(i).toString();
                            %>
                            <option value="<%= optionDate %>"><%= optionDate %></option>
                            <%
                        }
                    %>
                </select>
            </div>
            <div class="styled-select">
                <label for="times">시간:</label>
                <select name="times" id="times">
                    <option value="" disabled selected hidden>Choose Time</option>
                    <option value="08:00">08:00</option>
                    <option value="10:00">10:00</option>
                    <option value="12:00">12:00</option>
                    <option value="14:00">14:00</option>
                    <option value="16:00">16:00</option>
                    <option value="18:00">18:00</option>
                    <option value="20:00">20:00</option>
                    <option value="22:00">22:00</option>
                </select>
            </div>

            <input type="submit" value="예약하기" class="navyBtn">
        </form>
    </div>
</body>
</html>
