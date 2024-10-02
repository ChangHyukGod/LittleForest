package com.simplecoding.repositoryexam.vo.basic;

import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @fileName : FaqVO.java
 * @author : KTE
 * @since : 2024. 9. 27. description : FAQ VO
 */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@SuppressWarnings("serial")
public class FaqVO extends Criteria {

    private int id;

    private String question;

    private String answer;

    private String createdAt; // 날짜 형식을 원하는 대로 바꿔도 됩니다.
}
