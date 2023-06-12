<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>
<%
String code = request.getParameter("code");

StockDTO dto = new StockDTO();
String price = dto.NowPrice(code);

out.println(price);

%>