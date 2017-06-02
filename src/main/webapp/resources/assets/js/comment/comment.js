
$(function() {
   var k = $("#max").val();
   $(document).on("click", "#register", function(e) {
        
           $.ajax({
             
             type: 'POST',
             url: 'notice_comment.do',
             data: $("#comment").serialize(),
             dataType:'json',
             
             
              success : function(data) {
                 k++;
                 var tag="   <form id='c_f' class='"+data.c_cid+"'><input type='hidden' name='n_id_' value='"+data.n_id+"'><div id='com' class='com'>"
                  var tag1="<img src='/skhu/resources/userImages/"+data.poto+"'>";
                  var tag2="<div style='display:inline-block;' class='k'>";
                  var tag6="<input type='hidden' value="+k+"'>"
                  if(data.c_number == 0){
                     var tag3="<span>"+data.name+"</span>";
                  }
                  else{
                  var tag3="<span>"+data.name+"("+data.c_number+"기)"+"</span>";
                  }
                  var tag4="<span id='s'>"+data.time+"</span>";
                  var tag5="<div id='cont'>"+data.content+"</div>"+"</div><button type='button' id='c_ad' value='"+data.c_cid+"'>수정</button><button type='button' id='c_de' value='"+data.c_cid+"'>삭제</button></div></form>";      
                  $(tag+tag1+tag2+tag6+tag3+tag4+tag5).appendTo("#here");
                  $("textarea[name=c_content]").val("");
                  
              },error : function(data){
              
                 alert("통신 오류");
              }
          });
 
}); 
})
$(function() {
   var k = $("#max").val();
   $(document).on("click", "#register_b", function(e) {
           $.ajax({
             
             type: 'POST',
             url: 'board_comment.do',
             data: $("#comment").serialize(),
             dataType:'json',
             
             
              success : function(data) {
                 k++;
                 var tag="   <form id='c_f' class='"+data.c_cid+"'><input type='hidden' name='b_id_' value='"+data.n_id+"'><div id='com' class='com'>"
                  var tag1="<img src='/skhu/resources/userImages/"+data.poto+"'>";
                  var tag2="<div style='display:inline-block;' class='k'>";
                  var tag6="<input type='hidden' value="+k+"'>"
                  if(data.c_number == 0){
                     var tag3="<span>"+data.name+"</span>";
                  }
                  else{
                  var tag3="<span>"+data.name+"("+data.c_number+"기)"+"</span>";
                  }
                  var tag4="<span id='s'>"+data.time+"</span>";
                  var tag5="<div id='cont'>"+data.content+"</div>"+"</div><button type='button' id='c_ad' value='"+data.c_cid+"'>수정</button><button type='button' id='c_de_' value='"+data.c_cid+"'>삭제</button></div></form>";      
                  $(tag+tag1+tag2+tag6+tag3+tag4+tag5).appendTo("#here");
                  $("textarea[name=c_content]").val("");
                  
              },error : function(data){
              
                 alert("통신 오류");
              }
          });
 
}); 
})
  $(function() {
     $("#down span").click( function() {
             location.href="download.do?f_id="+$(this).attr("data-url");
   });
 
})

   
 

