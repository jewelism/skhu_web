package skhu.model;

import java.util.Date;

public class Notice {
   int n_id;
   String n_writerId;
   String n_writerName;
   String n_title;
   String n_content;
   Date n_writeTime;
   String f_name;
   boolean n_file;
   int n_count;
   public int getN_count() {
      return n_count;
   }
   public void setN_count(int n_count) {
      this.n_count = n_count;
   }
   public boolean isN_file() {
      return n_file;
   }
   public void setN_file(boolean n_file) {
      this.n_file = n_file;
   }
   public String getF_name() {
      return f_name;
   }
   public void setF_name(String f_name) {
      this.f_name = f_name;
   }
   public int getN_id() {
      return n_id;
   }
   public void setN_id(int n_id) {
      this.n_id = n_id;
   }
   public String getN_writerId() {
      return n_writerId;
   }
   public void setN_writerId(String n_writerId) {
      this.n_writerId = n_writerId;
   }
   public String getN_writerName() {
      return n_writerName;
   }
   public void setN_writerName(String n_writerName) {
      this.n_writerName = n_writerName;
   }
   public String getN_title() {
      return n_title;
   }
   public void setN_title(String n_title) {
      this.n_title = n_title;
   }
   public String getN_content() {
      return n_content;
   }
   public void setN_content(String n_content) {
      this.n_content = n_content;
   }
   public Date getN_writeTime() {
      return n_writeTime;
   }
   public void setN_writeTime(Date n_writeTime) {
      this.n_writeTime = n_writeTime;
   }
}