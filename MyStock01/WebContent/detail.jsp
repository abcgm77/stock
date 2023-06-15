<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
String code = request.getParameter("code");

StockDTO sdto = new StockDTO();
StockVO  svo  = sdto.StockInfo(code);

String name = svo.getStockName();
String status = "분석대기";
String sclass = "status_able";

if(svo.getStatus().equals("R"))
{
	status = "분석중";
	sclass = "status_ableg";
}
else if(svo.getStatus().equals("C"))
{
	status = "분석완료";
	sclass = "status_ableb";
}
else if(svo.getStatus().equals("E"))
{
	status = "없는종목";
	sclass = "status_re";
}

newslistDTO newsdto = new newslistDTO();

WordDTO wdto = new WordDTO();
String [] p_wordlist = wdto.GetWordList("p", code, name);
String [] n_wordlist = wdto.GetWordList("n", code, name);

ArrayList<String> pwlist = new ArrayList<String>();

for(String s : p_wordlist)
{
	pwlist.add(s);
}

ArrayList<String> nwlist = new ArrayList<String>();

for(String s : n_wordlist)
{
	nwlist.add(s);
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
            text: '기사 수'
        }
    }
});




function wordcloud1(){
	
	var words = <%= pwlist %>;

	/// 단어 빈도수 계산
	var wordFrequency = {};
	words.forEach((word) => {
	  wordFrequency[word] = (wordFrequency[word] || 0) + 1;
	});

	// 빈도수를 기준으로 내림차순 정렬된 단어 배열 생성
	var sortedWords = Object.entries(wordFrequency).sort((a, b) => b[1] - a[1]);

	// 상위 30개 단어만 남기고 나머지는 제외
	var topWords = sortedWords.slice(0, 40).flatMap(([word, frequency]) => {
	  var repeatedWords = [];
	  for (let i = 0; i < frequency; i++) {
	    repeatedWords.push(word);
	  }
	  return repeatedWords;
	});
	
	const text =
		topWords,
		  //lines = text.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g),
		  data = text.reduce((arr, word) => {
		    let obj = Highcharts.find(arr, obj => obj.name === word);
		    if (obj)
		    {
		      obj.weight += 1;
		    }
		    else
		    {
		      obj =
		      {
		        name: word,
		        weight: 1
		      };
		      arr.push(obj);
		    }
		    return arr;
		  }, []);

		Highcharts.chart('container1', {
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
	
wordcloud1();

function wordcloud2(){
	var words = <%= nwlist %>;

	/// 단어 빈도수 계산
	var wordFrequency = {};
	words.forEach((word) => {
	  wordFrequency[word] = (wordFrequency[word] || 0) + 1;
	});

	// 빈도수를 기준으로 내림차순 정렬된 단어 배열 생성
	var sortedWords = Object.entries(wordFrequency).sort((a, b) => b[1] - a[1]);

	// 상위 30개 단어만 남기고 나머지는 제외
	var topWords = sortedWords.slice(0, 40).flatMap(([word, frequency]) => {
	  var repeatedWords = [];
	  for (let i = 0; i < frequency; i++) {
	    repeatedWords.push(word);
	  }
	  return repeatedWords;
	});
	
	const text =
		topWords,
		  //lines = text.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g),
		  data = text.reduce((arr, word) => {
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
	
wordcloud2();


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
		<%
			int p_count = newsdto.GetTotal("p", code, 1);
	    	int n_count = newsdto.GetTotal("n", code, 1);
	    	double sum     = p_count + n_count;
	    	
	    	int p_percent = (int)(p_count / sum * 100);
	    	int n_percent = (int)(n_count / sum * 100);
	    	System.out.println(p_count);
	    	System.out.println(n_count);
		%>
		<td class="left">긍정 : <%= p_percent %>%, 부정 : <%= n_percent %>%</td>
	</tr>				
	<tr>
		<td class="left"><span style="color:#ff6600">해당 종목은 <%= (p_percent > n_percent) ? "상승" : "하락" %> 가능성이 높습니다.</span></td>
	</tr>
	<%
	if(svo.getStatus().equals("C"))
	{
	%>
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
			        <%
			        
			        
			        for (int i=7; i>=1; i--)
			        {
				        Calendar calendar = new GregorianCalendar();
						SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");						
						String chkDate = SDF.format(calendar.getTime());		
			        	calendar.add(Calendar.DATE, -1 * i);
			        	chkDate = SDF.format(calendar.getTime());
				    	int p_total = newsdto.GetTotal("p", code, i);
				    	int n_total = newsdto.GetTotal("n", code, i);
				        %>
				        <tr>
			                <th><%= chkDate %></th>
			                <td><%= p_total %></td>
			                <td><%= n_total %></td>
			            </tr>
				        <%
			        }
			        %>

			        </tbody>
			    </table>
			</figure>
		</td>
	</tr>											
	<tr>
		<td colspan="2">
			<h4>관련 뉴스 (긍정)
				<div class="btn_group">
					<a href="javascript:OpenNews('p','<%= code %>');" class="btn tbin tfc">더보기 +</a>
				</div>
			</h4>							
			<div style="height:20px"></div>
			<table border="0" class="tb_in" style="width:100%;" align="center">
				<tr>
					<th style="width:40px; height: 35px;">번호</th>
					<th>제목</th>
					<th style="width:110px">날짜</th>
					<th style="width:70px">긍정확률</th>
					<td rowspan="10" style="width: 220px;">
		    			<div id="container1" style="width:200px; height:200px; margin:0; padding:0; object-fit: cover;"></div>		    			
					</td>
				</tr>				
				<%
				ArrayList<newslistVO> plist = newsdto.GetList(1, "p", code , 5);
				if (plist.size() == 0)
				{
					%>
					<tr><td colspan="4" style="text-align:center;">뉴스 기사가 없습니다.</td></tr>
					<%	
				}else{					
					int p_page = 1;
					for(newslistVO vo : plist)
					{
						String title = vo.getTitle();
						if(title.length() > 27)
						{
							title  = title.substring(0,27);
							title += "...";
						}					
						%>
						<tr>
							<td class="center" style="height: 35px;"><%= p_page %></td>
							<td><a href="<%= vo.getUrl() %>" target='_blank'><%= title %></a></td>
							<td class="center"><%= vo.getDate().substring(0,10) %></td>
							<td class="right" style="color:#de6262; text-align:center;"><%= (int)vo.getScore() %>%</td>
						</tr>
						<%
						p_page += 1;
					}
					
				}
				%>
			</table>							
		</td>
	</tr>	
	<tr>
		<td colspan="2">
			<h4>관련 뉴스 (부정)
				<div class="btn_group">
					<a href="javascript:OpenNews('n','<%= code %>');" class="btn tbin tfc">더보기 +</a>
				</div>
			</h4>
			<div style="height:20px"></div>
			<table border="0" class="tb_in" style="width:100%" align="center">
				<tr>
					<th style="width:40px; height: 35px;">번호</th>
					<th>제목</th>
					<th style="width:110px">날짜</th>
					<th style="width:70px">부정확률</th>
					<td rowspan="10" style="width: 220px;">
		    			<div id="container2" style="width:200px; height:200px; margin:0; padding:0; object-fit: cover;"></div>		    			
					</td>
				</tr>							
				<%
				ArrayList<newslistVO> nlist = newsdto.GetList(1, "n", code , 5);
				if (plist.size() == 0)
				{
					%>
					<tr><td colspan="4" style="text-align:center;">뉴스 기사가 없습니다.</td></tr>
					<%	
				}else{			
					int n_page = 1;
					for(newslistVO vo : nlist)
						{
						String title = vo.getTitle();
						if(title.length() > 27)
						{
							title  = title.substring(0,27);
							title += "...";
						}					
						%>
						<tr>
							<td class="center" style="height: 35px;"><%= n_page %></td>
							<td><a href="<%= vo.getUrl() %>" target='_blank'><%= title %></a></td>
							<td class="center"><%= vo.getDate().substring(0,10) %></td>
							<td class="right" style="color:#005baa; text-align:center;"><%= (int)vo.getScore() %>%</td>
						</tr>
						<%
						n_page += 1;
					}
				}
				%>
			</table>							
		</td>
	</tr>
	<%
	}else if(svo.getStatus().equals("W")){
	%>
		<tr><td colspan="2">분석대기중 입니다...</td></tr>
	<%
	}else if(svo.getStatus().equals("R")){
	%>
		<tr><td colspan="2">분석중 입니다...</td></tr>
	<%
	}else if(svo.getStatus().equals("E")){	
	%>
		<tr><td colspan="2">없는종목 입니다, 정확한 종목코드를 입력해 주세요.</td></tr>
	<%
	}
	%>																					
</table>