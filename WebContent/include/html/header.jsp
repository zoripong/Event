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
		if(session.getAttribute("isCompany").equals("0")){
			%>
			<a href="userHome.jsp">����������</a>
			<%	
		}else{
			%>
			<a href="companyHome.jsp">����������</a>
			<%
		}
	}

%>

</header>