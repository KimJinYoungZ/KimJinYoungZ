<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="list.List" %>
<%@ page import="list.ListDAO" %>
<%@ page import="student.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String studentID = null;
		if (session.getAttribute("studentID") != null) {
			studentID = (String) session.getAttribute("studentID");

		}

		int listID=0;
		if(request.getParameter("listID") != null)
		{
			listID= Integer.parseInt(request.getParameter("listID"));
		}
		if(listID ==0)
		{
	  		PrintWriter script = response.getWriter();
	  		script.println("<script>");
	  		script.println("alert('유효하지 않은 글입니다.')");
	  		script.println("location.href = 'list.jsp'");
	  		
	  		script.println("</script>");
		}
		List list= new ListDAO().getLists(listID);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">전남대학교 운동 게시판</a>
		</div>

	</nav>
	<div class="container">
		<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%">글 제목</td>
						<td colspan="2"> <%=list.getListTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replace(">", "&gt;") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"> <%=list.getStudentID() %></td>
					</tr>
										<tr>
						<td>작성일자</td>
						<td><%= list.getListDate().substring(0,11) + list.getListDate().substring(11,13) +"시" +list.getListDate().substring(14,16) +"분" %></td>
					</tr>
										<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 2000px; text-align: left;"> <%=list.getListContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replace(">", "&gt;") %></td> 
					</tr>
				</tbody>
				
			</table>
			<a href="list.jsp" class="btn btn-primary">목록</a>
			<%
				if(studentID !=null && studentID.equals(list.getStudentID()))
				{
				%>
					<a href ="update.jsp?listID=<%=listID %>" class= "btn btn-primary">수정</a>
					<a href ="deleteAction.jsp?listID=<%=listID %>" class= "btn btn-primary">삭제</a>	
			<% 
				}
				
			%>
			<input type="submit" class="btn btn-primary pull-right" value="글 쓰기">
	
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>