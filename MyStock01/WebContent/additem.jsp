<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>  
<%@ page import="java.util.*" %>
<%



String name = request.getParameter("name"); //�����
String code = request.getParameter("code"); //�����ڵ�

StockDTO dto = new StockDTO();
if(dto.QueryStock(code) == true)
{
	out.println("����");
}
else
{
	dto.AddStock(code, name);
}

%>

