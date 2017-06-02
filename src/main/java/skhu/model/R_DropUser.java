package skhu.model;

public class R_DropUser {
	private String rd_id;
	private String u_id;
	private String rd_state;
	private String rd_content;
	private java.sql.Timestamp rd_time;
	
	private String u_name;
	private String u_cNumber;
	private String u_status;
	private String u_photo;
	
	public String getRd_id() {
		return rd_id;
	}
	public void setRd_id(String rd_id) {
		this.rd_id = rd_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getRd_state(){
		return rd_state;
	}
	public void setRd_state(String rd_state){
		this.rd_state = rd_state;
	}
	public String getRd_content() {
		return rd_content;
	}
	public void setRd_content(String rd_content) {
		this.rd_content = rd_content;
	}
	public java.sql.Timestamp getRd_time() {
		return rd_time;
	}
	public void setRd_time(java.sql.Timestamp rd_time) {
		this.rd_time = rd_time;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_cNumber() {
		return u_cNumber;
	}
	public void setU_cNumber(String u_cNumber) {
		this.u_cNumber = u_cNumber;
	}
	public String getU_status() {
		return u_status;
	}
	public void setU_status(String u_status) {
		this.u_status = u_status;
	}
	public String getU_photo() {
		return u_photo;
	}
	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}
}
