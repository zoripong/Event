<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
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
<a href="signup.jsp">ȸ������</a>