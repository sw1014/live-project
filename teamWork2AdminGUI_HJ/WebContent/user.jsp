<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/information.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>口罩预约平台</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background-color: rgba(0, 191, 191, 1);
}

.btn {
	cursor: pointer;
	border-width: 0px;
	margin-top: 30px;
	width: 400px;
	height: 100px;
	border-radius: 15px;
	font-size: 20px;
}

.btn:hover {
	color: white;
	background-color: #0489B1
}

#btn1 /*首页的两个按钮 */ {
	width: 400px;
	height: 300px;
	margin: 0 auto;
	position: relative;
	top: 50%;
	margin-top: -150px;
}

.btn2 /* 开始预约、结束预约按钮*/ {
	color: white;
	background-color: rgba(0, 191, 191, 1);
	width: 100px;
	height: 40px;
	border-radius: 10px;
}

.form /*表单格式设置*/ {
	margin-top: 5px;
}
</style>
</head>
<body>
	<div id="btn1">
		<button class="btn" data-toggle="modal" data-target="#myModal"
			id="orderButton">口罩预约购买</button>
		<button type="button" class="btn" id="search">中签结果查询</button>
	</div>
	<%
		String date = (String) session.getAttribute("date");
		if (date == null) {
			session.setAttribute("date", "2020-03-15");
			date= "2020-03-15";
		}
		String situation = (String) session.getAttribute("situation");
		if (situation == null) {
			session.setAttribute("situation", "预约中～～");
			situation= "预约中～～";
		}
	%>
	<div style="text-align: center;">
		<p id="situation"><%=situation %></p>
		<p><%=date%>
		</p>
	</div>
	<div>
		<button id="start">开始新的预约</button>
		<button id="end">结束当前预约</button>
	</div>
	<script type="text/javascript">
		var search = document.getElementById("search");
		search.onclick = function() {
			window.location.href = "searchServlet";
		}
		var situation = '<%=situation%>';
		var start = document.getElementById("start");
		if(situation=="预约中～～"){
			document.getElementById("orderButton").disabled = false;
			document.getElementById("start").disabled = true;
		}
		else {
			document.getElementById("orderButton").disabled = true;
			document.getElementById("end").disabled = true;
		}
		start.onclick = function() {
			document.getElementById("orderButton").disabled = false;
			situation.value = "预约中";
			$("p").text("预约中～～");
			window.location.href = "addDateServlet?situation=";
		}
		var end = document.getElementById("end");
		end.onclick = function() {
			document.getElementById("orderButton").disabled = true;
			situation.value = "暂停预约";
			$("p").text("暂停预约～～");
			window.location.href = "addDateServlet?situation=";
		}
	</script>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">登记信息</h4>
				</div>
				<div class="modal-body"
					style="display: flex; justify-content: center; flex-direction: column;">
					<form>
						<div class="form">
							姓名:<input id="name" type="text" name="name">
						</div>
						<div class="form">
							身份证号:<input id="idcard" type="text" name="idcard">
						</div>
						<div class="form">
							手机号:<input id="tel" type="text" name="tel">
						</div>
						<%
							String limitNumString = (String) session.getAttribute("limitNum");
							int limitNum = 0;
							if (limitNumString == null) {
								limitNum = 3;
							} else {
								limitNum = Integer.parseInt(limitNumString);
							}
						%>
						<div class="form">
							预约口罩数量: <select id="number">
								<%
									for (int i = 0; i < limitNum; i++) {
								%>
								<option value=<%=(i + 1)%>><%=(i + 1)%>个
								</option>
								<%
									}
								%>
							</select>
							<div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn2" data-dismiss="modal">取消
					</button>
					<button type="button" class="btn2" onclick="order()">确定</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>