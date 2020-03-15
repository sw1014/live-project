<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/admin.css" rel="stylesheet">
<script src="../plugins/table-export/bootstrap-table-export.min.js"></script>
<script src="../plugins/table-export/tableExport.js"></script>
<title>中签结果查询</title>
</head>
<body>
	<%
		String currentDay = (String) request.getAttribute("date");
		if (currentDay == null) {
			currentDay = "2020-03-15";
	%>
	<script type="text/javascript">
		window.location.href = "searchServlet?date=2020-03-15";
	</script>
	<%
		}
		String[] dateList = (String[]) request.getAttribute("dateList");
		//dateList为中签名单的名字列表，即日期，供下方选择
		System.out.println(currentDay);
		if (dateList == null) {
			dateList = new String[1];
			dateList[0] = "      ";
		}
		String[][] nameList = (String[][]) request.getAttribute("nameList");
		System.out.println(nameList);
		if (nameList == null) {
			nameList = new String[3][];
			for (int i = 0; i < 3; i++) {
				nameList[i] = new String[4];
				nameList[i][0] = "";
				nameList[i][1] = "";
				nameList[i][2] = "";
				nameList[i][3] = "";
			}
		}
	%>
	<div id="exportLuckyListDiv">
		<!-- 导出中签名单 -->
		<div class="subTitle">中签名单</div>
		<form action="user.jsp">
			<button type="submit">返回预约界面</button>
		</form>
		<div id="exportLuckyList">
			<select id="dateSelects">
				<%
					for (int i = 0; i < dateList.length; i++) {
						if (dateList[i] != null && dateList[i].equals(currentDay)) {
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
			window.location.href = "searchServlet?type=changeDates&date="
					+ dates.value;
		}
		var exportButton = document.getElementById("export");
		exportButton.onclick = function() {
			downloadTable('tableList');
		}
	</script>
</body>
</html>