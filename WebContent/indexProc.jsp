<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBExecutor"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="include/css/index.css">
index입니다.
<%
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	System.out.println(date);
	String sql = "select * from event join user on user.id = event.user_id where end_date>=date_format('"+date+"', '%Y-%m-%d');";
	ResultSet rs = db.execToSet(sql);

	StringBuffer sb = new StringBuffer();
	while(rs.next()){
		sb.append("<section class='event_item'>");
		sb.append("<a href='eventDetail.jsp?id="+rs.getString("event_id")+"'>");	
		sb.append(rs.getString("title"));
		sb.append("/");
		sb.append(rs.getString("name"));
		sb.append("/");
		sb.append(rs.getString("end_date"));
		sb.append("/");
		sb.append(rs.getString("reward"));
		sb.append("/");
		sb.append("<img class=\"main_img\" src=\"image/"+rs.getString("name")+"/"+rs.getString("main_img")+"\">");
		sb.append("</a>");
		sb.append("</section>");
	}
	if("1".equals(session.getAttribute("isCompany"))){
		%>
			<a href="writeEvent.jsp">이벤트 등록하기</a>
		<%
	}
%>
<a href="#">종료된 이벤트 확인하기</a>
<section id="sc_events">
	<%= sb.toString() %>
</section>