<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String answer_id = request.getParameter("id");
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());	
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
	String sql = "select event.event_id as event_id from event join answer on event.event_id = answer.event_id where answer_id = 8;";
	
	ResultSet rs = db.execToSet(sql);

	if(rs.next()){
		response.sendRedirect("eventDetail.jsp?id="+rs.getString("event_id"));
	}else{
		response.sendRedirect("index.jsp");
	}


%>