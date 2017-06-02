package skhu.model;

import java.util.Date;

public class Board {
   int b_id;
   String b_writerId;
   String b_writerName;
   String b_title;
   String b_content;
   Date b_writeTime;
   boolean b_file;
   String b_aid;
   public String getB_aid() {
      return b_aid;
   }
   public void setB_aid(String b_aid) {
      this.b_aid = b_aid;
   }
   int b_count;
   public int getB_count() {
      return b_count;
   }
   public void setB_count(int b_count) {
      this.b_count = b_count;
   }
   public boolean isB_file() {
      return b_file;
   }
   public void setB_file(boolean b_file) {
      this.b_file = b_file;
   }
   public int getB_id() {
      return b_id;
   }
   public void setB_id(int b_id) {
      this.b_id = b_id;
   }
   public String getB_writerId() {
      return b_writerId;
   }
   public void setB_writerId(String b_writerId) {
      this.b_writerId = b_writerId;
   }
   public String getB_writerName() {
      return b_writerName;
   }
   public void setB_writerName(String b_writerName) {
      this.b_writerName = b_writerName;
   }
   public String getB_title() {
      return b_title;
   }
   public void setB_title(String b_title) {
      this.b_title = b_title;
   }
   public String getB_content() {
      return b_content;
   }
   public void setB_content(String b_content) {
      this.b_content = b_content;
   }
   public Date getB_writeTime() {
      return b_writeTime;
   }
   public void setB_writeTime(Date b_writeTime) {
      this.b_writeTime = b_writeTime;
   }
}