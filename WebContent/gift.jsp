<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String eventId = request.getParameter("event_id");
	
	System.out.println(eventId);
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	String sql = "select answer.answer_id as answer_id, count(answer.answer_id) as heart_count from answer join heart on answer.answer_id = heart.answer_id where event_id = "+eventId+" group by answer_id order by heart_count desc;";
	System.out.println(sql);
	ResultSet rs = db.execToSet(sql);
	
	int index = 0;
	if(rs.next()){
		sql = "update gift set gift = 1 where answer_id = "+rs.getString("answer_id")+" and event_id = "+eventId+";"; 
		if(db.exec(sql)){
			response.sendRedirect("companyHome.jsp");
		}
	}

%>