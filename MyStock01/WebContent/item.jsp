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
					<input id="code" type="text" style="width:160px" placeholder="�����ڵ�">
					<input id="name" type="text" style="width:160px" placeholder="�����">
				</div>
				<div style="float: right">
					<a href="javascript:AddItem();" class="btn sfn">�����߰�</a>
					<a href="javascript:GetItemList();" class="btn sfnp">���ΰ�ħ</a>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<th style="width:80px">�����ڵ�</th>
		<th>�����</th>						
		<th style="width:80px">����</th>
		<th style="width:140px">ó��</th>
	</tr>
	<%
	for(StockVO vo : list)
	{
		String code = vo.getStockCode();
		String name = vo.getStockName();
		String status = "�м����";
		String sclass = "status_able";
		
		if(vo.getStatus() == "R")
		{
			status = "�м���";
			sclass = "status_ableg";
		}
		else if(vo.getStatus() == "C")
		{
			status = "�м��Ϸ�";
			sclass = "status_ableb";
		}
		else if(vo.getStatus() == "E")
		{
			status = "��������";
			sclass = "status_re";
		}
		%>
		<tr>
			<td><%= code %></td>
			<td class="left"><%= name %></td>
			<td><span class="<%=sclass %>"><%= status %></span></td>
			<td>
				<a class="btn tbin tfc" href="javascript:GetItemDetail('<%= code %>');">��ȸ</a>
				<a class="btn tbin tfg" href="delitem.jsp?code=<%= code %>">����</a>
			</td>							
		</tr>
		<%
						
	}%>
	</tbody>
</table>