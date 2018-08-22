<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
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
<a href="signup.jsp">회원가입</a>