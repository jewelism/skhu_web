//memberConroller.java
package skhu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.mail.javamail.JavaMailSender;
import skhu.mapper.MemberMapper;
import skhu.mapper.UserMapper;
import skhu.model.Page;
import skhu.model.PaginationM;
import skhu.model.User;
import skhu.service.UserService;

@Controller
@RequestMapping("/member")
public class MemberController {

   @Autowired
   UserService userService;
   @Autowired
   MemberMapper memberMapper;
   @Autowired
   UserMapper userMapper;
   @Autowired
   private JavaMailSender mailSender;

   @RequestMapping(value = "/cardinalList.do", method = RequestMethod.GET)
   public String cardinalList(@RequestParam("selgisu") int selgisu, Model model) {
      User user = userService.getCurrentUser();
      Page page = new Page("member");

      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc", userService.getCount());
      model.addAttribute("gisu", userService.getGisu());
      model.addAttribute("selgisu", selgisu);
      model.addAttribute("list", memberMapper.selectByGisu(selgisu));
      return "member/cardinalList";
   }

   @RequestMapping(value = "/cardinalList.do", method = RequestMethod.POST)
   public String cardinalList(@RequestParam(value = "selgisu", required = false) int selgisu,
         @RequestParam(value = "searchsel", required = false) int searchsel,
         @RequestParam(value = "searchtxt", required = false) String searchtxt, Model model) {
      User user = userService.getCurrentUser();
      Page page = new Page("member");

      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc", userService.getCount());
      model.addAttribute("gisu", userService.getGisu());
      model.addAttribute("selgisu", selgisu);
      model.addAttribute("searchsel", searchsel);
      model.addAttribute("searchtxt", searchtxt);
      if (searchsel == 2) {
         searchtxt = searchtxt.trim();
         searchtxt = userService.modPhone(searchtxt);
      }
      if (searchtxt.equals("null"))
         model.addAttribute("list", memberMapper.selectByGisu(selgisu));
      else
         model.addAttribute("list", memberMapper.selectSearch(selgisu, searchsel, searchtxt));
      return "member/cardinalList";
   }

   @RequestMapping(value = "/member_info.do", method = RequestMethod.GET)
   public String member_info(@RequestParam("uid") String uid, @RequestParam("ustatus") String ustatus, Model model) {
      User user = userService.getCurrentUser();
      memberMapper.updateMng(uid, ustatus, user.getU_id(), user.getU_status());
      return "main/logout";
   }

   @RequestMapping(value = "/member_info.do", method = RequestMethod.POST)
   public String member_info(@RequestParam("selgisu") int selgisu, @RequestParam("searchsel") int searchsel,
         @RequestParam("searchtxt") String searchtxt, @RequestParam("uid") String uid, Model model) {
      User user = userService.getCurrentUser();
      Page page = new Page("member");

      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc", userService.getCount());
      model.addAttribute("mem", memberMapper.selectByUid(uid));
      model.addAttribute("selgisu", selgisu);
      model.addAttribute("searchsel", searchsel);
      model.addAttribute("searchtxt", searchtxt);
      return "member/member_info";
   }

   @RequestMapping(value = "/member_mail.do")
   public String member_mail(Model model, PaginationM paginationM) {
      User user = userService.getCurrentUser();
      Page page = new Page("member");

      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("gisu", userService.getGisu());
      paginationM.setRecordCount(userMapper.selectCount(paginationM));
      model.addAttribute("list", userMapper.selectPage(paginationM));
      model.addAttribute("rc", userService.getCount());
      return "member/member_mail";
   }

   @RequestMapping(value = "/member_send.do", method = RequestMethod.GET)
   public String member_send(@RequestParam(value = "uid", required = false) String[] uidArr, Model model) {
      User user = userService.getCurrentUser();
      Page page = new Page("member");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc", userService.getCount());

      List<User> list = new ArrayList<User>();
      int count = 0;
      for (String s : uidArr) {
         list.addAll(memberMapper.selectByUid(s));
         if (count < 10)
            count++;
      }
      model.addAttribute("list", list);
      model.addAttribute("count", count);
      return "member/member_send";
   }

   @RequestMapping(value = "/member_send.do", method = RequestMethod.POST)
   @ResponseBody
   public void member_send(@RequestParam("uidArr") String[] uidArr, @RequestParam("content") String content, @RequestParam("title") String title, Model model) {
      User user = userService.getCurrentUser();
      Page page = new Page("member");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc", userService.getCount());

      List<User> list = new ArrayList<User>();
      for (String s : uidArr) {
         list.addAll(memberMapper.selectByUid(s.replaceAll("&", "").replaceAll("=", "")));
      }

      MimeMessage message;
      MimeMessageHelper messageHelper;

      for (int i = 0; i < list.size(); i++) {
         String tomail = list.get(i).getU_email();
         try {
            message = mailSender.createMimeMessage();
            messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setTo(tomail);
            messageHelper.setSubject(title);
            messageHelper.setText(content);

            mailSender.send(message);
            model.addAttribute("message", "메일전송을 성공했습니다");
         } catch (Exception e) {
            model.addAttribute("message", "메일전송을 실패했습니다");
            System.out.println(e);
         }
      }
   }
}