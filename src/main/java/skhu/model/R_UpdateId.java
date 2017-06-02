package skhu.model;

import java.sql.Date;
import java.util.UUID;

public class R_UpdateId {
	private int ru_id;
	private String u_id;
	private String ru_originId;
	private String ru_updateId;
	private String ru_state;
	private String ru_content;
	private java.sql.Timestamp ru_time;
	
	private String u_name;
	private String u_cNumber;
	private String u_status;
	private String u_photo;
	
	/*join user*/
	public String getU_name(){
		return u_name;
	}
	public void setU_name(String u_name){
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

	/*ru*/
	public int getRu_id() {
		return ru_id;
	}
	public void setRu_id(int ru_id) {
		this.ru_id = ru_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getRu_originId() {
		return ru_originId;
	}
	public void setRu_originId(String ru_originId) {
		this.ru_originId = ru_originId;
	}
	public String getRu_updateId() {
		return ru_updateId;
	}
	public void setRu_updateId(String ru_updateId) {
		this.ru_updateId = ru_updateId;
	}
	public String getRu_state() {
		return ru_state;
	}
	public void setRu_state(String ru_state) {
		this.ru_state = ru_state;
	}
	public String getRu_content() {
		return ru_content;
	}
	public void setRu_content(String ru_content) {
		this.ru_content = ru_content;
	}
	public java.sql.Timestamp getRu_time() {
		return ru_time;
	}
	public void setRu_time(java.sql.Timestamp ru_time) {
		this.ru_time = ru_time;
	}
}
