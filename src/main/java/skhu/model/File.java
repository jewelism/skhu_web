package skhu.model;

public class File {
   Integer f_id;
   Integer b_id;
   String f_name;
   float f_size;
   Integer n_id;
   byte[] f_data;
   String f_extension;
   int r_id;

   public int getR_id() {
      return r_id;
   }

   public void setR_id(int r_id) {
      this.r_id = r_id;
   }

   public String getF_extension() {
      return f_extension;
   }

   public void setF_extension(String f_extension) {
      this.f_extension = f_extension;
   }

   public byte[] getF_data() {
      return f_data;
   }

   public void setF_data(byte[] f_data) {
      this.f_data = f_data;
   }

   public Integer getF_id() {
      return f_id;
   }

   public void setF_id(Integer f_id) {
      this.f_id = f_id;
   }

   public Integer getB_id() {
      return b_id;
   }

   public void setB_id(Integer b_id) {
      this.b_id = b_id;
   }

   public String getF_name() {
      return f_name;
   }

   public void setF_name(String f_name) {
      this.f_name = f_name;
   }

   public float getF_size() {
      return f_size;
   }

   public void setF_size(float f_size) {
      this.f_size = f_size;
   }

   public Integer getN_id() {
      return n_id;
   }

   public void setN_id(Integer n_id) {
      this.n_id = n_id;
   }

   public String getMimeType() {
      int index = f_name.lastIndexOf('.');
      if (index > 0) {
         String extension = f_name.substring(index + 1).toLowerCase();
         switch (extension) {
         case "png":
         case "bmp":
         case "gif":
            return "image/" + extension;
         }
      }
      return "image/jpeg";
   }
}