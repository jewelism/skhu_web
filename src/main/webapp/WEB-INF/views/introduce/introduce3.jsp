<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
	$(function() {
		$("tr:not(:nth-child(2))").click(function() {
			location.href = $(this).attr("data-url");
		});
		$("div.pagination a").click(function() {
			$("input[name=pg]").val($(this).attr("data-page"));
			$("#jstl").submit();
		});
	});
</script>

<script>
	var fk = function() {
		var ac = "";
		if (matchMedia("screen and (max-width: 840px)").matches) {
			ac = "+"
			$("#write")
					.html(
							"<img src=${pageContext.request.contextPath}/resources/images/pencil.png style=height:30px>");
		}

		else {
			ac = "글쓰기"
			$("#write")
					.html(
							"<input type=image src=${pageContext.request.contextPath}/resources/images/write.jpg>");
		}
	}
</script>

<script>
	$(function() {
		$("#write").click(function() {
			location.href = "../introduce/introduce3_write.do"
		});
	});
</script>
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
					<i class="icon major fa-smile-o"style="margin:0 0 0 0;"></i>
					<ul>
						<h3 id="h_3">introduce</h3>
						<li style="background-color: #dcd0d0;">회칙</li>
						<li style="cursor: pointer;text-decoration:none;"><a href="introduce1.do">소개</a></li>
						<li style="cursor: pointer;text-decoration:none;"><a href="introduce2.do">인사말</a></li>
					</ul>
				</div>
				</section>
				<section class="board">
				<div class="box highlight">
					<div class="boad">
						<h3 class="page-header">동문회칙</h3>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div id="write">
								<script>
									fk()
								</script>
							</div>
						</sec:authorize>
					</div>
				</div>
				</section>
				<section class="board""> <form:form id="jstl" method="get"
					modelAttribute="pagination">
					<h1>
						<input type="hidden" name="pg" value="1" />
						<table class="box highlight" id="board_" style="font-size: 15px">
							<tr>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td style="width: 10%">번호</td>
								<td style="width: 45%">제목</td>
								<td style="width: 10%">작성자</td>
								<td style="width: 25%">작성일(수정일)</td>
								<td style="width: 10%">조회수</td>
							</tr>
							<c:forEach var="rule" items="${ list }">
								<tr style="cursor: pointer;"
									data-url="introduce3_content.do?r_id=${rule.r_id }&${ pagination.queryString}">
									<td>${ rule.no }</td>
									<td>${ rule.r_title }</td>
									<td>관리자</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${ rule.r_writeTime }" /></td>
									<td>${ rule.r_num }</td>
								</tr>
							</c:forEach>

						</table>

						<div class="pagination pagination-small pagination-centered">
							<ul>
								<c:forEach var="page1" items="${ pagination.pageList }">
									<li style="cursor: pointer;" class='${ page1.cssClass }'><a
										data-page="${ page1.number }">${ page1.label }</a></li>
								</c:forEach>
							</ul>
						</div>
						<div id="search">
							<form:select path="srchType">
								<form:option value="0" label="전체" />
								<form:option value="1" label="제목" />
								<form:option value="2" label="내용" />
							</form:select>
							<form:input path="srchText" />
							<input type="image"
								src="${pageContext.request.contextPath}/resources/images/search.jpg"
								id="my">
						</div>
				</form:form> </section>
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