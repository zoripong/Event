<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/signup.css">
<script src="include/script/signup.js"></script>
<%
	request.setCharacterEncoding("utf-8");
	String isCompany = request.getParameter("isCompany");
%>
<section id="sc_signup">
	<section id="sc_overlay"></section>
	<section id="sc_signup_box">
		<section id="sc_container">
			<section id="sc_title">
				<p id="p_title">Welcome</p>
				<p id="p_sub_title">you can just join us.</p>
				<hr id="separation">
			</section>
			<form id="form_signup" action="signupService.jsp" method="POST">
				<input type="hidden" name="isCompany" value="<%= isCompany %>">
				<input class="input_text" type="email" name="id"  placeholder="ID" required />
				<input id="input_pw" class="input_text" type="password" name="password" placeholder="Password" required/> 
				<input id="input_re_pw" class="input_text" type="password" name="retype-pw" placeholder="Please Retype the Password" required/>
				
				<%
					if(isCompany.equals("0")){
						
				%>
				<script>
					$("#sc_signup").css("background-image","url(\"include/image/bg_user_signup.jpg\")");

				</script>
				<input class="input_text" type="text"  name="name" placeholder="Your Name" >
				<%						
					}else{
				%>
				<script>
					$("#sc_signup").css("background-image","url(\"include/image/bg_company_signup.jpg\")");
				</script>

				<input class="input_text" type="text"  name="name" placeholder="Company Name" >
				<% 
					}
				%>
				<input id="input_submit" type="submit" value="회원가입"/>
				
				
			</form>
		</section>
	</section>
</section>