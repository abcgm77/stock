<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>
<%@ page import="java.util.*" %>
<%
String code = request.getParameter("code");

StockDTO sdto = new StockDTO();
StockVO  svo  = sdto.StockInfo(code);

String name = svo.getStockName();
String status = "�м����";
String sclass = "status_able";

if(svo.getStatus() == "R")
{
	status = "�м���";
	sclass = "status_ableg";
}
else if(svo.getStatus() == "C")
{
	status = "�м��Ϸ�";
	sclass = "status_ableb";
}
else if(svo.getStatus() == "E")
{
	status = "��������";
	sclass = "status_re";
}

%>

<script type="text/javascript">
Highcharts.chart('container', {
    data: {
        table: 'datatable'
    },
    chart: {
        type: 'column'
    },
    title: {
        text: '<%= name %>'
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        allowDecimals: false,
        title: {
            text: '��� ��'
        }
    }
});
</script>
<table border="0" class="tb" style="width:100%" align="center">
	<tr>
		<td colspan="2" class="right">����ð� : <strong><span id="curTime"></span></strong></td>
	</tr>				
	<tr>
		<th style="width:150px">�����</th>
		<td class="left"><%= name %> (<%= code %>)
		<input type="hidden" id="item_code" value="<%= code %>"></td>
	</tr>
	<tr>
		<th>���簡</th>
		<td class="left"><span id="nowprice"></span>
		&nbsp;&nbsp;&nbsp;
		<div class="btn_group">
			<a class="btn tbin tfc" href="https://finance.naver.com/item/sise.naver?code=<%= code %>" target="_blank">�ü� ��ȸ(��â)</a>
		</div>						
		</td>
	</tr>
	<tr>
		<th>�м�����</th>
		<td class="left"><span class="<%= sclass %>"><%= status %></span></td>
	</tr>
	<tr>
		<th rowspan="2">�м����</th>
		<td class="left">���� : 700%, ���� : 30%</td>
	</tr>				
	<tr>
		<td class="left"><span style="color:#ff6600">�ش� ������ ��� ���ɼ��� �����ϴ�.</span></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<h4>[ ��/���� ���� ���� ]</h4>
			<br>
			<figure class="highcharts-figure">
			    <div id="container"></div>
			    <table id="datatable" style="display:none">
			        <thead>
			            <tr>
			                <th></th>
			                <th>����</th>
			                <th>����</th>
			            </tr>
			        </thead>
			        <tbody>
			            <tr>
			                <th>2023-06-12</th>
			                <td>4</td>
			                <td>1</td>
			            </tr>
			            <tr>
			                <th>2023-06-13</th>
			                <td>10</td>
			                <td>1</td>
			            </tr>
			            <tr>
			                <th>2023-06-14</th>
			                <td>3</td>
			                <td>4</td>
			            </tr>
			            <tr>
			                <th>2023-06-15</th>
			                <td>2</td>
			                <td>11</td>
			            </tr>
			            <tr>
			                <th>2023-06-16</th>
			                <td>5</td>
			                <td>9</td>
			            </tr>
			            <tr>
			                <th>2023-06-17</th>
			                <td>7</td>
			                <td>9</td>
			            </tr>
			            <tr>
			                <th>2023-06-18</th>
			                <td>9</td>
			                <td>9</td>
			            </tr>
			        </tbody>
			    </table>
			</figure>
		</td>
	</tr>											
	<tr>
		<td colspan="2">
			<h4>���� ���� (����)
				<div class="btn_group">
					<a href="javascript:OpenNews('p');" class="btn tbin tfc">������ +</a>
				</div>
			</h4>							
			<div style="height:20px"></div>
			<table border="0" class="tb_in" style="width:100%" align="center">
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
			</table>							
		</td>
	</tr>	
	<tr>
		<td colspan="2">
			<h4>���� ���� (����)
				<div class="btn_group">
					<a href="javascript:OpenNews('n');" class="btn tbin tfc">������ +</a>
				</div>
			</h4>
			<div style="height:20px"></div>
			<table border="0" class="tb_in" style="width:100%" align="center">
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
						<td><a href="#" title="ddsdasdasda">[Ư¡��]�Ｚ����, 3�ŷ��� ���� ...</a></td>
						<td class="center">2023.06.08 10:12</td>
						<td class="right">98%</td>
					</tr>
					<%
				}
				%>
			</table>							
		</td>
	</tr>																													
</table>