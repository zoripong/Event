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
		%>
			<a href="signout.jsp">로그아웃</a>		
		<%
	}

%>

</header>