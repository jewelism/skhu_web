<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css" />

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">

<title>역대 동문회장</title>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style type="text/css">
 	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
	<div id="page-wrapper">
		<c:import url="../menu.jsp" />
		<section id="banner"> </section>
		<!-- Highlights -->
		<section class="wrapper style1" >
			<div class="container">
				<div class="row 200%">
					<section class="me">
						<div class="box highlight">
							<i class="icon major fa-smile-o"></i>
							<ul>
								<h3 id="h_3">introduce</h3>
								<li style="background-color:#dcd0d0;">인사말</li>
								<li style="cursor:pointer;"><a href="introduce1.do">소개</a></li>
								<li style="cursor:pointer;"><a href="introduce3.do">회칙</a></li>
							</ul>
						</div>
					</section>
					<section class="box"style="padding: 80px 0 0 0px;">
						<h3 class="page-header"style="margin:0px 0 0px">인사말</h3>
						<ul class="nav nav-tabs" style="width:100%;">
	  						<li class="${active1}"><a href="introduce2.do">${greeting1.getG_name()}</a></li>
							<li class="${active2}"><a href="introduce2_2.do">${greeting2.getG_name()}</a></li>
						</ul>
		     			<table class="table table-bordered" style="margin-top:15px;width:760px;height:350px;" >
							<tr>
								<td style="width:25%;">
								<c:if test="${empty greeting.g_photo }">
			      					<image id="blah1" style="display:block; width:350px;height:350px; margin-top:10px;" src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif">
			    				</c:if>
			    				<c:if test="${not empty greeting.g_photo }">
			      					<image id="blah2" style="display:block; width:350px;height:350px; margin-top:10px;" src="${pageContext.request.contextPath}/resources/userImages/${greeting.g_photo}"
			      					onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
			    				</c:if>
								<td style="width:100%;height:100%;">${greeting.getG_content()}</td>
							</tr>
						</table>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li style="float:right;">
							<a href="introduce2_edit.do?g_id=${greeting.g_id }"><img
							src="${pageContext.request.contextPath}/resources/images/change.jpg"
							style="border-radius: 3px"></a>
						</li>
					</sec:authorize>
					</section>
					
				</div>
			</div>
		</section>
	</div>
	<!-- Scripts -->	
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>