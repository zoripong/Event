<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="include/script/eventDetail.js"></script>   
<%

	out.println(request.getParameter("id"));
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	
	String sql = "select * from event where event_id = "+request.getParameter("id")+";";
	ResultSet rs = db.execToSet(sql);
	
	StringBuffer sb = new StringBuffer();
	
	String question = "";
	String eventId = "";
	
	boolean possible =true;
	
	if(rs.next()){
		sb.append(rs.getString("title"));
		sb.append(rs.getString("question"));
		eventId = rs.getString("event_id");
		question = rs.getString("question");
		
		//TODO : 날짜지났으면 신청 불가!!
		
	}
	
	
	String answerSql = "select answer_id, answer, name from answer join user on answer.user_id=user.id where event_id="+ eventId +";";
	ResultSet answerSet = db.execToSet(answerSql);
	
		sb.append("<section id='user_answrs'>");
	
	int index = 0;
	while(answerSet.next()){
		
		if(index%3 == 0){
			if(index != 0){
				sb.append("</section>");
			}
			sb.append("<section class='answer_line'>");		
			
		}
		index++;
		sb.append("<section id='answer_"+answerSet.getInt("answer_id")+"'class='answer_item'>");
		
		DBExecutor subDb = new DBExecutor(DBConnector.getMySqlConnection());
		String heartSql= "select count(*) as count from answer join heart on answer.answer_id = heart.answer_id where answer.answer_id = "+answerSet.getInt("answer_id")+";";
		ResultSet heartRs = subDb.execToSet(heartSql);
		
		sb.append(answerSet.getString("answer"));
		sb.append(answerSet.getString("name"));
		
		sb.append("<a href=\"check.jsp?answer_id="+answerSet.getInt("answer_id")+"\" target=\"_blink\">누가 추천했지?</a>");
		
		if(heartRs.next()){
			sb.append(heartRs.getInt("count"));
		}
		
		if(possible){			
			if("0".equals((String)session.getAttribute("isCompany")) && session.getAttribute("id") != null){
				sb.append("<button onclick='recommend("+answerSet.getInt("answer_id")+")' >추천해요.</button>");
			}
		}
		sb.append("</section>");
		
	}	
	
	if(index == 0){
		sb.append("<button onclick='recommend(-1)' >첫 이벤트 신청자 되기!</button>");
	}

	sb.append("</section>");
	sb.append("</section>");
	
		// + 추천을 누르면 !!

	sb.append("<form id=\"event_form\" action=\"answer.jsp\" method=\"POST\">");
	sb.append("<input type=\"hidden\" name=\"event_id\" value=\""+eventId+"\">");
	sb.append("<input type=\"hidden\" name=\"question\" value=\""+question+"\">");
	sb.append("<input id=\"input_heart\" type=\"hidden\" name=\"heart_index\" value=\"\">");

	sb.append("</form>");

	
	out.println(sb.toString());
%>