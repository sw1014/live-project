<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户名或密码错误</title>
</head>
<body>
	<%
		String nameString = request.getParameter("name");
		String passwordString = request.getParameter("password");
		if (nameString.equals("admin") && passwordString.equals("123456")) {
	%>
	<jsp:forward page="admin.jsp"></jsp:forward>
	<%
		} else {
	%>
	<form action="adminLogin.jsp">
	<h1>用户名或密码错误</h1>
	<button type="submit">返回登陆界面 </button>
	</form>
	<%
		}
	%>
</body>
</html>