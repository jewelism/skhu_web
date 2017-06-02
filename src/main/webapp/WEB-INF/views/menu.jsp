<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Header -->
<div id="header">
<!-- Logo -->
<h1>
    <p id="logo">함께 맞는 비</p>
</h1>
<!-- Nav -->
<sec:authorize access="hasRole('ROLE_USER') && !hasRole('ROLE_ADMIN')">
<nav id="nav">
  <ul>
    <li class="${page.user}">
    	<a href="/skhu/user/edit.do">
    		<image class="center-block img-circle img-thumbnail img-responsive" style="width:25px;height:25px;"
            src="${pageContext.request.contextPath}/resources/userImages/${user.u_photo }"
            onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
    		&nbsp;&nbsp;&nbsp;${user.u_name}(${user.u_cNumber}기)
    	</a>
    	<ul>
	    	<li><a href="/skhu/user/edit.do">내정보</a></li>
	     	<li><a href="/skhu/main/logout.do">로그아웃</a></li>
	 	</ul>
    </li>
    <li id="first" class="${page.main}"><a href="${pageContext.request.contextPath}/main/home.do">홈</a></li>
    <li class="${page.member}"><a href="${pageContext.request.contextPath}/member/cardinalList.do?selgisu=0">총동문회</a>
    	<ul>
        	<li><a href="${pageContext.request.contextPath}/member/cardinalList.do?selgisu=0">동문명단</a></li>
        	<c:if test="${user.u_status eq \"회장\"||user.u_status eq \"부회장\"}">
            	<li class="${page.member}"><a href="/skhu/member/member_mail.do">메일전송</a></li>
         	</c:if>
     	</ul>
    </li>
    <li class="${page.introduce}"><a href="/skhu/introduce/introduce1.do">안내</a>
	  <ul>
		<li><a href="/skhu/introduce/introduce1.do">인문학습원 소개</a></li>
		<li><a href="/skhu/introduce/introduce2.do">전,현 원장 인삿말</a></li>
		<li><a href="/skhu/introduce/introduce3.do">총동문회 회칙</a></li>
	  </ul>
	</li>
    <li class="${page.community}"><a href="/skhu/community/notice.do">커뮤니티</a>
	  <ul>
	    <li><a href="/skhu/community/notice.do">공지사항</a></li>
	    <li><a href="/skhu/community/board.do">자유게시판</a></li>
	  </ul>
	</li>
  </ul>
</nav>
</div>
</sec:authorize>      

<sec:authorize access="hasRole('ROLE_ADMIN')">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main2.css" />
<!-- Nav -->
<nav id="nav">
   <ul>
      <li><a href="#"><image class="center-block img-circle img-thumbnail img-responsive" style="width:25px;height:25px;" src="${pageContext.request.contextPath}/resources/userImages/admin.png">&nbsp;&nbsp;&nbsp;관리자</a>
      	<ul>
	     	<li><a href="/skhu/main/logout.do">로그아웃</a></li>
	 	</ul>
      </li>
      <li id="first" class="${page.main}"><a href="/skhu/main/home_admin.do">홈</a></li>
    <li class="${page.member}"><a href="${pageContext.request.contextPath}/member/cardinalList.do?selgisu=0">총동문회</a>
     	<ul>
       		 <li><a href="${pageContext.request.contextPath}/member/cardinalList.do?selgisu=0">동문명단</a></li>
     	</ul>
    </li>
    <li class="${page.introduce}"><a href="/skhu/introduce/introduce1.do">안내</a>
	  <ul>
		<li><a href="/skhu/introduce/introduce1.do">인문학습원 소개</a></li>
		<li><a href="/skhu/introduce/introduce2.do">전,현 원장 인삿말</a></li>
		<li><a href="/skhu/introduce/introduce3.do">총동문회 회칙</a></li>
	  </ul>
	</li>
    <li class="${page.community}"><a href="/skhu/community/notice.do">커뮤니티</a>
	  <ul>
	    <li><a href="/skhu/community/notice.do">공지사항</a></li>
	    <li><a href="/skhu/community/board.do">자유게시판</a></li>
	  </ul>
	</li>
    <li class="${page.task}"><a href="/skhu/task/member_list.do">업무
    	<c:if test="${rc.total ne 0 }">
    		<span class="badge">${rc.total}</span>
    	</c:if>
    	</a>
      <ul>
       	<li><a href="/skhu/task/member_list.do">회원목록</a></li>
       	<li><a href="/skhu/task/member_register.do">회원등록</a></li>
       	<li><a href="/skhu/task/requestId.do">아이디변경
       	<c:if test="${rc.countId ne 0 }">
    		<span class="badge">${rc.countId}</span>
    	</c:if>
       	</a></li>
       	<li><a href="/skhu/task/requestDrop.do">회원탈퇴
       	<c:if test="${rc.countDrop ne 0 }">
    		<span class="badge">${rc.countDrop}</span>
    	</c:if>
    	</a></li>
      </ul>
    </li>
   </ul>
</nav>
</div>
</sec:authorize>
      
