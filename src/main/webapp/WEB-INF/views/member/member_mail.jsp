<!-- member_mail.jsp -->
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
           $(':checkbox', this).trigger('click');
        });
        $("div.pagination a").click(function() {
            $("input[name=pg]").val($(this).attr("data-page"));
            $("#pgna").submit();
        });
        $("[data-auto-submit=true]").change(function() {
            $(this).parents("form").submit();
        });
        $('#chkall').click(function() {
            $("#chk input[type=checkbox]").trigger("click");
        });
        $("#sendmail").click(function(e) {
           var chckType = document.getElementsByName('uid'); 
           var cnt = 0;
           for(i = 0; i < chckType.length; i++){
               if (chckType[i].checked == true)
                  cnt++;
            }
            if(cnt==0){
               alert("하나라도 선택하셔야해요");
                e.preventDefault();
            }else{
               if( ! confirm("선택된 사람들에게 보낼 메일을 작성합니다.") ){
                    e.preventDefault();
                } else {
                   document.form.submit();
                } 
            }
        });
   });
    
    
     

 
 //document.form.submit();
</script>
</head>
<body>
   <div id="page-wrapper" style="margin-bottom:30px;">

   <c:import url="../menu.jsp"/>

   <div class="container">
       <hr />
       <h1>회원 목록</h1>
       <hr />
       <form:form id="pgna" method="get" modelAttribute="paginationM">
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
                  <c:forEach var="i" begin="1" end="${ gisu }" step="1">
                     <form:option value="${ i }" label="${ i }기" />
                  </c:forEach>
              </form:select>
              
              <span style="display: inline-block; margin-bottom: 5px;">이름</span>
              <form:input path="sn" style="width:200px; height:30px;"/>
              <button type="submit" class="btn btn-small" style="margin-bottom: 10px;">검색</button>
          </div> 
       </form:form>   
       <table class="table table-bordered" style="margin-top:15px;">
           <thead>
               <tr>
                  <th><input type="checkbox" id="chkall"></th>
                  <th>사진</th>
                   <th>아이디</th>
                   <th>이름</th>
                   <th>기수</th>
                   <th>등급</th>
                   <th>생년월일</th>
                  <th>이메일</th>
                               
               </tr>
           </thead>
           <tbody>
               <c:forEach var="user" items="${ list }">
                   <tr data-url="user_edit.do?id=${ user.u_loginId }&${paginationM.queryString}">
                      <form id="mailform" method="get" action="${pageContext.request.contextPath}/member/member_send.do" style="display: inline;">
                      <td id="chk"><input type="checkbox" name="uid" value="${ user.u_id }"></td>
                      <td><image style="width:50px;height:50px;" src="${pageContext.request.contextPath}/resources/userImages/${user.u_photo}" 
                         onError='this.src="${pageContext.request.contextPath}/resources/userImages/no_pic.gif"'></td>
                       <td>${ user.u_loginId }</td>
                       <td>${ user.u_name }</td>
                       <td>${ user.u_cNumber }기</td>
                       <td>${ user.u_status }</td>
                       <td>${ user.u_birth }</td>
                       <td>${ user.u_email }</td>
                       
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
           <button id="sendmail" class="btn" style="float:right;">메일 작성</button>
       </div>       
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