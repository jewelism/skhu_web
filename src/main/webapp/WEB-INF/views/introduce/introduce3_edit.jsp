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
<script
	src="${pageContext.request.contextPath}/resources/smarterditor/js/init.js"
	type="text/javascript"></script>
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/smarterditor/js/init.js"
	type="text/javascript"></script>
<title>성공회대 총동문회</title>
<style type="text/css">
 	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: none;}
</style>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
   $(function() {
      var editor_object = [];

      nhn.husky.EZCreator
            .createInIFrame({
               oAppRef : editor_object,
               elPlaceHolder : "smt",
               sSkinURI : "${pageContext.request.contextPath}/resources/smarteditor/SmartEditor2Skin.html",
               htParams : {
                  bUseToolbar : true,
                  bUseVerticalResizer : false,
                  bUseModeChanger : true,
               }
            });

      $("button").click(function() {
         editor_object.getById["smt"].exec("UPDATE_CONTENTS_FIELD", []);
         $("#board_message").submit();
      })

   })
</script>
<script>
   var fk = function() {
      var ac = "";
      if (matchMedia("screen and (max-width: 840px)").matches) {
         ac = "+"
         $("#smart_editor2_content").css("width", "310px");
      } else {
         ac = "글쓰기"
         $("#smart_editor2_content").css("width", "auto");
      }
   }
</script>
<style>
textarea {
	width: 100%;
	height: 300px;
}
</style>
</head>
<body>
	<form method="post" enctype="multipart/form-data">

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
							<h3>수정</h3>
							<div id="write"></div>
						</div>
					</section>

					<section class="board">

					<table class="box highlight" id="board_2">
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="r_title"
								value="${rule.r_title }"></td>
							<td style="text-align: right;">작성자</td>
							<td>관리자</td>
						</tr>
						<tr>
							<td class="file_">첨부파일</td>
							<c:choose>
								<c:when test="${files==null}">
									<td>
										<div class="filebox">
											<input type="file" name="file">
									</td>
								</c:when>
								<c:otherwise>
									<td>
										<div class="files">${files.f_name}</div>
									</td>
								</c:otherwise>
							</c:choose>
							<td colspan="2"><button type="submit" class="btn btn-small"
									name="cmd" value="deleteFile">
									<i class="icon icon-remove"></i> 파일 삭제
								</button></td>
						</tr>
						<tr>
							<td colspan="4"><textarea rows="14" cols="100"
									name="r_content" class="smarteditor2" id="body">${rule.r_content }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>
					</table>

					<div id="pa2">
						<ul>
							<li><a href="introduce3_content.do?r_id=${rule.r_id }"><img
									src="${pageContext.request.contextPath}/resources/images/cancel.jpg"
									style="border-radius: 3px"></a></li>
							<li><button type="submit" id="save" name="cmd" value="save"
									style="padding: 0; border: 0;">
									<img
										src="${pageContext.request.contextPath}/resources/images/save.jpg"
										style="border-radius: 3px">
								</button></li>
						</ul>
					</div>
				</div>
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
			src="${pageContext.request.contextPath}/resources//assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	</form>
</body>
</html>