<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	request.setCharacterEncoding("UTF-8");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	MultipartRequest multi = null;
	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024*1024*5;
 	String encType = "UTF-8";
 	ServletContext scontext = getServletContext();
 	realFolder = scontext.getRealPath("image/"+String.valueOf(session.getAttribute("user_id")));
 	
 	try{
 		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
 		Enumeration<?> files = multi.getFileNames();
    	String file1 = (String)files.nextElement();
		filename1 = multi.getFilesystemName(file1);
	} catch(Exception e) {
		e.printStackTrace();
	}

	String user_id = multi.getParameter("user_id");
	String title = multi.getParameter("title");
	String end_date = multi.getParameter("end_date");
	String question = multi.getParameter("question");
	String detail = multi.getParameter("detail");
	String reward = multi.getParameter("reward");
	String main_image = multi.getParameter("hidden_main_img");
 	
 	/*
 	
 	CREATE TABLE event(
	  event_id INT(10) NOT NULL auto_increment,
	  user_id INT(10) NOT NULL,
	  title VARCHAR(50) NOT NULL,
	  end_date DATE NOT NULL,
	  detail VARCHAR(50),
	  question VARCHAR(50),
	  reward VARCHAR(50),
	  main_img VARCHAR(50),
	  PRIMARY KEY (event_id),
	  FOREIGN KEY (user_id) REFERENCES user(id)
	)DEFAULT CHARSET=utf8;

 	*/
 	
	
	if(db.exec("INSERT INTO event VALUES(null, "+user_id+", '"+title+"', '"+end_date+"', '"+detail+"', '"+question+"', '"+reward+"', '"+main_image+"');")){
		response.sendRedirect("companyHome.jsp");
	}else{
		System.out.println("등록 실패");
		
		response.sendRedirect("writeEvent.jsp?isFailed=true");
	
	}

%>