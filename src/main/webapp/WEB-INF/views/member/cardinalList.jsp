<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
<!-- Bootstrap Core CSS -->
<link
   href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Custom CSS -->
<link
   href="${pageContext.request.contextPath}/resources/assets/css/round-about.css"
   rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">
<title>성공회대 총동문회</title>
<style>
.emptyuser {
   margin-right: auto;
   margin-left: 500px;
   margin-bottom: 100px;
}

.col-lg-12 {
   margin-left: 50px;
}

.center-block {
   display: inline-block;
   margin-right: auto;
   margin-left: auto;
}

.img-thumbnail {
   padding: 0;
}

#nav>ul>li.current {
   font-weight: 600;
}

#nav>ul>li.current:before {
   -moz-transform: rotateZ(45deg);
   -webkit-transform: rotateZ(45deg);
   -ms-transform: rotateZ(45deg);
   transform: rotateZ(45deg);
   width: 0.75em;
   height: 0.75em;
   content: '';
   display: block;
   position: absolute;
   bottom: -0.7em;
   left: 50%;
   margin-left: -0.375em;
   background-color: #b7822b;
   background-image:
      url("${pageContext.request.contextPath}/resources/images/bg01.png");
}

#nav>ul>li.current a {
   color: #fff;
}

.img-thumbnail {
   background-color: rgba(0, 0, 0, 0.15);
   border: 0;
}

.page-header {
   margin: -40px 0 30px;
}
</style>
</head>

<body>
   <div id="page-wrapper">

      <c:import url="../menu.jsp" />

      <section id="banner"> </section>

      <!-- Highlights -->
      <section class="wrapper style1">
      <div class="container">
         <div class="container main">
            <!-- Team Members Row -->
            <div class="row">
               <div class="col-lg-12">
                  <h3 class="page-header">
                     <form method="get">
                        <select name="selgisu" id="gisusel" onchange="this.form.submit()"
                           style="font-size: 30px; width: 100px; height: 60px; margin-left: 20px">
                           <option style="font-size: 30px" value="0" label="전체" />
                           <c:forEach var="g" begin="1" end="${ gisu }" step="1">
                              <c:choose>
                                 <c:when test="${g eq selgisu}">
                                    <option style="font-size: 30px" value="${g}" label="${g}기"
                                       selected />
                                 </c:when>
                                 <c:otherwise>
                                    <option style="font-size: 30px" value="${g}" label="${g}기" />
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                        </select>
                     </form>
                     <form method="post" class="gisuform"
                        style="margin-left: 12px; margin-right: 20px; margin-top: -15px">

                        <button type="submit" class="btn btn-small search"
                           style="width: 50px; margin-top: 20px; margin-bottom: 10px; float: right">검색</button>
                        <input type="text" class="searchMem" id="search"
                           name="searchtxt" value="${searchtxt}"
                           style="width: 250px; height: 27px; margin-top: 20px; margin-right: 5px; float: right" />
                        <select name="searchsel"
                           style="width: 150px; height: 27px; margin-top: 20px; margin-right: 5px; float: right">
                           <option value="0" ${ searchsel == 0 ? "selected" : "" }>검색없음</option>
                           <option value="1" ${ searchsel == 1 ? "selected" : "" }>이름</option>
                           <option value="2" ${ searchsel == 2 ? "selected" : "" }>폰번호</option>
                           <option value="3" ${ searchsel == 3 ? "selected" : "" }>소속지위</option>
                        </select>
                     </form>
                  </h3>

               </div>

               <c:if test="${empty list}">
                  <h2 class="emptyuser">회원이 없습니다</h2>
               </c:if>

            
               <c:forEach var="i" items="${ list }">
                  <div class="col-lg-4 col-sm-6 text-center">
                  <sec:authorize access="hasRole('ROLE_USER') && !hasRole('ROLE_ADMIN')">
                     <c:choose>
                        <c:when test="${i.u_openPhoto eq true || (user.u_cNumber eq i.u_cNumber)&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\")}">
                           <img class="img-circle img-responsive img-center"
                              style="width: 200px; height: 200px;"
                              src="${pageContext.request.contextPath}/resources/userImages/${i.u_photo}"
                              onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
                        </c:when>
                        <c:otherwise>
                           <img class="img-circle img-responsive img-center"
                              style="width: 200px; height: 200px;"
                              src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif">
                        </c:otherwise>
                     </c:choose>
                  </sec:authorize>
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                  <img class="img-circle img-responsive img-center"
                              style="width: 200px; height: 200px;"
                              src="${pageContext.request.contextPath}/resources/userImages/${i.u_photo}"
                              onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
                 </sec:authorize>
                 
                     


                     <h3>${i.u_name}
                        <small>${i.u_cNumber}기 ${i.u_status}</small>
                     </h3>
                     <p>
                     <form method="post" action="${pageContext.request.contextPath}/member/member_info.do">
                        <input type="hidden" name="uid" value="${i.u_id}"/>
                        <input type="hidden" name="selgisu" value="${requestScope.selgisu}"/>
                        <c:choose>
                           <c:when test="${empty requestScope.searchsel}">
                              <input type="hidden" name="searchsel" value="0"/>
                           </c:when>
                           <c:otherwise>
                              <input type="hidden" name="searchsel" value="${requestScope.searchsel}"/>
                           </c:otherwise>
                        </c:choose>
                        <input type="hidden" name="searchtxt" value="${requestScope.searchtxt}"/>
                        <button type="submit" class="btn">회원상세정보</button>
                     </form>

                     </p>

                  </div>
               </c:forEach>
            </div>

            <hr>

            <!-- Footer -->

            <div class="row">
               <div class="col-lg-12">
                  <p>Copyright &copy; Boseok</p>
               </div>
               <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

         </div>
      </div>
   </div>
   </section>
   <!-- Footer -->
   <%--
            <div id="footer">

               <!-- Icons -->
                  <ul class="icons">
                     <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                     <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                     <li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
                     <li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
                     <li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
                  </ul>

               <!-- Copyright -->
                  <div class="copyright">
                     <ul class="menu">
                        <li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                     </ul>
                  </div>

            </div>
          --%>


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