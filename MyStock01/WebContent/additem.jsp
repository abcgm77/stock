<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>  
<%@ page import="java.util.*" %>
<%



String name = request.getParameter("name"); //종목명
String code = request.getParameter("code"); //종목코드

StockDTO dto = new StockDTO();
if(dto.QueryStock(code) == true)
{
	out.println("실패");
}
else
{
	dto.AddStock(code, name);
}

%>

