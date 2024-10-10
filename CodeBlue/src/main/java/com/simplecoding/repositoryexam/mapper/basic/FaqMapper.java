/**
 * 
 */
package com.simplecoding.repositoryexam.mapper.basic;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.basic.FaqVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
 * @fileName : FaqMapper.java
 * @author : KTE
 * @since : 2024. 9. 27. description :
 */
@Mapper
public interface FaqMapper {

    List<?> selectFaqlist(Criteria searchVO);

    int selectFaqListTotCnt(Criteria searchVO);

    int insert(FaqVO faqVO);

    void update(FaqVO faqVO) throws Exception;

    FaqVO selectFaqById(int id) throws Exception;

    int delete(FaqVO faqVO);
}