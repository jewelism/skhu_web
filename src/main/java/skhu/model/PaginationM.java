package skhu.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class PaginationM {
    int currentPage = 1;
    int pageSize = 5;
    int srchNumber = 0;
    String srchName = "";
    int recordCount;

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
    
    public int getSrchNumber() {
        return srchNumber;
    }

    public void setSrchNumber(int srchNumber) {
        this.srchNumber = srchNumber;
    }

    public String getSrchName() {
        return srchName;
    }

    public void setSrchName(String srchName) {
        this.srchName = srchName;
    }

    public int getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(int recordCount) {
        this.recordCount = recordCount;
    }

    /* query string과 같은 이름의 메소드들 구현 */
    public int getPg() {
        return currentPage;
    }

    public void setPg(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getSz() {
        return pageSize;
    }

    public void setSz(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSc() {
        return srchNumber;
    }

    public void setSc(int srchNumber) {
        this.srchNumber = srchNumber;
    }


    public String getSn() {
        return srchName;
    }

    public void setSn(String srchName) {
        this.srchName = srchName;
    }

    /* 멤버 변수 값들을 quey string으로 출력하기 위한 메소드 */
    public String getQueryString() throws UnsupportedEncodingException {
        String temp = (srchName.isEmpty() || srchName == null) ? "" : URLEncoder.encode(srchName, "UTF-8");
        return String.format("pg=%d&sz=%d&sc=%d&sn=%s", currentPage, pageSize, srchNumber, temp);
    }

    /* 화면 하단에 페이지 번호 링크들을 출력하기 위한 메소드와 클래스 */
    public List<PageLabel> getPageList() {
        ArrayList<PageLabel> list = new ArrayList<PageLabel>();
        int pageCount = (recordCount + pageSize - 1) / pageSize;
        int basePage = ((currentPage - 1) / 10) * 10;
        if (basePage > 0)
            list.add(new PageLabel("Prev", basePage));
        for (int i = 1; i <= 10 && basePage + i <= pageCount; ++i)
            list.add(new PageLabel(basePage + i, currentPage == basePage + i));
        if (basePage + 11 <= pageCount)
            list.add(new PageLabel("Next", basePage + 11));
        return list;
    }

    public class PageLabel {
        String label;
        int number;
        String cssClass;

        public PageLabel(int number, boolean active) {
            this.label = "" + number;
            this.number = number;
            this.cssClass = active ? "active" : "";
        }

        public PageLabel(String label, int number) {
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
