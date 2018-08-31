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
 		String realFolder = application.getRealPath("image");
		System.out.println(realFolder);
		File file = new File(realFolder+"\\"+id);
		System.out.println(realFolder);
        if(!file.exists()){
            file.mkdirs();
            System.out.println("created directory successfully!");
        }

 	
		
		response.sendRedirect("signin.jsp");
		
	}else{
		System.out.println("회원가입 실패"); 
		response.sendRedirect("signup.jsp");
	}
	
%>