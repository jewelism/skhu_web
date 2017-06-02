<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/register.css" />
<title>성공회대 총동문회</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.maskedinput.js" type="text/javascript"></script> 
<script>
$(function(){
    $("#allCheck").click(function(){
		if($("#allCheck").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		} else {
			$("input[type=checkbox]").prop("checked",false);
		}
	})
})
jQuery(function($){
   $(".date").mask("9999-99-99",{placeholder:"____-__-__"});
   $(".phone").mask("999-9999-9999",{placeholder:"___-____-____"});   
   $(".jobPhone").mask("99-999-9999",{placeholder:"__-___-____"});
});
function checkFileType(filePath) {
    var fileFormat = filePath.split(".");
    if (fileFormat.indexOf("xlsx") > -1) {
        return true;
    } else {
        return false;
    }
}
	
function upload() {
    var file = $("#excelFile").val();
    if (file == "" || file == null) {
    	alert("파일을 선택해주세요.");
        return false;
    } else if (!checkFileType(file)) {
    	alert("엑셀 파일만 업로드 가능합니다.");
        return false;
    }
    if (confirm("업로드 하시겠습니까?")) {
    	$("#excelForm").submit();        
	}
}

function register(){
	$('#userForm').submit();
}
</script>
</head>
<body>
   <c:import url="../menu.jsp"/>
    
      <div class="container">
      	<hr />
	   		 <h1>회원 등록</h1>
	    <hr />
	    
               
			<form id="excelForm" enctype="multipart/form-data" method="post" action="upload.do" >
        		<input id="excelFile" type="file" name="excelFile"/>
        		<button id="uploadButton" type="button" onclick="upload()" class="btn btn-success" style="margin-bottom: 5px;">업로드</button>
        		<c:if test="${ not empty error }">
	        		<div class="alert alert-error">${ error }</div>
	    		</c:if>
	    		<c:if test="${ not empty success }">
	        		<div class="alert alert-success">${ success }</div>
	    		</c:if>
    		</form>
    		
    		<form:form id="userForm" method="post" action="register.do" modelAttribute="userForm" >
    		<table class="table table-bordered" style="margin-top:15px; margin-bottom:15px;">
	        <thead>
	            <tr>
	            	<th style="width:60px;"><input id="allCheck" type="checkbox" style="margin-bottom:7px;" checked>열번</th>
	            	<th style="width:40px;">기수</th>
	            	<th style="width:70px;">사진</th>
	                <th style="width:70px;">성명</th>
	                <th style="width:100px;">소속</th>
	                <th style="width:70px;">지위</th>
	   				<th style="width:100px;">핸드폰</th>
	   				<th style="width:100px;">직장전화</th>
	   				<th style="width:100px;">이메일</th>
	   				<th style="width:100px;">근무지 주소</th>
	   				<th style="width:100px;">생년월일</th>
	            </tr>
	        </thead>
	        <c:forEach var="item" items="${userForm.users}" varStatus="status">
	        		<tr>
	        			<td align="Center"><input type="checkbox" name="values" value="${status.count}" style="border: 0; text-align: center;margin-bottom: 8px;" checked>${status.count }</td>
	        			<td><input name="users[${status.index }].u_cNumber" value="${item.u_cNumber }" style="${item.val_cNumber} width:100%; text-align: center"/></td>
		                <td>
		                <input name="users[${status.index }].u_photo" value="${item.u_photo }" style="display:none; width:100%; border: 0; text-align: center"/>
		                <c:if test="${empty item.u_photo }">
	                		<image style="width:50px;height:50px;" src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif">
	                	</c:if>
		                <c:if test="${not empty item.u_photo }">
	                		<image style="width:50px;height:50px;" src="${pageContext.request.contextPath}/resources/userImages/${item.u_photo}"
	                		onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
	                	</c:if>
		                </td>
		                <td><input name="users[${status.index }].u_name" value="${item.u_name }" style="${item.val_name} width:100%; text-align: center"/></td>
	   					<td><input name="users[${status.index }].u_jobName" value="${item.u_jobName }" style="width:100%; border: 0; text-align: center"/></td>
	   					<td><input name="users[${status.index }].u_jobStatus" value="${item.u_jobStatus }" style="width:100%; border: 0; text-align: center"/></td>
	   					<td><input class="phone" name="users[${status.index }].u_phone" value="${item.u_phone }" style="${item.val_phone} width:100%; text-align: center"/></td>
	   					<td><input class="jobPhone" name="users[${status.index }].u_jobPhone" value="${item.u_jobPhone }" style="width:100%; border: 0; text-align: center"/></td>
	   					<td><input id="email" name="users[${status.index }].u_email" value="${item.u_email }" style="width:100%; border: 0; text-align: center"/></td>
	   					<td><input name="users[${status.index }].u_address" value="${item.u_address }" style="width:100%; border: 0; text-align: center"/></td>
	   					<td><input class="date" name="users[${status.index }].u_birth2" value="${item.u_birth2 }" style="${item.val_birth} width:100%;text-align: center"/></td>
	   					
	                </tr>
	        </c:forEach>
                  
                  
            </table> 
            <hr/>
               <div id="buttonParty">
	               <input type="submit" name="btn" onclick="register()" style="background-color:white
		               ;border:1px solid #ccc9c9; color:black;" value="회원등록" >
               </div>
            </form:form>   

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