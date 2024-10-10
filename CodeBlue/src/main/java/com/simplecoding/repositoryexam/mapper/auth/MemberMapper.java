
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
 * @since : 2024. 9. 23. description :
 */
@Mapper
public interface MemberMapper {

	public MembersVO authenticate(MembersVO membersVO); // 상세조회(인증)

	public void register(MembersVO membersVO); // insert함수

	public int countByUsername(String username); // 유저 수 계산 => 중복확인용
	
	public int countByUseremail(String email); // 이메일 갯수 계산 => 중복확인용
	
	public int infofix(MembersVO membersVO); // 정보수정
	
}
