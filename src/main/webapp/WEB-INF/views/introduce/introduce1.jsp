<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/introduce.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
	<style>
	table  {
    background-image: url("../resources/assets/css/images/box_bg.gif");
	}
	</style>
<title>학교소개</title>
<style type="text/css">
 	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
	<section id="banner"> </section>

	<!-- Highlights -->
	<div id="page-wrapper">
		<c:import url="../menu.jsp" />
		<section id="banner"> </section>
		<!-- Highlights -->
		<section class="wrapper style1">
		<div class="container">
			<div class="row 200%">
				<section class="me">
				<div class="box highlight">
					<i class="icon major fa-smile-o"></i>
					<ul>
						<h3 id="h_3">introduce</h3>
						<li style="background-color: #dcd0d0;">소개</li>
						<li style="cursor: pointer;"><a href="introduce2.do">인사말</a></li>
						<li style="cursor: pointer;"><a href="introduce3.do">회칙</a></li>
					</ul>
				</div>
				</section>
				<section class="box" style="padding: 80px 0 0 0px;">
				<h3 class="page-header" style="margin: 0px 0 0px">동문회 소개</h3>
				<table class="table table-bordered"
					style="margin-top: 15px; width: 760px; height: 902px;" id=intro1;>
					<tr>
						<td>${introduce}</td>
						
					</tr>
				</table>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li style="float:right;">
							<a href="introduce1_edit.do"><img
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
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.dropotron.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/skel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>