<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String s = request.getParameter("s");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>뉴스 더보기++</title>
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
					<th style="width:50px">번호</th>
					<th>제목</th>
					<th style="width:150px">날짜</th>
					<th style="width:70px">긍정확률</th>
					<td rowspan="10"><img src="./images/wc.png" style="width:200px;height:200px;"></td>
				</tr>							
				<%
				for(int i = 1; i <= 5; i++)
				{
					%>
					<tr>
						<td class="center"><%= i %></td>
						<td>[특징주]삼성전자, 3거래일 연속 ...</td>
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
						<th style="width:50px">번호</th>
						<th>제목</th>
						<th style="width:150px">날짜</th>
						<th style="width:70px">부정확률</th>
						<td rowspan="10"><img src="./images/wc.png" style="width:200px;height:200px;"></td>
					</tr>							
					<%
					for(int i = 1; i <= 5; i++)
					{
						%>
						<tr>
							<td class="center"><%= i %></td>
							<td>[특징주]삼성전자, 3거래일 연속 ...</td>
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