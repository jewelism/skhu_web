package skhu.service;

import skhu.model.*;
import skhu.mapper.AdminMapper;
import skhu.mapper.UserMapper;

import java.util.Calendar;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
    AdminMapper adminMapper;
	
	//User Service
	public User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof MyAuthenticationProvider.MyAuthenticaion)
			return ((MyAuthenticationProvider.MyAuthenticaion) authentication).getUser();
		return null;
	}

	public static void setCurrentUser(User user) {
		((MyAuthenticationProvider.MyAuthenticaion) SecurityContextHolder.getContext().getAuthentication())
				.setUser(user);
	}
	
	public boolean confirm_password(String p1,String p2){
		if(p1.equals(p2)){
			return true;
		}
		else{
			return false;
		}
	}
	
	//Admin Service
	public static Admin getCurrentAdmin() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof MyAuthenticationProvider.MyAuthenticaion_admin)
			return ((MyAuthenticationProvider.MyAuthenticaion_admin) authentication).getAdmin();
		return null;
	}

	public static void setCurrentAdmin(Admin admin) {
		((MyAuthenticationProvider.MyAuthenticaion_admin) SecurityContextHolder.getContext().getAuthentication())
				.setAdmin(admin);
	}
	
	// member Service
	public int getGisu() {
		Calendar c = Calendar.getInstance();
		String ntime = String.valueOf(c.get(Calendar.YEAR));
		int a = Integer.parseInt(ntime);
		int b = 2011; // 2000년도가 1기라고 가정하자
		int gisu = a - b + 1;
		return gisu;
	}

	public String modPhone(String searchtxt) { // -를 빼먹고 검색하는경우 -를 삽입하는
												// modPhone메소드
		if (searchtxt.length() >= 3) { // 우선3개 이상입력을 받은경우
			StringBuilder sb = new StringBuilder(searchtxt);
			if (sb.length() == 3) {
				return sb.toString();
			} else if (!searchtxt.substring(3, 4).equals("-")) {
				sb.insert(3, "-"); // -를 삽입
				if (sb.substring(0, 3).equals("010")) {
					if (sb.length() > 7)
						sb.insert(8, "-");
				} else { // 010을 이 아니면(019-111-2222처럼 폰번호가 10자리)
					if (sb.length() > 6)
						sb.insert(7, "-");
				}
				return sb.toString();
			} else {
				return sb.toString();
			}
		} else { // 2자리이하 입력을 받은경우는 그냥 모든사용자를 보여준다
			return "01";
		}
	}
	
	public String validateBeforeUpdate(User user) {
        String s = user.getU_password();
        if (StringUtils.isBlank(s))
            return "비밀번호를 입력하세요.";

        s = user.getU_name();
        if (StringUtils.isBlank(s))
            return "이름을 입력하세요.";

        s = user.getU_phone();
        if (StringUtils.isBlank(s))
            return "휴대폰 번호를 입력하세요.";
        
        s = user.getU_email();
        if (StringUtils.isBlank(s))
            return "이메일을 입력하세요.";

        s = user.getU_address();
        if (StringUtils.isBlank(s))
            return "주소를 입력하세요.";

        return null;
    }
	
	public RequestCount getCount(){
		RequestCount rc = new RequestCount();
        int countId = adminMapper.countRequestId();
        int countDrop = adminMapper.countRequestDrop();
        rc.setCountId(countId);
        rc.setCountDrop(countDrop);
        rc.setTotal(countId+countDrop);
        return rc;
	}
	public String Same_write_user(Notice notice,User user){
	      if(notice.getN_writerId().equals(user.getU_id())){
	         return "inherit";
	      }
	      else
	         return "none";
	}
	public String board_Same_write_user(Board board,User user){
	       if(board.getB_writerId() ==null){
	          return "none";
	       }
	       else{
	    	   if(board.getB_writerId().equals(user.getU_id())){
	    		   return "inherit";
	    	   }
	    	   else
	    		   return "none";
	       }
	         
	}
	public String status(String status){
	      if(Pattern.matches("^[0-9a-zA-Z]*$",status.substring(0,1))==true||status.substring(0,1).equals("회")
	            ||status.substring(0,1).equals("부")){
	         return "inherit";
	         
	      }
	      else{
	         return "none";
	      }
	}
}
