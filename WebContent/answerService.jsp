<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	int userId = (int)session.getAttribute("id");
	String eventId = request.getParameter("event_id");
	String answers[] = request.getParameterValues("answer");
	
	String answer="";
	for(String answerItem : answers){
		answer += answerItem;
	}
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());

	if(db.exec("INSERT INTO answer VALUES (null, "+userId+", "+eventId+", '"+answer+"');")){
		System.out.println("답변 성공");
		ResultSet rs = db.execToSet("select answer_id from answer where user_id ='"+userId+"' and event_id='"+eventId+"' and answer='"+answer+"';");
		if(rs.next()){
			if(db.exec("INSERT INTO gift VALUES(null, "+eventId+", "+rs.getString("answer_id")+", 0);")){
				System.out.println("성공");
				response.sendRedirect("eventDetail.jsp?id="+eventId);
			}
		}
	}else{
		System.out.println("회원가입 실패"); 
		response.sendRedirect("index.jsp");
	}
	
	

%>
