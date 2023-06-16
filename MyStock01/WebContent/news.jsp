<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>
<%@ page import="java.util.*" %>
<%
String etype = request.getParameter("etype");
if(etype == null) etype = "p";

String code = request.getParameter("code");
if(code == null) code = "";


newslistDTO newsdto = new newslistDTO();

int  pageno = 1;
try{
	pageno = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){};

//��ü �ڷ��� ������ ��ȸ�Ѵ�.
int total = newsdto.GetTotal(etype, code, 1);
int max_page = total / 10; //��ü ������ ����
if( total % 10 != 0) max_page++;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���� ������</title>
		<link rel="stylesheet" href="./css/stock.css" charset="utf-8">
		<link rel="stylesheet" href="./css/jquery-ui.css">
		<script language="javascript" src="./js/jquery-3.6.0.js"></script>
		<script language="javascript" src="./js/jquery-ui.js"></script>	
	</head>
	<body>
		<div style="margin:30px;">
		<table border="0" class="tb_in" style="width:100%;" align="center">

			<%
				if(etype.equals("p")){
			%>
				<tr>
					<th style="width:50px">��ȣ</th>
					<th>����</th>
					<th style="width:150px">��¥</th>
					<th style="width:70px">����Ȯ��</th>
					<!-- td rowspan="10"><img src="./images/wc.png" style="width:200px;height:200px;"></td -->
				</tr>							
				<%
				ArrayList<newslistVO> plist = newsdto.GetList(pageno, "p", code , 10);
				int p_page = (pageno - 1) * 10 + 1;
				for(newslistVO vo : plist)
				{
					String title = vo.getTitle();
					if(title.length() > 33)
					{
						title  = title.substring(0,33);
						title += "...";
					}					
					%>
					<tr>
						<td class="center"><%= p_page %></td>
						<td><a href="<%= vo.getUrl() %>" target='_blank'><%= title %></a></td>
						<td class="center"><%= vo.getDate().substring(0,10) %></td>
						<td class="right" style="color:#de6262;text-align:center;"><%= (int)vo.getScore() %>%</td>
					</tr>
					<%
					p_page += 1;
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
						<!-- td rowspan="10"><img src="./images/wc.png" style="width:200px;height:200px;"></td -->
					</tr>							
					<%
					ArrayList<newslistVO> nlist = newsdto.GetList(pageno, "n", code , 10);
					int n_page = (pageno - 1) * 10 + 1;
					for(newslistVO vo : nlist)
					{
						String title = vo.getTitle();
						if(title.length() > 33)
						{
							title  = title.substring(0,33);
							title += "...";
						}					
						%>
						<tr>
							<td class="center"><%= n_page %></td>
							<td><a href="<%= vo.getUrl() %>" target='_blank'><%= title %></a></td>
							<td class="center"><%= vo.getDate().substring(0,10) %></td>
							<td class="right" style="color:#005baa;text-align:center;"><%= (int)vo.getScore() %>%</td>
						</tr>
						<%
						n_page += 1;
					}
					%>
					<%
				}
			%>
			<!-- page test -->
				<tr>
					<td style="text-align:center;" colspan="4">
					<%
					int startBlock = ((pageno - 1)/5)*5; //���� ��� ������
					startBlock += 1;
					int endBlock = startBlock  + 5 - 1;  //���� ��� ������
					if( endBlock > max_page)
					{
						//���� ��� �������� ��ü ���������� ũ��....
					    endBlock = max_page;
					}	
					//���� �� ǥ���ϱ�
					if(startBlock > 5)
					{
						%>
						<a style="font-weight:bold;" href="news.jsp?etype=<%= etype %>&code=<%= code %>&page=<%= startBlock - 1 %>">����</a>
						<%					
					}		
					
					for(int page_no = startBlock; page_no <= endBlock; page_no++)
					{
						if(page_no == pageno)
						{
							%><a style="color:red; font-weight:bold;" href="news.jsp?etype=<%= etype %>&code=<%= code %>&page=<%= page_no %>"><%= page_no %></a>&nbsp;<%
						}else
						{
							%><a style="font-weight:bold;" href="news.jsp?etype=<%= etype %>&code=<%= code %>&page=<%= page_no %>"><%= page_no %></a>&nbsp;<%
						}
					}
					
					//���� �� ǥ���ϱ�
					if(endBlock < max_page)
					{
						%>
						<a style="font-weight:bold;" href="news.jsp?etype=<%= etype %>&code=<%= code %>&page=<%= endBlock + 1 %>">����</a>
						<%					
					}		
					%>
					</td>
				</tr>				
			<!-- page test -->
		</table>
		</div>
	</body>
</html>