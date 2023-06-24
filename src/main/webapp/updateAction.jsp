<%@page import="student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="list.ListDAO" %>
<%@ page import="list.List" %>
<%@ page import="java.io.PrintWriter" %>
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
  	
	int listID=0;
	if(request.getParameter("listID") != null)
	{
		listID = Integer.parseInt(request.getParameter("listID"));
	}

	
	if(listID==0)
	{
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('유효하지 않은 글입니다.')");
  		script.println("location.href = 'list.jsp'");
  		
  		script.println("</script>");
	}
	List list = new ListDAO().getLists(listID);
	if(!studentID.equals(list.getStudentID()))
	{
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('권한이 없습니다.')");
  		script.println("location.href = 'list.jsp'");
  		
  		script.println("</script>");
	}
  	
  	
  	
  	else {
  		if (request.getParameter("listTitle") == null || request.getParameter("listContent") == null
  				||request.getParameter("listTitle").equals("") || request.getParameter("listContent").equals("")) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('입력이 안된 사항이 있습니다.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				ListDAO listDAO = new ListDAO();
  				int result = listDAO.update(listID, request.getParameter("listTitle"), request.getParameter("listContent"));
  				if (result == -1) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('글 수정에 실패 했습니다.')");
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