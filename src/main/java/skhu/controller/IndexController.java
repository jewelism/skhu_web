package skhu.controller;

import skhu.service.*;
import skhu.mapper.*;
import skhu.model.*;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Controller
public class IndexController {

	@Autowired
	UserService userService;
	@Autowired
	UserMapper userMapper;
	@Autowired 
	private JavaMailSender mailSender;
		
	@RequestMapping("/index.do")
    public String index() {
        return "index";
    }
	
	@RequestMapping(value="/login_success.do",method=RequestMethod.GET)
	public @ResponseBody JsonResult loginSuccess(HttpServletResponse response) {
        response.addHeader("Access-Control-Allow-Origin", "*");
	    
	    User user = userService.getCurrentUser();
	    
	    if (user!=null)
	       return new JsonResult(true, true ,user.getU_count());
	    
	    return new JsonResult(true, false,false);
	}
	
	@RequestMapping(value="/login_failure.do",method=RequestMethod.GET)
	public @ResponseBody JsonResult loginFailure(HttpServletResponse response) {
        response.addHeader("Access-Control-Allow-Origin", "*");

	    return new JsonResult(false, false ,false);
	}
	
	@RequestMapping(value="/password_confirm.do",method=RequestMethod.POST)
	public @ResponseBody JsonResult password_change(HttpServletResponse response,
			@RequestParam("password_1")String p1,@RequestParam("password_2")String p2) {
        response.addHeader("Access-Control-Allow-Origin", "*");
        
        String loginId = userService.getCurrentUser().getU_loginId();
	    if(p1.length()==0 && p1.length()<8){
	    	
	    	return new JsonResult(true,false,true);
	    }
        else if(p1.equals(p2) && p1.length()!=0 ){
        	
        	userMapper.update(loginId, true, p1);
        	return new JsonResult(true,true,true);
        }
        else {
        	
        	return new JsonResult(true,true,false);
        }
	}
	
	@RequestMapping(value="/send.do",method=RequestMethod.POST)
	public @ResponseBody JsonResult search_password(HttpServletResponse response,
			@RequestParam("loginId")String id,@RequestParam("email")String email) throws Exception {
        response.addHeader("Access-Control-Allow-Origin", "*");        
       
        User user = userMapper.selectForEmail(id, email);
        if(user==null){
        	return new JsonResult(false,false,false);
        }else{
        String setfrom = "lsklsk4341@gmail.com";         
        String tomail  = user.getU_email();    { 
        String title   = "임시 비밀번호 입니다.";      
        String content = "임시 비밀 번호는 abcd1234";  
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper 
                              = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom);  
            messageHelper.setTo(tomail);     
            messageHelper.setSubject(title); 
            messageHelper.setText(content); 
            userMapper.update(user.getU_loginId(), true, "abcd1234");
	    	
            mailSender.send(message);
          } catch(Exception e){
            System.out.println(e);
          }
         
        	return new JsonResult(true,true,true);
        }
        }
	}
}