$(function() {
 $("#file_delete").click( function() {
    var array = new Array();
    if(confirm("삭제하시겠습니까?")==true){
    $("#file:checked").each(function(i){
      array.push(Number($(this).val())); 
    });
  
    
    $.ajax({
          
           type: 'POST',
           url: 'notice_file_delete.do',
           data: {check:JSON.stringify(array)},
           dataType:'json',
           
            success : function(data) {
               for(var i =0;i<array.length;i++){
                  $("."+array[i]).remove();
                  $("."+array[i]).css("display","none");
                  $("#file:checked").remove();
                  $("#all").prop("checked",false);
               }
            
               
               
            },error:function(request,status,error){
                
            }
        });
    }
});
})
$(function() {
   
 $("#board_file_delete").click( function() {
    var array = new Array();
    if(confirm("삭제하시겠습니까?")==true){
    $("#file:checked").each(function(i){
      array.push(Number($(this).val())); 
    });
  
    
    $.ajax({
          
           type: 'POST',
           url: 'board_file_delete.do',
           data: {check:JSON.stringify(array)},
           dataType:'json',
           
            success : function(data) {
               for(var i =0;i<array.length;i++){
                  $("."+array[i]).remove();
                  $("."+array[i]).css("display","none");
                  $("#file:checked").remove();
                  $("#all").prop("checked",false);
               }
            
               
               
            },error:function(request,status,error){
                
            }
        });
    }else
       {
          return;
       }
     
});
})
$(function() {
   
 $(document).on("click", "#c_de", function(e) {
    var k=$(this).attr('value');
   
    $.ajax({
          
        type: 'POST',
        url: 'comment_delete.do',
        data: {name:$(this).attr('value'),ki:$("#c_f input[name=n_id_]").val()},
        dataType:'json',
        
         success : function(data) {
           $('form').remove("."+k);
          

         
         },error : function(data){
           
            alert("통신 오류");
         }
     });
  });
})
$(function() {
   
 $(document).on("click", "#c_de_", function(e) {
    var k=$(this).attr('value');
   
    $.ajax({
          
        type: 'POST',
        url: 'comment_delete_b.do',
        data: {name:$(this).attr('value'),ki:$("#c_f input[name=n_id_]").val()},
        dataType:'json',
        
         success : function(data) {
           $('form').remove("."+k);
          

         
         },error : function(data){
           
            alert("통신 오류");
         }
     });
  });
})
var fk = function() {
      var ac = "";
      if (matchMedia("screen and (max-width: 840px)").matches) {
         ac = "+"
         $("#smart_editor2_content").css("width", "310px");
      } else {
         ac = "글쓰기"
         $("#smart_editor2_content").css("width", "auto");
      }
   }
   
   $(function() {
      var k=0;
      $(".up").click(
                  function() {
                     var tag = "<br class='brl'><input  style='float:left; margin-top: 1% ;'type='file' name='file' multiple /><br class='brl'>"
                     k++;
                     $(tag).appendTo(".files");
                  
                  });
   

      $(".del").click(
                  function() {
                     if(k>=1){
                     $("[type=file]:last").remove();
                     $(".brl:last").remove();
                     $(".brl:last").remove();
                     k--;
                     }
                     
                  });
   
      $("#all").click(
            function() {
               if($("#all").prop("checked")) {
               
                  $("input[type=checkbox]").prop("checked",true);
               
               } else {
                  
                  $("input[type=checkbox]").prop("checked",false);
               }
            });

   
});
   $(function() {
      
       $("#save").click( function() {
          if($("#title").val()==""){
           alert("제목을 입력하세요")
       }
       });
   });

   $(function() {
      
       $("#nt").click( function() {
          location.href="notice.do";
       });
   });
   $(function() {
      
       $("#bd").click( function() {
          location.href="board.do";
       });
   });
   $(function() {
     
      $(document).on("click", "#c_ad", function(e) {
         var k=$(this).attr('value');
         var text=$('.'+k+' div div div').text();
           $("."+k+" div div div").css("display","none");
           $("."+k+" div button").remove();
           var tag="<textarea name='c_t' maxlength='6000'style='resize:none;width:70%; margin-top:2%; margin-left:3%;overflow: hidden;line-height: 14px;height: 60px;'>"+text+"</textarea><div class='my_up'><button type='button' id='register_c' value='"+k+"'>등록</button></div>"
           var tag1="<button type='button' id='c_ca' value='"+k+"'>취소</button>";
           $("."+k+" .com").append(tag1);
           $("."+k+" .k").append(tag);
     
        
       });
      
     });
     $(function() {
        
     $(document).on("click", "#c_ca", function(e) {
        var k=$(this).attr('value');
        var text=$('.'+k+' div div div').text();
             $("."+k+" div div textarea").remove();
             $("."+k+" .com .my_up").remove();
             $("."+k+" .com button").remove();
             $("#c_r").remove();
             var tag3="<div id='#cont'>"+text+"</div>"
             var tag4="<button type='button' id='c_ad' value='"+k+"'>수정</button>"
             var tag5="<button type='button' id='c_de' value='"+k+"'>삭제</button>"
             $("."+k+" div div div").css("display","inherit");
              $("."+k+" .com").append(tag4);
              $("."+k+" .com").append(tag5);
          });
     });
$(function() {
   $(document).on("click", "#register_c", function(e) {
      var k=$(this).val();
      var k1=$("."+k+" textarea").val();
      
 $.ajax({
             
             type: 'POST',
             url: 'comment_update.do',
             data: {id:k,content:$("."+k+" textarea").val()},
             dataType:'json',
             
             
              success : function(data) {
                $("."+k+" textarea").remove();
                $("#register_c").remove();
                $("."+k+" .my_up").remove();
                $("."+k+" .com button").remove();
                var tag4="<button type='button' id='c_ad' value='"+k+"'>수정</button>"
                   var tag5="<button type='button' id='c_de' value='"+k+"'>삭제</button>"
                   var tag6="<div id='cont'>"+k1+"</div>"
                   $("."+k+" .com").append(tag4);
                $("."+k+" .com").append(tag5);
                $("."+k+" div div div").css("display","inherit");
                $("."+k+" div div div").text(k1);
              },error : function(data){
              
                 alert("통신 오류");
              }
          });
 
      
      
   });
});
   
   