package skhu.service;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import skhu.mapper.*;
import skhu.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

@Component
public class MyAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	UserMapper userMapper;
	@Autowired
	AdminMapper adminMapper;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String loginId = authentication.getName();
		String password = authentication.getCredentials().toString();
		return authenticate(loginId, password);
	}

	public Authentication authenticate(String loginId, String password) throws AuthenticationException {

		if(Pattern.matches("^[a-zA-Z]*$", loginId.substring(0,1))!=true){
			User user = userMapper.selectByLoginId(loginId);
			if (user == null)
				return null;
			if (user.getU_password().equals(password) == false){
				return null;
			}
			
			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
			
			return new MyAuthenticaion(loginId, password, grantedAuthorities, user);
		}
		
		else{
			Admin admin = adminMapper.selectByLoginId(loginId);
			if (admin == null)
				return null;
			if (admin.getA_password().equals(password) == false){
				return null;
				
			}
				
			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			return new MyAuthenticaion_admin(loginId, password, grantedAuthorities, admin);
		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	
	public class MyAuthenticaion extends UsernamePasswordAuthenticationToken {
		private static final long serialVersionUID = 1L;
		User user;

		public MyAuthenticaion(String loginId, String password, List<GrantedAuthority> grantedAuthorities, User user) {
			super(loginId, password, grantedAuthorities);
			this.user = user;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
	}
	public class MyAuthenticaion_admin extends UsernamePasswordAuthenticationToken {
		private static final long serialVersionUID = 1L;
		Admin admin;

		public MyAuthenticaion_admin(String loginId, String password, List<GrantedAuthority> grantedAuthorities, Admin admin) {
			super(loginId, password, grantedAuthorities);
			this.admin = admin;
		}

		public Admin getAdmin() {
			return admin;
		}

		public void setAdmin(Admin admin) {
			this.admin = admin;
		}
	}
}
