<%@page import="student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="list.ListDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="list" class="list.List" scope="page" />
<jsp:setProperty name="list" property="listTitle" />
<jsp:setProperty name="list" property="listContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
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
  	} else {
  		if (list.getListTitle() == null || list.getListContent() == null) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('입력이 안된 사항이 있습니다.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				ListDAO listDAO = new ListDAO();
  				int result = listDAO.write(list.getListTitle(), studentID, list.getListContent());
  				if (result == -1) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('글쓰기에 실패 했습니다.')");
  					script.println("history.back()");
  					script.println("</script>");
  				} else {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("location.href = 'list.jsp'");
  					script.println("</script>");
  				}
  			}
  	}		
  %>
</body>
</html>