<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/smarterditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/board.css" />
<title>성공회대 총동문회</title>
</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/smarterditor/js/init.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/comment/comment.js"></script>




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
						<i class="icon major fa-smile-o"></i>
						<ul>
							<h3 id="h_3">Community</h3>
							<li style="background-color:#dcd0d0;">공지사항</li>
						<li id="bd" style="cursor:pointer;">자유게시판</li>
						</ul>
					</div>
				</div>
				</section>
				<section class="board">
				<div class="box highlight">
					<div class="boad">
						<h3>공지사항</h3>
						<div id="write"></div>
					</div>
				</section>

				<section class="board">

				<form id="fm" method="post" enctype="multipart/form-data">
					<table class="box highlight" id="board_2">
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" id="title"></td>

						</tr>
						<tr>
							<td>작성자</td>
							<td>${user.u_name}</td>
						</tr>
						<tr style="marging-top: 1%; marging-bottom: 1%;">
							<td>파일첨부</td>
							<td colspan="4">
								<div class="files">
									 <input style="float:left; margin-top: 1%"type="file" name="file" multiple />
									 <label class="up" id="add">+</label>
									 <label class="del">-</label>
								</div>

							</td>
						<tr>
							<td colspan="4"><textarea rows="14" cols="100" name="body"
									class="smarteditor2" id="body"></textarea></td>
						<tr>

						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>


					</table>

					<div id="pa2">
						<ul>
							<li><button style="padding: 0; border: 0;">
									<img
										src="${pageContext.request.contextPath}/resources/images/list.jpg"
										style="border-radius: 3px">
								</button></li>
							<li><button type="submit" id="save"
									style="padding: 0; border: 0;">
									<img
										src="${pageContext.request.contextPath}/resources/images/save.jpg"
										style="border-radius: 3px">
								</button></li>
						</ul>
				</form>
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