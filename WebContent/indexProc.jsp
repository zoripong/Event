<%@page import="db.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="include/css/index.css">
index�Դϴ�.
<%
	Connection conn = DBConnector.getMySqlConnection();
	System.out.println("DB���� ����!!!!!!!!!? : "+conn);
	
%>

<%

	if("1".equals(session.getAttribute("isCompany"))){
		%>
			<a href="writeEvent.jsp">�̺�Ʈ ����ϱ�</a>
		<%
	}

%>