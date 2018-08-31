<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());	
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	int id = (Integer)session.getAttribute("id");
	
	/*
	
	 select answer.answer_id as answer_id, answer from event join answer on event.event_id = answer.event_id join gift on gift.answer_id = answer.answer_id where answer.user_id = 29 and gift = 1;
	 select answer.answer_id as answer_id, answer from event join answer on event.event_id = answer.event_id join gift on gift.answer_id = answer.answer_id where answer.user_id = 29 and gift = 0;

	*/
	StringBuffer sb = new StringBuffer();
	
	sb.append("응모 중인 이벤트");
	int userID = (Integer)session.getAttribute("id");
	String sql = "select answer.answer_id as answer_id, answer from event join answer on event.event_id = answer.event_id join gift on gift.answer_id = answer.answer_id where answer.user_id = 29 and gift = 0;";
	System.out.println(sql);
	ResultSet rs = db.execToSet(sql);
	while(rs.next()){
		sb.append("<section class='event_item'>");
		sb.append("<a href='myAnswer.jsp?id="+rs.getString("answer_id")+"'>");
		sb.append(rs.getString("answer"));
		sb.append("/");
		
		String subSql = " select count(*) as heart_count from heart where answer_id="+rs.getString("answer_id")+";";
		System.out.println("subSql "+subSql);
		DBExecutor subDb = new DBExecutor(DBConnector.getMySqlConnection());	
		ResultSet subRs = subDb.execToSet(subSql);
		if(subRs.next()){
			sb.append(subRs.getString("heart_count"));
		}
		
		sb.append("</a>");
		sb.append("</section>");
	}

	sb.append("당첨된 이벤트");
	
	sql = "select answer.answer_id as answer_id, answer from event join answer on event.event_id = answer.event_id join gift on gift.answer_id = answer.answer_id where answer.user_id = 29 and gift = 1;";
	System.out.println(sql);
	rs = db.execToSet(sql);
	while(rs.next()){
		sb.append("<section class='event_item'>");
		sb.append("<a href='myAnswer.jsp?id="+rs.getString("answer_id")+"'>");
		sb.append(rs.getString("answer"));
		sb.append("/");
		sb.append("</a>");
		sb.append("</section>");
	}

	
	
	
	out.println(sb.toString());
%>
