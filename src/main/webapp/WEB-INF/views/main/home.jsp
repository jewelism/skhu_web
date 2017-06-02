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
   href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">
<title>성공회대 총동문회</title>
</head>
<body>
   <div id="page-wrapper">
      <c:import url="../menu.jsp" />

      <section id="banner"> </section>

      <!-- Highlights -->
      <section class="wrapper style1">
      <div class="container">
         <div class="row 200%">
            <section class="4u 12u(narrower)">
            <div class="box highlight">
               <i class="icon major fa-search"></i>
               <h3>검색</h3>
               <form method="post" action="${pageContext.request.contextPath}/member/cardinalList.do?selgisu=0">
                  <select name="searchsel" id="myOption">
                     <option value="0">검색없음</option>
                     <option value="1">이름</option>
                     <option value="2">폰번호</option>
                     <option value="3">소속지위</option>
                  </select> 
                  <input type="text" name="searchtxt" id="search_" /> 
                  <input type="image" src="${pageContext.request.contextPath}/resources/images/search.jpg" id="my_" />
               </form>
            </div>
            </section>
            <section class="4u 12u(narrower)">
            <div class="box highlight">
               <i class="icon major fa-pencil"></i>
               <h3>공지사항</h3>
               <c:forEach var="k" items="${plist }">
                  <li style="margin:5.5%; font-size:20px; overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                  <a style="text-decoration:none; color:black;"href="../community/notice_content.do?n_id=${k.n_id}">${k.n_title }</a></li>
               </c:forEach>
            </div>
            </section>
            <section class="4u 12u(narrower)">
            <div class="box highlight">
               <i class="icon major fa-smile-o"></i>
               <h3>자유게시판</h3>
               <c:forEach var="b" items="${blist }">
                  <li style="margin:5.5%; font-size:20px; overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                     <a style="text-decoration:none; color:black;"href="../community/board_content.do?b_id=${b.b_id}">${b.b_title }</a></li>
               </c:forEach>
            </div>
            </section>
         </div>
      </div>
      </section>
      <!-- Footer -->
      <div id="footer">

         <!-- Icons -->
         <ul class="icons">
            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon fa-facebook"><span
                  class="label">Facebook</span></a></li>
            <li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
            <li><a href="#" class="icon fa-linkedin"><span
                  class="label">LinkedIn</span></a></li>
            <li><a href="#" class="icon fa-google-plus"><span
                  class="label">Google+</span></a></li>
         </ul>

         <!-- Copyright -->
         <div class="copyright">
            <ul class="menu">
               <li>&copy; Untitled. All rights reserved</li>
               <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
            </ul>
         </div>

      </div>
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