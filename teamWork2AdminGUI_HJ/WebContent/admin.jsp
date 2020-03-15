<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/admin.css" rel="stylesheet">
<script src="../plugins/table-export/bootstrap-table-export.min.js"></script>
<script src="../plugins/table-export/tableExport.js"></script>
<meta charset="UTF-8">
<title>管理员界面</title>
</head>
<body id="adminBodyBackground">
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="#setAppointmentTimeDiv">设置预约时间</a> <a
					href="#setAppointmentLimitDiv">设置预约上限<a> <a
						href="#setMaskNumDiv">设置口罩总数<a> <a
								href="#exportLuckyListDiv">导出中签名单<a>
			</nav>
		</div>
		<div id="setAppointmentTimeDiv">
			<!-- 设置预约时间 -->
			<div class="subTitle">设置预约时间</div>
			<div id="setAppointmentTimeInput">
				<form action="test.jsp?type=setAppointmentTime" method="get">
					开放时间: <input type="text" name="startTime" /> <br /> 截止时间: <input
						type="text" name="endTime" /> <br /> <input type="submit"
						value="设置" class="button" />
				</form>
			</div>
			<div class="note">输入格式为Hour: minute: Second 如 17:30:00</div>
		</div>
		<div id="setAppointmentLimitDiv">
			<!-- 设置预约上限 -->
			<div class="subTitle">设置预约上限</div>
			<div id="setAppointmentLimitInput">
				<form action="test.jsp?type=setAppointmentLimit" method="get">
					最高可预约数量: <input type="text" name="limitNum" /> <br /> <input
						type="submit" value="设置" class="button" />
				</form>
			</div>
		</div>
		<div id="setMaskNumDiv">
			<!-- 设置口罩总数 -->
			<div class="subTitle">设置口罩总数</div>
			<div id="setMaskNumInput">
				<form action="test.jsp?type=setMaskNum" method="get">
					设置口罩总数: <input type="text" name="totalNum" /> <br /> <input
						type="submit" value="设置" class="button" />
				</form>
			</div>
		</div>

		<%
			String currentDay = (String) request.getAttribute("date");
			if (currentDay == null) {
				currentDay = "2020-03-13";
		%>
		<script type="text/javascript">
			window.location.href = "adminDBServlet?date=2020-03-13";
		</script>
		<%
			}
			String[] dateList = (String[]) request.getAttribute("dateList");
			//dateList为中签名单的名字列表，即日期，供下方选择
			if (dateList == null) {
				dateList = new String[3];
				dateList[0] = "2020-03-13";
				dateList[1] = "2020-03-14";
				dateList[2] = "2020-03-15";
			}
			String[][] nameList = (String[][]) request.getAttribute("nameList");
			if (nameList == null) {
				nameList = new String[3][];
				for (int i = 0; i < 3; i++) {
					nameList[i] = new String[4];
					nameList[i][0] = "name";
					nameList[i][1] = "ID";
					nameList[i][2] = "phone";
					nameList[i][3] = "num";
				}
			}
		%>
		<div id="exportLuckyListDiv">
			<!-- 导出中签名单 -->
			<div class="subTitle">导出中签名单</div>
			<div id="exportLuckyList">
				<select id="dateSelects">
					<%
						for (int i = 0; i < dateList.length; i++) {
							if (dateList[i]!=null && dateList[i].equals(currentDay) ) {
					%><option value=<%=dateList[i]%> selected="selected"><%=dateList[i]%></option>
					<%
						} else
					%>
					<option value=<%=dateList[i]%>><%=dateList[i]%></option>
					<%
						}
					%>
				</select>
				<button id="export">导出</button>
				<table class="tableList" id="tableList">
					<tr>
						<td>姓名</td>
						<td>身份证</td>
						<td>电话</td>
						<td>口罩数量</td>
					</tr>
					<%
						for (int i = 0; i < nameList.length; i++) {
					%>
					<tr>
						<%
							for (int j = 0; j < nameList[i].length; j++) {
						%>
						<td><%=nameList[i][j]%></td>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function doDownload(url, filename) {
			var a = document.createElement('a');
			a.setAttribute('download', filename);
			a.setAttribute('href', url);
			a.dispatchEvent(new MouseEvent('click'));
		}
		function downloadTable(tableId) {
			var table = document.getElementById(tableId);
			var url = 'data:text/plain; utf-8,' + encodeURI(table.outerHTML);
			doDownload(url, '我的表格.html');
		}
		var dates = document.getElementById("dateSelects");
		dates.onchange = function() {
			//alert("admin.jsp?type=changeDates&date="
			//+ dates.value);
			window.location.href = "adminDBServlet?type=changeDates&date="
					+ dates.value;
		}
		var exportButton = document.getElementById("export");
		exportButton.onclick = function() {
			downloadTable('tableList');
		}
	</script>
</body>
</html>