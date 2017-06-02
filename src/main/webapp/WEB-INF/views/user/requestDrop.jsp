<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<head>
<title>성공회대 총동문회</title>
</head>
		<div class="container">
		
			<div class="box highlight">
					<div class="boad">
						<h3 >회원탈퇴</h3>
					<div id="write"><script>fk()</script></div>
				</div>
			</div>
		    <hr style="height: 5px;">
		
		   <form:form method="post" class="form-horizontal" modelAttribute="r_DropUser">
		   		<form:hidden path="u_id"/> 
	    		
	    		<div class="control-group">
	      			<label class="control-label" for="name">탈퇴 사유</label>
	      			<div class="controls">
	      			<c:choose>
					  	  <c:when test="${r_DropUser.rd_state ne '대기'}"><form:textarea path="rd_content" class="input-xlarge" style="height:75px; float:left;"/></c:when>
 						  <c:otherwise><form:textarea path="rd_content" readonly="true" class="input-xlarge" style="height:75px; float:left;"/></c:otherwise>
					</c:choose>
	      			</div>
	    		</div>
	    		
	    		<c:if test="${ not empty error }">
			        <div class="alert alert-error">${ error }</div>
			    </c:if>
			    <c:if test="${r_UpdateId.ru_state eq '대기'}">
			        <div class="alert alert-success">${ success }</div>
			    </c:if>
			    
		   <!-- Button -->
		      <div class="controls">
   			    <c:if test="${r_DropUser.rd_state ne '대기'}">
		        	<button id="okButton" type="submit" class="btn btn-primary">요청</button>
		        </c:if>
		        <button id="cancelButton" type="button" class="btn btn-danger" onclick="window.close()">닫기</button>
		      </div>
		   </form:form>

		</div>
	</body>
</html>