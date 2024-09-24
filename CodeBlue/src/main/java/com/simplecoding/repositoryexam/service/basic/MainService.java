/**
 * 
 */
package com.simplecoding.repositoryexam.service.basic;



import java.util.List;

import com.simplecoding.repositoryexam.vo.basic.MainVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
  * @fileName : MainService.java
  * @author : KTE
  * @since : 2024. 9. 24. 
  * description :
  */
public interface MainService {
	   
	   public List<?> selectMainList(Criteria searchVO) throws Exception; // 1) 전체 조회

	   public void insert(MainVO mainVO) throws Exception; // 2) insert 함수

	   public MainVO selectMain(String uuid); // 3) 상세조회
	}