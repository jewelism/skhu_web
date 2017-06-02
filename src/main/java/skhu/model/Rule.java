package skhu.model;

import java.util.Date;
public class Rule {
   int r_id;
   int r_num;
   int no;
   String r_title;
   String r_content;
   Date r_writeTime;
   public int getR_id() {
      return r_id;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public void setR_id(int r_id) {
      this.r_id = r_id;
   }
   public int getR_num() {
      return r_num;
   }
   public void setR_num(int r_num) {
      this.r_num = r_num;
   }
   public String getR_title() {
      return r_title;
   }
   public void setR_title(String r_title) {
      this.r_title = r_title;
   }
   public String getR_content() {
      return r_content;
   }
   public void setR_content(String r_content) {
      this.r_content = r_content;
   }
   public Date getR_writeTime() {
      return r_writeTime;
   }
   public void setR_writeTime(Date r_writeTime) {
      this.r_writeTime = r_writeTime;
   }
   
}