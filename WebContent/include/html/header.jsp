<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <link rel="stylesheet" type="text/css" href="include/css/header.css">
<header>
<a href="index.jsp">��������</a>
<%
	if(session.getAttribute("id") == null){
		%>
			<a href="signin.jsp">�α���</a>
		<%
	}else{
		%>
			<a href="signout.jsp">�α׾ƿ�</a>		
		<%
	}

%>

</header>