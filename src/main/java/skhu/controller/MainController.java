package skhu.controller;


import skhu.service.*;
import skhu.model.*;
import skhu.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	UserService userService;
	@Autowired
	CommunityMapper communityMapper;
	
	@Secured("ROLE_USER")
	@RequestMapping("/home.do")
    public String home(Model model,Pagination pagination) {
		User user = userService.getCurrentUser();
		Page page = new Page("main");
		
        model.addAttribute("user", user);
        model.addAttribute("page",page);
        pagination.setPageSize(3);
        model.addAttribute("plist", communityMapper.selectAll(pagination));
        model.addAttribute("blist", communityMapper.board_selectAll(pagination));

        return "main/home";
    }
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/home_admin.do")
    public String homeAdmin(Model model,Pagination pagination) {
		Admin admin = userService.getCurrentAdmin();
		Page page = new Page("main");
		
		model.addAttribute("admin",admin);
		model.addAttribute("page",page);
		model.addAttribute("rc",userService.getCount());
        pagination.setPageSize(3);
        model.addAttribute("plist", communityMapper.selectAll(pagination));
        model.addAttribute("blist", communityMapper.board_selectAll(pagination));
        
        return "main/home_admin";
	}
}
