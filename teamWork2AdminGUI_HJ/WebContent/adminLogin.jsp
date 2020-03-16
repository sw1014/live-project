<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/admin.css" rel="stylesheet">
<meta charset="UTF-8">
<title>管理员登陆</title>
</head>
<body id="adminLoginBackground">
	<div id="adminLoginDiv">
		<div id="adminLoginTitleDiv">欢迎来到管理员登陆界面 <br /> <br /></div>
		<div id="adminLoginInputDiv">
			<form action="adminVerify.jsp" method="get">
				用户名: <input type="text" name="name" /> <br />
				&nbsp;&nbsp;密码&nbsp;&nbsp;: <input type="text" name="password" /> <br />
				<input type="submit" value="登陆" class="button"/>
			</form>
		</div>
	</div>
</body>
</html>