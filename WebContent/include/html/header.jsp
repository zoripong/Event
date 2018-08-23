<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <link rel="stylesheet" type="text/css" href="include/css/header.css">
<header>
<a href="index.jsp">ㅎㅁㅈㅇ</a>
<%
	if(session.getAttribute("id") == null){
		%>
			<a href="signin.jsp">로그인</a>
		<%
	}else{
		if(session.getAttribute("isCompany").equals("0")){
			%>
			<a href="userHome.jsp">마이페이지</a>
			<%	
		}else{
			%>
			<a href="companyHome.jsp">마이페이지</a>
			<%
		}
	}

%>

</header>