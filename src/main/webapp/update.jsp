<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="list.List" %>
<%@ page import="list.ListDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>전남대학교 운동 게시판</title>
</head>
<body>
	<%
		String studentID = null;
		if (session.getAttribute("studentID") != null) {
			studentID = (String) session.getAttribute("studentID");

		
			
		}
		if(studentID==null)
		{
	  		PrintWriter script = response.getWriter();
	  		script.println("<script>");
	  		script.println("alert('로그인을 하세요.')");
	  		script.println("location.href = 'login.jsp'");
	  		
	  		script.println("</script>");
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
		List list = new ListDAO().getLists(listID);
		if(!studentID.equals(list.getStudentID()))
		{
	  		PrintWriter script = response.getWriter();
	  		script.println("<script>");
	  		script.println("alert('권한이 없습니다.')");
	  		script.println("location.href = 'list.jsp'");
	  		
	  		script.println("</script>");
		}
		
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
		<form method="post" action="updateAction.jsp?listID=<%= listID %>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="listTitle" maxlength="50" value="<%= list.getListTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="listContent" maxlength="2048" style="height: 350px;"><%= list.getListContent() %></textarea></td>
		
					</tr>
				</tbody>
				
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글 수정">
		</form>

			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>