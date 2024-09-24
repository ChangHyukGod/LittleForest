/**
 * 
 */
package com.simplecoding.repositoryexam.service.Impl.auth;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplecoding.repositoryexam.mapper.auth.MemberMapper;
import com.simplecoding.repositoryexam.service.auth.MembersService;
import com.simplecoding.repositoryexam.vo.auth.MembersVO;

/**
  * @fileName : MembersServiceImpl.java
  * @author : KTE
  * @since : 2024. 9. 23. 
  * description :
  */
@Service
public class MembersServiceImpl implements MembersService{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public MembersVO authenticateMembers(MembersVO loginVO) throws Exception {
		// TODO memberMapper 
		MembersVO membersVO = memberMapper.authenticate(loginVO);
		if(membersVO != null) {
			 boolean isMatchedPassword = BCrypt.checkpw(loginVO.getPassword(), membersVO.getPassword());
			 
			 if(isMatchedPassword == false) {
				 throw new Exception("암호가 틀립니다.");
			 }
		}
		return membersVO;
	}
	
	//회원가입
	@Override
	public void registerMembers(MembersVO membersVO) throws Exception {
		// TODO Auto-generated method stub
		String hashedPassword = BCrypt.hashpw(membersVO.getPassword(), BCrypt.gensalt());
		membersVO.setPassword(hashedPassword);
		memberMapper.register(membersVO);
	}





	
	
}
