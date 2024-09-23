/**
 * 
 */
package com.simplecoding.repositoryexam.service.auth;

import com.simplecoding.repositoryexam.vo.auth.MembersVO;

/**
  * @fileName : MembersService.java
  * @author : KTE
  * @since : 2024. 9. 23. 
  * description :
  */
public interface MembersService {
	public MembersVO authenticateMembers(MembersVO membersVO) throws Exception;
	public void registerMembers(MembersVO membersVO) throws Exception;
}
