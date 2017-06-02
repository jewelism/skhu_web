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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/member_list.css" />
<title>성공회대 총동문회</title>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
	function success(){
    	$('#sel').val("승인");
    	$('#notJstl').attr('action','requestDrop.do');
    	$('#notJstl').submit();
    }
    function fail(){
    	$('#sel').val("거절");
    	$('#notJstl').attr('action','requestDrop.do');
    	$('#notJstl').submit();
    }
    function del(){
    	$('#sel').val("기록 삭제");
    	$('#notJstl').attr('action','requestDropF.do');
    	$('#notJstl').submit();
    }
    function delComplete(){
    	$('#sel').val("완전 탈퇴");
    	$('#notJstl').attr('action','requestDropF.do');
    	$('#notJstl').submit();
    }
</script>
</head>
<body>
	<c:import url="../menu.jsp"/>

      <div class="container">
                     
                    	<hr />
	    				<h1>회원 탈퇴</h1>
	    				<hr />
	    				
	    	<ul class="nav nav-tabs">
  				<li class="${active1}"><a href="requestDrop.do">대기중</a></li>
 			    <li class="${active2}"><a href="requestDropF.do">완료</a></li>
			</ul>
     		<form id="notJstl" method="post">
     		   
			<table class="table table-bordered" style="margin-top:15px;">
	        <thead>
	            <tr>
	            	<th>
	            	<c:if test="${not empty active1 }">
		            	<input id="allCheck" type="checkbox">
		            </c:if>
		            </th>
	            	<th>사진</th>
	                <th>이름</th>
	                <th>기수</th>
	                <th>등급</th>
	                <th>탈퇴 사유</th>
	   				<th>상태</th>
	   				<th>요청시간</th>           
	            </tr>
	        </thead>
	        <c:forEach var="item" items="${ list }">
	        		<tr>
	        			<td><input type="checkbox" name="values" value="${item.rd_id}"></td>
	                	<c:if test="${empty item.u_photo }">
	                		<td><image style="width:50px;height:50px;" src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"></td>
	                	</c:if>
	                	<c:if test="${not empty item.u_photo }">
	                		<td><image style="width:50px;height:50px;" src="${pageContext.request.contextPath}/resources/userImages/${item.u_photo}"></td>
	                	</c:if>
	                    <td>${ item.u_name }</td>
	                    <td>${ item.u_cNumber }기</td>
	                    <td>${ item.u_status }</td>
	                    <td><a href="#" title="${item.rd_content}" style="color:black;">탈퇴 사유</a></td>
	                    <td>${ item.rd_state }</td>
	                    <td>${ item.rd_time }</td>
	                </tr>
	        </c:forEach>
                  
                  
            </table> 
            <hr />
            
               <div id="buttonParty">
               	   <c:if test="${not empty active1 }">
		               <input type="button" name="btn" onclick="success()" style="background-color:white
		               ;border:1px solid #ccc9c9; color:black;" value="승인" >
		               <input type="button" name="btn" onclick="fail()" style="background-color:white
		               ;border:1px solid #ccc9c9; color:black;" value="거절" > 	
	               </c:if>
	               <c:if test="${not empty active2 }">
		               <input type="button" name="btn" onclick="del()" style="background-color:white
		               ;border:1px solid #ccc9c9; color:black;" value="기록 삭제" >
		               <input type="button" name="btn" onclick="delComplete()" style="background-color:white
		               ;border:1px solid #ccc9c9; color:black;" value="완전 탈퇴" > 	
	               </c:if>
	               
	               <input id="sel" type="hidden" name="sel">
               </div>

   </form>
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