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
String status = "분석대기";
String sclass = "status_able";

if(svo.getStatus() == "R")
{
	status = "분석중";
	sclass = "status_ableg";
}
else if(svo.getStatus() == "C")
{
	status = "분석완료";
	sclass = "status_ableb";
}
else if(svo.getStatus() == "E")
{
	status = "없는종목";
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
            text: '기사 수'
        }
    }
});
</script>
<table border="0" class="tb" style="width:100%" align="center">
	<tr>
		<td colspan="2" class="right">현재시간 : <strong><span id="curTime"></span></strong></td>
	</tr>				
	<tr>
		<th style="width:150px">종목명</th>
		<td class="left"><%= name %> (<%= code %>)
		<input type="hidden" id="item_code" value="<%= code %>"></td>
	</tr>
	<tr>
		<th>현재가</th>
		<td class="left"><span id="nowprice"></span>
		&nbsp;&nbsp;&nbsp;
		<div class="btn_group">
			<a class="btn tbin tfc" href="https://finance.naver.com/item/sise.naver?code=<%= code %>" target="_blank">시세 조회(새창)</a>
		</div>						
		</td>
	</tr>
	<tr>
		<th>분석상태</th>
		<td class="left"><span class="<%= sclass %>"><%= status %></span></td>
	</tr>
	<tr>
		<th rowspan="2">분석결과</th>
		<td class="left">긍정 : 700%, 부정 : 30%</td>
	</tr>				
	<tr>
		<td class="left"><span style="color:#ff6600">해당 종목은 상승 가능성이 높습니다.</span></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<h4>[ 긍/부정 뉴스 추이 ]</h4>
			<br>
			<figure class="highcharts-figure">
			    <div id="container"></div>
			    <table id="datatable" style="display:none">
			        <thead>
			            <tr>
			                <th></th>
			                <th>긍정</th>
			                <th>부정</th>
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
			<h4>관련 뉴스 (긍정)
				<div class="btn_group">
					<a href="javascript:OpenNews('p');" class="btn tbin tfc">더보기 +</a>
				</div>
			</h4>							
			<div style="height:20px"></div>
			<table border="0" class="tb_in" style="width:100%" align="center">
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
			</table>							
		</td>
	</tr>	
	<tr>
		<td colspan="2">
			<h4>관련 뉴스 (부정)
				<div class="btn_group">
					<a href="javascript:OpenNews('n');" class="btn tbin tfc">더보기 +</a>
				</div>
			</h4>
			<div style="height:20px"></div>
			<table border="0" class="tb_in" style="width:100%" align="center">
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
						<td><a href="#" title="ddsdasdasda">[특징주]삼성전자, 3거래일 연속 ...</a></td>
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