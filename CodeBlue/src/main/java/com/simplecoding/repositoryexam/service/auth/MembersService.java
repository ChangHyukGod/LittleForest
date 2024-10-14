/**
 * 
 */
package com.simplecoding.repositoryexam.service.auth;

import java.util.List;

import com.simplecoding.repositoryexam.vo.auth.MembersVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
 * @fileName : MembersService.java
 * @author : KTE
 * @since : 2024. 9. 23. description :
 */
public interface MembersService {
   
   public MembersVO authenticateMembers(MembersVO membersVO);

   public void registerMembers(MembersVO membersVO) ;

   boolean isUsernameDuplicate(String username); // id 중복
   
   boolean isUseremailDuplicate(String email); // email 중복

   String infofix(MembersVO membersVO) throws Exception;
   
}
