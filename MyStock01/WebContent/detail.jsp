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
<style>
#container {
    height: 400px;
}

.highcharts-figure,
.highcharts-data-table table {
    min-width: 310px;
    max-width: 800px;
    margin: 1em auto;
}

#datatable {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

#datatable caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

#datatable th {
    font-weight: 600;
    padding: 0.5em;
}

#datatable td,
#datatable th,
#datatable caption {
    padding: 0.5em;
}

#datatable thead tr,
#datatable tr:nth-child(even) {
    background: #f8f8f8;
}

#datatable tr:hover {
    background: #f1f7ff;
}
<!-- #################### -->
.highcharts-figure,
.highcharts-data-table table {
    min-width: 320px;
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    background: #f1f7ff;
}
</style>
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


function wordcloud(){
	const text =
		  'Chapter 1. Down the Rabbit-Hole ' +
		  'Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: ' +
		  'once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations ' +
		  'in it, \'and what is the use of a book,\' thought Alice \'without pictures or conversation?\'' +
		  'So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy ' +
		  'and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking ' +
		  'the daisies, when suddenly a White Rabbit with pink eyes ran close by her.',
		  lines = text.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g),
		  data = lines.reduce((arr, word) => {
		    let obj = Highcharts.find(arr, obj => obj.name === word);
		    if (obj) {
		      obj.weight += 1;
		    } else {
		      obj = {
		        name: word,
		        weight: 1
		      };
		      arr.push(obj);
		    }
		    return arr;
		  }, []);

		Highcharts.chart('container2', {
		  accessibility: {
		    screenReaderSection: {
		      beforeChartFormat: '<h5>{chartTitle}</h5>' +
		        '<div>{chartSubtitle}</div>' +
		        '<div>{chartLongdesc}</div>' +
		        '<div>{viewTableButton}</div>'
		    }
		  },
		  series: [{
		    type: 'wordcloud',
		    data,
		    name: 'Occurrences'
		  }],
		  title: {
		    text: '',
		    align: 'left'
		  },
		  subtitle: {
		    text: '',
		    align: 'left'
		  },
		  tooltip: {
		    headerFormat: '<span style="font-size: 16px"><b>{point.key}</b></span><br>'
		  }
		});
	}
	
wordcloud();


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
		<td class="left">���� : 70%, ���� : 30%</td>
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
					<td rowspan="10">
		    			<div id="container2" style="width:200px; height:200px; margin:0; padding:0; object-fit: cover;"></div>		    			
					</td>
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