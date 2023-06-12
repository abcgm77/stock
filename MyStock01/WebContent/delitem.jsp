<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="stock.dto.*" %>
<%@ page import="stock.vo.*" %>   
<%

String code = request.getParameter("code"); //종목코드

StockDTO dto = new StockDTO();
dto.DelStock(code);

response.sendRedirect("index.jsp");

%>
