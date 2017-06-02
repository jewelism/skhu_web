<!-- member_info.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/user.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">
<title>성공회대 총동문회</title>
<style>
#nav>ul>li.current:before {
   bottom: -0.6em;
}

input[type="text"], input[type="password"], input[type="email"],
   textarea {
   width: 75%;
}
</style>
</head>
<body>
   <div id="page-wrapper">

      <c:import url="../menu.jsp" />
      <section class="userEdit">


      <div class="container">
         <div class="subhead">
            <div class="box highlight">
               <div class="boad">
                  <h3>회원정보</h3>
                  <div id="write">
                     <script>
                        fk()
                     </script>
                  </div>
               </div>
            </div>
            <hr style="height: 5px; background-color: #b7822b;">

         </div>
         <c:forEach var="mem" items="${ mem }">
            <div id="image_box" class="col-md-3">
               <div class="image_set">
               <sec:authorize access="hasRole('ROLE_USER') && !hasRole('ROLE_ADMIN')">
                  <c:choose>
                     <c:when test="${mem.u_openPhoto eq true || (user.u_cNumber eq mem.u_cNumber)&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\")}">
                        <img class="img-circle img-responsive img-center"
                           style="width: 350px; height: 350px;"
                           src="${pageContext.request.contextPath}/resources/userImages/${mem.u_photo}"
                           onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
                     </c:when>
                     <c:otherwise>
                        <img class="img-circle img-responsive img-center"
                           style="width: 350; height: 350px;"
                           src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif">
                     </c:otherwise>
                  </c:choose>
               </sec:authorize>
               <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <img class="img-circle img-responsive img-center"
                           style="width: 350px; height: 350px;"
                           src="${pageContext.request.contextPath}/resources/userImages/${mem.u_photo}"
                           onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'>
               </sec:authorize>
               </div>
            </div>
            <div class="col-md-9 personal-info">


               <div class="subbody">

                  <fieldset>

                     <div class="control-group">
                        <label class="control-label">이름</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_name}" class="input-xlarge"
                              style="height: 25px;" readonly />
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label">기수, 등급</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_cNumber}기 ${mem.u_status}"
                              class="input-xlarge" style="height: 25px;" readonly />
                           <c:if test="${user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\")&&mem.u_status ne \"회장\"&&mem.u_id ne user.u_id}">
                               
                                 <form method="get" style="display: inline;">
                                    <input type="hidden" name="uid" value="${mem.u_id}"/>
                                    <input type="hidden" name="ustatus" value="${mem.u_status}"/>
                                  <button id="mngsel" class="btn" style="margin-bottom:5px;margin-top:-2px;">양도</button>
                               </form>
                               
                           </c:if>
                              
                           
                        </div>
                     </div>
                     
            <!--  //////*******/////관리자로 로그인했을때/////***********///////// -->
            
            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                     <div class="control-group">
                        <label class="control-label" for="name">생년월일</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_birth}" class="input-xlarge" style="height: 25px;" readonly />
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">휴대폰번호</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_phone}" class="input-xlarge" style="height: 25px;" readonly />
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">이메일</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_email}" class="input-xlarge" style="height: 25px;" readonly />
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">주소</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_address}" class="input-xlarge" style="height: 25px;" readonly />
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">직장전화</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_jobPhone}" class="input-xlarge" style="height: 25px;" readonly />
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">직장지위</label>
                        <div class="controls">
                           <input type="text" value="${mem.u_jobStatus}" class="input-xlarge" style="height: 25px;" readonly />
                        </div>
                     </div>
                     </sec:authorize>
                     <sec:authorize access="hasRole('ROLE_USER') && !hasRole('ROLE_ADMIN')">
                     <div class="control-group">
                        <label class="control-label" for="name">생년월일</label>
                        <div class="controls">
                           <c:choose>
                              <c:when test="${mem.u_openBirth eq true || (user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\"))}">
                                 <input type="text" value="${mem.u_birth}" class="input-xlarge" style="height: 25px;" readonly />
                              </c:when>
                              <c:otherwise>
                                 <input type="text" value="비공개" class="input-xlarge" style="height: 25px;" readonly />
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">휴대폰번호</label>
                        <div class="controls">
                           <c:choose>
                              <c:when test="${mem.u_openPhone eq true || (user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\"))}">
                                 <input type="text" value="${mem.u_phone}" class="input-xlarge" style="height: 25px;" readonly />
                              </c:when>
                              <c:otherwise>
                                 <input type="text" value="비공개" class="input-xlarge" style="height: 25px;" readonly />
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">이메일</label>
                        <div class="controls">
                           <c:choose>
                              <c:when test="${mem.u_openEmail eq true || (user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\"))}">
                                 <input type="text" value="${mem.u_email}" class="input-xlarge" style="height: 25px;" readonly />
                              </c:when>
                              <c:otherwise>
                                 <input type="text" value="비공개" class="input-xlarge" style="height: 25px;" readonly />
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">주소</label>
                        <div class="controls">
                           <c:choose>
                              <c:when test="${mem.u_openAddress eq true || (user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\"))}">
                                 <input type="text" value="${mem.u_address}" class="input-xlarge" style="height: 25px;" readonly />
                              </c:when>
                              <c:otherwise>
                                 <input type="text" value="비공개" class="input-xlarge" style="height: 25px;" readonly />
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="name">소속직장</label>
                        <div class="controls">
                           <c:choose>
                              <c:when test="${mem.u_openJobName eq true || (user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\"))}">
                                 <input type="text" value="${mem.u_jobName}" class="input-xlarge" style="height: 25px;" readonly />
                              </c:when>
                              <c:otherwise>
                                 <input type="text" value="비공개" class="input-xlarge" style="height: 25px;" readonly />
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     
                     <div class="control-group">
                        <label class="control-label" for="name">직장지위</label>
                        <div class="controls">
                           <c:choose>
                              <c:when test="${mem.u_openJobStatus eq true || (user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\"))}">
                                 <input type="text" value="${mem.u_jobStatus}" class="input-xlarge" style="height: 25px;" readonly />
                              </c:when>
                              <c:otherwise>
                                 <input type="text" value="비공개" class="input-xlarge" style="height: 25px;" readonly />
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label" for="name">직장전화</label>
                        <div class="controls">
                           <c:choose>
                              <c:when test="${mem.u_openJobPhone eq true || (user.u_cNumber eq mem.u_cNumber&&(user.u_status eq \"회장\"||user.u_status eq \"부회장\"))}">
                                 <input type="text" value="${mem.u_jobPhone}" class="input-xlarge" style="height: 25px;" readonly />
                              </c:when>
                              <c:otherwise>
                                 <input type="text" value="비공개" class="input-xlarge" style="height: 25px;" readonly />
                              </c:otherwise>
                           </c:choose>
                        </div>
                     </div>

                     </sec:authorize>
         </c:forEach>
         <div class="control-group">
            <div class="controls">
               <form method="post" class="gisuform"
                  action="${pageContext.request.contextPath}/member/cardinalList.do?selgisu=${selgisu}"
                  style="margin-left: 12px; margin-right: 20px; margin-top: -15px">
                  <input type="hidden" name="searchsel" value="${searchsel}" />
                  <input type="hidden" name="searchtxt" value="${searchtxt}" /><br/>
                  <button type="submit" class="btn">목록으로 나가기</button>
               </form>
            </div>

         </div>

         </fieldset>


      </div>

      <hr style="height: 5px; background-color: #b7822b;">
   </div>

   </div>

   </section>



   <!-- Footer -->
   <div id="footer">

      <!-- Copyright -->
      <div class="copyright">
         <ul class="menu">
            <li>&copy; Boseok. All rights reserved</li>
         </ul>
      </div>

   </div>
   </div>

   <!-- Scripts -->
   <script>
   document
   .getElementById("mngsel")
   .addEventListener("click", function( e ){
       if( ! confirm("직책을 양도합니다.") ){
          e.preventDefault();
       } else {
          alert("로그아웃됩니다.");
          location.href="../main/logout.do";
          document.form.submit();
       }
   });
   </script>
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