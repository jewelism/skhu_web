<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/board.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/smarterditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">

<title>역대 동문회장</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/smarterditor/js/init.js"
	type="text/javascript"></script>
<script type="text/javascript">
 function getFile(){
   document.getElementById("upfile").click();
 }
 function sub(obj){
    var file = obj.value;
    var fileName = file.split("\\");
    document.getElementById("yourBtn").innerHTML = fileName[fileName.length-1];
    document.getElementById("g_photo").value = fileName[fileName.length-1];
    if (obj.files && obj.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah1').attr('src', e.target.result);
            $('#blah2').attr('src', e.target.result);
        }

        reader.readAsDataURL(obj.files[0]);
    }
    event.preventDefault();
  }
</script>
<style type="text/css">
 	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: none;}
</style>
<style>
textarea {
	width: 500px;
	height: 365px;
	background-color: transparent;
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
						<i class="icon major fa-smile-o"></i>
						<ul>
							<h3 id="h_3">introduce</h3>
							<li style="background-color: #dcd0d0;">인사말</li>
							<li style="cursor: pointer;"><a href="introduce1.do">소개</a></li>
							<li style="cursor: pointer;"><a href="introduce3.do">회칙</a></li>
						</ul>
					</div>
					</section>

					<section class="box" style="padding: 80px 0 0 0px;">
					<h3 class="page-header" style="margin: 0px 0 0px">인사말</h3>
					<div class="introduce2_box" style="width: 760px; height: 300px;">

						<div style="width: 15%;margin-top:10px;">

							<input style="height: 100%;" type="text" name="g_name"
								value="${greeting.g_name }">

						</div>


						<table class="table table-bordered"
							style="margin-top: 0px; width: 100%; height: 300px;">
							<tr>
								<td style="width: 25%;">
								<c:if test="${empty greeting.g_photo }">
			      					<image id="blah1" style="display:block; width:350px;height:350px; margin-top:10px;" src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif">
			    				</c:if>
			    				<c:if test="${not empty greeting.g_photo }">
			      					<image id="blah2" style="display:block; width:350px;height:350px; margin-top:10px;" src="${pageContext.request.contextPath}/resources/userImages/${greeting.g_photo}"
			      					onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
			    				</c:if>
								</td>
								<td><textarea rows="14" cols="100" name="g_content"
										class="smarteditor2" id="body">${greeting.g_content}</textarea></td>
							</tr>
						</table>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<input id="g_photo" name="g_photo" type="hidden" value="${greeting.g_photo}"/>
             			<div id="yourBtn" onclick="getFile()" class="btn btn-success" style="margin-left:45px; width:150px;">사진 업로드</div>
            			<div style='height: 0px;width: 0px; overflow:hidden;'><input id="upfile" type="file" name="image" value="upload" onchange="sub(this)"/></div>
						
							<li style="float: right;"><button type="submit" id="save"
									name="cmd" value="save" style="padding: 0; border: 0;">
									<img
										src="${pageContext.request.contextPath}/resources/images/save.jpg"
										style="border-radius: 3px">
								</button></li>
						</sec:authorize>
					</div>
					</section>
				</div>
			</div>
		</div>
		</section>
		</div>
	</form>
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