package skhu.service;

import skhu.model.User;
import skhu.mapper.UserMapper;
import skhu.model.R_DropUser;
import skhu.model.R_UpdateId;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RequestService {
    @Autowired
    UserMapper userMapper;
    
    public java.sql.Timestamp currentTime() throws ParseException{
	
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
    	Calendar cal = Calendar.getInstance(); 
    	java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
		
		return timestamp;
    }

	public String validateBeforeRequest(R_UpdateId r_updateId){
        String origin = r_updateId.getRu_originId();
        String update = r_updateId.getRu_updateId();
        
        if(StringUtils.isBlank(update))
        	return "변경 아이디를 입력하세요.";
        
        if(origin.equals(update))
        	return "원래 아이디로 변경 할 수 없습니다.";
        
        User user = userMapper.selectByLoginId(update);
        if (user != null)
        	if(!(user.getU_id().equals(r_updateId.getU_id())))
        		return "이미 존재하는 로그인ID 입니다.";
        
        update = r_updateId.getRu_content();
        if(StringUtils.isBlank(update))
        	return "변경 사유를 입력하세요.";
		
        return null;
    }
	
	public String validateBeforeRequestD(R_DropUser r_dropUser){
        String s = r_dropUser.getRd_content();
		if(StringUtils.isBlank(s))
        	return "탈퇴 사유를 입력하세요.";
		
        return null;
    }

}
