<%@page import="db.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
index입니다.
<%
	Connection conn = DBConnector.getMySqlConnection();
	System.out.println("DB연결 정보!!!!!!!!!? : "+conn);
	
%>

