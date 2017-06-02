<!-- member_send.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/main.css" /> 
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">
<!-- <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/member_list.css" /> -->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<title>성공회대 총동문회</title>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="me.js"></script>
<script>
   $(function() {
      $("#sendmail").click(function(e) {
         if (!confirm("메일을 보냅니다.")) {
            e.preventDefault();
         } else {
            alert('메일 전송이 완료될때까지 기다려주세요');
            $.ajaxSettings.traditional = true;
            var url = unescape(location.href); 
            url.replace(/,/gi, '');
              //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
            var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("uid");
            paramArr.splice(0,1);
            //alert(paramArr);
            $.ajax({
                     type : "post",
                     url : "member_send.do",
                     data : {
                       "content" : $('textarea#txta').val(),
                       "title" : $('input#ttl').val(),
                       "uidArr" : paramArr
                     },
                     beforeSend: function() {
                         //통신을 시작할때 처리되는 함수 
                         $('html').css("cursor","wait");   // 현재 html 문서위에 있는 마우스 커서를 로딩 중 커서로 변경
                    },
                     complete: function() {
                         //통신이 완료된 후 처리되는 함수
                         $('html').css("cursor","auto"); // 통신이 완료 된 후 다시 일반적인 커서 모양으로 변경
                     },
                     success : function(data) {
                        $('#tab').empty();
                        var html = '';
                        if (data != null) {
                           html += '<br/><br/><h2 style="margin-left:500px;">메일전송완료 ${message}</h2><br/><br/><hr>';
                           html += '<button id="cancel" class="btn" onClick="loc()" style="margin-left:950px;margin-top:30px;">목록보기</button>'
                           $('#tab').append(html);
                        }
                     },
                     error : function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:"
                              + request.responseText + "\n" + "error:"
                              + error);
                     }
                });
         }
      });
      $("#cancel").click(function(e) {
         if (!confirm("이전화면으로 돌아갑니다.")) {
            e.preventDefault();
         } else {
            //이전화면으로..대충 링크
            location.href = "member_mail.do"
         }
      });
      
      $("textarea.autosize").keyup(function () {
          $(this).css("height","1px").css("height",(20+$(this).prop("scrollHeight"))+"px");
        });
   });
   function loc(){
	   location.href="member_mail.do"
   }
</script>
<style>
textarea {width:300px;overflow:visible;}
.mytable { border-collapse:collapse; }  
.mytable tr, .mytable td { border:1px solid #dddddd; }
hr {
    margin: 20px 130px 0px 130px;
    border-top: 1px solid #eeeeee;
    border-bottom: 1px solid #ffffff;
}
</style>
</head>
<body>
   <div id="page-wrapper" style="margin-bottom: 30px;">

      <c:import url="../menu.jsp" />
      <div class="container">
         <hr />
         <h1 style="margin-left:150px;">메일 전송</h1>
         <hr />
         <div id="tab">
            <!-- <table class="mytable">
               <tr>
                  <td>보내는사람</td>
                  <td colspan="${count}">${ user.u_name }</td>
               </tr>
               <tr>
                  <td>받는사람</td>
                  <td><c:forEach var="i" end="${count}" items="${ list }">${i.u_name} </c:forEach><c:if test="${count eq 10}">...외 다수 </c:if></td>
                  
               </tr>
            </table> -->
            
            <h4 style="margin-left:150px;">받는사람 : <c:forEach var="i" end="${count}" items="${ list }">${i.u_name} </c:forEach><c:if test="${count eq 10}">...외 다수 </c:if></h4>
            <hr />
            <div style="margin-left:190px; margin-top:30px;">
            <input type="hidden" id="tolist" value="${list}">
            제목<br/><input type="text" id="ttl" style="height:30px; width:800px; display: inline;"><br/>
            내용<br/><textarea id="txta" style="width:800px; height:250px;"></textarea>
            </div>
            <hr />
			<div style="margin-right:180px; margin-top:30px;">
            <button type="button" id="sendmail" class="btn"
               style="float: right; margin-left: 10px;">메일보내기</button>
            <button type="button" id="cancel" class="btn" style="float: right;">목록보기</button>
            </div>
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