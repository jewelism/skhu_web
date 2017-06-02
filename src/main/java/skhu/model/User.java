package skhu.model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class User {
	private String u_id;
	private String u_loginId;
	private String u_password;
	private String u_name;
	private Integer u_cNumber;
	private String u_status;
	private Date u_birth;
	private String u_birth2;
	private String u_phone;
	private String u_email;
	private String u_address;
	private String u_jobName;
	private String u_jobPhone;
	private String u_jobStatus;
	private String u_photo;
	private Boolean u_openBirth;
	private Boolean u_openPhone;
	private Boolean u_openEmail;
	private Boolean u_openAddress;
	private Boolean u_openJobName;
	private Boolean u_openJobPhone;
	private Boolean u_openJobStatus;
	private Boolean u_openPhoto;
	private Boolean u_count;
	
	//user register validate css option
	private String val_cNumber="border: 0;";
	private String val_name="border: 0;";
	private String val_phone="border: 0;";
	private String val_birth="border: 0;";
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_loginId() {
		return u_loginId;
	}
	public void setU_loginId(String u_loginId) {
		this.u_loginId = u_loginId;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public Integer getU_cNumber() {
		return u_cNumber;
	}
	public void setU_cNumber(Integer u_cNumber) {
		this.u_cNumber = u_cNumber;
	}
	public String getU_status() {
		return u_status;
	}
	public void setU_status(String u_status) {
		this.u_status = u_status;
	}
	public Date getU_birth() {
		return u_birth;
	}
	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}
	public String getU_birth2(){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(u_birth==null){
			return u_birth2;
		}
		return format.format(u_birth);
	}
	public void setU_birth2(String u_birth2){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(u_birth2.matches("(19|20)[0-9]{2}-((0[1-9])|(1[012]))-[0-3][0-9]")){
				u_birth=new java.sql.Date(format.parse(u_birth2).getTime());
			}else{
				this.u_birth2=u_birth2;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public String getU_jobName(){
		return u_jobName;
	}
	public void setU_jobName(String u_jobName){
		this.u_jobName=u_jobName;
	}
	public String getU_jobPhone() {
		return u_jobPhone;
	}
	public void setU_jobPhone(String u_jobPhone) {
		this.u_jobPhone = u_jobPhone;
	}
	public String getU_jobStatus() {
		return u_jobStatus;
	}
	public void setU_jobStatus(String u_jobStatus) {
		this.u_jobStatus = u_jobStatus;
	}
	public String getU_photo() {
		return u_photo;
	}
	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}
	public Boolean getU_openBirth() {
		return u_openBirth;
	}
	public void setU_openBirth(Boolean u_openBirth) {
		this.u_openBirth = u_openBirth;
	}
	public Boolean getU_openPhone() {
		return u_openPhone;
	}
	public void setU_openPhone(Boolean u_openPhone) {
		this.u_openPhone = u_openPhone;
	}
	public Boolean getU_openEmail() {
		return u_openEmail;
	}
	public void setU_openEmail(Boolean u_openEmail) {
		this.u_openEmail = u_openEmail;
	}
	public Boolean getU_openAddress() {
		return u_openAddress;
	}
	public void setU_openAddress(Boolean u_openAddress) {
		this.u_openAddress = u_openAddress;
	}
	public Boolean getU_openJobName() {
		return u_openJobName;
	}
	public void setU_openJobName(Boolean u_openJobName) {
		this.u_openJobName = u_openJobName;
	}
	public Boolean getU_openJobPhone() {
		return u_openJobPhone;
	}
	public void setU_openJobPhone(Boolean u_openJobPhone) {
		this.u_openJobPhone = u_openJobPhone;
	}
	public Boolean getU_openJobStatus() {
		return u_openJobStatus;
	}
	public void setU_openJobStatus(Boolean u_openJobStatus) {
		this.u_openJobStatus = u_openJobStatus;
	}
	public Boolean getU_openPhoto() {
		return u_openPhoto;
	}
	public void setU_openPhoto(Boolean u_openPhoto) {
		this.u_openPhoto = u_openPhoto;
	}
	public Boolean getU_count() {
		return u_count;
	}
	public void setU_count(Boolean u_count) {
		this.u_count = u_count;
	}
	
	//user register validate css option
	public String getVal_cNumber(){
		return val_cNumber;
	}
	public void setVal_cNumber(String val_cNumber){
		this.val_cNumber = val_cNumber;
	}
	public String getVal_name(){
		return val_name;
	}
	public void setVal_name(String val_name){
		this.val_name = val_name;
	}
	public String getVal_phone(){
		return val_phone;
	}
	public void setVal_phone(String val_phone){
		this.val_phone = val_phone;
	}
	public String getVal_birth(){
		return val_birth;
	}
	public void setVal_birth(String val_birth){
		this.val_birth = val_birth;
	}
}
