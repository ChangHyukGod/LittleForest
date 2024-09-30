/**
 * 
 */
package com.simplecoding.repositoryexam.service.basic;

import java.util.List;

import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
 * @fileName : FaqService.java
 * @author : KTE
 * @since : 2024. 9. 27. description :
 */
public interface FaqService {

    // 전체 FAQ 개수 가져오기
    List<?> selectFaqList(Criteria searchVO) throws Exception;

    int selectFaqListTotCnt(Criteria searchVO);
}