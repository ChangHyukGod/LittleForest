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
 * @since : 2024. 9. 23. description :
 */
@Service
public class MembersServiceImpl implements MembersService {

   @Autowired
   MemberMapper memberMapper;
 
   // 로그인
   @Override
   public MembersVO authenticateMembers(MembersVO loginVO) {
      MembersVO membersVO = memberMapper.authenticate(loginVO);

      if (membersVO == null || !BCrypt.checkpw(loginVO.getPassword(), membersVO.getPassword())) {
         return null; // 회원이 없거나 비밀번호가 틀릴 경우 null 반환
      }

      return membersVO; // 인증 성공 시 회원 정보 반환
   }

   // 회원가입
   @Override
   public void registerMembers(MembersVO membersVO)  {

      String hashedPassword = BCrypt.hashpw(membersVO.getPassword(), BCrypt.gensalt());
      
      membersVO.setPassword(hashedPassword);
      
      memberMapper.register(membersVO);
   }

   // id 중복확인
   @Override
   public boolean isUsernameDuplicate(String username) {
      
      return memberMapper.countByUsername(username) > 0;
      
   }
   
   // email 중복확인
   @Override
   public boolean isUseremailDuplicate(String email) {
      
      return memberMapper.countByUseremail(email) > 0;
      
   }

   // 회원정보 수정
   @Override
   public String infofix(MembersVO membersVO) throws Exception {
       // 회원 비밀번호를 해시화
       String rawPassword = membersVO.getPassword(); // 원본 비밀번호
       String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt()); // 해시화된 비밀번호

       // 해시화된 비밀번호를 다시 membersVO에 설정
       membersVO.setPassword(hashedPassword);
       
       // 데이터베이스에 비밀번호 업데이트
       memberMapper.infofix(membersVO);
       
       // 해시화된 비밀번호 반환
       return hashedPassword; // 해시화된 비밀번호 반환
   }


}
