<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
   rel="stylesheet">
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
   <script src="${pageContext.request.contextPath}/resources/assets/js/comment/comment.js"></script>
<title>성공회대 총동문회</title>
</head>
<script type="text/javascript">  
$(function(){
    var $win = $(window);
    var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
 
    /*사용자 설정 값 시작*/
    var speed          = "fast";     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
    var easing         = 'swing'; // 따라다니는 방법 기본 두가지 linear, swing
    var $layer         = $('.me'); // 레이어 셀렉팅
    var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
    $layer.css('position', 'relative');
    /*사용자 설정 값 끝*/
 
    // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
    if (top > 0 )
        $win.scrollTop(layerTopOffset+top);
   
 
    //스크롤이벤트가 발생하면
    $(window).scroll(function(){
        yPosition = $win.scrollTop();
        if (yPosition < 0)
        {
            yPosition = 0;
        }
        $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
    });
});
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
                  <h3>공지사항</h3>
                  <div id="write"></div>
               </div>
            </div>
            </section>

            <section class="board">
            
               <table class="box highlight" id="board_1">
                  <tr>
                     <td colspan="4"></td>
                  </tr>
                  <tr>
                     <td style="text-align: left;padding-left: 3%;     width: 100px;">제목</td>
                     <td colspan="4">${notice.n_title }</td>
                  </tr>
                  <tr>
                     <td style="text-align: left;padding-left: 3%;     width:150px;">작성자</td>
                     <td style="float:left;">${notice.n_writerName }</td>
                     <td >작성일</td>
                     <td style="width:200px"><fmt:formatDate pattern="yyyy-MM-dd" value="${ notice.n_writeTime }" /></td>
                  </tr>
                  <tr>
                     <td style="text-align: left;padding-left: 3%;">첨부파일</td>
                  
               
                  
                     
                     <td colspan="4">
                     <c:forEach var="f" items="${file }">
                     <span id="down">
                     <span  style="float:left;cursor:pointer;"
                           data-url="${f.f_id}"><img src="${pageContext.request.contextPath}/resources/assets/css/images/mimeicon/${f.f_extension}.gif">${f.f_name }</span>
                           <br/>
                     </span>
                      </c:forEach>
                     </td>
                  
                  </tr>
                  
                  
                  <tr style="text-align:left; padding-left:10%;">
                     <td colspan='4'
                        style=' padding-left:1%; padding-top: 20px; height: 200px; word-break: break-all;line-height:30px;'>
                        ${notice.n_content}
                     </td>
                  </tr>
               
               
                  
            
               
                  <tr id="co">
                  <td colspan="4" style="background-color:#dcd0d0;">
                  <div id="here">
                     <c:forEach var="k" items="${c}">
                     <form id="c_f" class="${k.c_id}">
                     <input type="hidden" name="n_id_" value="${ notice.n_id}">
                     <input type="hidden" id="max" value="${ max}">
                     <div id="com" class="com">
                     <c:if test="${k.u_photo eq null}">
                        <img src="/skhu/resources/userImages/${k.a_photo}">
                     </c:if>
                     <c:if test="${k.a_photo eq null}">
                     <img src="/skhu/resources/userImages/${k.u_photo}">
                     </c:if>
                        
                        
                           <div style="display:inline-block;" class="k">
                              <input type="hidden" value="${k.c_id }">
                             <span>${k.c_writerName }
                             <c:if test="${k.u_cNumber ne 0}">(${k.u_cNumber}기)</c:if></span>
                              <span id="s">${k.c_writeTime}</span>
                              
                              <div id="cont">${k.c_content}</div>
                              
                           </div>
                           <c:if test="${user.u_id eq k.c_writerId}">
                           <button type="button" id="c_ad" value="${k.c_id }">수정</button>
                            <button type="button" id="c_de" value="${k.c_id }">삭제</button>
                            </c:if>
                            <c:if test="${t eq true}">
                           <button type="button" id="c_ad" value="${k.c_id }">수정</button>
                            <button type="button" id="c_de" value="${k.c_id }">삭제</button>
                            </c:if>
                     </div>
                     
                     
                     </form>
                     </c:forEach>
                  </div>
            
                  <form id="comment">
                     <textarea name="c_content" maxlength="6000"style="resize:none;width:70%; margin-top:2%; margin-left:3%;overflow: hidden;line-height: 14px;height: 60px;"></textarea>
                     <input type="hidden" name="n_id" value="${notice.n_id }">
                     <input type="hidden" name="c_id" value="${max+1 }">
                     
                     <div class="my_up">
                        <button type="button" id="register">등록</button>
                     </div>
                  </form>
                  </td>
                  </tr>
                  
                  
                  
               
                  <tr id="under">
                  <td colspan="4"></td>
                  </tr>
            

               </table>
               <div id="pa1">
                  
                  <ul>
                     <li>
                     <li><a href="notice.do?${pagination.queryString}"><input type="image" src="${pageContext.request.contextPath}/resources/images/list.jpg" style="border-radius: 3px"></a></li>
                     <li><a href="notice_change.do?n_id=${notice.n_id }&${pagination.queryString }"><input type="image" src="${pageContext.request.contextPath}/resources/images/change.jpg" style="border-radius: 3px;display:${css};"></a></li>
                     <li><a href="notice_delete.do?n_id=${notice.n_id}&${pagination.queryString }"><input type="image" src="${pageContext.request.contextPath}/resources/images/delete.jpg" style="border-radius: 3px; display:${css};"></a></li>
                  </ul>
                  
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
