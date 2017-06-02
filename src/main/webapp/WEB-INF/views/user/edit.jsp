<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/user.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<title>성공회대 총동문회</title>
<style>
#nav > ul > li.current:before {
    bottom: -0.4em;
}
input[type="text"], input[type="password"], input[type="email"], textarea {
	width:75%;
}
</style>
<script type="text/javascript">
 function getFile(){
   document.getElementById("upfile").click();
 }
 function sub(obj){
    var file = obj.value;
    var fileName = file.split("\\");
    document.getElementById("yourBtn").innerHTML = fileName[fileName.length-1];
    document.getElementById("u_photo").value = fileName[fileName.length-1];
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
</head>
<body>
		<div id="page-wrapper">

	<c:import url="../menu.jsp"/>
<section class="userEdit">


	<div class="container">
	<div class="subhead">
			<div class="box highlight">
					<div class="boad">
						<h3 >회원정보 수정</h3>
					<div id="write"><script>fk()</script></div>
				</div>
			</div>
	    <hr style="	height: 5px; background-color: #b7822b;">
	   <!-- Form -->
	   <form:form id="jstl" method="post" class="form-horizontal" modelAttribute="user" enctype="multipart/form-data">
		  <div id="image_box" class="col-md-3">	  
			   <div class="image_set">
				<c:if test="${empty user.u_photo }">
			      <image id="blah1" class="center-block img-circle img-thumbnail img-responsive" style="display:block; width:350px;height:350px; margin-top:10px;" src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif">
			    </c:if>
			    <c:if test="${not empty user.u_photo }">
			      <image id="blah2" class="center-block img-circle img-thumbnail img-responsive" style="display:block; width:350px;height:350px; margin-top:10px;" src="${pageContext.request.contextPath}/resources/userImages/${user.u_photo}"
			      onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
			    </c:if>
			    <label style="float:left; margin-left:80px; margin-top:30px;">공개여부</label>
				<form:checkbox path="u_openPhoto" style="margin-left:5px; margin-top:34px;"/>
			    <form:hidden id="u_photo" path="u_photo"/>
			    <div id="yourBtn" onclick="getFile()" class="btn btn-success" style="margin-left:45px; width:150px;">사진 업로드</div>
				<div style='height: 0px;width: 0px; overflow:hidden;'><input id="upfile" type="file" name="image" value="upload" onchange="sub(this)"/></div>
		      </div>
		  </div>
		 <div class="col-md-9 personal-info">
		
	  
	  	<div class="subbody" >
			
	  <fieldset>
	  
	  	<div class="control-group">
	      <label class="control-label">아이디</label>
	      <div class="controls">
	        <form:input path="u_loginId" readonly="true" class="input-xlarge" style="height:25px; float:left;"/>
	        <button id="changeId" class="btn btn-default" type="button" style="margin-left: 5px; line-height:15px;">변경</button>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <label class="control-label">비밀번호</label>
	      <div class="controls">
	        <form:password path="u_password" showPassword="true" class="input-xlarge" style="height:25px;"/>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <label class="control-label">이름</label>
	      <div class="controls">
	        <form:input path="u_name" class="input-xlarge" style="height:25px;"/>
	      </div>
	    </div>
	 
	    <div class="control-group">
	      <label class="control-label">기수</label>
	      <div class="controls">
	      	<input type="text" value ="${user.u_cNumber }기" readonly="true" class="input-xlarge" style="height:25px;"/>
	      	<form:hidden path="u_cNumber" label="${user.u_cNumber}" class="input-xlarge" style="height:25px;"/>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <label class="control-label" for="name">등급</label>
	      <div class="controls">
	        <form:input path="u_status" readonly="true" class="input-xlarge" style="height:25px;"/>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <label class="control-label" for="name">생년월일</label>
	      <div class="controls">
	        <form:input path="u_birth" readonly="true" class="input-xlarge" style="height:25px; float:left;"/>
	        <label style="float:left; margin-left:5px; margin-top:2px;">공개여부</label>
			<form:checkbox path="u_openBirth" style="margin-left:5px; margin-top:6px;"/>
	      </div>
	    </div>
	 
	 	<div class="control-group">
	      <label class="control-label" for="name">휴대폰</label>
	      <div class="controls">
	        <form:input path="u_phone" class="input-xlarge" style="height:25px; float:left;"/>
	        <label style="float:left; margin-left:5px; margin-top:2px;">공개여부</label>
			<form:checkbox path="u_openPhone" style="margin-left:5px; margin-top:6px;"/>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <label class="control-label" for="name">이메일</label>
	      <div class="controls">
	        <form:input path="u_email" class="input-xlarge" style="height:25px; float:left;"/>
	        <label style="float:left; margin-left:5px; margin-top:2px;">공개여부</label>
			<form:checkbox path="u_openEmail" style="margin-left:5px; margin-top:6px;"/>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <label class="control-label" for="name">주소</label>
	      <div class="controls">
	        <form:input path="u_address" class="input-xlarge" style="height:25px; float:left;"/>
	        <label style="float:left; margin-left:5px; margin-top:2px;">공개여부</label>
			<form:checkbox path="u_openAddress" style="margin-left:5px; margin-top:6px;"/>
	      </div>
	    </div>
	 
	 	<div class="control-group">
	      <label class="control-label" for="name">소속직장</label>
	      <div class="controls">
	        <form:input path="u_jobName" class="input-xlarge" style="height:25px; float:left;"/>
	        <label style="float:left; margin-left:5px; margin-top:2px;">공개여부</label>
			<form:checkbox path="u_openJobName" style="margin-left:5px; margin-top:6px;"/>
	      </div>
	    </div>
	 
	 	<div class="control-group">
	      <label class="control-label" for="name">직장지위</label>
	      <div class="controls">
	        <form:input path="u_jobStatus" class="input-xlarge" style="height:25px; float:left;"/>
	        <label style="float:left; margin-left:5px; margin-top:2px;">공개여부</label>
			<form:checkbox path="u_openJobStatus" style="margin-left:5px; margin-top:6px;"/>
	      </div>
	    </div>
	 
	 	<div class="control-group">
	      <label class="control-label" for="name">직장전화</label>
	      <div class="controls">
	        <form:input path="u_jobPhone" class="input-xlarge" style="height:25px; float:left;"/>
	        <label style="float:left; margin-left:5px; margin-top:2px;">공개여부</label>
			<form:checkbox path="u_openJobPhone" style="margin-left:5px; margin-top:6px;"/>
	      </div>
	    </div>
	 	
	     <div class="control-group">
	      <!-- Button -->
	      <div class="controls">
	        <button id="saveButton" type="submit" class="btn btn-primary">저장</button>
	        <button id="dropButton" class="btn btn-danger" type="button" style="margin-left: 5px;">회원탈퇴</button>
	      </div>
	      
	    </div>
	    
		<c:if test="${ not empty error }">
	        <div class="alert alert-error">${ error }</div>
	    </c:if>
	    <c:if test="${ not empty success }">
	        <div class="alert alert-success">${ success }</div>
	    </c:if>
  	
  </fieldset>

		  	
  	</div> 
  	
  	<hr style="	height: 5px; background-color: #b7822b;">
  	</div>
  	</form:form>
</div>

    </section>

			<!-- Footer -->
				<div id="footer">

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>

				</div>
		</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.popupwindow.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/user.js"></script>
</body>
</html>