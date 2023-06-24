<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="list.ListDAO" %>
<%@ page import="list.List" %>
<%@ page import="java.util.ArrayList" %>
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
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					
						ListDAO listDAO= new ListDAO();
					ArrayList<List> lists = listDAO.getList(pageNumber);
				
					for(int i =0; i< lists.size(); i++) {
					%>
					<tr>
						<td><%= lists.get(i).getListID() %></td>
						<td> <a href= "view.jsp?listID=<%= lists.get(i).getListID() %>"><%= lists.get(i).getListTitle( )%> </a></td>
						<td><%= lists.get(i).getStudentID() %></td>
						<td><%= lists.get(i).getListDate().substring(0,11) + lists.get(i).getListDate().substring(11,13) +"시" +lists.get(i).getListDate().substring(14,16) +"분" %></td>
					

					</tr>
					<% 
					}					
					%>
					
					

				</tbody>
			</table>
			<%
				if(pageNumber !=1)
				{
			%>
					<a href="list.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-succes btn-arrow-left>">이전</a>
			<%
				}
			%>
			<%
				if(listDAO.nextPage(pageNumber))
				{
			%>
					<a href="list.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-succes btn-arrow-left>">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>