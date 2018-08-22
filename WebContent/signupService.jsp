<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@page import="java.io.File"%>
<%@page import="db.DBExecutor"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String isCompany = request.getParameter("isCompany");

	
	out.println(id +"/"+password+"/"+name);
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	if(db.exec("INSERT INTO user VALUES (null, '"+id+"', '"+password+"', '"+name+"', "+isCompany+");")){
		System.out.println("회원가입 성공");
	
	 	ServletContext scontext = getServletContext();
 		String realFolder = scontext.getRealPath("image/"+id);
		 File file = new File(realFolder);
		System.out.println(realFolder);
        if(!file.exists()){
            file.mkdirs();
            System.out.println("created directory successfully!");
        }%>

 	
	
		<jsp:forward page="signin.jsp"/>
		<%
	}else{
		System.out.println("회원가입 실패"); %>
		<jsp:forward page="signup.jsp"/>
		<%
	}
	
%>