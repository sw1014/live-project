<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/admin.css" rel="stylesheet">
<meta charset="UTF-8">
<title>管理员界面</title>
</head>
<body id="adminBodyBackground">
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="">设置预约时间</a> <a href="">设置预约上限<a>
				<a href="">设置口罩总数<a><a href="">导出中签名单<a>
			</nav>
		</div>
		<div id="setAppointmentTimeDiv"><!-- 设置预约时间 -->
		<div class="subTitle">设置预约时间</div>
		<div id="setAppointmentTimeInput">
		<form action="test.jsp" method="get">
				开放时间: <input type="text" name="startTime" /> <br />
				截止时间: <input type="text" name="endTime" /> <br />
				<input type="submit" value="设置" class="button"/>
			</form>
			</div>
			<div class="note">输入格式为year-month-day 如 2020-02-02</div>
		</div>
		<div id="setAppointmentLimitDiv"><!-- 设置预约上限 -->
		<div class="subTitle">设置预约上限</div>
		<div id="setAppointmentLimitInput">
		<form action="test.jsp" method="get">
				最高可预约数量: <input type="text" name="startTime" /> <br />
				<input type="submit" value="设置" class="button"/>
			</form>
			</div>
		</div>
		<div id="setMaskNumDiv"><!-- 设置口罩总数 -->
		<div class="subTitle">设置口罩总数</div>
		<div id="setMaskNumInput">
		<form action="test.jsp" method="get">
				最高可预约数量: <input type="text" name="startTime" /> <br />
				<input type="submit" value="设置" class="button"/>
			</form>
			</div>
		</div>
		
		<div id="exportLuckyListDiv"><!-- 导出中签名单 -->
		<div class="subTitle">导出中签名单</div>
		</div>
	</div>
</body>
</html>