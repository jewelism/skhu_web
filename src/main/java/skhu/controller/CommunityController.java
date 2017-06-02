package skhu.controller;

import skhu.service.*;
import skhu.model.*;

import skhu.mapper.*;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/community")
public class CommunityController {

   @Autowired
   UserService userService;
   @Autowired
   CommunityMapper communityMapper;
   @Autowired
   UserMapper uMapper;

   @RequestMapping("/notice.do")
   public String notice(Model model, Pagination pagination) {
      User user = userService.getCurrentUser();
      if(user!=null){
         String s=user.getU_status();
         model.addAttribute("css", userService.status(s));
      }
      else{
         model.addAttribute("css","inherit");
      }
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
     model.addAttribute("rc",userService.getCount());
      pagination.setRecordCount(communityMapper.selectCount(pagination));
      model.addAttribute("plist", communityMapper.selectAll(pagination));

      return "community/notice";
   }

   @RequestMapping("/notice_write.do")
   public String notice_write(Model model) {
      User user = userService.getCurrentUser();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());

      return "community/notice_write";
   }

   @RequestMapping("/notice_content.do")
   public String notice_content(@RequestParam("n_id") String n_id, Model model, Pagination pagination) {
      User user = userService.getCurrentUser();
      Admin admin = userService.getCurrentAdmin();
      Page page = new Page("community");
      model.addAttribute("user", user);
      if(admin!=null){
         model.addAttribute("t",true);
      }else{
         model.addAttribute("f",false);
      }
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());
      model.addAttribute("c", communityMapper.notice_comment(n_id));
      model.addAttribute("max", communityMapper.max_nid());
      
      Notice notice = communityMapper.selectById(n_id);
      model.addAttribute("file", communityMapper.select_file_byn_Id(n_id));
   

      model.addAttribute("notice", notice);
      int nid = Integer.parseInt(n_id);
      
      
      if(user !=null){
         String css = userService.Same_write_user(notice, user);
         model.addAttribute("css", css);
      }else{
         model.addAttribute("css","inherit");
      }
      return "community/notice_content";
   }
   
   

   
   
   @RequestMapping(value="/notice_file_delete.do")
   public @ResponseBody JsonResult notice_file_delete(String[] check,HttpServletResponse response,Model model) {
      User user = userService.getCurrentUser();
      String [] arr = new String[check.length];
      
      model.addAttribute("pic","hello");
      int nid = 0;
      if(check.length==1){
         check[0]=check[0].substring(1,check[0].length()-1);
         nid=communityMapper.search_file(check[0]);
      }
      else{
      for(int a=0;a<check.length;a++){
         
         if((check[a].charAt(0))=='['){
            check[a]=check[a].substring(1,check[a].length());
            nid=communityMapper.search_file(check[a]);
         }
         else if((check[a].charAt(check[a].length()-1))==']'){
            check[a]=check[a].substring(0,check[a].length()-1);
         }
      }
      }
     
      for(int a=0;a<check.length;a++){
         communityMapper.file_delete(check[a]);
      }
      int n = communityMapper.count_n(nid);
      System.out.println(nid);
      System.out.println(n);
      if(n==0){
         communityMapper.notice_file(nid);
      }
      
      return new JsonResult(true, true, true);
   }

   @RequestMapping(value = "/notice_write.do", method = RequestMethod.POST)
   public String notice_save(Model model, @RequestParam("title") String title, @RequestParam("body") String body,
         @RequestParam("file") MultipartFile[] uploadFiles) throws IOException {
      User user = userService.getCurrentUser();
      Admin admin = userService.getCurrentAdmin();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());
      String error="title";
      if(title.equals("")){
         return "community/notice_write"; 
      }
      else{
         for (MultipartFile uploadFile : uploadFiles) {
                if (uploadFile.getSize() > 0) {
                   if(user!=null){
                      communityMapper.notice_insert(user.getU_id(), user.getU_name(), title, body,true);
                   }
                   else if(admin !=null){
                      communityMapper.notice_insert(admin.getA_id(), "관리자", title, body,true);
                   }
                      break;
                }
                else{
                   if(user!=null){
                        communityMapper.notice_insert(user.getU_id(), user.getU_name(), title, body,false);
                     }
                     else if(admin !=null){
                        communityMapper.notice_insert(admin.getA_id(), "관리자", title, body,false);
                     }
                }
         }
      for (MultipartFile uploadFile : uploadFiles) {
         File file = new File();
         if (uploadFile.getSize() > 0) {

            file.setF_name(Paths.get(uploadFile.getOriginalFilename()).getFileName().toString());
            file.setF_size((float) uploadFile.getSize());
            file.setN_id(communityMapper.max());
            file.setF_data(uploadFile.getBytes());
            String a= Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
            String a2= a.substring(a.length()-5);
            String a3 = a2.substring(a2.indexOf(".")+1, a2.length());
            file.setF_extension(a3);
            communityMapper.insert_file(file);

         }
      }
      

      return "redirect:/community/notice.do";
      }
   }
   @RequestMapping(value = "/notice_change.do", method = RequestMethod.POST)
   public String notice_change(Model model, @RequestParam("n_id") String id,@RequestParam("title") String title, @RequestParam("body") String body,
         @RequestParam("file") MultipartFile[] uploadFiles,Pagination pagination) throws IOException {
      User user = userService.getCurrentUser();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());
      String error="title";
      
   
      communityMapper.notice_update(id, title, body);
      for (MultipartFile uploadFile : uploadFiles) {
         File file = new File();
         if (uploadFile.getSize() > 0) {

            file.setF_name(Paths.get(uploadFile.getOriginalFilename()).getFileName().toString());
            file.setF_size((float) uploadFile.getSize());
            file.setN_id(Integer.parseInt(id));
            file.setF_data(uploadFile.getBytes());
            String a= Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
            String a2= a.substring(a.length()-5);
            String a3 = a2.substring(a2.indexOf(".")+1, a2.length());
            file.setF_extension(a3);
            communityMapper.insert_file(file);
            communityMapper.n_ch(id);

         }
      }
      
      return "redirect:/community/notice_content.do?n_id="+id+"&&"+pagination.getQueryString();
   }

   @RequestMapping(value="/notice_change.do",method=RequestMethod.GET)
   public void download(@RequestParam("n_id") String Id, Model model, Pagination pagination) throws UnsupportedEncodingException {
      User user = userService.getCurrentUser();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());

      Notice notice = communityMapper.selectById(Id);
      model.addAttribute("file", communityMapper.select_file_byn_Id(Id));
      model.addAttribute("notice", notice);
      System.out.println(pagination.getQueryString());

   }

   @RequestMapping("/download.do")
   public void download(@RequestParam("f_id") String Id, HttpServletResponse response) throws IOException {

      File file = communityMapper.select_file_byf_Id(Id);
      if (file == null)
         return;
      String fileName = URLEncoder.encode(file.getF_name(), "UTF-8");
      response.setContentType("application/octet-stream");
      response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
      try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
         output.write(file.getF_data());
      }
   }
   @RequestMapping("/notice_delete")
   public String notice_delete(@RequestParam("n_id") String id,@RequestParam("pg") String pg,Model model){
      communityMapper.notice_Delete(id);
      return "redirect:notice.do?pg="+pg;
   }

   @RequestMapping("/board.do")
   public String board(Model model, Pagination pagination) {
      User user = userService.getCurrentUser();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());
      pagination.setRecordCount(communityMapper.board_selectCount(pagination));
      model.addAttribute("plist", communityMapper.board_selectAll(pagination));

      return "community/board";
   }

   @RequestMapping("/board_write.do")
   public String board_write(Model model) {
      User user = userService.getCurrentUser();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());

      return "community/board_write";
   }

   @RequestMapping("/board_content.do")
   public String board_content(@RequestParam("b_id") String b_id, Model model, Pagination pagination) {
      User user = userService.getCurrentUser();
      Admin admin = userService.getCurrentAdmin();
      Page page = new Page("community");
      model.addAttribute("user", user);
      if(admin!=null){
          model.addAttribute("t",true);
       }else{
          model.addAttribute("f",false);
       }
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());
      model.addAttribute("c", communityMapper.board_comment(b_id));
      model.addAttribute("max", communityMapper.max_nid());
      
      Board board = communityMapper.board_selectById(b_id);
      model.addAttribute("file", communityMapper.board_select_file_byb_Id(b_id));
      model.addAttribute("board", board);
      int bid = Integer.parseInt(b_id);

      
      if(user !=null){
         String css = userService.board_Same_write_user(board,user);
         model.addAttribute("css", css);
      }else{
         model.addAttribute("css","inherit");
      }
      return "community/board_content";
   }
   
   

   
   
   @RequestMapping(value="/board_file_delete.do")
   public @ResponseBody JsonResult board_file_delete(String[] check,HttpServletResponse response,Model model) {
      User user = userService.getCurrentUser();
      String [] arr = new String[check.length];
      
      model.addAttribute("pic","hello");
      
      int bid = 0;
      if(check.length==1){
         check[0]=check[0].substring(1,check[0].length()-1);
         bid=communityMapper.search_bfile(check[0]);
      }
      else{
      for(int a=0;a<check.length;a++){
         
         if((check[a].charAt(0))=='['){
            check[a]=check[a].substring(1,check[a].length());
            bid=communityMapper.search_bfile(check[a]);
         }
         else if((check[a].charAt(check[a].length()-1))==']'){
            check[a]=check[a].substring(0,check[a].length()-1);
         }
      }
      }
     
      for(int a=0;a<check.length;a++){
         communityMapper.file_delete(check[a]);
      }
      int n = communityMapper.count_b(bid);
      System.out.println(bid);
      System.out.println(n);
      if(n==0){
         communityMapper.board_file(bid);
      }
      
      return new JsonResult(true, true, true);
   }

   @RequestMapping(value = "/board_write.do", method = RequestMethod.POST)
   public String board_save(Model model, @RequestParam("title") String title, @RequestParam("body") String body,
         @RequestParam("file") MultipartFile[] uploadFiles) throws IOException {
      User user = userService.getCurrentUser();
      Admin admin = userService.getCurrentAdmin();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());
      String error="title";
      if(title.equals("")){
         return "community/board_write"; 
      }else{
         for (MultipartFile uploadFile : uploadFiles) {
             if (uploadFile.getSize() > 0) {
                if(user!=null){
                     communityMapper.board_insert(user.getU_id(), user.getU_name(), title, body,true);
                  }
                  else if(admin !=null){
                     communityMapper.board_insert_ad(admin.getA_id(), "관리자", title, body,true);
                  }
                     break;
               }
               else{
                  if(user!=null){
                       communityMapper.board_insert(user.getU_id(), user.getU_name(), title, body,false);
                    }
                    else if(admin !=null){
                       communityMapper.board_insert_ad(admin.getA_id(), "관리자", title, body,false);
                    }
               }
      }
     
      for (MultipartFile uploadFile : uploadFiles) {
         File file = new File();
         if (uploadFile.getSize() > 0) {

            file.setF_name(Paths.get(uploadFile.getOriginalFilename()).getFileName().toString());
            file.setF_size((float) uploadFile.getSize());
            file.setB_id(communityMapper.board_max());
            file.setF_data(uploadFile.getBytes());
            String a= Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
            String a2= a.substring(a.length()-5);
            String a3 = a2.substring(a2.indexOf(".")+1, a2.length());
            file.setF_extension(a3);
            communityMapper.board_insert_file(file);

         }
      }

      return "redirect:/community/board.do";
      }
   }
   @RequestMapping(value = "/board_change.do", method = RequestMethod.POST)
   public String board_change(Model model, @RequestParam("b_id") String id,@RequestParam("title") String title, @RequestParam("body") String body,
         @RequestParam("file") MultipartFile[] uploadFiles,Pagination pagination) throws IOException {
      User user = userService.getCurrentUser();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());
      communityMapper.board_update(id, title, body);
      for (MultipartFile uploadFile : uploadFiles) {
         File file = new File();
         if (uploadFile.getSize() > 0) {

            file.setF_name(Paths.get(uploadFile.getOriginalFilename()).getFileName().toString());
            file.setF_size((float) uploadFile.getSize());
            file.setB_id(Integer.parseInt(id));
            file.setF_data(uploadFile.getBytes());
            String a= Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
            String a2= a.substring(a.length()-5);
            String a3 = a2.substring(a2.indexOf(".")+1, a2.length());
            file.setF_extension(a3);
            communityMapper.board_insert_file(file);
            communityMapper.b_ch(id);

         }
      }
      
      return "redirect:/community/board_content.do?b_id="+id+"&&"+pagination.getQueryString();
   }

   @RequestMapping(value="/board_change.do",method=RequestMethod.GET)
   public void board_change(@RequestParam("b_id") String Id, Model model, Pagination pagination) {
      User user = userService.getCurrentUser();
      Page page = new Page("community");
      model.addAttribute("user", user);
      model.addAttribute("page", page);
      model.addAttribute("rc",userService.getCount());

      Board board = communityMapper.board_selectById(Id);
      model.addAttribute("file", communityMapper.board_select_file_byb_Id(Id));
      model.addAttribute("board", board);

   }

   @RequestMapping("/board_download.do")
   public void board_download(@RequestParam("f_id") String Id, HttpServletResponse response) throws IOException {

      File file = communityMapper.select_file_byf_Id(Id);
      if (file == null)
         return;
      String fileName = URLEncoder.encode(file.getF_name(), "UTF-8");
      response.setContentType("application/octet-stream");
      response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
      try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
         output.write(file.getF_data());
      }
   }
   @RequestMapping("/board_delete")
   public String board_delete(@RequestParam("b_id") String id,Pagination pagination,Model model) throws UnsupportedEncodingException{
      communityMapper.board_Delete(id);
      return "redirect:board.do?"+pagination.getQueryString();
   }


   @RequestMapping("/notice_comment.do")
   public @ResponseBody JsonResult_1 comment_insert(@RequestParam("n_id")int id,Comment comment,Model model, HttpServletResponse response) {
      response.addHeader("Access-Control-Allow-Origin", "*");
      int a=communityMapper.max_nid()+1;
      User user = userService.getCurrentUser();
      Admin admin = userService.getCurrentAdmin();
      if(user!=null){
      comment.setC_writerId(user.getU_id());
      comment.setC_writerName(user.getU_name());
      comment.setU_cNumber(user.getU_cNumber());
      }else if(admin !=null){
         comment.setC_writerId(admin.getA_id());
         comment.setC_writerName("관리자");
      }
      comment.setN_id(id);
      
      String c_content = comment.getC_content().replace("\r\n", "</br>");
      comment.setC_content(c_content);
      Date d  = new Date();
      SimpleDateFormat t1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
      comment.setC_writeTime((String)t1.format(d));
     
     
      communityMapper.comment_insert(comment);
      communityMapper.count(id);
      if(user!=null){
      return new JsonResult_1(a,comment.getN_id(),user.getU_name(),user.getU_status(),user.getU_photo(),comment.getC_content(),(String)t1.format(d),user.getU_cNumber());
      }
      else{
         return new JsonResult_1(a,comment.getN_id(),"관리자","관리자","admin.png",comment.getC_content(),(String)t1.format(d),0);
      }
   }

   @RequestMapping("/comment_delete.do")
   public @ResponseBody JsonResult comment_delete(String name,String ki,HttpServletResponse response, Model model) {
      User user = userService.getCurrentUser();
      communityMapper.delete_comment(name);
      System.out.println(ki);
      communityMapper.count_d(ki);
      return new JsonResult(true, true, true);
   }
   @RequestMapping("/comment_delete_b.do")
   public @ResponseBody JsonResult comment_delete_b(String name,String ki,HttpServletResponse response, Model model) {
      User user = userService.getCurrentUser();
      communityMapper.delete_comment(name);
      communityMapper.count_bd(ki);
      return new JsonResult(true, true, true);
   }
   @RequestMapping("/comment_update.do")
   public @ResponseBody JsonResult_1 comment_update(int id,String content,Model model, HttpServletResponse response) {
    communityMapper.n_c(id, content);
    return  new JsonResult_1(id,content);
   }
   
   @RequestMapping("/board_comment.do")
   public @ResponseBody JsonResult_1 b_comment_insert(@RequestParam("b_id")int id,Comment comment,Model model, HttpServletResponse response) {
      response.addHeader("Access-Control-Allow-Origin", "*");
     
      int a=communityMapper.max_nid()+1;
      User user = userService.getCurrentUser();
      Admin admin = userService.getCurrentAdmin();
      if(user!=null){
      comment.setC_writerId(user.getU_id());
      comment.setC_writerName(user.getU_name());
      comment.setU_cNumber(user.getU_cNumber());
      }else if(admin !=null){
         comment.setC_writerId(admin.getA_id());
         comment.setC_writerName("관리자");
      }
      comment.setB_id(id);
      
      String c_content = comment.getC_content().replace("\r\n", "</br>");
      comment.setC_content(c_content);
      Date d  = new Date();
      SimpleDateFormat t1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
      comment.setC_writeTime((String)t1.format(d));
     
     
      communityMapper.b_comment_insert(comment);
      communityMapper.count_bb(id);
      if(user!=null){
      return new JsonResult_1(a,comment.getB_id(),user.getU_name(),user.getU_status(),user.getU_photo(),comment.getC_content(),(String)t1.format(d),user.getU_cNumber(),0);
      }
      else{
         return new JsonResult_1(a,comment.getB_id(),"관리자","관리자","admin.png",comment.getC_content(),(String)t1.format(d),0,0);
      }
   }


   
}