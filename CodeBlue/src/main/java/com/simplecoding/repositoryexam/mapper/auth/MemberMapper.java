/**
 * 
 */
package com.simplecoding.repositoryexam.mapper.auth;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.auth.MembersVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
  * @fileName : MemberMapper.java
  * @author : KTE
  * @since : 2024. 9. 23. 
  * description :
  */
@Mapper
public interface MemberMapper {
	
	public MembersVO authenticate(MembersVO membersVO); //상세조회(인증)
	
	public void register(MembersVO membersVO);			// insert함수
	
	int countByUsername(String username);
}
