<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String answerId = request.getParameter("answer_id");
	//out.println(answerId);
	
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());

	String sql = "select name from heart join user on heart.user_id = user.id where answer_id = "+answerId+";";
	ResultSet rs = db.execToSet(sql);
	
	while(rs.next()){
		out.println(rs.getString("name"));
	}
%>