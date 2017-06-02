package skhu.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class Pagination {
   int currentPage = 1;
   int pageSize = 7;
   int recordCount;
   int srchType;
   String srchText = "";

   public int getSrchType() {
      return srchType;
   }

   public void setSrchType(int srchType) {
      this.srchType = srchType;
   }

   public String getSrchText() {
      return srchText;
   }

   public void setSrchText(String srchText) {
      this.srchText = srchText;
   }

   public int getCurrentPage() {
      return currentPage;
   }

   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }

   public int getPageSize() {
      return pageSize;
   }

   public void setPageSize(int pageSize) {
      this.pageSize = pageSize;
   }

   public int getRecordCount() {
      return recordCount;
   }

   public void setRecordCount(int recordCount) {
      this.recordCount = recordCount;
   }

   public int getPg() {
      return currentPage;
   }

   public void setPg(int currentPage) {
      this.currentPage = currentPage;
   }

   public int getSs() {
      return srchType;
   }

   public void setSs(int srchType) {
      this.srchType = srchType;
   }

   public String getSt() {
      return srchText;
   }

   public void setSt(String srchText) {
      this.srchText = srchText;
   }

   public int getSz() {
      return pageSize;
   }

   public void setSz(int pageSize) {
      this.pageSize = pageSize;
   }

   public String getQueryString() throws UnsupportedEncodingException {
      String temp = (srchText == null) ? "" : URLEncoder.encode(srchText, "UTF-8");
      return String.format("pg=%d&sz=%d&ss=%d&st=%s", currentPage, pageSize, srchType, temp);
   }

   public List<Page1> getPageList() {
      ArrayList<Page1> list = new ArrayList<Page1>();
      int pageCount = (recordCount + pageSize - 1) / pageSize;
      int basePage = ((currentPage - 1) / 10) * 10;
      if (basePage > 0)
         list.add(new Page1("Prev", basePage));
      for (int i = 1; i <= 10 && basePage + i <= pageCount; ++i)
         list.add(new Page1(basePage + i, currentPage == basePage + i));
      if (basePage + 11 <= pageCount)
         list.add(new Page1("Next", basePage + 11));
      return list;
   }

   public class Page1 {
      String label;
      int number;
      String cssClass;

      public Page1(int number, boolean active) {
         this.label = "" + number;
         this.number = number;
         this.cssClass = active ? "active" : "";
      }

      public Page1(String label, int number) {
         this.label = label;
         this.number = number;
         this.cssClass = "";
      }

      public Object getLabel() {
         return label;
      }

      public int getNumber() {
         return number;
      }

      public String getCssClass() {
         return cssClass;
      }
   }
}