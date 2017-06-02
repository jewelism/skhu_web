package skhu.controller;

import skhu.service.*;
import skhu.model.*;
import skhu.mapper.*;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	RequestService requestService;
	@Autowired
	UserMapper userMapper;
	@Autowired
	RequestMapper requestMapper;
	
	@RequestMapping(value="/edit.do", method = RequestMethod.GET)
    public String edit(Model model) {
		User user = userService.getCurrentUser();
		Page page = new Page("user");
		
        model.addAttribute("user", user);
        model.addAttribute("page",page);
        return "user/edit";
    }
	
	@RequestMapping(value="/edit.do", method = RequestMethod.POST)
    public String edit(@RequestParam(value="image",required=false) MultipartFile image,User user, Model model, HttpServletRequest request) {
		Page page = new Page("user");
		
        String message = userService.validateBeforeUpdate(user);
        if(!image.getOriginalFilename().equals("")){
	        java.io.File destFile = new java.io.File(request.getSession().getServletContext().getRealPath("resources/userImages")+"\\"+image.getOriginalFilename());
		    try{
		        image.transferTo(destFile);
		    }catch(IllegalStateException | IOException e){
		        throw new RuntimeException(e.getMessage(),e);
		    }
        }
        if (message == null) {
            userMapper.myUpdate(user);
            userService.setCurrentUser(user);
            model.addAttribute("success", "저장했습니다.");
        } else{
            model.addAttribute("error", message);
            if(message.equals("이름을 입력하세요."))
            	user.setU_name(userService.getCurrentUser().getU_name());
        }
        model.addAttribute("page",page);        
        return "user/edit";
    }
	
	@RequestMapping(value="/requestId.do", method = RequestMethod.GET)
    public String request(Model model) {
		User user = userService.getCurrentUser();
		
		R_UpdateId r_updateId = requestMapper.alreadyRequest(user.getU_id());
		if(r_updateId==null){
			r_updateId = new R_UpdateId();
			r_updateId.setU_id(user.getU_id());
			r_updateId.setRu_originId(user.getU_loginId());
			r_updateId.setRu_state("기본");
		}else{
			model.addAttribute("success", "요청중입니다.");
		}
		model.addAttribute("r_UpdateId",r_updateId);
        model.addAttribute("user", user);
		
        return "user/requestId";
    }
	
	@RequestMapping(value="/requestId.do", method = RequestMethod.POST)
    public String request(R_UpdateId r_updateId, Model model) throws ParseException {
		String message = requestService.validateBeforeRequest(r_updateId);
		
		r_updateId.setRu_time(requestService.currentTime());
		
		if (message == null) {
			r_updateId.setRu_state("대기");
            requestMapper.insert(r_updateId);
            model.addAttribute("success", "요청중입니다.");
        } else{
            model.addAttribute("error", message);
        }
        
        return "user/requestId";
    }
	@RequestMapping(value="/requestDrop.do", method = RequestMethod.GET)
    public String requestDrop(Model model) {
		User user = userService.getCurrentUser();
		
		R_DropUser r_dropUser = requestMapper.alreadyRequestDrop(user.getU_id());
		if(r_dropUser==null){
			r_dropUser = new R_DropUser();
			r_dropUser.setU_id(user.getU_id());
			r_dropUser.setRd_state("기본");
		}else{
			model.addAttribute("success", "요청중입니다.");
		}
		model.addAttribute("r_DropUser",r_dropUser);
        model.addAttribute("user", user);
		
        return "user/requestDrop";
    }
	@RequestMapping(value="/requestDrop.do", method = RequestMethod.POST)
    public String requestDrop(R_DropUser r_dropUser, Model model) throws ParseException {
		String message = requestService.validateBeforeRequestD(r_dropUser);
		
		r_dropUser.setRd_time(requestService.currentTime());
		
		if (message == null) {
			r_dropUser.setRd_state("대기");
            requestMapper.insertDrop(r_dropUser);
            model.addAttribute("success", "요청중입니다.");
        } else{
            model.addAttribute("error", message);
        }
        
        return "user/requestDrop";
    }
}
