<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/board.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<title>성공회대 총동문회</title>
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
		<section class="wrapper style1">
		<div class="container">
			<div class="row 200%">
				<section class="me">
				<div class="box highlight">
					<div id="right_section">
						<i class="icon major fa-smile-o"style="margin:0 0 0 0;"></i>
						<ul>
							<h3 id="h_3">Introduce</h3>
							<li style="background-color: #dcd0d0;">회칙</li>
							<li style="cursor: pointer;"><a href="introduce1.do">소개</a></li>
							<li style="cursor: pointer;"><a href="introduce2.do">인사말</a></li>
						</ul>
					</div>
				</div>
				</section>
				<section class="board">
				<div class="box highlight">
					<div class="boad">
						<h3>동문회칙</h3>
						<div id="write"></div>
					</div>
				</div>
				</section>
				<section class="board"">

				<table class="box highlight" id="board_1"
					style="margin-left: auto; margin-right: auto;  border-bottom: 1px solid black;">
					<tr>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3">${rule.r_title}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>관리자</td>
						<td>작성일</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${ rule.r_writeTime }" /></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td style="text-align: left;"><c:forEach var="file"
								items="${ files }">

								<a class="btn btn-small"
									href="rule_download.do?f_id=${ file.f_id }"><i
									class="icon icon-file"></i>${ file.f_name }</a>
							</c:forEach></td>
					</tr>
					<tr style="text-align: left; padding-left: 10%;">
						<td colspan='4'
							style='padding-left: 1%; padding-top: 20px; height: 200px; word-break: break-all; line-height: 30px;'>
							${rule.r_content}</td>
					</tr>
					<tr>
						<td colspan="4"></td>
					</tr>
				</table>
				<div id="pa1">
					<ul>

						<li><a href="introduce3.do?${ pagination.queryString }"><img
								src="${pageContext.request.contextPath}/resources/images/list.jpg"
								style="border-radius: 3px"></a></li>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li><a href="introduce3_edit.do?r_id=${rule.r_id }"><img
									src="${pageContext.request.contextPath}/resources/images/change.jpg"
									style="border-radius: 3px"></a></li>
							<li><a href="delete.do?r_id=${rule.r_id }"><img
									src="${pageContext.request.contextPath}/resources/images/delete.jpg"
									style="border-radius: 3px"></a></li>
						</sec:authorize>
					</ul>
				</div>
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