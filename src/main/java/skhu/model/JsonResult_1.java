package skhu.model;

public class JsonResult_1 {
   String name;
   String status;
   int n_id;
   String poto;
   String content;
   String time;
   int c_number;
   int c_cid;
   int b_id;
   public int getB_id() {
      return b_id;
   }
   public void setB_id(int b_id) {
      this.b_id = b_id;
   }
   public int getC_cid() {
      return c_cid;
   }
   public void setC_cid(int c_cid) {
      this.c_cid = c_cid;
   }
   public int getC_number() {
      return c_number;
   }
   public void setC_number(int c_number) {
      this.c_number = c_number;
   }
   public String getTime() {
      return time;
   }
   public void setTime(String time) {
      this.time = time;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public JsonResult_1(int c_cid,int n_id,String name,String status,String poto,String content,String time,int k){
      this.name=name;
      this.c_cid=c_cid;
      this.n_id=n_id;
      this.status=status;
      this.poto=poto;
      this.content=content;
      this.time=time;
      this.c_number=k;
   }
   public JsonResult_1(int c_cid,int b_id,String name,String status,String poto,String content,String time,int k,int p){
      this.name=name;
      this.c_cid=c_cid;
      this.b_id=b_id;
      this.status=status;
      this.poto=poto;
      this.content=content;
      this.time=time;
      this.c_number=k;
   }
   public JsonResult_1(int c_cid,String content){
      this.c_cid=c_cid;
      this.content=content;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getStatus() {
      return status;
   }
   public void setStatus(String status) {
      this.status = status;
   }
   public int getN_id() {
      return n_id;
   }
   public void setN_id(int n_id) {
      this.n_id = n_id;
   }
   public String getPoto() {
      return poto;
   }
   public void setPoto(String poto) {
      this.poto = poto;
   }
   public String getContent() {
      return content;
   }
   public void setConetent(String content) {
      this.content = content;
   }
}