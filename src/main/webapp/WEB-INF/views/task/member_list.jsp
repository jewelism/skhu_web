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
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/member_list.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<title>성공회대 총동문회</title>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="me.js"></script>
<script>
    $(function() {
        $("tbody tr").click(function() {
            location.href = $(this).attr("data-url");
        });
        $("div.pagination a").click(function() {
            $("input[name=pg]").val($(this).attr("data-page"));
            $("form").submit();
        });
        $("[data-auto-submit=true]").change(function() {
            $(this).parents("form").submit();
        });
    });
</script>
</head>
<body>
   <div id="page-wrapper" style="margin-bottom:30px;">

	<c:import url="../menu.jsp"/>

	<div class="container">
	    <hr />
	    <h1>회원 목록</h1>
	    <hr />
	    <form:form method="get" modelAttribute="paginationM">
	    	<input type="hidden" name="pg" value="1" />
	    
	    	<span style="display: inline-block; margin-bottom: 5px;">사이즈</span>
		    <form:select path="sz" data-auto-submit="true" style="width:60px; height:30px;">
	        	<form:option value="5" />
	        	<form:option value="10" />
	        	<form:option value="30" />
	        	<form:option value="100" />
	    	</form:select>
	    	<div style="float:right;">
		    	<span style="display: inline-block; margin-bottom: 5px;">기수</span>
		    	<form:select path="sc" style="width:80px; height:30px;">
		            <form:option value="0" label="전체" />
		            <form:option value="1" label="1기" />
		            <form:option value="2" label="2기" />
		            <form:option value="3" label="3기" />
		           	<form:option value="4" label="4기" />
		           	<form:option value="5" label="5기" />
		           	<form:option value="6" label="6기" />	           		            	            	            
		        </form:select>
		        
		        <span style="display: inline-block; margin-bottom: 5px;">이름</span>
	        	<form:input path="sn" style="width:200px; height:30px;"/>
	        	<button type="submit" class="btn btn-small" style="margin-bottom: 10px;">검색</button>
	    	</div>    
	    <table class="table table-bordered" style="margin-top:15px;">
	        <thead>
	            <tr>
	            	<th>사진</th>
	                <th>아이디</th>
	                <th>이름</th>
	                <th>기수</th>
	                <th>등급</th>
	                <th>생년월일</th>
	   				<th>이메일</th>
	   				<th>최초 비밀번호 변경</th>             
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="user" items="${ list }">
	                <tr data-url="user_edit.do?id=${ user.u_loginId }&${paginationM.queryString}">
	                	<c:if test="${empty user.u_photo }">
	                		<td><image style="width:50px;height:50px;" src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"></td>
	                	</c:if>
	                	<c:if test="${not empty user.u_photo }">
	                		<td><image style="width:50px;height:50px;" src="${pageContext.request.contextPath}/resources/userImages/${user.u_photo}"
	                		onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'></td>
	                	</c:if>
	                    <td>${ user.u_loginId }</td>
	                    <td>${ user.u_name }</td>
	                    <td>${ user.u_cNumber }기</td>
	                    <td>${ user.u_status }</td>
	                    <td>${ user.u_birth }</td>
	                    <td>${ user.u_email }</td>
	                    <td>
	                    <c:choose>
					  	  <c:when test="${user.u_count == true }"><image style="width:30px;height:30px;" src="${pageContext.request.contextPath}/resources/images/check.png"></c:when>
 						  <c:otherwise></c:otherwise>
						</c:choose>	                    
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    <hr />
	    
	    <div class="pagination pagination-small pagination-centered" style="margin-top:35px;">
        	<ul>
            	<c:forEach var="num" items="${ paginationM.pageList }">
                	<li class='${ num.cssClass }'><a data-page="${ num.number }">${ num.label }</a></li>
            	</c:forEach>
        	</ul>
    	</div>
    	
    	</form:form>
	</div>

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