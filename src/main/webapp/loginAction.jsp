<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="student.studentDAO" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student" class ="student.Student" scope="page" />
<jsp:setProperty name="student" property ="studentID"/>
<jsp:setProperty name="student" property ="studentPassword"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>로그인</title>
    </head>
    <body>
		<%
		
			String studentID = null;
			String clubName = null;
			if(session.getAttribute("studentID") !=null)
			{
				studentID = (String) session.getAttribute("studentID");
			}
			
			
			studentDAO StudentDAO = new studentDAO();
			int result = StudentDAO.login(student.getStudentID(), student.getStudentPassword());
			
			if(result == 1)
			{
				session.setAttribute("studentID", student.getStudentID());
				session.setAttribute("clubName", student.getClubName());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");	
			}
			else if (result==0)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result==-1)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result ==-2)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스에 오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		%>
    </body>
</html>

