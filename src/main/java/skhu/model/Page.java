package skhu.model;

public class Page {
	private String user;
	private String main;
	private String member;
	private String introduce;
	private String community;
	private String task;
	
	public Page(String currentPage){
		switch(currentPage){
			case "user":
				user = "current";
				break;
			case "main":
				main = "current";
				break;
			case "member":
				member = "current";
				break;
			case "introduce":
				introduce = "current";
				break;
			case "community":
				community = "current";
				break;
			case "task":
				task = "current";
				break;
		}
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getCommunity() {
		return community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}
	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}
}
