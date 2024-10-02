/**
 * 
 */
package com.simplecoding.repositoryexam.service.Impl.basic;

import java.util.List;

/**
  * @fileName : FaqServiceImpl.java
  * @author : KTE
  * @since : 2024. 9. 27. 
  * description :
  */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplecoding.repositoryexam.mapper.basic.FaqMapper;
import com.simplecoding.repositoryexam.service.basic.FaqService;
import com.simplecoding.repositoryexam.vo.basic.FaqVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

@Service
public class FaqServiceImpl implements FaqService {

    @Autowired
    private FaqMapper faqMapper;

    @Override
    public List<?> selectFaqList(Criteria criteria) throws Exception {
	return faqMapper.selectFaqlist(criteria);
    }

    @Override
    public int selectFaqListTotCnt(Criteria criteria) throws Exception {
	return faqMapper.selectFaqListTotCnt(criteria);
    }

    @Override
    public void insertFaqVO(FaqVO faqVO) throws Exception {
	faqMapper.insert(faqVO);
    }

    @Override
    public FaqVO selectFaqById(int id) throws Exception {
	return faqMapper.selectFaqById(id);
    }

    @Override
    public void updateFaq(FaqVO faqVO) throws Exception {
	faqMapper.update(faqVO);
    }

    @Override
    public void deleteFaq(FaqVO faqVO) throws Exception {
	faqMapper.delete(faqVO);
    }

}