/**
 * 
 */
package com.simplecoding.repositoryexam.service.Impl.auth;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplecoding.repositoryexam.mapper.auth.MemberMapper;
import com.simplecoding.repositoryexam.service.auth.MembersService;
import com.simplecoding.repositoryexam.vo.auth.MembersVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

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
	
	//로그인
	@Override
	public MembersVO authenticateMembers(MembersVO loginVO) {
	    MembersVO membersVO = memberMapper.authenticate(loginVO);

	    if (membersVO == null || !BCrypt.checkpw(loginVO.getPassword(), membersVO.getPassword())) {
	        return null; // 회원이 없거나 비밀번호가 틀릴 경우 null 반환
	    }

	    return membersVO; // 인증 성공 시 회원 정보 반환
	}

	//회원가입
	@Override
	public void registerMembers(MembersVO membersVO) throws Exception {
		// TODO Auto-generated method stub
		String hashedPassword = BCrypt.hashpw(membersVO.getPassword(), BCrypt.gensalt());
		membersVO.setPassword(hashedPassword);
		memberMapper.register(membersVO);
	}

	@Override
	public boolean isUsernameDuplicate(String username) {
        return memberMapper.countByUsername(username) > 0;
    }

}
