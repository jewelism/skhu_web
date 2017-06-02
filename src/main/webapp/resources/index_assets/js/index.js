
$(function() {
    $("#f1").click(function() {
    	
    	$("#title").fadeOut('slow');
        $("#f1").fadeOut('slow');
        $("#f2").fadeOut('slow');
        $("#f3").fadeOut('slow');
        $("#f4").fadeOut('slow',loginView);
    });
    $("#f2").click(function() {
    	$("#title").fadeOut('slow');
        $("#f1").fadeOut('slow');
        $("#f2").fadeOut('slow');
        $("#f3").fadeOut('slow');
        $("#f4").fadeOut('slow');
    });
    $("#f3").click(function() {
    	$("#title").fadeOut('slow');
        $("#f1").fadeOut('slow');
        $("#f2").fadeOut('slow');
        $("#f3").fadeOut('slow');
        $("#f4").fadeOut('slow');
    });
    $("#f4").click(function() {
    	$("#title").fadeOut('slow');
        $("#f1").fadeOut('slow');
        $("#f2").fadeOut('slow');
        $("#f3").fadeOut('slow');
        $("#f4").fadeOut('slow');
    });
    
    
    
   function loginView(){
	   $(".demo").fadeIn('slow');
   }
    
   /-- login function --/ 
   var animating = false,
   submitPhase1 = 1100,
   submitPhase2 = 400,
   logoutPhase1 = 800,
   $login = $(".login");
  
  function ripple(elem, e) {
    $(".ripple").remove();
    var elTop = elem.offset().top,
        elLeft = elem.offset().left,
        x = e.pageX - elLeft,
        y = e.pageY - elTop;
    var $ripple = $("<div class='ripple'></div>");
    $ripple.css({top: y, left: x});
    elem.append($ripple);
  };
  
  $(document).on("click", "#close", function(e) {
    if (animating) return;
    animating = true;
    var that = this;
    ripple($(that), e);
    $(that).addClass("processing");
    setTimeout(function() {
      $(that).addClass("success");
      setTimeout(function() {
    	  
      }, submitPhase2 - 70);
      setTimeout(function() {
        $login.hide();
        $login.addClass("inactive");
        animating = false;
        $(that).removeClass("success processing");
        location.href="index.do";
      }, submitPhase2);
    }, submitPhase1);
  });
  
  $(document).on("click", "#log", function(e) {
	    if (animating) return;
	    animating = true;
	    var that = this;
	    ripple($(that), e);
	    $(that).addClass("processing");
	    setTimeout(function() {
	      setTimeout(function() {
	    	  
	      }, submitPhase2 - 70);
	      setTimeout(function() {
	        $.ajax({
			    
	    		type: 'POST',
	    		url: 'login_processing.do',
	    		data: $(".login__form").serialize(),
	    		dataType:'json',
	    		
	    	    success : function(data) {
	    	    	$("form").each(function() {  
	                this.reset();  
	            });  
	    	    	if(data.success && data.userTrue && !data.count){
	    	    		$(that).addClass("success");
	    	    		$login.hide();
	    		        $login.addClass("inactive");
	    		        animating = false;
	    		        $(that).removeClass("success processing");
	    		        
		    	    	$(".demo_").css("display","inherit");
		    	    	$(".demo_ > .login.inactive").css("display","inherit");
		    	    	$(".demo_ > .login.inactive").css("opacity","1");
		    	    	
	    	    	}else if(data.success && data.userTrue){
	    	    		$(that).addClass("success");
	    	    		$login.hide();
	    		        $login.addClass("inactive");
	    		        animating = false;
	    		        $(that).removeClass("success processing");
	    		        
	    	    		location.href="main/home.do";
	    	    	}else if(data.success && !data.userTrue){
	    	    		$(that).addClass("success");
	    	    		$login.hide();
	    		        $login.addClass("inactive");
	    		        animating = false;
	    		        $(that).removeClass("success processing");
	    		        
	    	    		location.href="main/home_admin.do";
	    	    	}else if(!data.success){
	    	    		animating = false;
	    	    		$(".demo .ke").css("display","inherit");
	    	    		$(".demo #search").css("display","");
	    	    		$(".demo .login__form ").css("top","30%")
	    	    		$(".demo .login__check ").css("top","12rem")
	    	    		$(that).removeClass("processing");
	    	    	}
	    	    },error : function(data){
	    	    	animating = false;
	    	    	$(that).removeClass("processing");
	    	    	alert("통신 오류");
	    	    }
	    	});
	      }, submitPhase2);
	    }, submitPhase1);
	  });
  
  $(document).on("click", ".app__logout", function(e) {
    if (animating) return;
    $(".ripple").remove();
    animating = true;
    var that = this;
    $(that).addClass("clicked");
    setTimeout(function() {
      $app.removeClass("active");
      $login.show();
      $login.css("top");
      $login.removeClass("inactive");
    }, logoutPhase1 - 120);
    setTimeout(function() {
      $app.hide();
      animating = false;
      $(that).removeClass("clicked");
    }, logoutPhase1);
  });
  $(document).on("click", "#password_", function(e) {
	
	    if (animating) return;
	    animating = true;
	    var that = this;
	    ripple($(that), e);
	    $(that).addClass("processing");
	    setTimeout(function() {
	      setTimeout(function() {
	    	  
	      }, submitPhase2 - 70);
	      setTimeout(function() {
	        $.ajax({
			    
	    		type: 'POST',
	    		url: 'password_confirm.do',
	    		data: $(".login__form").serialize(),
	    		dataType:'json',
	    		
	    	    success : function(data) {
	    	    	$("form").each(function() {  
    	                this.reset();  
    	             });  
	    	    	if(data.success && data.userTrue && data.count){
	    	    		
	    	    		$(that).addClass("success");
	    	    		$login.hide();
	    		        $login.addClass("inactive");
	    		        animating = false;
	    		        $(that).removeClass("success processing");
	    	    		location.href="main/home.do";
	    	    	}else if(data.success && !data.userTrue && data.count){
	    	    		animating = false;
	    	    		$(".ke").css("display","none");
	    	    		$(".ke1").css("display","inherit");
	    	    		$("#password_").css("margin-top","20%");
	    	    		$(that).removeClass("processing");
	    	    		
	    	    	}
	    	    	else if(data.success && data.userTrue && !data.count){
	    	    		animating = false;
	    	    		$(".ke1").css("display","none");
	    	    		$("#password_").css("margin-top","20");
	    	    		$(".ke").css("display","inherit");
	    	    		$(".ke").css("margin-top","10%");
	    	    		$(that).removeClass("processing");
	    	    		
	    	    	}
	    	    },error : function(data){
	    	    	animating = false;
	    	    	$(that).removeClass("processing");
	    	    	alert("통신 오류");
	    	    }
	    	});
	      }, submitPhase2);
	    }, submitPhase1);
	  });
  $(document).on("click", "#search", function(e) {
		
	    if (animating) return;
	    animating = true;
	    var that = this;
	    ripple($(that), e);
	    $(that).addClass("processing");
	    setTimeout(function() {
	      setTimeout(function() {
	    	  
	      }, submitPhase2 - 70);
	      setTimeout(function() {
	        $.ajax({
			    
	    		type: 'POST',
	    		url: 'index.do',
	    		
	    		
	    	    success : function(data) {
	    	    	$("form").each(function() {  
    	                this.reset();  
    	             });  
	    	    	
	    	    		animating = false;
	    	    		$(".demo_1").css("display","inherit");
	    	    		$(".demo_").css("display","none");
	    	    		$(".demo").css("display","none")
	    	    		$(".demo_1 .ke").css("display","none");
	    	    		$("#pass_close").removeClass("success")
	    	    		
	    	    
	    	    },error : function(data){
	    	    	animating = false;
	    	    	$(that).removeClass("processing");
	    	    	alert("통신 오류");
	    	    }
	    	});
	      }, submitPhase2);
	    }, submitPhase1);
	  });
  $(document).on("click", "#search_pass", function(e) {
	 
	    if (animating) return;
	    animating = true;
	    var that = this;
	    ripple($(that), e);
	    $(that).addClass("processing");
	    setTimeout(function() {
	      setTimeout(function() {
	    	  
	      }, submitPhase2 - 70);
	      setTimeout(function() {
	        $.ajax({
			    
	    		type: 'POST',
	    		url: 'send.do',
	    		data: $(".demo_1 .login__form").serialize(),
	    		dataType:'json',
	    		
	    	    success : function(data) {
	    	    	
	    	    	$("form").each(function() {  
    	                this.reset();  
    	             });  
	    	    	if(data.success && data.userTrue && data.count){
	    	    		animating = false;
	    	    		$(".demo_1").css("display","none");
	    	    		$(".demo_").css("display","none");
	    	    		$(".demo").css("display","inherit");
	    	    		$("#search").removeClass("processing");
	    	    		$("#search_pass").removeClass("processing");
	    	    		$(".demo_1 .ke").css("display","none");
	    	    		$(".demo .ke").css("display","none");
	    	    		$(".demo .login__form").css("top","40%");
	    	    		$(".login__submit").removeClass("success")
	    	    		alert("임시비밀번호가 메일로 발송되었습니다.")
	    	    		
	    	    	}
	    	    	else if(!data.success && !data.userTrue && !data.count){
	    	    		
	    	    		animating = false;
	    	    		$(".demo_1 .ke").css("display","inherit");
	    	    		$(".demo_1 .login__form").css("top","40%");
	    	    		$(that).removeClass("processing");
	    	    		
	    	    	}
	    	    		
	    	    
	    	    },error : function(data){
	    	    	animating = false;
	    	    	$(that).removeClass("processing");
	    	    	alert("통신 오류");
	    	    }
	    	});
	      }, submitPhase2);
	    }, submitPhase1);
	  });
  $(document).on("click", "#pass_close", function(e) {
	    if (animating) return;
	    animating = true;
	    var that = this;
	    ripple($(that), e);
	    $(that).addClass("processing");
	    setTimeout(function() {
	      $(that).addClass("success");
	      setTimeout(function() {
	    	  
	      }, submitPhase2 - 70);
	      setTimeout(function() {
	    	  $.ajax({
				    
		    		type: 'POST',
		    		url: 'index.do',
		    		
		    	    success : function(data) {
		    	    	$("form").each(function() {  
	    	                this.reset();  
	    	             });  
		    	    	animating = false;
		    	    	$(that).removeClass("processing");
		    	    	$(".demo").css("display","inherit");
		    	    	$(".demo_1").css("display","none");
		    	    	$(".demo_").css("display","none");
		    	    	$("#search").removeClass("processing");
		    	    	$(".demo .ke").css("display","none");
		    	    
		    	    },error : function(data){
		    	    	animating = false;
		    	    	$(that).removeClass("processing");
		    	    	alert("통신 오류");
		    	    }
		    	});
	      }, submitPhase2);
	    }, submitPhase1);
	  });
})