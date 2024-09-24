/**
 * 
 */
package com.simplecoding.repositoryexam.mapper.basic;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.basic.MainVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;


@Mapper
public interface MainMapper {
   
   // 1) 전체 조회
   public List<?> selectMainList(Criteria searchVO) throws Exception; 
   
   // 2) insert 함수
   public int insert(MainVO mainVO) throws Exception;
   
   // 3) 상세조회 함수
   public MainVO selectMain(String uuid);


}
