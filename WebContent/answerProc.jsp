<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userId = (int)session.getAttribute("id");
	String question = request.getParameter("question");
	String eventId = request.getParameter("event_id");
	String answerId = request.getParameter("heart_index");
	
	System.out.println(question+"/"+eventId+"/"+answerId);
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());

	if(!answerId.equals("-1")){
		if(db.exec("INSERT INTO heart VALUES (null, "+userId+", "+answerId+");")){
			System.out.println("성공");
		}
	}
	
	char[] cQuestion = question.replace(" ", "").toCharArray();
	
	StringBuffer sb = new StringBuffer();
	sb.append("<form action='answerService.jsp' method='POST'>");
	sb.append("<input type=\"hidden\" name=\"event_id\" value=\""+eventId+"\">");
	
	
	for(int i = 0; i < cQuestion.length; i++){
		sb.append("<input type='text' name='answer' id='' class='answer_char' placeholder='"+cQuestion[i]+"' maxlength='1' required>");
	}	
	sb.append("<input type='submit' value='제출'>");
	sb.append("</form>");

	//TODO : 초성 맞는지 체크
	out.println(sb.toString());
%>