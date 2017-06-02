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

<script
   src="${pageContext.request.contextPath}/resources/assets/js/comment/comment.js"></script>
<script>
   $(function() {

      $("tr:not(:nth-child(2))").click(function() {
         location.href = $(this).attr("data-url");
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
      } else {
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
         location.href = "board_write.do";
      });
      $("div.pagination a").click(function() {
         $("input[name=pg]").val($(this).attr("data-page"));
         $("form").submit();
      });
   });
</script>
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

               <i class="icon major fa-smile-o"></i>
               <ul>
                  <h3 id="h_3">Community</h3>
                  <li style="background-color:#dcd0d0;">자유게시판</li>
                  <li id="nt" style="cursor:pointer;">공지사항</li>
               </ul>

            </div>
            </section>
            <section class="board">

            <div class="box highlight">
               <div class="boad">
                  <h3>자유게시판</h3>
                  <div id="write" style="display:${css}">
                     <script>
                        fk()
                     </script>
                  </div>
               </div>
            </div>

            </section>

            <section class="board"> <form:form method="get"
               modelAttribute="pagination">
               <h1 style="font-weight:normal !important;">

                  <input type="hidden" name="pg" value="1" />
                  <table class="box highlight" id="board_" style="table-layout:fixed">

                     <tr>
                        <td colspan="6"></td>
                     </tr>
                     <tr>
                        <td>번호</td>
                        <td colspan="2">제목</td>
                        <td>작성자</td>
                        <td colspan="2">작성일</td>

                     </tr>

                     <c:forEach var="list" items="${plist}">

                        <tr 
                           data-url="board_content.do?b_id=${ list.b_id }&${pagination.queryString }"
                           style="cursor: pointer;">
                           <td >${list.b_id}</td>
                           <td colspan="2" style="text-align:left;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                           >${list.b_title}<img class="${list.b_file }" src="${pageContext.request.contextPath}/resources/assets/css/images/clip.png">
                           <c:if test="${list.b_count > 0}"><span style="color:red;">[${list.b_count}]</span></c:if></td>
                           <td>${list.b_writerName}</td>
                           <td colspan="2"><fmt:formatDate pattern="yyyy-MM-dd"
                                 value="${ list.b_writeTime 
                                 }" /></td>
                        </tr>

                     </c:forEach>

                  </table>
                  <div class="pagination pagination-small pagination-centered">
                     <ul>

                        <c:forEach var="page1" items="${ pagination.pageList }">
                           <li class='${ page1.cssClass }'><a
                              data-page="${ page1.number }">${ page1.label }</a></li>
                        </c:forEach>
                     </ul>
                  </div>
                  <div id="search">
                     <form:select path="srchType">
                        <form:option value="0" label="검색조건" />
                        <form:option value="1" label="제목" />
                        <form:option value="2" label="글쓴이" />
                     
                     </form:select>
                     <form:input path="srchText" /><input type="image"
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