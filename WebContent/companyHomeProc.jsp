<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="include/script/companyHome.js"></script>
<%
	DBExecutor db = new DBExecutor(DBConnector.getMySqlConnection());	
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	int id = (Integer)session.getAttribute("id");

	StringBuffer sb = new StringBuffer();

	

	sb.append("미증정 종료 이벤트");

	String sql = "select distinct event.event_id, user.user_id, title, main_img, end_date, reward from event join user on user.id = event.user_id join gift on gift.event_id = event.event_id where end_date<date_format('"+date+"', '%Y-%m-%d') and event.event_id != all(select event_id from gift where gift = 1);";
	System.out.println("미증정 종료 이벤트" + sql);
	ResultSet rs = db.execToSet(sql);
	while(rs.next()){
		sb.append("<section class='event_item'>");
		sb.append("<a href='eventDetail.jsp?id="+rs.getString("event_id")+"'>");	
		sb.append(rs.getString("title"));
		sb.append("/");
		sb.append(rs.getString("end_date"));
		sb.append("/");
		sb.append(rs.getString("reward"));
		sb.append("/");sb.append("<img class=\"main_img\" src=\"image/"+rs.getString("user.user_id")+"/"+rs.getString("main_img")+"\">");
		
		sb.append("</a>");
		sb.append("<button onclick=\"gift("+rs.getString("event_id")+")\">증정품 지급하기</button>");
		sb.append("</section>");
	}
	

	
	
	sb.append("진행중");
	sql = "select * from event join user on user.id = event.user_id where end_date>=date_format('"+date+"', '%Y-%m-%d');";
	rs = db.execToSet(sql);
	while(rs.next()){
		sb.append("<section class='event_item'>");
		sb.append("<a href='eventDetail.jsp?id="+rs.getString("event_id")+"'>");	
		sb.append(rs.getString("title"));
		sb.append("/");
		sb.append(rs.getString("end_date"));
		sb.append("/");
		sb.append(rs.getString("reward"));
		sb.append("/");
		sb.append("<img class=\"main_img\" src=\"image/"+rs.getString("user.user_id")+"/"+rs.getString("main_img")+"\">");
		sb.append("</a>");
		sb.append("</section>");
	}
	
	

	sb.append("종료 이벤트");

	sql = "select distinct event.event_id, user.user_id, title, main_img, end_date, reward from event join user on user.id = event.user_id join gift on gift.event_id = event.event_id where end_date<date_format('"+date+"', '%Y-%m-%d') and event.event_id = all(select event_id from gift where gift = 1);";
	rs = db.execToSet(sql);
	System.out.println("종료 이벤트" + sql);
	
	while(rs.next()){
		sb.append("<section class='event_item'>");
		sb.append("<a href='eventDetail.jsp?id="+rs.getString("event_id")+"'>");	
		sb.append(rs.getString("title"));
		sb.append("/");
		sb.append(rs.getString("end_date"));
		sb.append("/");
		sb.append(rs.getString("reward"));
		sb.append("/");
		sb.append("<img class=\"main_img\" src=\"image/"+rs.getString("user.user_id")+"/"+rs.getString("main_img")+"\">");
		sb.append("</a>");
		sb.append("</section>");
	}
	sb.append("<form id=\"gift_form\" action=\"gift.jsp\" method=\"POST\">");
	sb.append("<input type=\"hidden\" id=\"event_id\" name=\"event_id\" value=\"\">");
	sb.append("</form>");
	
	out.print(sb.toString());
%>
