<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="db.DBExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="include/script/writeEvent.js"></script>
 
 <%
 	if(request.getParameter("isFailed")!=null){
 		out.println("<script>alert('등록에 실패하였습니다. 다시 시도해주세요. =(')</script>");
 	}
 %>
 
<link rel="stylesheet" type="text/css" href="include/css/writeEvent.css">
<section id="sc_write">
	<form id="content_form"  enctype="multipart/form-data" action="writeEventService.jsp" method="POST">
	 	<input type="hidden" name="user_id" value="<%=session.getAttribute("id")%>">
	
	 	<section id="sc_title">
	 		<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>당신의 이벤트에 제목을 붙여주세요.</p>
	 		</section>
	 		
		 	<input id="input_title" type="text" name="title" placeholder="Please Fill in the Blank" required><br>
	 	</section>
	 	
		
		<section id="sc_detail">
		 	<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>이벤트 종료일을 지정해주세요.?</p>
	 		</section>
		 	<input id="input_end_date" type="date" name="end_date" required><br>
	 	</section>
	 	
	 	<section id="sc_title">
	 		<section class="sub_title">
	 			<div class="sub_title_point"></div>
				<p>문제를 작성해주세요.</p>
	 		</section>
		 	<input id="input_question" type="text" name="question" placeholder="Please Fill in the Blank" required><br>
		</section>
		
	 	<section id="sc_tag">
		 	<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>이벤트 주최 이유가 무엇인가요?</p>
	 		</section>
	 		
	 		<input id="input_detail" type="text" name="detail" placeholder="Please Fill in the Blank" required>
		</section> 

	 	<section id="sc_reward">
		 	<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>이벤트 상품을 공개해주세요.</p>
	 		</section>
	 		
	 	<input id="input_reward" type="text" name="reward" placeholder="Please Fill in the Blank" required>
		</section>
		
		<section id="sc_main_image">
			<section class="sub_title">
		 		<div class="sub_title_point"></div>
				<p>이벤트의 메인 사진을 지정해주세요.</p>
	 		</section>
	 		<i id="main_image_clicker" class="far fa-image fa-10x"></i>
	 		<img id="preview">
		 	<input id="main_image" type="file" name="main_image" accept="image/*" required >
		</section> 	
		
	
	 	<input id="submit_button" type="submit" value="이벤트 만들기">
	 </form>
</section>