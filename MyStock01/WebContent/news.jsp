<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String s = request.getParameter("s");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���� ������++</title>
		<link rel="stylesheet" href="./css/stock.css" charset="utf-8">
		<link rel="stylesheet" href="./css/jquery-ui.css">
		<script language="javascript" src="./js/jquery-3.6.0.js"></script>
		<script language="javascript" src="./js/jquery-ui.js"></script>	
	</head>
	<body>
	
		<table border="0" class="tb_in" style="width:100%" align="center">
			<%
				if(s.equals("p")){
			%>
				<tr>
					<th style="width:50px">��ȣ</th>
					<th>����</th>
					<th style="width:150px">��¥</th>
					<th style="width:70px">����Ȯ��</th>
					<td rowspan="10"><img src="./images/wc.png" style="width:200px;height:200px;"></td>
				</tr>							
				<%
				for(int i = 1; i <= 5; i++)
				{
					%>
					<tr>
						<td class="center"><%= i %></td>
						<td>[Ư¡��]�Ｚ����, 3�ŷ��� ���� ...</td>
						<td class="center">2023.06.08 10:12</td>
						<td class="right">98%</td>
					</tr>
					<%
				}
				%>
			<%
				}
				else
				{
					%>
					<tr>
						<th style="width:50px">��ȣ</th>
						<th>����</th>
						<th style="width:150px">��¥</th>
						<th style="width:70px">����Ȯ��</th>
						<td rowspan="10"><img src="./images/wc.png" style="width:200px;height:200px;"></td>
					</tr>							
					<%
					for(int i = 1; i <= 5; i++)
					{
						%>
						<tr>
							<td class="center"><%= i %></td>
							<td>[Ư¡��]�Ｚ����, 3�ŷ��� ���� ...</td>
							<td class="center">2023.06.08 10:12</td>
							<td class="right">98%</td>
						</tr>
						<%
					}
					%>
					<%
				}
			%>
		</table>
	</body>
</html>