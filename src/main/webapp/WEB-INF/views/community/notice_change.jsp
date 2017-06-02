<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smarterditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">

<title>성공회대 총동문회</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/smarterditor/js/init.js" type="text/javascript"></script>
   <script
   src="${pageContext.request.contextPath}/resources/assets/js/comment/comment.js"></script>
<script>
var fk=function () {
   var ac="";
   if (matchMedia("screen and (max-width: 840px)").matches) {
       ac="+"
          $("#smart_editor2_content").css("width","310px");
      } else {
        ac="글쓰기"
           $("#smart_editor2_content").css("width","auto");
      }
}
</script>


<body>
   <div id="page-wrapper">

   <c:import url="../menu.jsp"/>
   
      <section id="banner"> </section>

      <!-- Highlights -->
      <section class="wrapper style1">
      <div class="container">
         <div class="row 200%">
         <section class="me">
            <div class="box highlight">
            <div id="right_section">
            <i class="icon major fa-smile-o"></i>
            <ul>
            <h3 id="h_3">Community</h3>
            <li style="background-color:#dcd0d0;">공지사항</li>
                  <li id="bd" style="cursor:pointer;">자유게시판</li>
            </ul>
            </div>
            </div>
            </section>
            <section class="board">
            <div class="box highlight">
               <div class="boad">
                           <h3 >공지사항</h3>
               <div id="write">
            </div>
            </div>
            </section>

            <section class="board">

            <form id="fm" method="post" enctype="multipart/form-data">
               <table class="box highlight" id="board_2">
                  <tr>
                     <td colspan="5"></td>
                  </tr>
                  <tr>
                     <td>제목</td>
                     <td colspan="2"><input type="text" name="title" value="${notice.n_title }"></td>
                     
                  </tr>
                  <tr>
                  <td>작성자</td>
                  <td>${notice.n_writerName}</td>
                  </tr>
                  <tr>
                  <td>파일첨부</td>
                  <td colspan="5">
                  <div class="files">
                           
                            <input style="float:left; margin-top: 1%"type="file" name="file" multiple />
                            <label class="up">+</label>
                            <label class="del">-</label>
                        
                  </div>
                  </td>
                  </tr>
                  <tr style="height:10px;">
                  </tr>
                  <tr>
                  <td>
                  </td>
                  <td class="upload">
                  
                     <div style="float:left; padding-left:2%;"><input type="checkbox" id="all"></div>
                     <div style="padding-left:10%;border-bottom: 1px solid;border-color: #b9b9b2">파일명</div>
                     <input type="hidden" id="n_hidden" value="${notice.n_id }">
                     <div id="k">
                     <div class="s">
                     <c:forEach var="f" items="${file }">
                     
                     <div class="${f.f_id }"  id="down" style="height:20px;padding-top:1%; margin-bottom:2%;">
                     <div style="float:left; padding-left:2%;">
                     
                     <input id="file" value="${f.f_id}"type="checkbox" ></div>
                     <div class="${f.f_id }" style="text-align:center;cursor:pointer; display:block"
                           data-url="${f.f_id}">${f.f_name }</div>
                     <br />
                           
                     </div>
                     
                      </c:forEach>
                      </div>
                      </div>
                  
                  </td>
                  <td style="width:24%;">
                  <label><button type="button" id="file_delete"style="background-color: white;border: 0;">삭제</button></label>
                  </td>
                  </tr>
                  
                  <tr style="height:10px;">
                  </tr>
                  <tr>
                     <td  colspan="4"><textarea rows="14" cols="100" name="body" class ="smarteditor2"id="body">${notice.n_content}</textarea>
                     
                     </td>
                  <tr>
                  
                  </tr>
                  <tr>
                     <td colspan="4"></td>
                  </tr>


               </table>
               <div id="pa2">
                  <ul>
                     <li><a href="notice.do?${pagination.queryString}"><input type="image" src="${pageContext.request.contextPath}/resources/images/cancel.jpg" style="border-radius: 3px"></a></li>
                     <li><button type="submit" id="save"style="padding: 0;border: 0;"><img src="${pageContext.request.contextPath}/resources/images/save.jpg" style="border-radius: 3px"></button></li>
                  </ul>
            </form>
         </div>
      </section>


   </div>

   </div>

   </section>

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