<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <link rel="stylesheet" href="css/login-wrapper.css" />
</head>
<body>
    <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="loginAction.jsp" id="login-form">
            <input type="text" name="studentID" placeholder="StudentID">
            <input type="password" name="studentPassword" placeholder="Password">

            <input type="submit" class="btn btn-primary form-control" value="로그인">
        </form>
    </div>
</body>
</html>