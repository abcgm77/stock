<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>
<%@ page import="java.util.*" %>
<%
StockDTO dto = new StockDTO();
ArrayList<StockVO> list = dto.ShowStock();
%>
<table border="0" class="tb edit" style="width:100%" align="center">
	<tbody id="stocklist">
	<tr>		
		<td class="right" colspan="4">
			<div style="display:flex">
				<div style="float: left; flex:1; text-align:left">
					<input id="code" type="text" style="width:160px" placeholder="종목코드">
					<input id="name" type="text" style="width:160px" placeholder="종목명">
				</div>
				<div style="float: right">
					<a href="javascript:AddItem();" class="btn sfn">종목추가</a>
					<a href="javascript:GetItemList();" class="btn sfnp">새로고침</a>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<th style="width:80px">종목코드</th>
		<th>종목명</th>						
		<th style="width:80px">상태</th>
		<th style="width:140px">처리</th>
	</tr>
	<%
	for(StockVO vo : list)
	{
		String code = vo.getStockCode();
		String name = vo.getStockName();
		String status = "분석대기";
		String sclass = "status_able";
		
		if(vo.getStatus() == "R")
		{
			status = "분석중";
			sclass = "status_ableg";
		}
		else if(vo.getStatus() == "C")
		{
			status = "분석완료";
			sclass = "status_ableb";
		}
		else if(vo.getStatus() == "E")
		{
			status = "없는종목";
			sclass = "status_re";
		}
		%>
		<tr>
			<td><%= code %></td>
			<td class="left"><%= name %></td>
			<td><span class="<%=sclass %>"><%= status %></span></td>
			<td>
				<a class="btn tbin tfc" href="javascript:GetItemDetail('<%= code %>');">조회</a>
				<a class="btn tbin tfg" href="delitem.jsp?code=<%= code %>">삭제</a>
			</td>							
		</tr>
		<%
						
	}%>
	</tbody>
</table>