<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�ְ����� ����</title>
		<link rel="stylesheet" href="./css/stock.css" charset="utf-8">
		<link rel="stylesheet" href="./css/jquery-ui.css">
		<script language="javascript" src="./js/jquery-3.6.0.js"></script>
		<script language="javascript" src="./js/jquery-ui.js"></script>	
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>		
		<script src="https://code.highcharts.com/modules/wordcloud.js"></script>
	</head>
	<body>
	<script>
		window.onload = function()
		{
			GetItemList();
			
			ShowTime();
			setInterval(() => ShowTime(), 1000);		
		}
		
		//ȭ�鿡 �ð��� ǥ���Ѵ�.
		function ShowTime()
		{
			const date = new Date();
			curTime = date.toLocaleString("ko-kr");
			$("#curTime").html(curTime);
			//
			if($("#item_code").val()!= undefined)
			{
				//������ �ڵ� ã��
				let code = $("#item_code").val()
				//ajax nowprice.jsp (code)
				$.ajax({
				type : "get",
				url: "nowprice.jsp?code="+ code,
				dataType: "html",
				success : function(data) 
				{	
					console.log(data);
					// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
					$("#nowprice").html(data)
				},
				complete : function(data) 
				{	
					// ����� �����ϰų� �����߾ �� �Լ��� Ÿ�Եȴ�.
				},
				error : function(xhr, status, error) 
				{
					// ��� ���� �߻���	
				}
			});
				
			}
		}
		//���� ����� �ҷ��´�.
		function GetItemList()
		{
			$.ajax({
				type : "get",
				url: "item.jsp",
				dataType: "html",
				success : function(data) 
				{	
					// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
					$("#itemList").html(data);
				},
				complete : function(data) 
				{	
					// ����� �����ϰų� �����߾ �� �Լ��� Ÿ�Եȴ�.
				},
				error : function(xhr, status, error) 
				{
					// ��� ���� �߻���	
				}
			});				
		}
		
		//��ȸ ��ư Ŭ��
		function GetItemDetail(code)
		{
			$.ajax({
				type : "get",
				url: "detail.jsp?code=" + code,
				dataType: "html",
				success : function(data) 
				{	
					// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
					$("#itemDetail").html(data);
				},
				complete : function(data) 
				{	
					// ����� �����ϰų� �����߾ �� �Լ��� Ÿ�Եȴ�.
				},
				error : function(xhr, status, error) 
				{
					// ��� ���� �߻���	
				}
			});			
		}
		
		function AddItem()
		{
			name  = $("#name").val();
			code  = $("#code").val();
			
			if(code == "")
			{
				alert("�����ڵ带 �Է��ϼ���.")
				return;
			}
			else if( name == "")
			{
				alert("������� �Է��ϼ���.")
				return;
			}
			
			
			$.ajax({
				type : "get",
				url: "additem.jsp?code=" + code + "&name=" + name,
				dataType: "html",
				success : function(data) 
				{	
					data = data.trim();
					if(data == "����")
					{
						alert("�ߺ��� �����Դϴ�.");
					}
					else
					{
						location.reload();
					}
				},
				complete : function(data) 
				{	
					// ����� �����ϰų� �����߾ �� �Լ��� Ÿ�Եȴ�.
				},
				error : function(xhr, status, error) 
				{
					// ��� ���� �߻���	
				}
			});		
		}
		
		function OpenNews(str)
		{
			var height = 700;
			var width  = 700;
			var left   = (window.screen.width/2) - (width/2);
			var top    = (window.screen.height/2) - (height/2);
			popupWindow = window.open('news.jsp?s='+ str +'', 'test', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + '', 'resizeable');
			popupWindow.resizeTo(width, height);
			popupWindow.onresize = (_=>{
			    popupWindow.resizeTo(width, height);
			})
		}

	</script>
	<table border="0" style="width:1300px" align="center">
		<tr>
			<td colspan="2"  style="height:80px" align="center">
				<h2>�ְ����� ������ ���� ���� ������ ���ǴϾ��̴� ��</h2> 
			</td>
		</tr>
		<tr>
			<td width="500px" valign="top" id="itemList">
			���� ����� �غ����Դϴ�. ��ø� ��ٷ� �ּ���.
			</td>
			<td valign="top" id="itemDetail">
				<table border="0" class="tb" style="width:100%" align="center">
					<tr>
						<td colspan="2" class="right">����ð� : <strong><span id="curTime"></span></strong></td>
					</tr>
					<tr>
						<td colspan="2" style="height:400px">
							������ ��Ͽ��� ������ �����ϸ� �ش� ���� ���� �ְ����� ������ ���� ������ ǥ�õ˴ϴ�.
						</td>
					</tr>
				</table>		
			</td>
		</tr>
	</table>
	<br><br><br>
	</body>
</html>