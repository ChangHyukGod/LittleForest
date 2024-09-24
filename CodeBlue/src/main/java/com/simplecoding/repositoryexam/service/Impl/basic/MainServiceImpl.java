/**
 * 
 */
package com.simplecoding.repositoryexam.service.Impl.basic;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.simplecoding.repositoryexam.mapper.basic.MainMapper;
import com.simplecoding.repositoryexam.service.basic.MainService;
import com.simplecoding.repositoryexam.vo.basic.MainVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
 * @fileName : MainServiceImpl.java
 * @author : KTE
 * @since : 2024. 9. 24. description :
 */
@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainMapper mainMapper;

	@Override
	public List<?> selectMainList(Criteria searchVO) throws Exception {

		return mainMapper.selectMainList(searchVO);
	}

	// insert함수
	@Override
	public void insert(MainVO mainVO) throws Exception {

		String newUuid = UUID.randomUUID().toString();

		String fileDownloadUrl = generateDownloadUrl(newUuid);

		mainVO.setUuid(newUuid);
		mainVO.setFileUrl(fileDownloadUrl);

		mainMapper.insert(mainVO);
	}

	public String generateDownloadUrl(String uuid) {

		return ServletUriComponentsBuilder.fromCurrentContextPath().path("/main/").path(uuid).toUriString();
	}

	// 상세조회
	@Override
	public MainVO selectMain(String uuid) {

		MainVO mainVO = mainMapper.selectMain(uuid);

		return mainVO;
	}

}
