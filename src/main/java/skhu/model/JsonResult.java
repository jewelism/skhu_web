package skhu.model;

//로그인 결과 AJAX 통신 반환 객체
public class JsonResult {
    private boolean success; //로그인 성공 여부
    private boolean userTrue; //유저인지
    private boolean count; //첫 로그인인지
    
    public JsonResult(boolean success,Boolean userTrue,boolean count){
    	this.success= success;
    	this.userTrue = userTrue;
    	this.count = count;
    }

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public boolean isUserTrue() {
		return userTrue;
	}

	public void setUserTrue(boolean userTrue) {
		this.userTrue = userTrue;
	}

	public boolean isCount() {
		return count;
	}

	public void setCount(boolean count) {
		this.count = count;
	}
    
    
}