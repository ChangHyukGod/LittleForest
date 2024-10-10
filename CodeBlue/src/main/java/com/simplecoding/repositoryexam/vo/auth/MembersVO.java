/**
 * 
 */
package com.simplecoding.repositoryexam.vo.auth;

import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @fileName : MembersVO.java
 * @author : KTE
 * @since : 2024. 9. 20. description :
 */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@SuppressWarnings("serial")
public class MembersVO extends Criteria {
	private int memberid;
	private String membername;
	private int age;
	private String phonenumber;
	private String username;
	private String password;
	private int admin;
	private String email;
}
